-- ~/.config/nvim/lua/plugins/formatting.lua
return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" }, -- Se activa justo antes de guardar
        opts = {
            formatters_by_ft = {
                -- Delegamos el orden a Ruff en Python
                python = { "ruff_format", "ruff_fix" },
                -- Delegamos el orden a Stylua en Lua
                lua = { "stylua" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    }
}
