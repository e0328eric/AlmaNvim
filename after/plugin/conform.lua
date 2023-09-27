local utils = require("almagest.utils")

utils.cfgplugin("conform", {
	formatters_by_ft = {
		c = { "clang-format" },
		cpp = { "clang-format" },
		go = { "gofmt" },
		javascript = { { "prettierd", "prettier" } },
		lua = { "stylua" },
		nim = { "nimpretty" },
		python = { "isort", "black" },
		rust = { "rustfmt" },
		zig = { "zig fmt" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
