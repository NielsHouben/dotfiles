return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    wk.setup()

    wk.register({
      f = { function() vim.lsp.buf.format() end, "Format Buffer" },
      d = { function() vim.diagnostic.open_float() end, "Show Diagnostics" },
      a = { function() vim.lsp.buf.code_action() end, "Code Actions" },
    }, { prefix = "<leader>" })
  end,
}
