-- nset: neovim settings
vim.o.guifont = "icfs,agave_NF_r:h13"  -- for guis

-- tabs to spaces
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- line numbers
vim.o.number = true
vim.o.relativenumber = true

-- on file specific
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

-- others
vim.o.encoding = "utf-8"
vim.o.wrap = false
vim.o.completeopt = "menuone,noselect"

vim.o.signcolumn = "yes"
vim.o.hlsearch = false
vim.o.showtabline = 2

vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.autoread = true

vim.o.termguicolors = true
vim.o.scrolloff = 1

vim.o.laststatus = 2  -- todo: set to 3 in nvim 0.7
vim.o.showcmd = true
vim.o.showmode = false
vim.o.shortmess = "filnxtToOFc"

vim.o.tildeop = true  -- ~ is now an operator
