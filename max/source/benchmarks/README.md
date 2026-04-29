# QDTS Solver Benchmarks

Three benchmarks evaluate the two QDTS Max externals:

| Solver | Method |
|---|---|
| `qdts.solver` | Newton–Raphson (iterative, Eigen) |
| `qdts.solver_nn` | Neural network (ONNX, 16 model variants) |

---

## 1. Timing comparison (`benchmark_comparison`)

Head-to-head wall-clock timing for N = 5 … 16, across 10 000 random inputs from `[0, 2]`.  
`qdts.solver_nn` is aggregated over all 16 model variants per N.

```bash
./build_and_run_comparison.sh
```

**Output files (`results/`)**

| File | Description |
|---|---|
| `comparison_results.txt` | Human-readable table (mean ± std per N) |
| `comparison_results.csv` | Per-N stats used by the plotting script |
| `comparison_results.tex` | LaTeX table, ready to `\input{}` |
| `comparison_results_plot.pdf/.png` | Computation time vs N figure |

---

## 2. Generation quality (`benchmark_quality`)

Reconstruction error (clamped MSE) of `qdts.solver_nn` for N = 5 … 16, across 10 000 random inputs from `[0, 1]`, all 16 model variants.

```bash
./build_and_run_quality.sh
```

**Output files (`results/`)**

| File | Description |
|---|---|
| `quality_results.txt` | Human-readable table (mean ± std, min, max per N) |
| `quality_results.csv` | Per-N stats used by the plotting script |
| `quality_results.tex` | LaTeX table, ready to `\input{}` |
| `quality_results_plot.pdf/.png` | Reconstruction error vs N figure |

---

## 3. Output smoothness (`benchmark_smoothness`)

Tests whether `qdts.solver_nn` outputs vary smoothly under linear input interpolation.  
For N = 5 … 16 and all 16 model variants, 1 000 random endpoint pairs are generated
(A ~ U[0, 2]ᴺ, B = 2 − A) and the model is queried at 11 interpolation points
t = 0, 0.1, …, 1.0.  The MSE between f((1−t)A + tB) and the linear blend
(1−t)f(A) + tf(B) is computed and pooled across all N and variants.

```bash
./build_and_run_smoothness.sh
```

**Output files (`results/`)**

| File | Description |
|---|---|
| `smoothness_results.txt` | Human-readable per-t stats table |
| `smoothness_results.csv` | Per-t box stats used by the plotting script |
| `smoothness_results_plot_mean.pdf/.png` | Mean ± std smoothness error figure |
| `smoothness_results_plot_box.pdf/.png` | Box-and-whisker smoothness error figure |

---

## Overriding defaults

All three scripts accept positional arguments:

```bash
./build_and_run_comparison.sh  [onnx_dir] [output_base] [num_inputs]
./build_and_run_quality.sh     [onnx_dir] [output_base] [num_inputs]
./build_and_run_smoothness.sh  [onnx_dir] [output_base] [num_pairs]
```

Custom ORT or Eigen paths:

```bash
ORT_ROOT=/path/to/onnxruntime EIGEN_ROOT=/path/to/eigen ./build_and_run_comparison.sh
ORT_ROOT=/path/to/onnxruntime ./build_and_run_quality.sh
ORT_ROOT=/path/to/onnxruntime ./build_and_run_smoothness.sh
```

---

## Dependencies

| Dependency | Where it comes from |
|---|---|
| ONNX Runtime | Auto-detected from `cmake-build-release/` or Homebrew |
| Eigen | Auto-detected from `cmake-build-release/_deps/eigen3-src/` or Homebrew (comparison only) |
| Python 3 + `matplotlib` | System Python; install with `pip3 install matplotlib` |
