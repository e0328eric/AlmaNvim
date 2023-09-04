local utils = require("almagest.utils")

local colorscheme_list = {
	"base16-gruvbox-dark-hard",
	"noctis",
}

local colorscheme = colorscheme_list[2]

utils.cfgplugin("base16-colorscheme", function()
	vim.cmd("colorscheme " .. colorscheme)
    -- stolen from https://github.com/vim/vim/issues/981
	vim.cmd([[
        if has("termguicolors")     " set true colors
            set t_8f=\[[38;2;%lu;%lu;%lum
            set t_8b=\[[48;2;%lu;%lu;%lum
            set termguicolors
        endif
    ]])
	require("notify").setup({ background_colour = "#000000" })
end)
