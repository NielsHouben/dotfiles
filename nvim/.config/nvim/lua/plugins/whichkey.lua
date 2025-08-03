return {
    "folke/which-key.nvim",
    config = function()
        local wk = require("which-key")
        wk.setup()

        wk.add({
            { "<leader>f", function() vim.lsp.buf.format() end,        desc = "Format Buffer" },
            { "<leader>d", function() vim.diagnostic.open_float() end, desc = "Show Diagnostics" },
            { "<leader>a", function() vim.lsp.buf.code_action() end,   desc = "Code Actions" },
            { "<leader>r", function() vim.lsp.buf.rename() end,        desc = "Rename Symbol" },
            { "<leader>h", function() vim.lsp.buf.hover() end,         desc = "Hover Info" },
        })
    end,
}
