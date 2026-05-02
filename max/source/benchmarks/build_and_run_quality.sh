#!/usr/bin/env bash
# build_and_run_quality.sh
#
# Compiles benchmark_quality.cpp against ONNX Runtime and Eigen,
# then runs the generation quality benchmark (qdts.solver vs qdts.solver_nn).
#
# Usage:
#   ./build_and_run_quality.sh [onnx_dir] [output_base] [num_inputs]
#
# Defaults:
#   onnx_dir    = <repo>/experiments/qdts_solver_nn/onnx_exports
#   output_base = results/quality_results
#   num_inputs  = 10000
#
# Override ORT or Eigen locations:
#   ORT_ROOT=/path/to/onnxruntime EIGEN_ROOT=/path/to/eigen ./build_and_run_quality.sh
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"

# ── locate ONNX Runtime ───────────────────────────────────────────────────────
if [[ -z "${ORT_ROOT:-}" ]]; then
    ORT_CANDIDATES=(
        "/Users/bezha/Github/GrooveTransformerMaxExternal/cmake-build-release/external/onnxruntime_prebuilt/onnxruntime-osx-arm64-static_lib-1.20.0"
        "${SCRIPT_DIR}/../../cmake-build-release/external/onnxruntime_prebuilt/onnxruntime-osx-arm64-static_lib-1.20.0"
        "/opt/homebrew/opt/onnxruntime"
        "/usr/local/opt/onnxruntime"
    )
    for candidate in "${ORT_CANDIDATES[@]}"; do
        if [[ -d "$candidate" ]]; then
            ORT_ROOT="$candidate"
            break
        fi
    done
fi

if [[ -z "${ORT_ROOT:-}" ]]; then
    echo "ERROR: ONNX Runtime not found. Set ORT_ROOT=/path/to/onnxruntime"
    exit 1
fi

# ── locate Eigen ──────────────────────────────────────────────────────────────
if [[ -z "${EIGEN_ROOT:-}" ]]; then
    EIGEN_CANDIDATES=(
        "${SCRIPT_DIR}/../../cmake-build-release/_deps/eigen3-src"
        "/opt/homebrew/include/eigen3"
        "/usr/local/include/eigen3"
    )
    for candidate in "${EIGEN_CANDIDATES[@]}"; do
        if [[ -f "${candidate}/Eigen/Dense" ]]; then
            EIGEN_ROOT="$candidate"
            break
        fi
    done
fi

if [[ -z "${EIGEN_ROOT:-}" ]]; then
    echo "ERROR: Eigen not found. Set EIGEN_ROOT=/path/to/eigen-src"
    exit 1
fi

echo "Using ORT  : ${ORT_ROOT}"
echo "Using Eigen: ${EIGEN_ROOT}"

# ── args ──────────────────────────────────────────────────────────────────────
ONNX_DIR="${1:-${REPO_ROOT}/experiments/qdts_solver_nn/onnx_exports}"
OUT_BASE="${2:-${SCRIPT_DIR}/results/quality_results}"
NUM_INPUTS="${3:-10000}"

mkdir -p "$(dirname "${OUT_BASE}")"

# ── compile ───────────────────────────────────────────────────────────────────
BINARY="${SCRIPT_DIR}/benchmark_quality"
SRC="${SCRIPT_DIR}/benchmark_quality.cpp"

echo ""
echo "Compiling ${SRC} ..."
clang++ \
    -std=c++17 \
    -O2 \
    -I"${ORT_ROOT}/include" \
    -I"${EIGEN_ROOT}" \
    -o "${BINARY}" \
    "${SRC}" \
    -L"${ORT_ROOT}/lib" \
    -lonnxruntime \
    -framework Foundation \
    -framework CoreML \
    -framework Accelerate

echo "Compiled  → ${BINARY}"

# ── run ───────────────────────────────────────────────────────────────────────
echo ""
echo "Running quality benchmark  (onnx_dir=${ONNX_DIR}, runs=${NUM_INPUTS}) ..."
echo ""
"${BINARY}" "${ONNX_DIR}" "${OUT_BASE}" "${NUM_INPUTS}"

echo ""
echo "Done."
echo "  Text  : ${OUT_BASE}.txt"
echo "  CSV   : ${OUT_BASE}.csv"
echo "  LaTeX : ${OUT_BASE}.tex"

# ── plot (single-run, if CSV has no radius column) ───────────────────────────
PLOT_SCRIPT="${SCRIPT_DIR}/plot_quality.py"
PLOT_BASE="${OUT_BASE}_plot"

# ── plot (multi-radius) ───────────────────────────────────────────────────────
PLOT_RADII_SCRIPT="${SCRIPT_DIR}/plot_quality_radii.py"
PLOT_RADII_BASE="${OUT_BASE}_radii_plot"

if command -v python3 &>/dev/null; then
    echo ""
    echo "Generating multi-radius plots ..."
    if [[ -f "${PLOT_RADII_SCRIPT}" ]]; then
        python3 "${PLOT_RADII_SCRIPT}" "${OUT_BASE}.csv" "${PLOT_RADII_BASE}"
    else
        echo "Skipping (plot_quality_radii.py missing)."
        echo "Run manually: python3 ${PLOT_RADII_SCRIPT} ${OUT_BASE}.csv ${PLOT_RADII_BASE}"
    fi
else
    echo ""
    echo "Skipping plots (python3 not found)."
fi
