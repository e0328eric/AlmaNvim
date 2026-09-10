local utils = require("almagest.utils")

local colorscheme_list = {
	"base16-monokai",                   -- 1
	"base16-gruvbox-dark-hard",         -- 2
	"base16-tokyo-night-terminal-dark", -- 3
	"base16-catppuccin-mocha",          -- 4
	"base16-oxocarbon-dark",            -- 5
	"nightfox",                         -- 6
	"nordfox",                          -- 7
	"terafox",                          -- 8
	"carbonfox",                        -- 9
}

local colorscheme = colorscheme_list[2]

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
