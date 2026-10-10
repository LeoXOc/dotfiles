#!/bin/bash

echo "Creando directorios de usuario"

sleep 3

xdg-user-dirs-update

# Definir variables de rutas
DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"
BIN_DIR="$HOME/.local/bin"

echo "Iniciando la instalación de dotfiles..."
sleep 3
# Crear los directorios base si no existen
mkdir -p "$CONFIG_DIR"/{bspwm,sxhkd,polybar,picom,rofi,kitty,mpv}

# Enlazar configuraciones del gestor de ventanas y atajos
ln -sf "$DOTFILES_DIR/bspwm/bspwmrc" "$CONFIG_DIR/bspwm/bspwmrc"
ln -sf "$DOTFILES_DIR/sxhkd/sxhkdrc" "$CONFIG_DIR/sxhkd/sxhkdrc"

# Enlazar barras de estado y compositores
ln -sf "$DOTFILES_DIR/polybar/config.ini" "$CONFIG_DIR/polybar/config.ini"
ln -sf "$DOTFILES_DIR/polybar/launch.sh" "$CONFIG_DIR/polybar/launch.sh"
ln -sf "$DOTFILES_DIR/picom/picom.conf" "$CONFIG_DIR/picom/picom.conf"

# Enlazar emuladores de terminal, lanzadores y editores
ln -sf "$DOTFILES_DIR/kitty/kitty.conf" "$CONFIG_DIR/kitty/kitty.conf"
ln -sf "$DOTFILES_DIR/rofi/config.rasi" "$CONFIG_DIR/rofi/config.rasi"

mkdir -p "$CONFIG_DIR"/nvim/lua/{config,plugins}

ln -sf "$DOTFILES_DIR/nvim/init.lua" "$CONFIG_DIR/nvim/init.lua"
ln -sf "$DOTFILES_DIR/nvim/lua/config/autocmds.lua" "$CONFIG_DIR/nvim/lua/config/autocmds.lua"
ln -sf "$DOTFILES_DIR/nvim/lua/config/keymaps.lua" "$CONFIG_DIR/nvim/lua/config/keymaps.lua"
ln -sf "$DOTFILES_DIR/nvim/lua/config/options.lua" "$CONFIG_DIR/nvim/lua/config/options.lua"
ln -sf "$DOTFILES_DIR/nvim/lua/plugins/ai.lua" "$CONFIG_DIR/nvim/lua/plugins/ai.lua"
ln -sf "$DOTFILES_DIR/nvim/lua/plugins/blink.lua" "$CONFIG_DIR/nvim/lua/plugins/blink.lua"
ln -sf "$DOTFILES_DIR/nvim/lua/plugins/dap.lua" "$CONFIG_DIR/nvim/lua/plugins/dap.lua"
ln -sf "$DOTFILES_DIR/nvim/lua/plugins/flash.lua" "$CONFIG_DIR/nvim/lua/plugins/flash.lua"
ln -sf "$DOTFILES_DIR/nvim/lua/plugins/formatting.lua" "$CONFIG_DIR/nvim/lua/plugins/formatting.lua"
ln -sf "$DOTFILES_DIR/nvim/lua/plugins/lsp.lua" "$CONFIG_DIR/nvim/lua/plugins/lsp.lua"
ln -sf "$DOTFILES_DIR/nvim/lua/plugins/oil.lua" "$CONFIG_DIR/nvim/lua/plugins/oli.lua"
ln -sf "$DOTFILES_DIR/nvim/lua/plugins/snacks.lua" "$CONFIG_DIR/nvim/lua/plugins/snacks.lua"
ln -sf "$DOTFILES_DIR/nvim/lua/plugins/theme.lua" "$CONFIG_DIR/nvim/lua/plugins/theme.lua"
ln -sf "$DOTFILES_DIR/nvim/lua/plugins/treesitter.lua" "$CONFIG_DIR/nvim/lua/plugins/treesitter.lua"

# Otorgar permisos de ejecución obligatorios
# Si bspwmrc no es ejecutable, el entorno gráfico no cargará (pantalla negra)
chmod +x "$CONFIG_DIR/bspwm/bspwmrc"
chmod +x "$CONFIG_DIR/polybar/launch.sh"

# Establecer un fondo de pantalla inicial usando feh
# Ideal para inicializar la imagen en layouts de múltiples monitores
#if [ -f "$DOTFILES_DIR/wallpapers/default.jpg" ]; then
#    feh --bg-fill "$DOTFILES_DIR/wallpapers/default.jpg"
#fi

# 1. Enlazar archivos que van directo en el $HOME
ln -sf "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"

# 2. Preparar el directorio binario local
mkdir -p "$HOME/.local/bin"

# 3. Enlazar todo el contenido de tu carpeta de scripts al bin local
ln -sf "$DOTFILES_DIR/scripts/"* "$HOME/.local/bin/"

# 4. Asegurar permisos de ejecución masivos para todos tus scripts
chmod +x "$HOME/.local/bin/"*

echo "Dotfiles instalados correctamente."

echo "Instalando el helper de AUR (yay)..."
sleep 3
# Clonar e instalar yay en la carpeta temporal del sistema
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin

# makepkg -si compila e instala.
# --noconfirm evita que pregunte "¿Desea continuar? [S/n]"
makepkg -si --noconfirm

# Volver al inicio y limpiar
cd "$HOME"
rm -rf /tmp/yay-bin

echo "yay instalado correctamente."
echo "Intalando paquetes de AUR"
sleep 3

yay -S --needed --noconfirm - <aur.txt

echo "Configurando plugins de Vim..."
sleep 3
# Descargar vim-plug automáticamente si no existe
VIM_PLUG_FILE="$HOME/.vim/autoload/plug.vim"
if [ ! -f "$VIM_PLUG_FILE" ]; then
    curl -fLo "$VIM_PLUG_FILE" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Abrir Vim, ejecutar PlugInstall y cerrar de inmediato (+qall)
    vim +PlugInstall +qall
    echo "Plugins de Vim instalados."
else
    echo "vim-plug ya está instalado."
fi

echo "Configurando plugins de Neovim..."
sleep 3
# La bandera --headless ejecuta Neovim en segundo plano (sin interfaz).
# Sustituye "+Lazy! sync" por "+PlugInstall" si usas vim-plug en Neovim.
nvim --headless "+Lazy! sync" +qa

echo "Plugins de Neovim instalados."
