sudo apt update
sudo apt install -y curl git zsh tmux bat fzf btop tig zoxide

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl -LOs https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
# ~/.zshrc sets the PATH for nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Los lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

curl -LOs https://github.com/so-fancy/diff-so-fancy/releases/download/v1.4.4/diff-so-fancy
chmod +x diff-so-fancy
mv diff-so-fancy $HOME/.local/bin/

sudo curl -s https://ohmyposh.dev/install.sh | bash -s

sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

echo "Defaulting shell to zshell"
sudo chsh -s $(which zsh) $(whoami)

echo "Setting up dotfiles"
if [ -d ~/.config ]; then
  echo "Backing up ~/.config to ~/.config.bak"
  cp -r ~/.config ~/.config.bak
fi
if [ -f ~/.zshrc ]; then
  echo "Backing up ~/.zshrc to ~/.zshrc.bak"
  cp ~/.zshrc ~/.zshrc.bak
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

cp -rf "$SCRIPT_DIR/.config" ~/
cp -f "$SCRIPT_DIR/.zshrc" ~/.zshrc
cp -f "$SCRIPT_DIR/.tigrc" ~/.tigrc

echo "To complete installation by restarting the terminal with zshell..."
echo "Load tmux using command 'tmx' and 'prefix + I' to install plugins..."
