require("colorizer").setup()

local wk = require("which-key")

wk.add({
	{
		"<leader>Cc",
		"<cmd>ColorizerToggle<CR>",
		desc = "enable colorizer",
	},
})
