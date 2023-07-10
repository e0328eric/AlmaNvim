-- General config
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "100"
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true
-- vim.opt.fileencoding = "utf-8"
vim.opt.foldenable = false
vim.opt.foldmethod = "manual"
vim.opt.guifont = "-misc-fixed-medium-r-normal-*-18-120-100-100-c-90-iso10646-1"
vim.opt.guifontwide = "-misc-fixed-medium-r-normal-*-18-120-100-100-c-180-iso10646-1"
-- vim.opt.guicursor = ""
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.laststatus = 3
vim.opt.mouse = "a"
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.ruler = true
vim.opt.scrolloff = 3
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.textwidth = 100
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undo"
vim.opt.undolevels = 100
vim.opt.undoreload = 1000

vim.cmd([[
au BufRead,BufNewFile *.h set filetype=c
au BufRead,BufNewFile *.asm set filetype=nasm
]])
