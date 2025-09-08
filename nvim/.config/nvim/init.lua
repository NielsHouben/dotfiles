-- Basic options
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↪ "

vim.opt.winborder = "rounded"

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { desc = "Previous Tab" })

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

-- R files use 2-space indentation
vim.api.nvim_create_autocmd("FileType", {
    pattern = "r",
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
        vim.bo.softtabstop = 2
        vim.bo.expandtab = true
    end
})

-- Format buffer before saving
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        vim.opt_local.makeprg = "cargo run"
    end,
})
