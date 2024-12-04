DOTFILES_DIR=~/personal/configs/dotfiles

mkdir -p "$DOTFILES_DIR"
mkdir -p "$DOTFILES_DIR/wezterm"
mkdir -p "$DOTFILES_DIR/zsh"
mkdir -p "$DOTFILES_DIR/fonts"
mkdir -p "$DOTFILES_DIR/tmux"

sudo cp -r ~/.config/i3 "$DOTFILES_DIR"
sudo cp -r ~/.config/nvim "$DOTFILES_DIR"
sudo cp -r ~/.config/tmux/tmux.conf "$DOTFILES_DIR/tmux/tmux.conf"
sudo cp -r ~/.wezterm.lua "$DOTFILES_DIR/wezterm/.wezterm.lua"
sudo cp -r ~/.zshrc "$DOTFILES_DIR/zsh/.zshrc"
sudo cp -r ~/.i3status.conf "$DOTFILES_DIR/i3/.i3status.conf"
sudo cp -r /usr/share/fonts/* "$DOTFILES_DIR/fonts/"


