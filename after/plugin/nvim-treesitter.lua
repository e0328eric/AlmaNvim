local utils = require("almagest.utils")

-- msvc gives errors to compile tree-sitter parsers
-- so I remove msvc compiler, and if the user use
require("nvim-treesitter.install").compilers = { "gcc", "clang", "zig" }

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

-- tree-sitter install for typst
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.typst = {
	install_info = {
		url = "https://github.com/uben0/tree-sitter-typst.git",
		files = { "src/scanner.c", "src/parser.c" },
		branch = "master",
		generate_requires_npm = false,
		requires_generate_from_grammar = false,
	},
	filetype = "typ", -- if filetype does not match the parser name
}
