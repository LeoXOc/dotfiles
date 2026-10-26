-- ~/.config/nvim/lua/plugins/blink.lua
return {
    {
        "saghen/blink.cmp",
        version = "*",
        opts = {
            keymap = { preset = "default" },
            appearance = { nerd_font_variant = "mono" },
            signature = { enabled = true },
            
            -- 1. Forzamos la renderización automática del menú
            completion = {
                menu = { auto_show = true },
            },
            
            -- 2. Definimos los canales de información
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
        }
    }
}
