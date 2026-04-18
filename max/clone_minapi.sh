#!/usr/bin/env bash
# clone_minapi.sh
# Clones the Cycling74 Min-API (includes Eigen as a submodule) and the Max SDK
# into max/lib/. Run this from the max/ directory before configuring CMake.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIB_DIR="${SCRIPT_DIR}/lib"
mkdir -p "${LIB_DIR}"

# ── Min-API (C++ wrapper + Eigen) ─────────────────────────────────────────────
MIN_API_DIR="${LIB_DIR}/min-api"
if [ -d "${MIN_API_DIR}/.git" ]; then
    echo "min-api already present at ${MIN_API_DIR}"
else
    echo "Cloning min-api (with submodules — includes Eigen) ..."
    git clone --recurse-submodules https://github.com/Cycling74/min-api.git "${MIN_API_DIR}"
    echo "min-api cloned."
fi

# ── Max SDK (needed for MaxAPI.lib on Windows; optional on macOS) ──────────────
MAX_SDK_DIR="${LIB_DIR}/max-sdk"
if [ -d "${MAX_SDK_DIR}/.git" ]; then
    echo "max-sdk already present at ${MAX_SDK_DIR}"
else
    echo "Cloning max-sdk ..."
    git clone https://github.com/Cycling74/max-sdk.git "${MAX_SDK_DIR}"
    echo "max-sdk cloned."
fi

echo ""
echo "Done. You can now run cmake from the max/ directory."
