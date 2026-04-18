# QDTS Solver NN

Neural network (`HomogeneousInverse`) that inverts the QDT distortion function: given a target amplitude spectrum `T ∈ R^n`, it recovers the carrier complex `X̂ ∈ R^(n+1)` needed to evoke it. Learned counterpart to the Newton-Raphson solver in *Gutiérrez et al., ICMC 2023*.

The output is one dimension larger than the input because `D` maps `n+1` carriers → `n` targets (anti-diagonal sums), so its inverse goes `R^n → R^(n+1)`.

<details>
<summary><b>Directory structure</b></summary>

```
qdts_solver_nn/
├── qdts_nn/
│   ├── model.py        # HomogeneousInverse, model_creator
│   ├── train.py        # loss functions, train/val loops
│   └── auxiliar.py     # save_model / load_model
├── models/             # 192 checkpoints + results.csv
├── onnx_wrapper.py     # loads all checkpoints, exports ONNX
├── test_onnx.py        # verifies PyTorch vs ONNX outputs match
├── onnx_exports/       # exported ONNX files (one per N value)
├── training.ipynb
└── evaluation.ipynb
```

</details>

---

<details>
<summary><b>Training</b></summary>

The model is trained end-to-end by passing the predicted carriers back through `D` and minimising reconstruction error.

```
T ∈ R^n  (target amplitudes)
    │
    ▼
┌─────────────────┐
│  G  (network)   │   R^n → R^(n+1)
└────────┬────────┘
         │  X̂ ∈ R^(n+1)
         ▼
┌─────────────────┐
│  D  (distortion │   R^(n+1) → R^n
│     function)   │   anti-diagonal sums
└────────┬────────┘
         │  T̂ ∈ R^n
         ▼
    Loss = MSE(T̂, T)            ← loss_inverse_distortion
         + λ · (x̂₀ − 1)²       ← reg_one   (first carrier near 1)
         + (1−λ) · ‖x̂₁…ₙ‖²    ← reg_zero  (others near 0)
```

**Checkpoints** — `Model_N{n}_L{num_layers}_H{hidden_size}_R{weight_reg_one}_seed{seed}.pt`

| Field | Values |
|---|---|
| `N` | 5–16 |
| `L` | 3 |
| `H` | 256 |
| `R` (λ above) | 0.0 or 0.25 |
| `seed` | 123, 246, 369, 492, 615, 738, 861, 984 |

192 total = 12 × 2 × 8. Validation metrics in `models/results.csv`.

</details>

---

<details>
<summary><b>Inference</b></summary>

At inference only `G` is used. The input is normalised to enforce homogeneity of degree 1/2 (`G(λT) = √λ · G(T)`), then re-scaled after the network.

```
T ∈ R^n
    │
    │  normalise: T_unit = T/‖T‖,  scale = √‖T‖
    ▼
┌──────────────────────┐
│  Linear(n → H)       │
│  SiLU                │  ← input layer
├──────────────────────┤
│  Linear(H → H)       │
│  ReLU                │  ← hidden layer  ×(num_layers − 1)
├──────────────────────┤
│  Linear(H → n+1)     │  ← output layer (no activation)
└──────────┬───────────┘
           │
           │  re-scale: output × scale
           ▼
    X̂ ∈ R^(n+1)  (carrier amplitudes)
```

```python
from qdts_nn.auxiliar import load_model
model = load_model("models/Model_N10_L3_H256_R0.25_seed369.pt")
X_hat = model(T)                   # forward
X_hat = model.forward_clamped(T)   # clamped to [-2, 2]
```

</details>

---

<details>
<summary><b>ONNX conversion</b></summary>

All 192 checkpoints are wrapped in `onnx_wrapper.py` (`QDTSSolverONNX`), which stacks their weights as zero-padded buffers so they can be indexed at runtime by `variant_index`.

One ONNX file is exported per N value (12 files total). A single file cannot cover all N values because the first and last layer shapes differ with N (`Linear(n, H)` vs `Linear(n', H)`). Each file holds all 16 variants for that N and returns **four outputs** in one forward pass:

| Output | Shape | Description |
|---|---|---|
| `X_hat` | `(batch, n+1)` | carrier amplitudes |
| `error` | `()` | MSE — `D(X̂)` vs `T` |
| `X_hat_clamped` | `(batch, n+1)` | carrier amplitudes clamped to `[−2, 2]` |
| `error_clamped` | `()` | MSE — `D(X̂_clamped)` vs `T` |

**Export**

```bash
python onnx_wrapper.py --models_dir models/ --output_dir onnx_exports/
```

**Verify (PyTorch vs ONNX)**

```bash
python test_onnx.py                   # all N, all variants
python test_onnx.py --n 10            # single N
python test_onnx.py --n 10 --variant 3
```

</details>

---

<details>
<summary><b>ONNX inference — Python &amp; C++</b></summary>

### Python

