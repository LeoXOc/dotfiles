-- ~/.config/nvim/lua/config/autocmds.lua
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- 1. Grupo para evitar duplicados al recargar Neovim
local clean_group = augroup("CleanSpaces", { clear = true })

-- 2. Limpiar espacios en blanco al final de la línea antes de guardar
autocmd("BufWritePre", {
    group = clean_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
