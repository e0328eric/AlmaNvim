local lsp = require("lsp-zero")
local cmp = require("cmp")
local luasnip = require("luasnip")

lsp.preset("recommended")

-- lsp.ensure_installed({
--     "sumneko_lua",
-- })

lsp.set_preferences({
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-]>"] = cmp.mapping.select_next_item(cmp_select),
	["<A-]>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		elseif has_words_before() then
			cmp.complete()
		else
			fallback()
		end
	end, { "i", "s" }),
	["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = false,
	float = true,
})

lsp.on_attach(function(client, bufnr)
	local opts = function(desc)
		if desc == nil then
			return { buffer = bufnr, remap = false }
		else
			return { desc = desc, buffer = bufnr, remap = false }
		end
	end

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts("Goto definition"))
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts())
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts("Workspace Symbol"))
	vim.keymap.set("n", "gl", function()
		vim.diagnostic.open_float()
	end, opts("Open diagnostic with floating window"))
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts("Diagnostic goto next"))
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts("Diagnostic goto previous"))
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts("Code Action"))
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts("references"))
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts("Rename symbols"))
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts())
end)
