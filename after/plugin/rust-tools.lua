local rt = require("rust-tools")
local utils = require("almagest.utils")

utils.cfgplugin("rust-tools", function(rt)
	rt.setup({
		server = {
			standalone = true,
			on_attach = function(_, bufnr)
				vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })

				utils.wkmap({
					c = {
						a = { rt.code_action_group.code_action_group, "Code Action" },
					},
				})
			end,
			settings = {
				["rust-analyzer"] = {
					check = {
						command = "clippy",
					},
					diagnostics = {
						enable = false,
					},
				},
			},
		},
	})
end)
