#!/bin/bash

WALLPAPER_DIRECTORY="$HOME/wallpapers"

# Pick a random wallpaper
WALLPAPER=$(find -L "$WALLPAPER_DIRECTORY" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n 1)

if [ -z "$WALLPAPER" ]; then
    echo "No wallpaper found. Check your directory or file extensions."
    exit 1
fi

echo "Selected wallpaper: $WALLPAPER"

hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper ",$WALLPAPER"
hyprctl hyprpaper unload unused

