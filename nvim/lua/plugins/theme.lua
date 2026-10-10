-- ~/.config/nvim/lua/plugins/theme.lua
return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- Variante oscura y de alto contraste
                transparent_background = false,
            })
            
            -- Comando nativo para aplicar el tema
            vim.cmd.colorscheme("catppuccin")
        end
    }
}
