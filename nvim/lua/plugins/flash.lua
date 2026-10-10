-- ~/.config/nvim/lua/plugins/flash.lua
return {
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            -- Desactivamos la interferencia con la búsqueda nativa '/'
            modes = { search = { enabled = false } } 
        },
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Salto Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Selección semántica" },
        },
    }
}
