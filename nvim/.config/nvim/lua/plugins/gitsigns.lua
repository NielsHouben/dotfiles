return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = {hl = "GitGutterAdd",    text = "+", numhl="GitSignsAddNr",    linehl="GitSignsAddLn"},
        change       = {hl = "GitGutterChange", text = "~", numhl="GitSignsChangeNr", linehl="GitSignsChangeLn"},
        delete       = {hl = "GitGutterDelete", text = "_", numhl="GitSignsDeleteNr", linehl="GitSignsDeleteLn"},
        topdelete    = {hl = "GitGutterDelete", text = "‾", numhl="GitSignsDeleteNr", linehl="GitSignsDeleteLn"},
        changedelete = {hl = "GitGutterChange", text = "~", numhl="GitSignsChangeNr", linehl="GitSignsChangeLn"},
      },
      current_line_blame = true,
    })
  end,
}

