local wk = require("which-key")

wk.add({
	{
		"<leader>cc",
		function()
			local buf = vim.api.nvim_get_current_buf()
			local ft = vim.api.nvim_buf_get_option(buf, "filetype")
			local filename = vim.api.nvim_buf_get_name(buf)
			vim.cmd("!vesti compile " .. filename)
		end,
		desc = "Compile vesti",
	},
})
