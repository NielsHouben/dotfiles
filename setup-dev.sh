#!/usr/bin/env bash

set -e

# Only source nvm if it exists
[ -s /usr/share/nvm/init-nvm.sh ] && . /usr/share/nvm/init-nvm.sh

echo "Make sure to source ~/.zshrc first"

echo "Installing nvm LTS"
nvm install --lts

