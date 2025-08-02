return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    wk.setup()

    wk.register({
    }, { prefix = "<leader>" })
  end,
}

