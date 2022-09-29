#!/usr/bin/env sh

echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installing dotfiles ..."

## Set environment variables

export CODESPACES_REPOSITORY=/workspaces/$RepositoryName

# Update the oh-my-zsh settings without your dotfiles
cp .p10k-with-clock.zsh ~/
cp .p10k-without-clock.zsh ~/
cp switch-p10k-clock.sh ~/

mv ~/.zshrc ~/.zshrc.bak

echo "$(sed 's/ZSH_THEME="codespaces"/ZSH_THEME="powerlevel10k"/g' ~/.zshrc)" > ~/.zshrc
echo "$(sed 's/plugins=(git)/plugins=(git zsh-completions zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc)" > ~/.zshrc
echo "
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> $HOME/.zshrc
