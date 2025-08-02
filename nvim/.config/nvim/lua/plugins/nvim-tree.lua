return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "folke/which-key.nvim" }, -- Ensure it's loaded before nvim-tree config runs
  },
  config = function()
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
        side = "left",
        preserve_window_proportions = true,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    })

    local wk = require("which-key")
    wk.register({
      e = { "<cmd>NvimTreeToggle<CR>", "Toggle File Explorer" },
    }, { prefix = "<leader>" })
  end,
}
