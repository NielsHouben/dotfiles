#!/usr/bin/env bash

ZSH_PLUGIN_DIR="$HOME/.local/share/zsh/plugins"

mkdir -p "$ZSH_PLUGIN_DIR"

declare -A plugins=(
  [zsh-autosuggestions]="https://github.com/zsh-users/zsh-autosuggestions.git"
  [zsh-syntax-highlighting]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
)

for plugin in "${!plugins[@]}"; do
  plugin_dir="$ZSH_PLUGIN_DIR/$plugin"
  if [[ ! -d "$plugin_dir" ]]; then
    echo "Cloning $plugin..."
    git clone "${plugins[$plugin]}" "$plugin_dir"
  else
    echo "$plugin already installed."
  fi
done

