vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.undofile = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- preview substitutions
vim.opt.inccommand = 'split'

vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.virtualedit = "block" -- allow cursor to move where there is no text in visual block mode

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- ignore case when searching
vim.o.ignorecase = true

vim.o.completeopt = "menu,menuone,noselect"

-- use spaces instead of tabs
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.shiftround = true

require("plugins")
