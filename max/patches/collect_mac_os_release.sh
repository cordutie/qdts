#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
MAX_PKG="$HOME/Documents/Max 9/Packages/qdts"

# ── Detect architecture ────────────────────────────────────────────────────────
ARCH=$(uname -m)
if [ "$ARCH" = "arm64" ]; then
    OUTPUT="$SCRIPT_DIR/qdts-osx-arm64.zip"
elif [ "$ARCH" = "x86_64" ]; then
    OUTPUT="$SCRIPT_DIR/qdts-osx-x86_64.zip"
else
    echo "ERROR: Unrecognized architecture: $ARCH"
    exit 1
fi

echo "Architecture: $ARCH → $(basename "$OUTPUT")"

# ── Locate Max 9 package ───────────────────────────────────────────────────────
if [ ! -d "$MAX_PKG" ]; then
    echo "WARNING: Max 9 package not found at default location:"
    echo "  $MAX_PKG"
    echo ""
    read -r -p "Enter the path to your Max 9 qdts package folder: " CUSTOM_PATH
    CUSTOM_PATH="${CUSTOM_PATH/#\~/$HOME}"
    if [ ! -d "$CUSTOM_PATH" ]; then
        echo "ERROR: Directory not found at:"
        echo "  $CUSTOM_PATH"
        exit 1
    fi
    MAX_PKG="$CUSTOM_PATH"
fi

echo "Using Max package at: $MAX_PKG"

# ── Check externals ────────────────────────────────────────────────────────────
EXTERNALS_DIR="$MAX_PKG/externals"

if [ ! -d "$EXTERNALS_DIR" ]; then
    echo "ERROR: externals directory not found at:"
    echo "  $EXTERNALS_DIR"
    exit 1
fi

MXO_COUNT=$(find "$EXTERNALS_DIR" -name "*.mxo" -maxdepth 1 | wc -l | tr -d ' ')
if [ "$MXO_COUNT" -eq 0 ]; then
    echo "ERROR: no .mxo files found in:"
    echo "  $EXTERNALS_DIR"
    echo "Build the externals first before creating a release."
    exit 1
fi

echo "Found $MXO_COUNT .mxo file(s) in externals — OK"

# ── Check Max package dirs ─────────────────────────────────────────────────────
for DIR in externals resources; do
    if [ ! -d "$MAX_PKG/$DIR" ]; then
        echo "ERROR: '$DIR' not found in Max package at:"
        echo "  $MAX_PKG"
        exit 1
    fi
done

# ── Check solver directories ───────────────────────────────────────────────────
for DIR in solver solver_nn; do
    if [ ! -d "$SCRIPT_DIR/$DIR" ]; then
        echo "ERROR: '$DIR' directory not found next to this script."
        exit 1
    fi
done

echo "Found solver and solver_nn — OK"

# ── Build zip ─────────────────────────────────────────────────────────────────
rm -f "$OUTPUT"
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

# Create target structure
mkdir -p "$TMP_DIR/qdts/patches"

# Copy Max package contents
cp -r "$MAX_PKG/externals" "$TMP_DIR/qdts/externals"
cp -r "$MAX_PKG/resources" "$TMP_DIR/qdts/resources"

# Copy solver directories into patches/
cp -r "$SCRIPT_DIR/solver"    "$TMP_DIR/qdts/patches/solver"
cp -r "$SCRIPT_DIR/solver_nn" "$TMP_DIR/qdts/patches/solver_nn"

# Zip
cd "$TMP_DIR"
zip -qr "$OUTPUT" qdts

echo "Release zip created at:"
echo "  $OUTPUT"