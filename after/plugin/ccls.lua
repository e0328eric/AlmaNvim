local util = require("lspconfig.util")
local server_config = {
	filetypes = { "c", "cpp", "objc", "objcpp", "opencl" },
	root_dir = function(fname)
		return util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")(fname)
			or util.find_git_ancestor(fname)
	end,
	init_options = {
		cache = {
			directory = vim.fs.normalize("~/.cache/ccls"),
		},
	},
	--on_attach = require("my.attach").func,
	--capabilities = my_caps_table_or_func
}
require("ccls").setup({ lsp = { lspconfig = server_config } })
