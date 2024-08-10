sudo apt update
sudo apt install -y curl git zsh zinit tmux tmux-plugin-manager bat fzf btop tig neovim zoxide

bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

sudo add-apt-repository ppa:aos1/diff-so-fancy
sudo apt update
sudo apt install -y diff-so-fancy

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
