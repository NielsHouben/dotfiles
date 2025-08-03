return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "rust_analyzer",
                "clangd",
                "lua_ls",
                "pyright", -- Python
                "ts_ls",   -- TypeScript/JavaScript
                "gopls",   -- Go
                "bashls",  -- Bash
                "jsonls",  -- JSON
                "yamlls",  -- YAML
            },
            automatic_installation = true,
        })
    end,
}
