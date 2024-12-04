!/bin/bash

# Salir si ocurre algún error
set -e

# Colores para mensajes
GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${GREEN}Iniciando el script de configuración...${RESET}"

# Actualizar el sistema y asegurarse de que los paquetes esenciales estén instalados
echo -e "${GREEN}Actualizando sistema y paquetes esenciales...${RESET}"
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget git unzip build-essential fonts-powerline xclip lsd tmux nodejs npm ripgrep fd-find

# Instalar i3 y dependencias
echo -e "${GREEN}Instalando i3 y dependencias...${RESET}"
sudo apt install -y i3 i3blocks i3status rofi dmenu feh

# Instalar Zsh
echo -e "${GREEN}Instalando Zsh...${RESET}"
sudo apt install -y zsh

# Cambiar el shell predeterminado a Zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    echo -e "${GREEN}Cambiando shell predeterminado a Zsh...${RESET}"
    chsh -s "$(which zsh)"
fi

# Instalar Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${GREEN}Instalando Oh My Zsh...${RESET}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Instalar Neovim
echo -e "${GREEN}Instalando Neovim...${RESET}"
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar -xvzf nvim-linux64.tar.gz
sudo mv nvim-linux64 /opt/nvim-linux64
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
rm nvim-linux64.tar.gz

# Instalar WezTerm
echo -e "${GREEN}Instalando WezTerm...${RESET}"
curl -LO https://github.com/wez/wezterm/releases/download/20240203-110809-5046fc22/wezterm-20240203-110809-5046fc22.Ubuntu22.04.deb
sudo apt install -y ./wezterm-20240203-110809-5046fc22.Ubuntu22.04.deb

# Instalar Tmux Package Manager (TPM)
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
  echo "Instalando Tmux Plugin Manager (TPM)..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
  echo "TPM ya está instalado."
fi

# Copiar fuentes al directorio de fuentes del usuario
echo -e "${GREEN}Copiando fuentes desde $DOTFILES_DIR/fonts a /usr/share/fonts...${RESET}"
mkdir -p "/usr/share/fonts"
sudo cp -r "$DOTFILES_DIR/fonts/"* "/usr/share/fonts/"
sudo fc-cache -fv

# Copiar configuraciones
echo -e "${GREEN}Copiando configuraciones...${RESET}"

mkdir -p "$HOME/.config/linux"
mkdir -p "$HOME/.config/tmux"
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/i3"

cp "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
cp "$DOTFILES_DIR/linux/set_digital_vibrance.sh" "$HOME/.config/linux/set_digital_vibrance.sh"
cp -r "$DOTFILES_DIR/tmux/" "$HOME/.config/"
cp -r "$DOTFILES_DIR/nvim/" "$HOME/.config/"
cp -r "$DOTFILES_DIR/wezterm/.wezterm.lua" "$HOME/.wezterm.lua"
cp -r "$DOTFILES_DIR/i3/config" "$HOME/.config/i3"
cp "$DOTFILES_DIR/i3/.i3status.conf" "$HOME/.i3status.conf"

