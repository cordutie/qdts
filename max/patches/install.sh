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

ZIP_URL="https://github.com/cordutie/qdts/releases/download/${VERSION}/${VERSION}-${ARCH_LABEL}.zip"

echo "Architecture: $ARCH"
echo "Downloading: $ZIP_URL"

# ── Locate Max Packages folder ────────────────────────────────────────────────
MAX8_PACKAGES="$HOME/Documents/Max 8/Packages"
MAX9_PACKAGES="$HOME/Documents/Max 9/Packages"

HAS_MAX8=false
HAS_MAX9=false
[ -d "$MAX8_PACKAGES" ] && HAS_MAX8=true
[ -d "$MAX9_PACKAGES" ] && HAS_MAX9=true

if $HAS_MAX8 && $HAS_MAX9; then
    echo ""
    echo "Both Max 8 and Max 9 were found."
    while true; do
        read -r -p "Install for Max 8 or Max 9? [8/9]: " MAX_CHOICE
        case "$MAX_CHOICE" in
            8) MAX_PACKAGES="$MAX8_PACKAGES"; break ;;
            9) MAX_PACKAGES="$MAX9_PACKAGES"; break ;;
            *) echo "Please enter 8 or 9." ;;
        esac
    done
elif $HAS_MAX8; then
    echo "Max 8 found. Installing there."
    MAX_PACKAGES="$MAX8_PACKAGES"
elif $HAS_MAX9; then
    echo "Max 9 found. Installing there."
    MAX_PACKAGES="$MAX9_PACKAGES"
else
    echo "WARNING: No Max Packages folder found at default locations:"
    echo "  $MAX8_PACKAGES"
    echo "  $MAX9_PACKAGES"
    echo ""
    read -r -p "Enter the path to your Max Packages folder: " CUSTOM_PATH
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