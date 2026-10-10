-- ~/.config/nvim/init.lua
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- 1. Rutina de instalación automática de lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Inicializar el gestor apuntando a nuestra futura carpeta modular
require("lazy").setup("plugins")
