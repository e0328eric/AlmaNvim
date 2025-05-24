local wk = require("which-key")

vim.g.mapleader = " "

wk.add({
	{
		"<leader> ",
		function()
			vim.cmd([[let @/=""]])
		end,
		desc = "Clear search highlights",
	},
	{ "<leader>b", group = "+buffer" },
	{ "<leader>bd", ":bp<bar>sp<bar>bn<bar>bd<CR>", desc = "delete buffer" },
	{ "<leader>bq", ":bdelete<CR>", desc = "delete buffer and window" },
})

vim.keymap.set("n", "<Tab>", vim.cmd.BufferLineCycleNext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.BufferLineCyclePrev)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("v", "Q", "gq")

vim.cmd([[
inoremap <ScrollWheelUp>     <Nop>
inoremap <ScrollWheelDown>   <Nop>
]])

vim.keymap.set("n", "<C-D>", "<nop>")

vim.keymap.set("n", "<S-Up>", "<nop>")
vim.keymap.set("i", "<S-Up>", "<nop>")
vim.keymap.set("v", "<S-Up>", "<nop>")
vim.keymap.set("n", "<S-Down>", "<nop>")
vim.keymap.set("i", "<S-Down>", "<nop>")
vim.keymap.set("v", "<S-Down>", "<nop>")

vim.keymap.set("n", "<C-\\>", "O")
vim.keymap.set("i", "<C-\\>", "<C-[>O")
