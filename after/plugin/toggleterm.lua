local utils = require("almagest.utils")

utils.cfgplugin("toggleterm", function(toggleterm)
	local Terminal = require("toggleterm.terminal").Terminal

	toggleterm.setup({
		size = function(term)
			if term.direction == "horizontal" then
				return vim.o.lines * 0.3
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			else
				return 20
			end
		end,
		open_mapping = [[<C-/>]],
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = { border = "curved", winblend = 0 },
	})

	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

	function _lazygit_toggle()
		lazygit:toggle()
	end

	-- NOTE: remap some keys for the sake of ease usage at the floatterm
	-- the followings are the remapped list
	-- <esc>  => <C-\><C-n>
	-- jk'    => <C-\><C-n>
	-- <C-h>  => <Cmd>wincmd h<CR>
	-- <C-j>  => <Cmd>wincmd j<CR>
	-- <C-k>  => <Cmd>wincmd k<CR>
	-- <C-l>  => <Cmd>wincmd l<CR>
	-- <C-w>  => <C-\><C-n><C-w>
	function _G.set_terminal_keymaps()
		local opts = { buffer = 0 }
		vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
		vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
		vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
		vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
	end
	vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

	utils.wkmap({
		t = {
			name = "+terminal",
			t = { "<cmd>ToggleTerm<CR>", "Toogle the terminal at the bottom" },
			f = { "<cmd>ToggleTerm direction=float<CR>", "Toogle the floating terminal" },
			v = { "<cmd>ToggleTerm direction=vertical<CR>", "Toogle the terminal at the right side" },
			n = { "<cmd>ToggleTerm direction=tab<CR>", "Toogle the terminal in the new tab" },
			g = { "<cmd>lua _lazygit_toggle()<CR>", "Toogle Lazygit" },
		},
	})
end)
