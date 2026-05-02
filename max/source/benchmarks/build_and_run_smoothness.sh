#!/usr/bin/env bash
# build_and_run_smoothness.sh
#
# Compiles benchmark_smoothness.cpp against ONNX Runtime,
# then runs the qdts.solver_nn output-smoothness benchmark.
#
# Usage:
#   ./build_and_run_smoothness.sh [onnx_dir] [output_base] [num_pairs]
#
# Defaults:
#   onnx_dir    = <repo>/experiments/qdts_solver_nn/onnx_exports
#   output_base = results/smoothness_results
#   num_pairs   = 1000
#
# Override ORT location:
#   ORT_ROOT=/path/to/onnxruntime ./build_and_run_smoothness.sh
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

echo "Using ORT: ${ORT_ROOT}"

# ── args ──────────────────────────────────────────────────────────────────────
ONNX_DIR="${1:-${REPO_ROOT}/experiments/qdts_solver_nn/onnx_exports}"
OUT_BASE="${2:-${SCRIPT_DIR}/results/smoothness_results}"
NUM_PAIRS="${3:-1000}"

mkdir -p "$(dirname "${OUT_BASE}")"

# ── compile ───────────────────────────────────────────────────────────────────
BINARY="${SCRIPT_DIR}/benchmark_smoothness"
SRC="${SCRIPT_DIR}/benchmark_smoothness.cpp"

echo ""
echo "Compiling ${SRC} ..."
clang++ \
    -std=c++17 \
    -O2 \
    -I"${ORT_ROOT}/include" \
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
echo "Running smoothness benchmark  (onnx_dir=${ONNX_DIR}, pairs=${NUM_PAIRS}) ..."
echo ""
"${BINARY}" "${ONNX_DIR}" "${OUT_BASE}" "${NUM_PAIRS}"

echo ""
echo "Done."
echo "  Text : ${OUT_BASE}.txt"
echo "  CSV  : ${OUT_BASE}.csv"

# ── plot ──────────────────────────────────────────────────────────────────────
PLOT_SCRIPT="${SCRIPT_DIR}/plot_smoothness.py"
PLOT_BASE="${OUT_BASE}_plot"

if command -v python3 &>/dev/null && [[ -f "${PLOT_SCRIPT}" ]]; then
    echo ""
    echo "Generating plots ..."
    python3 "${PLOT_SCRIPT}" "${OUT_BASE}.csv" "${PLOT_BASE}"
else
    echo ""
    echo "Skipping plot (python3 not found or plot_smoothness.py missing)."
    echo "Run manually: python3 ${PLOT_SCRIPT} ${OUT_BASE}.csv ${PLOT_BASE}"
fi
