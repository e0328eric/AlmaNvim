local utils = require("almagest.utils")
local wk = require("which-key")

utils.cfgplugin("nvim-tree", function(nvimtree)
	nvimtree.setup()

	wk.add({
		{ "<leader>e", ":NvimTreeToggle<CR>", desc = "open nvim-tree" },
	})
end)
