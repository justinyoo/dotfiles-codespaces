#!/usr/bin/env sh

echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installing dotfiles ..."

## Set environment variables

export CODESPACES_REPOSITORY=/workspaces/$RepositoryName

## Copy oh-my-zsh files
mv ~/.zshrc ~/.zshrc.bak
cp .zshrc ~/
cp .p10k.zsh ~/

source ~/.zshrc
