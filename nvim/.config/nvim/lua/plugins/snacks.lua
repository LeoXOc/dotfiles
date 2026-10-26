-- ~/.config/nvim/lua/plugins/snacks.lua
return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            picker = { enabled = true },
            notifier = { enabled = true },
        },
        keys = {
            { "<leader>ff", function() Snacks.picker.files() end, desc = "Buscar archivos" },
            { "<leader>fg", function() Snacks.picker.grep() end, desc = "Buscar texto" },
            -- Nueva integración táctica para control de versiones
            { "<leader>gg", function() Snacks.lazygit() end, desc = "Abrir LazyGit" },
        }
    }
}
