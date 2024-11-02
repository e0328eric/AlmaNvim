require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {},
	automatic_installation = { exclude = { "zls", "hls", "vuels", "pylsp", "nimls", "cmake", "clangd", } },
})

local utils = require("almagest.utils")
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspconfig = require("lspconfig")
local lspconfig_util = require("lspconfig.util")
local wk = require("which-key")

--  ╭──────────────────────────────────────────────────────────╮
--  │                    cmp theme setting                     │
--  ╰──────────────────────────────────────────────────────────╯
local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp_mappings = cmp.mapping.preset.insert({
	["<C-b>"] = cmp.mapping.scroll_docs(4),
	["<C-f>"] = cmp.mapping.scroll_docs(-4),
	["<CR>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Insert,
		select = true,
	}),
	["<C-]>"] = function(fallback)
		if not cmp.select_next_item() then
			if vim.bo.buftype ~= "prompt" and has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end
	end,

	["<A-]>"] = function(fallback)
		if not cmp.select_prev_item() then
			if vim.bo.buftype ~= "prompt" and has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end
	end,
	["<Tab>"] = cmp.mapping(function(fallback)
		if luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		else
			fallback()
		end
	end, { "i", "s" }),

	["<S-Tab>"] = cmp.mapping(function(fallback)
		if luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }),
})

vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#D5C4A1", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#83A598", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#83A598", bg = "NONE" })

local icons = {
	Class = " ",
	Color = " ",
	Constant = " ",
	Constructor = " ",
	Enum = " ",
	EnumMember = " ",
	Field = " ",
	File = " ",
	Folder = " ",
	Function = "ƒ ",
	Interface = "ﰮ ",
	Keyword = " ",
	Method = "ƒ ",
	Module = " ",
	Property = " ",
	Snippet = "﬌ ",
	Struct = " ",
	Text = " ",
	Unit = " ",
	Value = " ",
	Variable = " ",
}

cmp.setup({
	mapping = cmp_mappings,
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "path" },
	}, {
		{ name = "buffer", keyword_length = 3 },
	}),
	window = {
		completion = cmp.config.window.bordered({
			border = {
				"╭",
				"─",
				"╮",
				"│",
				"╯",
				"─",
				"╰",
				"│",
			},
			side_padding = 0,
			col_offset = -3,
		}),
		documentation = cmp.config.window.bordered({
			border = {
				"╭",
				"─",
				"╮",
				"│",
				"╯",
				"─",
				"╰",
				"│",
			},
		}),
	},
	formatting = {
		format = function(_, vim_item)
			vim_item.kind = (icons[vim_item.kind] or "  ") .. vim_item.kind
			return vim_item
		end,
	},
})

--local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

---------------------------------------------------------------------------------------------------
--    UI Settings
---------------------------------------------------------------------------------------------------
vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

local border = {
	{ "╭", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╮", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "╯", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╰", "FloatBorder" },
	{ "│", "FloatBorder" },
}

-- LSP settings (for overriding per client)
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

local lsp_configurations = {
	-- { name = "ccls", config = nil },
	{ name = "cmake", config = nil },
	--{ name = "gopls", config = nil },
	{ name = "hls", config = nil },
	{ name = "kotlin_language_server", config = nil },
	{ name = "lua_ls", config = nil },
	{ name = "nimls", config = nil },
	{ name = "pylsp", config = nil },
	{ name = "taplo", config = nil },
	{ name = "zls", config = nil },
	--{
	--	name = "typst_lsp",
	--	config = {
	--		root_dir = lspconfig_util.root_pattern("*.typ"),
	--		-- single_file_support = true,
	--		settings = {
	--			exportPdf = "onSave", -- Choose onType, onSave or never.
	--			-- serverPath = "" -- Normally, there is no need to uncomment it.
	--		},
	--	},
	--},
	{
		name = "rust_analyzer",
		config = {
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
	},
}

for _, lsp in ipairs(lsp_configurations) do
	if lsp.config == nil then
		lspconfig[lsp.name].setup({
			capabilities = capabilities,
		})
	else
		local config = lsp.config
		config.capabilities = capabilities
		lspconfig[lsp.name].setup(config)
	end
end

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover an Infomation" })
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Goto Reference" })

		wk.add({
			{ "<leader>l", group = "+lsp" },
			{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
			{ "<leader>lD", vim.lsp.buf.type_definition, desc = "Show the type definition" },
			{ "<leader>lR", "<cmd>LspRestart<CR>", desc = "Restart lsp" },
			{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename the structure" },
			{
				"<leader>lf",
				function()
					vim.lsp.buf.format({ async = true })
				end,
				desc = "Format the current buffer",
			},
			{ "<leader>lw", group = "+workspace" },
			{ "<leader>lwa", vim.lsp.buf.add_workspace_folder, desc = "Add a workspace folder" },
			{ "<leader>lwr", vim.lsp.buf.remove_workspace_folder, desc = "Remove a workspace folder" },
			{
				"<leader>lwl",
				function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end,
				desc = "List all workspace folders",
			},
		})
	end,
})
