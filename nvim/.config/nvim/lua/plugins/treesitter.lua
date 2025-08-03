return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "c", "cpp", "lua", "python", "javascript", "rust",
                "typescript", "go", "bash", "json", "yaml", "html", "css"
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        }
    end,
}