```python
import numpy as np
import onnxruntime as ort

session = ort.InferenceSession("onnx_exports/qdts_solver_N10.onnx")

T             = np.random.rand(1, 10).astype(np.float32)  # target amplitudes (batch, n)
variant_index = np.int64(3)                                # 0-based, alphabetical order

X_hat, error, X_hat_clamped, error_clamped = session.run(
    ["X_hat", "error", "X_hat_clamped", "error_clamped"],
    {"T": T, "variant_index": variant_index},
)
# X_hat        : (1, 11)  carrier amplitudes
# X_hat_clamped: (1, 11)  same, clamped to [-2, 2]
# error        : scalar   MSE reconstruction error
```

### C++

Requires the [ONNX Runtime C++ SDK](https://onnxruntime.ai/docs/install/).

Each ONNX file covers one value of N and all 16 variants. To switch between different N values at runtime, load the corresponding file into a new `Ort::Session`. To switch between variants, simply change the `variant_index` value passed as input — no reload needed.

```cpp
#include <onnxruntime/core/session/onnxruntime_cxx_api.h>
#include <string>
#include <vector>
#include <cstdint>

// Helper: load a session for a given N from the ONNX export directory.
// Call this once per N value and reuse the session for all variants.
Ort::Session loadSession(Ort::Env& env, const std::string& onnx_dir, int n) {
    Ort::SessionOptions opts;
    std::string path = onnx_dir + "/qdts_solver_N" + std::to_string(n) + ".onnx";
    return Ort::Session(env, path.c_str(), opts);
}

// Helper: run inference for a given variant.
// Changing variant_index is the only thing needed to switch models within the same N.
std::vector<float> runInference(Ort::Session& session, const std::vector<float>& T,
                                int n, int variant_index) {
    auto mem = Ort::MemoryInfo::CreateCpu(OrtArenaAllocator, OrtMemTypeDefault);

    std::vector<float>   T_data   = T;
    int64_t vi64 = static_cast<int64_t>(variant_index);
    std::array<int64_t, 2> T_shape  = {1, n};
    std::array<int64_t, 0> vi_shape = {};  // 0-dim scalar — required by the Gather op in the graph

    std::vector<Ort::Value> inputs;
    inputs.push_back(Ort::Value::CreateTensor<float>  (mem, T_data.data(), T_data.size(), T_shape.data(),  2));
    inputs.push_back(Ort::Value::CreateTensor<int64_t>(mem, &vi64,         1,             vi_shape.data(), 0));

    const char* in_names[]  = {"T", "variant_index"};
    const char* out_names[] = {"X_hat", "error", "X_hat_clamped", "error_clamped"};
    auto outputs = session.Run(Ort::RunOptions{}, in_names, inputs.data(), 2, out_names, 4);

    float* x    = outputs[0].GetTensorMutableData<float>();
    float  err  = *outputs[1].GetTensorMutableData<float>();
    float* x_cl = outputs[2].GetTensorMutableData<float>();
    // outputs[3] → error_clamped

    return std::vector<float>(x, x + n + 1);  // return X_hat
}

int main() {
    Ort::Env env(ORT_LOGGING_LEVEL_WARNING, "qdts");

    // --- Switch N: load a different session ---
    int n = 10;
    auto session = loadSession(env, "onnx_exports", n);

    std::vector<float> T(n, 0.5f);

    // --- Switch variant: just change the index, same session ---
    for (int vi = 0; vi < 16; ++vi) {
        auto X_hat = runInference(session, T, n, vi);
        // use X_hat (length n+1) ...
    }

    // --- Switch to a different N: load new session, keep env ---
    n = 12;
    auto session2 = loadSession(env, "onnx_exports", n);
    T.assign(n, 0.5f);
    auto X_hat2 = runInference(session2, T, n, 0);
}
```

> **Note on `variant_index` shape**: must be a 0-dim (scalar) tensor. Passing it as rank-1 `{1}` causes the internal Gather op to return shape `(1, 2, H, H)` instead of `(2, H, H)`, which crashes at runtime.

</details>

---

<details>
<summary><b>ONNX benchmarking</b></summary>

`benchmark_onnx.cpp` runs inference on every (N, variant) combination with a configurable number of random inputs and writes latency statistics to a text file. `build_and_run_benchmark.sh` compiles the C++ and immediately runs it.

**Run**

```bash
bash build_and_run_benchmark.sh [onnx_dir] [output_file] [num_inputs]
# defaults: onnx_exports/   benchmark_results.txt   100
```

The script auto-detects the ONNX Runtime static library from sibling project builds. Override with:

```bash
ORT_ROOT=/path/to/onnxruntime bash build_and_run_benchmark.sh
```

**Output** — `benchmark_results.txt` contains two tables:

*Per-variant* (one row per N × variant):

```
N    variant   mean      std       min       p50       p95       p99       max
------...
5    0         0.1230    0.0120    0.1050    0.1190    0.1450    0.1670    0.2100
...
```

*Per-N summary* (aggregated over all 16 variants and all inputs):

```
N    mean      std       min       p50       p95       p99       max
------...
5    0.1070    0.0110    0.0910    0.1050    0.1280    0.1480    0.2100
...
16   0.2480    0.0180    0.2100    0.2450    0.2790    0.3010    0.4200
```

All times are in milliseconds. The benchmark uses a single ORT thread (`SetIntraOpNumThreads(1)`) and full graph optimisation for realistic single-call latency.

</details>
