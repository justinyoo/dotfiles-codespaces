#!/usr/bin/env sh

echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installing dotfiles ..."

## Copy oh-my-zsh files
mv ~/.zshrc ~/.zshrc.bak
cp .zshrc ~/
cp .p10k.zsh ~/
