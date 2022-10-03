#!/usr/bin/env sh

echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installing dotfiles ..."

## Set environment variables

export CODESPACES_REPOSITORY=/workspaces/$RepositoryName

# Install plugins and themes (p10k)
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installing plugins and themes for oh-my-zsh ..."
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k --depth=1
ln -s ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme ~/.oh-my-zsh/custom/themes/powerlevel10k.zsh-theme

# Update the oh-my-zsh settings
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Updating settings for oh-my-zsh ..."
cp .p10k-with-clock.zsh ~/
cp .p10k-without-clock.zsh ~/
cp switch-p10k-clock.sh ~/

cp ~/.p10k-with-clock.zsh ~/.p10k.zsh
cp ~/.zshrc ~/.zshrc.bak

echo "$(cat ~/.zshrc)" | awk '{gsub(/ZSH_THEME=\"codespaces\"/, "ZSH_THEME=\"powerlevel10k\"")}1' > ~/.zshrc.replaced && mv ~/.zshrc.replaced ~/.zshrc
echo "$(cat ~/.zshrc)" | awk '{gsub(/plugins=\(git\)/, "plugins=(git zsh-completions zsh-syntax-highlighting zsh-autosuggestions)")}1' > ~/.zshrc.replaced && mv ~/.zshrc.replaced ~/.zshrc
echo "
# To customize prompt, run 'p10k configure' or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
" >> ~/.zshrc

# Update the oh-my-posh settings
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Updating settings for oh-my-posh ..."
cp p10k-with-clock.omp.json ~/
cp p10k-without-clock.omp.json ~/
cp switch-p10k-clock.ps1 ~/

mkdir ~/.config/powershell
cp Microsoft.PowerShell_profile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1
cp Microsoft.PowerShell_profile.ps1 ~/.config/powershell/Microsoft.VSCode_profile.ps1

cp ~/p10k-with-clock.omp.json ~/p10k.omp.json

# Add Azure Functions related
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Installing local.settings.json builder for Azure Functions ..."
cp Build-LocalSettingsJson.ps1 ~/
