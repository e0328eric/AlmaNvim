local utils = require("almagest.utils")

utils.cfgplugin("harpoon", function(harpoon)
	harpoon:setup()

	-- basic telescope configuration
	local conf = require("telescope.config").values
	local function toggle_telescope(harpoon_files)
		local file_paths = {}
		for _, item in ipairs(harpoon_files.items) do
			table.insert(file_paths, item.value)
		end

		require("telescope.pickers")
			.new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table({
					results = file_paths,
				}),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
			})
			:find()
	end

	vim.keymap.set("n", "<C-q>", function()
		harpoon:list():prev()
	end, { desc = "Move to prev harpoon list" })
	vim.keymap.set("n", "<C-e>", function()
		harpoon:list():next()
	end, { desc = "Move to next harpoon list" })

	utils.wkmap({
		h = {
			name = "+harpoon",
			a = {
				function()
					harpoon:list():add()
				end,
				"Add to the list",
			},
			r = {
				function()
					harpoon:list():remove()
				end,
				"Remove to the list",
			},
			l = {
				function()
					toggle_telescope(harpoon:list())
				end,
				"Open harpoon window",
			},
		},
	})
end)
