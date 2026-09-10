-- General config
vim.opt.autoindent = true
vim.opt.autoread = true
--vim.opt.cindent = false
--vim.opt.cinoptions:remove("#")
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "100"
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
--vim.opt.fileformats = { "unix", "dos" }
--vim.opt_global.fileformat = "unix"
vim.opt.foldenable = false
vim.opt.foldmethod = "manual"
vim.opt.guifont = "-misc-fixed-medium-r-normal-*-18-120-100-100-c-90-iso10646-1"
vim.opt.guifontwide = "-misc-fixed-medium-r-normal-*-18-120-100-100-c-180-iso10646-1"
-- vim.opt.guicursor = ""
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.laststatus = 3
vim.opt.mouse = "nc"
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.ruler = true
vim.opt.scrolloff = 3
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartindent = false
vim.opt.smarttab = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.title = true
vim.opt.textwidth = 100
vim.opt.undofile = true
vim.opt.undolevels = 100
vim.opt.undoreload = 1000

vim.cmd([[
au BufRead,BufNewFile *.h set filetype=c
au BufRead,BufNewFile *.asm set filetype=fasm
au BufRead,BufNewFile *.inc set filetype=fasm
au BufRead,BufNewFile *.ssa set filetype=qbe
au BufRead,BufNewFile *.typ set filetype=typst
au BufRead,BufNewFile *.gp set filetype=gnuplot
au BufRead,BufNewFile *.v set filetype=v
au BufRead,BufNewFile *.ves set filetype=vesti
au BufRead,BufNewFile *.glo set filetype=glosso
]])

-- vim.treesitter.language.add('vesti', {
--   path = vim.fn.expand('~/.config/nvim/after/parser/vesti.so'),
-- })
-- vim.treesitter.language.add('glosso', {
--   path = vim.fn.expand('~/.config/nvim/after/parser/glosso.so'),
-- })

-- enable tree-sitter highlighting for vesti
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'vesti',
  callback = function(args)
    vim.treesitter.start(args.buf, 'vesti')
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'glosso',
  callback = function(args)
    vim.treesitter.start(args.buf, 'glosso')
  end,
})

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
