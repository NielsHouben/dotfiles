-- Basic options
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↪ "

-- Show whitespace and end of line characters
vim.opt.list = true
vim.opt.listchars = { tab = '▸ ', trail = '·', space = '·' }

vim.g.mapleader = " " -- spacebar as leader


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

-- Ensure tab settings apply to all file types
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true
    end,
})

-- Format buffer before saving
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
