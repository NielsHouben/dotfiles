return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    -- Rust LSP
    lspconfig.rust_analyzer.setup({
      settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
          check = {
            command = "clippy"
          }
        }
      }
    })

    -- C/C++ LSP
    lspconfig.clangd.setup({
      cmd = { "clangd", "--background-index" },
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
    })
  end
}
