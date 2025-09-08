return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- LSP completion source
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- Add completion capabilities
        local capabilities = cmp_nvim_lsp.default_capabilities()


        -- pip install 'python-lsp-server[all]'
        lspconfig.pylsp.setup {
            settings = {
                pylsp = {
                    plugins = {
                        autopep8 = {
                            enabled = true,
                            args = { "--ignore=F841" },
                        },
                        pyflakes = { enabled = false },
                        mccabe = { enabled = false },
                        pycodestyle = { enabled = true },
                    }
                }
            }
        }


        -- Rust LSP
        -- lspconfig.rust_analyzer.setup({
        --     capabilities = capabilities,
        --     settings = {
        --         ["rust-analyzer"] = {
        --             cargo = { allFeatures = true },
        --             check = {
        --                 command = "clippy"
        --             }
        --         }
        --     }
        -- })

        -- C/C++ LSP
        lspconfig.clangd.setup({
            capabilities = capabilities,
            cmd = { "clangd", "--background-index" },
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
        })

        -- Lua LSP for Neovim configuration
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = { enable = false },
                },
            },
        })

        -- Python LSP
        lspconfig.pyright.setup({
            capabilities = capabilities,
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "basic",
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                    },
                },
            },
        })

        -- TypeScript/JavaScript LSP for Nuxt/Vue
        lspconfig.ts_ls.setup({
            capabilities = capabilities,
            filetypes = { "typescript", "javascript", "vue", "nuxt" },
        })

        -- Go LSP
        lspconfig.gopls.setup({
            capabilities = capabilities,
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                    },
                    staticcheck = true,
                },
            },
        })

        -- Bash LSP
        lspconfig.bashls.setup({
            capabilities = capabilities,
        })

        -- JSON LSP
        lspconfig.jsonls.setup({
            capabilities = capabilities,
        })

        -- YAML LSP
        lspconfig.yamlls.setup({
            capabilities = capabilities,
        })
    end
}
