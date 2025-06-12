#!/usr/bin/env bash

set -e

echo "Configuring locales..."
bash scripts/locale.sh

echo "Installing official repo packages..."
sudo pacman -Syu --noconfirm --needed $(< packages.txt)

echo "Installing yay (AUR helper) if needed..."
bash scripts/install-yay.sh

echo "Installing AUR packages..."
yay -S --noconfirm --needed $(< aurlist.txt)

echo "Refreshing font cache..."
fc-cache -fv

echo "Font and emoji test:"
echo "Hello, world! 👋🌍"
echo "Hej världen! 🇸🇪"
echo "こんにちは世界！🍣"          # Japanese: Hello, world!
echo "你好，世界！ 🐼"             # Chinese (Simplified): Hello, world!
echo "안녕하세요 세계! 🍚"         # Korean: Hello, world!


echo "✅ Setup complete."

