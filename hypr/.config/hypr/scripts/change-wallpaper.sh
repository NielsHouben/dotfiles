#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <path-to-wallpaper>"
    exit 1
fi

# Resolve relative path to absolute path
WALLPAPER=$(realpath "$1")

if [ ! -f "$WALLPAPER" ]; then
    echo "File not found: $WALLPAPER"
    exit 1
fi

echo "Selected wallpaper: $WALLPAPER"

hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper ",$WALLPAPER"
hyprctl hyprpaper unload unused
