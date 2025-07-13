#!/bin/bash

current_ws=$(hyprctl activeworkspace -j | jq '.id')

workspaces=$(hyprctl workspaces -j | jq '.[].id' | awk '$1 > 0 && $1 <= 10' | sort -n)
mapfile -t ws_array <<< "$workspaces"
length=${#ws_array[@]}

if [[ "$length" -eq 0 ]]; then
    exit 1
fi

for i in "${!ws_array[@]}"; do
    if [[ "${ws_array[$i]}" -eq "$current_ws" ]]; then
        prev_index=$(( i - 1 ))
        if (( prev_index < 0 )); then
            prev_index=$(( length - 1 ))
        fi
        hyprctl dispatch workspace "${ws_array[$prev_index]}"
        exit 0
    fi
done

hyprctl dispatch workspace "${ws_array[$((length - 1))]}"

