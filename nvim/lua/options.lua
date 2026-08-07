-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse
vim.opt.mouse = "a"

-- 4-space tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Smart search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Visual behavior
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.clipboard = "unnamedplus"

-- Netrw file explorer
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25

-- Replace :cd for :Z
vim.cmd([[cnoreabbrev <expr> cd (getcmdtype() == ':' && getcmdline() ==# 'cd') ? 'Z' : 'cd']])
