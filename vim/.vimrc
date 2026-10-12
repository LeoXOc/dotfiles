call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
call plug#end()

" Guaedar y correr Phyton con F5
autocmd FileType python map <F5> :w <CR> :!python3 % <CR>
" --- VISUAL Y TEMA ---"
"
" 6. Configuración del Tema
" Activa colores verdaderos (24-bit) si tu terminal Kitty lo soporta
if has('termguicolors')
    set termguicolors
endif

" Ajuste específico de Molokai para usar el fondo oscuro original
let g:molokai_original = 1
colorscheme molokai
" Aplicar el tema
"set background=dark
"colorscheme gruvbox

let mapleader = " "

syntax on                   " Activar coloreado de sintaxis
set termguicolors           " Activar colores reales (24-bit)
set number                  " Mostrar números de línea
set relativenumber
set cursorline              " Resaltar la línea donde está el cursor (ayuda a no perderse)
set scrolloff=8             " Mantener 8 líneas de margen al hacer scroll (muy cómodo)

" --- INDENTACIÓN (Ideal para Rust/Python) ---
filetype plugin indent on   " Detectar tipo de archivo para indentar mejor
set tabstop=4               " El tab visual ocupa 4 espacios
set shiftwidth=4            " La indentación real es de 4 espacios
set expandtab               " Convertir tabs en espacios (estándar hoy en día)
set autoindent              " Mantener indentación al bajar de línea

" --- BÚSQUEDA ---
set hlsearch
set ignorecase              " Ignorar mayúsculas al buscar...
set smartcase               " ...a menos que escribas una mayúscula explícitamente
set incsearch               " Ir buscando mientras escribes

" --- COMODIDAD ---
set mouse=a                 " Habilitar el mouse (para seleccionar texto o cambiar cursor)
set clipboard=unnamedplus   " Usar el portapapeles del sistema (Ctrl+C / Ctrl+V fuera de vim)
set nobackup                " No crear archivos de backup molestos (~)
set noswapfile              " No crear archivos swap

inoremap jk <Esc>
nnoremap <Leader>h :nohlsearch<CR>
