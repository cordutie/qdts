"""
onnx_wrapper.py

Wraps all 192 HomogeneousInverse checkpoints into a single nn.Module whose
weights are stored as stacked, zero-padded buffers (no per-checkpoint files
needed at inference time).

Limitation: models for different N values have incompatible first/last layer
shapes (Linear(n, H) vs Linear(n', H)), so a single ONNX graph cannot serve
all N values dynamically. ONNX export therefore produces one file per N value:

    output_dir/non_clamped/qdts_solver_N{n}.onnx   (12 files)
    output_dir/clamped/    qdts_solver_N{n}.onnx   (12 files)

The variant_index IS dynamic inside each exported ONNX (a Gather op selects
the right weights at runtime).

Usage
-----
PyTorch:
    wrapper = QDTSSolverONNX("models/")
    X_hat, err = wrapper(T, n=10, variant_index=3)
    print(wrapper.variant_names(10))   # ordered checkpoint list for n=10

ONNX export:
    python onnx_wrapper.py --models_dir models/ --output_dir onnx_exports/
"""

import sys
import argparse
from pathlib import Path
from collections import defaultdict

import torch
import torch.nn as nn
import torch.nn.functional as F

sys.path.insert(0, str(Path(__file__).parent))
from qdts_nn.auxiliar import load_model

# ── Constants (match the stored checkpoints) ─────────────────────────────────
N_MIN          = 5
N_MAX          = 16
N_COUNT        = N_MAX - N_MIN + 1   # 12
VARIANTS_PER_N = 16                  # 2 R values × 8 seeds
TOTAL_MODELS   = N_COUNT * VARIANTS_PER_N  # 192
MAX_N          = N_MAX
HIDDEN_SIZE    = 256
NUM_HIDDEN     = 2   # num_layers=3 → input block + 2 hidden blocks + output


# ── Wrapper ───────────────────────────────────────────────────────────────────

