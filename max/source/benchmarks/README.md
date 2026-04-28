# QDTS Solver Benchmark

Head-to-head timing comparison between the two QDTS solvers:

| Solver | Method |
|---|---|
| `qdts.solver` | Newton–Raphson (iterative, Eigen) |
| `qdts.solver_nn` | Neural network (ONNX, 16 model variants) |

For each target tone count N = 5 … 16, 100 random inputs are generated and timed.  
`qdts.solver_nn` is run across all 16 model variants per N (1 600 calls per N).

---

## How to run

From this folder:

```bash
./build_and_run_comparison.sh
```

This will:
1. Compile `benchmark_comparison.cpp` (requires clang++, ONNX Runtime, Eigen — auto-detected)
2. Run the benchmark and write results to `results/`
3. Run `plot_comparison.py` to generate the figure (requires `matplotlib`)

Override defaults if needed:

```bash
# custom ONNX models dir, output base, number of inputs per N
./build_and_run_comparison.sh /path/to/onnx_exports results/my_run 200

# custom ORT or Eigen path
ORT_ROOT=/path/to/onnxruntime ./build_and_run_comparison.sh
```

---

## Output files (`results/`)

| File | Description |
|---|---|
| `comparison_results.txt` | Human-readable table (mean ± std per N) |
| `comparison_results.csv` | Raw per-N stats, used by the plotting script |
| `comparison_results.tex` | LaTeX table, ready to `\input{}` in a paper |
| `comparison_results_plot.pdf` | Figure for inclusion in a LaTeX document |
| `comparison_results_plot.png` | Same figure as PNG |

---

## Dependencies

| Dependency | Where it comes from |
|---|---|
| ONNX Runtime | Auto-detected from `cmake-build-release/` or Homebrew |
| Eigen | Auto-detected from `cmake-build-release/_deps/eigen3-src/` or Homebrew |
| Python 3 + `matplotlib` | System Python; install with `pip3 install matplotlib` |
