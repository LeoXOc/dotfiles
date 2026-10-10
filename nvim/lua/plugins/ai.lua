-- ~/.config/nvim/lua/plugins/ai.lua
return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "zbirenbaum/copilot.lua", -- 1. Nuevo motor de conexión
        },
        config = function()
            require("copilot").setup({}) -- 2. Inicializa el protocolo de GitHub
            
            require("codecompanion").setup({
                strategies = {
                    chat = { adapter = "copilot" },
                    inline = { adapter = "copilot" },
                },
            })
            vim.keymap.set("n", "<leader>ai", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Abrir Chat IA" })
        end
    }
}
