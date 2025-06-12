-- Set basic options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorline = true

-- Bootstrap lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy with plugins folder
require("lazy").setup("plugins")

-- Force transparency (no background)
vim.cmd([[
  highlight Normal     guibg=NONE
  highlight NormalNC   guibg=NONE
  highlight EndOfBuffer guibg=NONE
  highlight SignColumn guibg=NONE
  highlight VertSplit  guibg=NONE
  highlight LineNr     guibg=NONE
  highlight Folded     guibg=NONE
  highlight StatusLine guibg=NONE

  highlight CursorLine guibg=#101010
]])

