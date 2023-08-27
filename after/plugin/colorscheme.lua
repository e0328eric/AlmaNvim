local utils = require("almagest.utils")

local colorscheme_list = {
	"base16-gruvbox-dark-hard",
	"moonlight",
}

local colorscheme = colorscheme_list[2]

utils.cfgplugin("base16-colorscheme", function()
	vim.cmd("colorscheme " .. colorscheme)
	require("notify").setup({ background_colour = "#000000" })
end)
