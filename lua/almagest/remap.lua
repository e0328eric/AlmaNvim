local utils = require("almagest.utils")

vim.g.mapleader = " "

utils.wkmap({
	[" "] = {
		function()
			vim.cmd([[let @/=""]])
		end,
		"Clear search highlights",
	},
	b = { name = "+buffer", d = { ":bdelete<CR>", "delete buffer" } },
})

vim.keymap.set("n", "<Tab>", vim.cmd.BufferLineCycleNext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.BufferLineCyclePrev)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<S-Up>", "<nop>")
vim.keymap.set("i", "<S-Up>", "<nop>")
vim.keymap.set("v", "<S-Up>", "<nop>")
vim.keymap.set("n", "<S-Down>", "<nop>")
vim.keymap.set("i", "<S-Down>", "<nop>")
vim.keymap.set("v", "<S-Down>", "<nop>")

vim.keymap.set("n", "<C-\\>", "O")
vim.keymap.set("i", "<C-\\>", "<C-[>O")
