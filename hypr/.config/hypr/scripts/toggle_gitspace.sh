#!/bin/bash

# Check if currently in gitspace
was_in_gitspace=$(hyprctl activeworkspace -j | jq -r '.name == "special:gitspace"')

# Toggle gitspace workspace
hyprctl dispatch togglespecialworkspace gitspace


# If we were already in it, we just toggled it off — exit early
if [ "$was_in_gitspace" == "true" ]; then
  exit 0
fi

# Check if kitty with class=gitspace already exists
kitty_exists=$(hyprctl clients -j | jq -r '.[] | select(.class == "gitspace")' | wc -l)

# If not, launch it
if [ "$kitty_exists" -eq 0 ]; then
  kitty --class gitspace
  hyprctl dispatch focuswindow class:gitspace
fi

