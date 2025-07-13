#!/bin/bash

# Get current workspace ID
current_ws=$(hyprctl activeworkspace -j | jq '.id')

# Get list of active workspace IDs (≤10), sorted
workspaces=$(hyprctl workspaces -j | jq '.[].id' | awk '$1 <= 10' | sort -n)

# Convert to array
mapfile -t ws_array <<< "$workspaces"

# Find index of current workspace
for i in "${!ws_array[@]}"; do
    if [ "${ws_array[$i]}" -eq "$current_ws" ]; then
        next_index=$(( (i + 1) % ${#ws_array[@]} ))
        next_ws=${ws_array[$next_index]}
        hyprctl dispatch workspace "$next_ws"
        exit 0
    fi
done

# If current not in list, just go to first one
hyprctl dispatch workspace "${ws_array[0]}"

