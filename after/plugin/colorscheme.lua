local utils = require("almagest.utils")

local colorscheme_list = {
	"base16-monokai",
	"base16-gruvbox-dark-hard",
	"base16-tokyo-night-terminal-dark",
	"nightfox",
	"nordfox",
	"terafox",
	"carbonfox",
}

local colorscheme = colorscheme_list[3]

require("nightfox").setup({
	transparent = true,
})

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
