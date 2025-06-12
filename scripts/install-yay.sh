#!/usr/bin/env bash

set -e

if ! command -v yay &> /dev/null; then
    echo "yay not found. Installing yay..."

    sudo pacman -S --needed --noconfirm base-devel git

    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmpdir"
    cd "$tmpdir"
    makepkg -si --noconfirm
    cd -
    rm -rf "$tmpdir"
else
    echo "yay is already installed."
fi

