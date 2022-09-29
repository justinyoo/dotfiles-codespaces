#!/usr/bin/env sh

echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installing dotfiles ..."

## Set environment variables

export CODESPACES_REPOSITORY=/workspaces/$RepositoryName

# Update the oh-my-zsh settings
cp .p10k-with-clock.zsh ~/
cp .p10k-without-clock.zsh ~/
cp switch-p10k-clock.sh ~/

cp ~/.p10k-with-clock.zsh ~/.p10k.zsh
cp ~/.zshrc ~/.zshrc.bak

echo "$(cat $HOME/.zshrc)" | awk '{gsub(/ZSH_THEME=\"codespaces\"/, "ZSH_THEME=\"powerlevel10k\"")}1' > $HOME/.zshrc.replaced && mv $HOME/.zshrc.replaced $HOME/.zshrc
echo "$(cat $HOME/.zshrc)" | awk '{gsub(/plugins=\(git\)/, "plugins=(git zsh-completions zsh-syntax-highlighting zsh-autosuggestions)")}1' > $HOME/.zshrc.replaced && mv $HOME/.zshrc.replaced $HOME/.zshrc
echo "
# To customize prompt, run 'p10k configure' or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
" >> $HOME/.zshrc
