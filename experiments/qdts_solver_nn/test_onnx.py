"""
test_onnx.py

Verifies that each exported ONNX model produces outputs numerically identical
to the corresponding PyTorch wrapper for both the clamped and non-clamped variants.

For every (n, variant_index, clamped) combination the test:
  1. Runs inference through QDTSSolverONNX (PyTorch).
  2. Runs the matching ONNX file through onnxruntime.
  3. Asserts X_hat and error agree within a tight tolerance.

Usage
-----
    python test_onnx.py                          # all N, all variants, batch=4
    python test_onnx.py --n 10                   # single N
    python test_onnx.py --n 10 --variant 3       # single (N, variant)
    python test_onnx.py --atol 1e-5              # looser tolerance
    python test_onnx.py --onnx_dir onnx_exports/ --models_dir models/
"""

import argparse
import sys
from pathlib import Path

import numpy as np
import torch

sys.path.insert(0, str(Path(__file__).parent))
from onnx_wrapper import QDTSSolverONNX, N_MIN, N_MAX, VARIANTS_PER_N

try:
    import onnxruntime as ort
except ImportError:
    sys.exit("onnxruntime not found. Install with: pip install onnxruntime")


# ── helpers ───────────────────────────────────────────────────────────────────

def load_ort_session(onnx_path: str) -> ort.InferenceSession:
    opts = ort.SessionOptions()
    opts.log_severity_level = 3   # suppress ORT info/warnings
    return ort.InferenceSession(onnx_path, sess_options=opts)


def run_pytorch(
    wrapper: QDTSSolverONNX,
    T: torch.Tensor,
    n: int,
    variant_index: int,
):
    with torch.no_grad():
        X_hat, error, X_hat_c, error_c = wrapper(T, n, torch.tensor(variant_index, dtype=torch.int64))
    return X_hat.numpy(), error.numpy(), X_hat_c.numpy(), error_c.numpy()


def run_onnx(
    session: ort.InferenceSession,
    T: np.ndarray,
    variant_index: int,
):
    feeds = {
        "T":             T,
        "variant_index": np.array(variant_index, dtype=np.int64),
    }
    X_hat, error, X_hat_c, error_c = session.run(
        ["X_hat", "error", "X_hat_clamped", "error_clamped"], feeds
    )
    return X_hat, error, X_hat_c, error_c


def check(
    label: str,
    pt_val: np.ndarray,
    ort_val: np.ndarray,
    atol: float,
) -> bool:
    ok = np.allclose(pt_val, ort_val, atol=atol, rtol=0)
    status = "PASS" if ok else "FAIL"
    if not ok:
        max_diff = np.abs(pt_val - ort_val).max()
        print(f"  [{status}] {label}  max_diff={max_diff:.2e}  (atol={atol:.0e})")
    return ok


# ── main test loop ────────────────────────────────────────────────────────────

def run_tests(
    models_dir: str,
    onnx_dir: str,
    n_filter,
    variant_filter,
    batch_size: int,
    atol: float,
) -> None:
    onnx_dir = Path(onnx_dir)

    n_values = [n_filter] if n_filter is not None else list(range(N_MIN, N_MAX + 1))
    variants = [variant_filter] if variant_filter is not None else list(range(VARIANTS_PER_N))

    total = passed = failed = 0

    wrapper = QDTSSolverONNX(models_dir)
    wrapper.eval()

    print(f"\n{'='*60}")
    print(f"  Comparing PyTorch vs ONNX (clamped + non-clamped)")
    print(f"{'='*60}")

    for n in n_values:
        onnx_path = onnx_dir / f"qdts_solver_N{n}.onnx"
        if not onnx_path.exists():
            print(f"  [SKIP] {onnx_path} not found")
            continue

        session = load_ort_session(str(onnx_path))
        T_np = np.random.rand(batch_size, n).astype(np.float32)
        T_pt = torch.from_numpy(T_np)

        print(f"\n  N={n}  ({len(variants)} variants, batch={batch_size})")

        for vi in variants:
            label = f"N={n} vi={vi:2d}"
            total += 1

            pt_xhat, pt_err, pt_xhat_c, pt_err_c     = run_pytorch(wrapper, T_pt, n, vi)
            ort_xhat, ort_err, ort_xhat_c, ort_err_c = run_onnx(session, T_np, vi)

            ok = all([
                check(f"{label}  X_hat",         pt_xhat,   ort_xhat,   atol),
                check(f"{label}  error",          pt_err,    ort_err,    atol),
                check(f"{label}  X_hat_clamped",  pt_xhat_c, ort_xhat_c, atol),
                check(f"{label}  error_clamped",  pt_err_c,  ort_err_c,  atol),
            ])
            if ok:
                passed += 1
            else:
                failed += 1

    # ── summary ───────────────────────────────────────────────────────────────
    print(f"\n{'='*60}")
    print(f"  Results: {passed}/{total} passed", end="")
    if failed:
        print(f"  ({failed} FAILED)")
    else:
        print("  — all OK")
    print(f"{'='*60}\n")

    if failed:
        sys.exit(1)


# ── CLI ───────────────────────────────────────────────────────────────────────

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Compare PyTorch vs ONNX inference.")
    p.add_argument("--models_dir", default="models/",       help="Checkpoint directory")
    p.add_argument("--onnx_dir",   default="onnx_exports/", help="Root ONNX export directory")
    p.add_argument("--n",          type=int, default=None,  help="Test a single N value")
    p.add_argument("--variant",    type=int, default=None,  help="Test a single variant index")
    p.add_argument("--batch",      type=int, default=4,     help="Batch size for dummy input")
    p.add_argument("--atol",       type=float, default=1e-5, help="Absolute tolerance for comparison")
    p.add_argument("--seed",       type=int, default=0,     help="Random seed for dummy inputs")
    args = p.parse_args()

    np.random.seed(args.seed)
    torch.manual_seed(args.seed)

    run_tests(
        models_dir    = args.models_dir,
        onnx_dir      = args.onnx_dir,
        n_filter      = args.n,
        variant_filter= args.variant,
        batch_size    = args.batch,
        atol          = args.atol,
    )
