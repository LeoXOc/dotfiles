-- ~/.config/nvim/lua/plugins/dap.lua
return {
    {
        "mfussenegger/nvim-dap",
        dependencies = { "mfussenegger/nvim-dap-python" },
        config = function()
            -- Apuntamos a la ruta exacta donde Mason instalará debugpy
            local debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(debugpy_path)
            
            local map = vim.keymap.set
            map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Punto de quiebre" })
            map("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Iniciar depurador" })
        end
    }
}
