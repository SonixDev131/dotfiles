-- General Settings
vim.g.mapleader = " "

vim.o.cursorline = true
vim.o.clipboard = "unnamedplus"
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.swapfile = false
vim.o.scrolloff = 4
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.winborder = "rounded"

-- Search Settings
vim.o.ignorecase = true -- Ignore case
vim.o.smartcase = true  -- Don't ignore case with capitals

-- Indentation Settings
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2     -- Size of an indent
vim.o.shiftround = true  -- Round indent
vim.o.smartindent = true -- Insert indents automatically