class QDTSSolverONNX(nn.Module):
    """
    All 192 checkpoints stored as zero-padded weight buffers.

    Flat model index = (n - N_MIN) * VARIANTS_PER_N + variant_index
    where variant_index is the position in the alphabetically sorted list of
    checkpoints for that n.

    Buffer shapes
    -------------
    w_in  : (TOTAL_MODELS, HIDDEN_SIZE, MAX_N)         padded along last dim
    b_in  : (TOTAL_MODELS, HIDDEN_SIZE)
    w_hid : (TOTAL_MODELS, NUM_HIDDEN, HIDDEN_SIZE, HIDDEN_SIZE)
    b_hid : (TOTAL_MODELS, NUM_HIDDEN, HIDDEN_SIZE)
    w_out : (TOTAL_MODELS, MAX_N+1, HIDDEN_SIZE)       padded along first dim
    b_out : (TOTAL_MODELS, MAX_N+1)                    padded
    """

    def __init__(self, models_dir: str) -> None:
        super().__init__()

        models_dir = Path(models_dir)
        files = sorted(models_dir.glob("Model_N*.pt"))

        # Group alphabetically by N
        by_n: dict[int, list[Path]] = defaultdict(list)
        for f in files:
            n = int(f.stem.split("_")[1][1:])   # "N10" → 10
            by_n[n].append(f)
        for n in by_n:
            by_n[n] = sorted(by_n[n])

        # Store ordered names for external reference
        self._variant_names: dict[int, list[str]] = {
            n: [f.name for f in by_n[n]] for n in sorted(by_n)
        }

        # Collect weights in flat order: n=5 variants 0..15, n=6 variants 0..15, …
        w_in_list, b_in_list   = [], []
        w_hid_list, b_hid_list = [], []
        w_out_list, b_out_list = [], []

        for n_idx in range(N_COUNT):
            n = N_MIN + n_idx
            for f in by_n[n]:
                m = load_model(str(f), device=torch.device("cpu"))
                layers = list(m.g.children())
                # Layer layout for num_layers=3:
                #   idx 0: Linear(n, H)    idx 1: SiLU
                #   idx 2: Linear(H, H)    idx 3: ReLU   ← hidden block 0
                #   idx 4: Linear(H, H)    idx 5: ReLU   ← hidden block 1
                #   idx 6: Linear(H, n+1)

                lin_in, lin_h0, lin_h1, lin_out = (
                    layers[0], layers[2], layers[4], layers[6]
                )

                # Input layer — pad weight columns to MAX_N
                w_in_list.append(F.pad(lin_in.weight.data, (0, MAX_N - n)))
                b_in_list.append(lin_in.bias.data.clone())

                # Hidden layers — H×H, no padding needed
                w_hid_list.append(
                    torch.stack([lin_h0.weight.data, lin_h1.weight.data])
                )
                b_hid_list.append(
                    torch.stack([lin_h0.bias.data, lin_h1.bias.data])
                )

                # Output layer — pad rows to MAX_N+1
                w_out_list.append(F.pad(lin_out.weight.data, (0, 0, 0, MAX_N - n)))
                b_out_list.append(F.pad(lin_out.bias.data,   (0, MAX_N - n)))

        self.register_buffer("w_in",  torch.stack(w_in_list))    # (192, H, MAX_N)
        self.register_buffer("b_in",  torch.stack(b_in_list))    # (192, H)
        self.register_buffer("w_hid", torch.stack(w_hid_list))   # (192, 2, H, H)
        self.register_buffer("b_hid", torch.stack(b_hid_list))   # (192, 2, H)
        self.register_buffer("w_out", torch.stack(w_out_list))   # (192, MAX_N+1, H)
        self.register_buffer("b_out", torch.stack(b_out_list))   # (192, MAX_N+1)

    # ── Inference ─────────────────────────────────────────────────────────────

    def forward(
        self,
        T: torch.Tensor,
        n: int,
        variant_index: torch.Tensor,
    ) -> tuple[torch.Tensor, torch.Tensor]:
        """
        Parameters
        ----------
        T             : target amplitudes  (batch, n)
        n             : number of harmonics, 5 ≤ n ≤ 16  — Python int, baked
                        into the ONNX graph at export time
        variant_index : scalar int tensor, 0-based index into the alphabetically
                        sorted checkpoint list for this n  (0–15)

        Returns
        -------
        X_hat : carrier amplitudes  (batch, n+1)
        error : scalar MSE  D(X_hat) vs T
        """
        model_idx: torch.Tensor = (n - N_MIN) * VARIANTS_PER_N + variant_index

        # Gather weights for this (n, variant) — becomes a Gather op in ONNX
        w_in  = self.w_in[model_idx]    # (H, MAX_N)
        b_in  = self.b_in[model_idx]    # (H,)
        w_hid = self.w_hid[model_idx]   # (2, H, H)
        b_hid = self.b_hid[model_idx]   # (2, H)
        w_out = self.w_out[model_idx]   # (MAX_N+1, H)
        b_out = self.b_out[model_idx]   # (MAX_N+1,)

        # Zero-pad T to MAX_N — safe because w_in columns n..MAX_N-1 are also 0,
        # so F.linear gives the same result as running with the original n-dim weights
        T_pad = F.pad(T, (0, MAX_N - n))   # (B, MAX_N)

        # Homogeneous normalisation: G(λT) = √λ · G(T)
        norm   = (T_pad * T_pad).sum(dim=1, keepdim=True).clamp(min=1e-12).sqrt()
        T_unit = T_pad / norm
        scale  = norm.sqrt()               # (B, 1)

        # MLP
        x = F.silu(F.linear(T_unit, w_in, b_in))
        for h in range(NUM_HIDDEN):
            x = F.relu(F.linear(x, w_hid[h], b_hid[h]))
        x_full = F.linear(x, w_out, b_out) * scale   # (B, MAX_N+1)

        # Trim padding — n is a Python int so this slice is static in ONNX
        X_hat         = x_full[:, : n + 1]                        # (B, n+1)
        X_hat_clamped = torch.clamp(X_hat, -2.0, 2.0)

        error         = ((self._distortion(X_hat,         n) - T) ** 2).mean()
        error_clamped = ((self._distortion(X_hat_clamped, n) - T) ** 2).mean()

        return X_hat, error, X_hat_clamped, error_clamped

    def _distortion(self, X: torch.Tensor, n: int) -> torch.Tensor:
        """
        Anti-diagonal (lagged) dot-product sums.
        Maps (B, n+1) → (B, n).  n is a Python int so the loop unrolls statically.
        """
        N = n + 1
        B = X.shape[0]
        Z = torch.zeros(B, n, dtype=X.dtype, device=X.device)
        for i in range(n):
            k = i + 1
            Xk = torch.cat(
                [X[:, k:], torch.zeros(B, k, dtype=X.dtype, device=X.device)],
                dim=1,
            )
            Z[:, n - 1 - i] = (X * Xk).sum(dim=1)
        return Z

    def variant_names(self, n: int) -> list[str]:
        """Alphabetically sorted checkpoint filenames for a given n."""
        return self._variant_names[n]


# ── ONNX export ───────────────────────────────────────────────────────────────

