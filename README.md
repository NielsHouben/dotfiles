# Setup

Simple setup for installing official and AUR packages. Will install yay helper if needed.

## Files
- `setup.sh` — Main script. Installs official and AUR packages.
- `packages.txt` — List of official Arch packages (e.g., zsh, kitty, neovim).
- `aurlist.txt` — List of AUR packages.
- `scripts/install-aur.sh` — Installs `yay` (if not already installed).

## Running the setup script
    chmod +x setup.sh scripts/*.sh
    ./setup.sh



# Dotfiles

## Add symlinks
    stow zsh kitty nvim

## Remove symlinks
    stow -D zsh

