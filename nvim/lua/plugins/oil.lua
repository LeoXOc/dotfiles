-- ~/.config/nvim/lua/plugins/oil.lua
return {
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            default_file_explorer = true,
        },
        keys = {
            { "-", "<cmd>Oil<CR>", desc = "Abrir directorio padre" }
        }
    }
}
