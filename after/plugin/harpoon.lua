local utils = require("almagest.utils")
local wk = require("which-key")

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

	wk.add({
		{ "<leader>h", group = "+harpoon" },
		{
			"<leader>hh",
			function()
				harpoon:list():add()
			end,
			desc = "Add to the list",
		},
		{
			"<leader>hr",
			function()
				harpoon:list():remove()
			end,
			desc = "Remove to the list",
		},
		{
			"<leader>hl",
			function()
				toggle_telescope(harpoon:list())
			end,
			desc = "Open harpoon window",
		},
		{
			"<leader>h[",
			function()
				harpoon:list():prev()
			end,
			desc = "Move to prev harpoon list",
		},
		{
			"<leader>h]",
			function()
				harpoon:list():next()
			end,
			desc = "Move to next harpoon list",
		},
	})
end)
