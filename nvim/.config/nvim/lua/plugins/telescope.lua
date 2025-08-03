return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
    },
    config = function()
        require("telescope").setup({
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                mappings = {
                    i = {
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                    },
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                live_grep = {
                    additional_args = function(opts)
                        return {"--hidden"}
                    end
                },
            },
        })

        -- Load extensions
        pcall(require("telescope").load_extension, "fzf")

        -- Auto-select file in nvim-tree when opening through telescope
        vim.api.nvim_create_autocmd("BufEnter", {
            callback = function()
                local bufname = vim.api.nvim_buf_get_name(0)
                if bufname ~= "" and vim.fn.filereadable(bufname) == 1 then
                    pcall(function()
                        require("nvim-tree.api").tree.find_file(bufname)
                    end)
                end
            end,
        })
    end,
}
