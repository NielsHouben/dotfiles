#!/bin/bash
# Purpose: Patch Brave .desktop file for native Wayland support directly in ~/.local

set -e

LOCAL_APPS_DIR="$HOME/.local/share/applications"
mkdir -p "$LOCAL_APPS_DIR"

SRC="/usr/share/applications/brave-browser.desktop"
DEST="$LOCAL_APPS_DIR/brave-browser.desktop"

echo "Copying original .desktop file from $SRC to $DEST"
cp "$SRC" "$DEST"

echo "Patching Exec lines for Wayland support..."
sed -i 's|^Exec=brave --incognito|Exec=brave --enable-features=UseOzonePlatform --ozone-platform=wayland --incognito|' "$DEST"
sed -i 's|^Exec=brave %U|Exec=brave --enable-features=UseOzonePlatform --ozone-platform=wayland %U|' "$DEST"
sed -i 's|^Exec=brave$|Exec=brave --enable-features=UseOzonePlatform --ozone-platform=wayland|' "$DEST"

echo "✅ Brave .desktop file patched successfully at:"
echo "   $DEST"
echo
echo "You can now launch Brave from your application launcher with Wayland enabled."

