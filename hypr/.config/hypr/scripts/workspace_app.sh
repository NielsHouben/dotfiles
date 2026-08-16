#!/usr/bin/env bash
#
# workspace_app.sh — go to a workspace and launch the app if it's not running yet
#
# Usage:
#   workspace_app.sh <workspace_number> <window_class_regex> <launch_command>
#
# Example binds (hyprland.conf):
#   bind = $mainMod, N, exec, ~/.config/hypr/scripts/workspace_app.sh 11 "md.obsidian.Obsidian" "obsidian"
#   bind = $mainMod, D, exec, ~/.config/hypr/scripts/workspace_app.sh 12 "discord" "discord"
#   bind = $mainMod, M, exec, ~/.config/hypr/scripts/workspace_app.sh 13 "Spotify" "spotify"

WORKSPACE="$1"
CLASS="$2"
LAUNCH_CMD="$3"

if [[ -z "$WORKSPACE" || -z "$CLASS" || -z "$LAUNCH_CMD" ]]; then
    echo "Usage: $0 <workspace_number> <window_class_regex> <launch_command>" >&2
    exit 1
fi

# Always switch to the workspace first
hyprctl dispatch workspace "$WORKSPACE"

# Check if a window with this class already exists (case-sensitive, matches hyprctl clients "class:" field)
if ! hyprctl clients -j | jq -e --arg c "$CLASS" '.[] | select(.class == $c)' >/dev/null 2>&1; then
    # Not running — launch it. The window rule for this class will move it
    # to the right workspace once it maps, so we don't need to do that here.
    eval "$LAUNCH_CMD" &
    disown
fi

