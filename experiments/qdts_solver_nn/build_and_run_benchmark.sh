#!/usr/bin/env bash
# build_and_run_benchmark.sh
#
# Compiles benchmark_onnx.cpp against the ONNX Runtime static library
# and immediately runs the benchmark.
#
# Usage:
#   ./build_and_run_benchmark.sh [onnx_dir] [output_file] [num_inputs]
#
# Defaults:
#   onnx_dir    = onnx_exports
#   output_file = benchmark_results.txt
#   num_inputs  = 100
#
# Override ORT location:
#   ORT_ROOT=/path/to/onnxruntime ./build_and_run_benchmark.sh
#
set -euo pipefail

# ── paths ─────────────────────────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Default ORT: look for the static-lib prebuilt used by sibling projects,
# then fall back to common homebrew paths.
if [[ -z "${ORT_ROOT:-}" ]]; then
    ORT_CANDIDATES=(
        "/Users/bezha/Github/GrooveTransformerMaxExternal/cmake-build-release/external/onnxruntime_prebuilt/onnxruntime-osx-arm64-static_lib-1.20.0"
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

ORT_INCLUDE="${ORT_ROOT}/include"
ORT_LIB="${ORT_ROOT}/lib"

echo "Using ORT: ${ORT_ROOT}"

# ── args ──────────────────────────────────────────────────────────────────────
ONNX_DIR="${1:-${SCRIPT_DIR}/onnx_exports}"
OUTPUT_FILE="${2:-${SCRIPT_DIR}/benchmark_results.txt}"
NUM_INPUTS="${3:-100}"

# ── compile ───────────────────────────────────────────────────────────────────
BINARY="${SCRIPT_DIR}/benchmark_onnx"
SRC="${SCRIPT_DIR}/benchmark_onnx.cpp"

echo "Compiling ${SRC} ..."
clang++ \
    -std=c++17 \
    -O2 \
    -I"${ORT_INCLUDE}" \
    -o "${BINARY}" \
    "${SRC}" \
    -L"${ORT_LIB}" \
    -lonnxruntime \
    -framework Foundation \
    -framework CoreML \
    -framework Accelerate

echo "Compiled  → ${BINARY}"

# ── run ───────────────────────────────────────────────────────────────────────
echo ""
echo "Running benchmark  (onnx_dir=${ONNX_DIR}, runs=${NUM_INPUTS}) ..."
echo ""
"${BINARY}" "${ONNX_DIR}" "${OUTPUT_FILE}" "${NUM_INPUTS}"

echo ""
echo "Done. Results: ${OUTPUT_FILE}"
