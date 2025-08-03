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
            { "<leader>q", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
            
            -- Telescope keybindings
            { "<leader>t", group = "Telescope" },
            { "<leader>tf", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
            { "<leader>tg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
            { "<leader>tb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
            { "<leader>th", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
            { "<leader>tr", "<cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
            { "<leader>tc", "<cmd>Telescope commands<CR>", desc = "Commands" },
        })
    end,
}
