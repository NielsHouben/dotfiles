return {
    "folke/which-key.nvim",
    config = function()
        local wk = require("which-key")
        wk.setup()

        wk.add({
            { "<leader>f",  function() vim.lsp.buf.format() end,          desc = "Format Buffer" },
            { "<leader>d",  function() vim.diagnostic.open_float() end,   desc = "Show Diagnostics" },
            { "<leader>a",  function() vim.lsp.buf.code_action() end,     desc = "Code Actions" },
            { "<leader>r",  function() vim.lsp.buf.rename() end,          desc = "Rename Symbol" },
            { "<leader>h",  function() vim.lsp.buf.hover() end,           desc = "Hover Info" },
            { "<leader>q",  "<cmd>Telescope find_files<CR>",              desc = "Find Files" },
            { "<leader>s",  "<cmd>edit #<CR>",                            desc = "Swap to alternate file" },
            { "<leader>y",  '"+y',                                        desc = "Yank to system clipboard", mode = { "n", "v" }, },

            -- LSP Navigation
            { "<leader>gd", function() vim.lsp.buf.definition() end,      desc = "Go to Definition" },
            { "<leader>gr", function() vim.lsp.buf.references() end,      desc = "Go to References" },
            { "<leader>gy", function() vim.lsp.buf.type_definition() end, desc = "Go to Type Definition" },

            -- Telescope keybindings
            { "<leader>t",  group = "Telescope" },
            { "<leader>tf", "<cmd>Telescope find_files<CR>",              desc = "Find Files" },
            { "<leader>tg", "<cmd>Telescope live_grep<CR>",               desc = "Live Grep" },
            { "<leader>tb", "<cmd>Telescope buffers<CR>",                 desc = "Buffers" },
            { "<leader>th", "<cmd>Telescope help_tags<CR>",               desc = "Help Tags" },
            { "<leader>tr", "<cmd>Telescope oldfiles<CR>",                desc = "Recent Files" },
            { "<leader>tc", "<cmd>Telescope commands<CR>",                desc = "Commands" },

            { "<leader>g",  group = "Git" },
            { "<leader>gb", "<cmd>Gitsigns blame<CR>",                    desc = "Se who did what and when" },

            { "<leader>w",  function() vim.cmd("write") end,              desc = "Save current buffer" },
            { "<leader>m",  function() vim.cmd("write | make") end,       desc = "Run code with make" },
        })
    end,
}
