local utils = require("almagest.utils")

utils.cfgplugin("dressing", {
	default_prompt = "Input:",
	win_options = {
		winblend = 10,
		winhighlight = "Normal:DressingInputNormalFloat,NormalFloat:DressingInputNormalFloat,FloatBorder:DressingInputFloatBorder",
	},
	input = {
		enabled = true,
		default_prompt = "Input:",
		prompt_align = "left",
		insert_only = true,
		start_in_insert = true,
		border = "rounded",
		relative = "cursor",
		prefer_width = 40,
		width = nil,
		max_width = { 140, 0.9 },
		min_width = { 20, 0.2 },
		override = function(conf)
			return conf
		end,
		get_config = nil,
	},
	select = {
		enabled = true,
		backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
		trim_prompt = true,
	},
})
