#!/bin/bash
set -e

VERSION="qdts-v0.2"

# ── Detect architecture ────────────────────────────────────────────────────────
ARCH=$(uname -m)
if [ "$ARCH" = "arm64" ]; then
    ARCH_LABEL="osx-arm64"
elif [ "$ARCH" = "x86_64" ]; then
    ARCH_LABEL="osx-x86_64"
else
    echo "ERROR: Unrecognized architecture: $ARCH"
    exit 1
fi

ZIP_URL="https://github.com/cordutie/qdts/releases/download/$VERSION/$VERSION-$ARCH_LABEL.zip"

echo "Architecture: $ARCH"
echo "Downloading: $ZIP_URL"

# ── Locate Max 9 Packages folder ──────────────────────────────────────────────
MAX_PACKAGES="$HOME/Documents/Max 9/Packages"

if [ ! -d "$MAX_PACKAGES" ]; then
    echo "WARNING: Max 9 Packages folder not found at default location:"
    echo "  $MAX_PACKAGES"
    echo ""
    read -r -p "Enter the path to your Max 9 Packages folder: " CUSTOM_PATH
    CUSTOM_PATH="${CUSTOM_PATH/#\~/$HOME}"
    if [ ! -d "$CUSTOM_PATH" ]; then
        echo "ERROR: Directory not found at: $CUSTOM_PATH"
        exit 1
    fi
    MAX_PACKAGES="$CUSTOM_PATH"
fi

echo "Installing to: $MAX_PACKAGES"

# ── Download & extract ─────────────────────────────────────────────────────────
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

curl -L --progress-bar "$ZIP_URL" -o "$TMP_DIR/qdts.zip"
unzip -q "$TMP_DIR/qdts.zip" -d "$TMP_DIR"

# Remove existing installation if present
rm -rf "$MAX_PACKAGES/qdts"

cp -r "$TMP_DIR/qdts" "$MAX_PACKAGES/qdts"

# ── Remove quarantine ──────────────────────────────────────────────────────────
xattr -dr com.apple.quarantine "$MAX_PACKAGES/qdts"

echo ""
echo "QDTS installed successfully at:"
echo "  $MAX_PACKAGES/qdts"