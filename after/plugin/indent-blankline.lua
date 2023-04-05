

vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineIndent guifg=#4d4d4d gui=nocombine]])

vim.cmd([[highlight IndentBlanklineSpaceChar guifg=#3c3c3c gui=nocombine]])

vim.opt.list = true
vim.opt.listchars:append("space: ")
-- vim.opt.listchars:append("eol:↯")

require("indent_blankline").setup({
	show_end_of_line = true,
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	char_highlight_list = {
		"IndentBlanklineIndent",
	},
})

