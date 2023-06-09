local utils = require("almagest.utils")

utils.cfgplugin("nvim-treesitter.configs", {
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"cpp",
		"css",
		"fish",
		"glsl",
		"go",
		"haskell",
		"html",
		"java",
		"javascript",
		"kotlin",
        "latex",
		"lua",
		"meson",
		"rust",
		"scss",
		"toml",
		"typescript",
		"vim",
		"vue",
		"wgsl",
		"zig",
	},
	sync_install = false,
	auto_install = true,
	highlight = { enable = true, additional_vim_regex_highlighting = false },
})
