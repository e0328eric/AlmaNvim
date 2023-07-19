local utils = require("almagest.utils")

local colorscheme = "base16-gruvbox-dark-hard"

utils.cfgplugin("base16-colorscheme", function()
	vim.cmd("colorscheme " .. colorscheme)
	require("notify").setup({ background_colour = "#000000" })
end)
