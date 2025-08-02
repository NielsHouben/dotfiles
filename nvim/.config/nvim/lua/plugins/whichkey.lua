return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    wk.setup()

    wk.register({
      f = { function() vim.lsp.buf.format() end, "Format Buffer" },
    }, { prefix = "<leader>" })
  end,
}

