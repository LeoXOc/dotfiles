-- ~/.config/nvim/lua/config/keymaps.lua
local map = vim.keymap.set

-- 1. Movimiento fluido: Salir del modo inserto sin estirar los dedos
map("i", "jk", "<ESC>", { desc = "Salir al modo Normal" })

-- 2. Limpieza visual: Apagar el resaltado de búsqueda con Espacio + h
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Limpiar resaltado" })

-- 3. Navegación de ventanas (Splits)
map("n", "<C-h>", "<C-w>h", { desc = "Ir a ventana izquierda" })
map("n", "<C-l>", "<C-w>l", { desc = "Ir a ventana derecha" })