class _SlimN(nn.Module):
    """
    Holds weights for exactly one N value (VARIANTS_PER_N variants).
    Computes both clamped and non-clamped outputs in a single forward pass.

    Used only during ONNX export so the tracer bakes only the 16 variants
    for that N — not all 192 — keeping each file small.
    """

    def __init__(self, full: "QDTSSolverONNX", n: int) -> None:
        super().__init__()
        self._n = n

        n_idx = n - N_MIN
        start = n_idx * VARIANTS_PER_N
        end   = start + VARIANTS_PER_N

        self.register_buffer("w_in",  full.w_in [start:end].clone())
        self.register_buffer("b_in",  full.b_in [start:end].clone())
        self.register_buffer("w_hid", full.w_hid[start:end].clone())
        self.register_buffer("b_hid", full.b_hid[start:end].clone())
        self.register_buffer("w_out", full.w_out[start:end].clone())
        self.register_buffer("b_out", full.b_out[start:end].clone())

    def forward(
        self,
        T: torch.Tensor,
        variant_index: torch.Tensor,
    ) -> tuple[torch.Tensor, torch.Tensor, torch.Tensor, torch.Tensor]:
        """
        Returns
        -------
        X_hat         : carrier amplitudes          (batch, n+1)
        error         : MSE  D(X_hat) vs T          scalar
        X_hat_clamped : carrier amplitudes clamped to [-2, 2]  (batch, n+1)
        error_clamped : MSE  D(X_hat_clamped) vs T  scalar
        """
        n = self._n

        w_in  = self.w_in [variant_index]
        b_in  = self.b_in [variant_index]
        w_hid = self.w_hid[variant_index]
        b_hid = self.b_hid[variant_index]
        w_out = self.w_out[variant_index]
        b_out = self.b_out[variant_index]

        T_pad  = F.pad(T, (0, MAX_N - n))
        norm   = (T_pad * T_pad).sum(dim=1, keepdim=True).clamp(min=1e-12).sqrt()
        T_unit = T_pad / norm
        scale  = norm.sqrt()

        x = F.silu(F.linear(T_unit, w_in, b_in))
        for h in range(NUM_HIDDEN):
            x = F.relu(F.linear(x, w_hid[h], b_hid[h]))
        x_full = F.linear(x, w_out, b_out) * scale   # (B, MAX_N+1)

        X_hat         = x_full[:, : n + 1]
        X_hat_clamped = torch.clamp(X_hat, -2.0, 2.0)

        error         = ((self._distortion(X_hat,         n) - T) ** 2).mean()
        error_clamped = ((self._distortion(X_hat_clamped, n) - T) ** 2).mean()

        return X_hat, error, X_hat_clamped, error_clamped

    def _distortion(self, X: torch.Tensor, n: int) -> torch.Tensor:
        B = X.shape[0]
        Z = torch.zeros(B, n, dtype=X.dtype, device=X.device)
        for i in range(n):
            k  = i + 1
            Xk = torch.cat(
                [X[:, k:], torch.zeros(B, k, dtype=X.dtype, device=X.device)],
                dim=1,
            )
            Z[:, n - 1 - i] = (X * Xk).sum(dim=1)
        return Z


def export_onnx(
    models_dir: str,
    output_dir: str,
    opset: int = 14,
    batch_size: int = 1,
) -> None:
    """
    Export one ONNX file per N value (12 files total) into output_dir/.
    Each file returns both clamped and non-clamped results.

    Inputs
    ------
    T             : float32  (batch, n)   — target amplitudes
    variant_index : int64    ()           — 0-based variant selector (0–15)

    Outputs
    -------
    X_hat         : float32  (batch, n+1) — carrier amplitudes
    error         : float32  ()           — MSE  D(X_hat) vs T
    X_hat_clamped : float32  (batch, n+1) — carrier amplitudes clamped to [-2, 2]
    error_clamped : float32  ()           — MSE  D(X_hat_clamped) vs T
    """
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    # Load once with clamped=False — _SlimN computes both modes internally
    full_wrapper = QDTSSolverONNX(models_dir)
    full_wrapper.eval()

    print("── Exporting ONNX (combined clamped + non-clamped) ──")
    for n in range(N_MIN, N_MAX + 1):
        slim     = _SlimN(full_wrapper, n)
        slim.eval()
        dummy_T  = torch.zeros(batch_size, n)
        dummy_vi = torch.tensor(0, dtype=torch.int64)

        out_path = str(output_dir / f"qdts_solver_N{n}.onnx")
        torch.onnx.export(
            slim,
            (dummy_T, dummy_vi),
            out_path,
            input_names  = ["T", "variant_index"],
            output_names = ["X_hat", "error", "X_hat_clamped", "error_clamped"],
            dynamic_axes = {"T": {0: "batch"}},
            opset_version= opset,
        )
        print(f"  N={n:2d}  →  {out_path}")


# ── CLI ───────────────────────────────────────────────────────────────────────

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Export QDTS solver checkpoints to ONNX.")
    p.add_argument("--models_dir",  default="models/",       help="Directory of .pt checkpoints")
    p.add_argument("--output_dir",  default="onnx_exports/", help="Root output directory")
    p.add_argument("--opset",       type=int, default=14,    help="ONNX opset version")
    args = p.parse_args()

    export_onnx(args.models_dir, args.output_dir, opset=args.opset)
