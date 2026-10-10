-- ~/.config/nvim/lua/plugins/lsp.lua
return {
    { "williamboman/mason.nvim", opts = {} },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            require("mason-lspconfig").setup({ ensure_installed = { "basedpyright", "ruff", "lua_ls" } })
            
            -- API Nativa de Neovim 0.11/0.12+ (Reemplaza a require('lspconfig'))
            vim.lsp.enable("basedpyright")
            vim.lsp.enable("ruff")
            vim.lsp.enable("lua_ls")
            
            local map = vim.keymap.set
            map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Ir a definición" })
            map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Acciones de código" })
        end
    }
}
