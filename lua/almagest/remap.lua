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
	{ "<leader>bd", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", desc = "delete buffer" },
	{ "<leader>bq", "<cmd>bdelete<CR>", desc = "delete buffer and window" },
	{ "<leader>b[", "<cmd>bprevious<CR>", desc = "move to the previous buffer" },
	{ "<leader>b]", "<cmd>bnext<CR>", desc = "move to the next buffer" },
})

vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>")

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

local modes = { "n", "v", "x", "o", "i", "t", "c" } -- normal/visual/select/op-pending/insert/terminal/cmdline
for _, m in ipairs(modes) do
	vim.keymap.set(m, "<PageUp>", "<Nop>", { noremap = true, silent = true })
	vim.keymap.set(m, "<PageDown>", "<Nop>", { noremap = true, silent = true })
	vim.keymap.set(m, "<S-PageUp>", "<Nop>", { noremap = true, silent = true })
	vim.keymap.set(m, "<S-PageDown>", "<Nop>", { noremap = true, silent = true })
	vim.keymap.set(m, "<C-PageUp>", "<Nop>", { noremap = true, silent = true })
	vim.keymap.set(m, "<C-PageDown>", "<Nop>", { noremap = true, silent = true })
end
