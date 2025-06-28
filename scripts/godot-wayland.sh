#!/bin/bash
# Purpose: Patch Godot .desktop file to add --display-driver wayland locally

set -e

LOCAL_APPS_DIR="$HOME/.local/share/applications"
mkdir -p "$LOCAL_APPS_DIR"

SRC="/usr/share/applications/org.godotengine.Godot.desktop"
DEST="$LOCAL_APPS_DIR/org.godotengine.Godot.desktop"

echo "Copying original .desktop file from $SRC to $DEST"
cp "$SRC" "$DEST"

echo "Patching Exec line to add --display-driver wayland..."
# Insert --display-driver wayland right after 'godot'
sed -i '/^Exec=/ s|\(godot\)|\1 --display-driver wayland|' "$DEST"

echo "✅ Godot .desktop file patched successfully at:"
echo "   $DEST"
echo
echo "You can now launch Godot with --display-driver wayland enabled."

