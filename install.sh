#!/bin/bash

# =========================================================================
# ACTIVAR MODO DEBUG Y REGISTRO
# =========================================================================
LOG_FILE="$HOME/instalacion_dotfiles.log"
exec > >(tee -a "$LOG_FILE") 2>&1
set -x
# =========================================================================

echo "Creando directorios de usuario"
sleep 3
xdg-user-dirs-update

# Definir variable de ruta segura
DOTFILES_DIR="$HOME/dotfiles"

echo "Iniciando la instalación de dotfiles con Stow..."
sleep 3

# 1. Movernos con ruta absoluta para evitar errores de contexto
cd "$DOTFILES_DIR" || exit

# 2. Eliminar archivos por defecto del sistema que causan conflictos con Stow
rm -f "$HOME/.bashrc"

# 3. Otorgar permisos de ejecución directamente en el repositorio
# (Ajusta las rutas si tu estructura de Stow es diferente)
chmod +x "$DOTFILES_DIR/bspwm/.config/bspwm/bspwmrc" 2>/dev/null
chmod +x "$DOTFILES_DIR/polybar/.config/polybar/launch.sh" 2>/dev/null
chmod +x "$DOTFILES_DIR/scripts/.local/bin/"* 2>/dev/null

# 4. Ejecutar Stow
stow bash bspwm cava fastfetch kitty mpv nvim picom polybar rofi scripts sxhkd vim

echo "Dotfiles instalados correctamente."

echo "Instalando el helper de AUR (yay)..."
sleep 3
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
cd "$HOME"
rm -rf /tmp/yay-bin
echo "yay instalado correctamente."

echo "Instalando paquetes de AUR..."
sleep 3
yay -S --needed --noconfirm --answerclean None --answerdiff None $(<"$DOTFILES_DIR/aur.txt")

echo "Configurando plugins de Vim..."
sleep 3
VIM_PLUG_FILE="$HOME/.vim/autoload/plug.vim"
if [ ! -f "$VIM_PLUG_FILE" ]; then
    curl -fLo "$VIM_PLUG_FILE" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
    echo "Plugins de Vim instalados."
else
    echo "vim-plug ya está instalado."
fi

echo "Configurando plugins de Neovim..."
sleep 3
nvim --headless "+Lazy! sync" +qa
echo "Plugins de Neovim instalados."
