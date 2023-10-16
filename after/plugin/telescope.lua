local utils = require("almagest.utils")

utils.cfgplugin("telescope", function(telescope)
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")

	telescope.setup({
		defaults = { mappings = { i = { ["<C-u>"] = false, ["<C-d>"] = false } } },
		pickers = {
			find_files = {
				theme = "ivy",
			},
		},
	})

	pcall(telescope.load_extension, "fzf")
	pcall(telescope.load_extension, "software-licenses")

	utils.wkmap({
		["/"] = {
			function()
				builtin.current_buffer_fuzzy_find(themes.get_dropdown({ winblend = 10, previewer = false }))
			end,
			"Fuzzily search in current buffer",
		},
		["?"] = {
			name = "+help",
			k = { builtin.keymaps, "Show all keymaps for neovim" },
		},
		b = { b = { builtin.buffers, "Find existing buffers" } },
		f = {
			name = "+files",
			f = { builtin.find_files, "Find Files" },
			g = { builtin.git_files, "Find Files" },
			r = { builtin.oldfiles, "Find recently opened files" },
		},
		s = {
			name = "+search",
			h = { builtin.help_tags, "Search Help" },
			w = {
				function()
					builtin.grep_string({ search = vim.fn.input("Grep > ") })
				end,
				"Search current word",
			},
			g = { builtin.live_grep, "Search by grep" },
			d = { builtin.diagnostics, "Search Diagnostics" },
		},
		L = { "<cmd>Telescope software-licenses find<CR>", "insert license" },
	})
end)
