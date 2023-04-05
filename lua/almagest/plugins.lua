-- LuaFormatter off
return {
	-- Colorscheme
	"RRethy/nvim-base16",
	"freddiehaddad/feline.nvim",
	"akinsho/bufferline.nvim",
	"rcarriga/nvim-notify",
	"stevearc/dressing.nvim",
	"norcalli/nvim-colorizer.lua",

	-- main page
	"glepnir/dashboard-nvim",

	-- Utilities
	{ "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
	"akinsho/toggleterm.nvim",
	"prabirshrestha/asyncomplete.vim",
	"lukas-reineke/indent-blankline.nvim",
	"theprimeagen/harpoon",
	"mhartington/formatter.nvim",
	"mbbill/undotree",
	"TimUntersberger/neogit",
	"numToStr/Comment.nvim",
	"j-hui/fidget.nvim",
	"LudoPinelli/comment-box.nvim",
	{ "folke/which-key.nvim", lazy = true },
	{
		"mg979/vim-visual-multi",
		branch = "master",
	},
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	},

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" },

			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "onsails/lspkind.nvim" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-symbols.nvim",
			"nvim-telescope/telescope-hop.nvim",
			"renerocksai/telekasten.nvim",
			"renerocksai/calendar-vim",
		},
		lazy = true,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-endwise",
			"windwp/nvim-ts-autotag",
			"p00f/nvim-ts-rainbow",
		},
		lazy = true,
	},

	-- Language Specific
	"qnighy/lalrpop.vim",
	"alaviss/nim.nvim",
	"SeniorMars/typst.nvim",
	{
		"saecki/crates.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	},
}
-- LuaFormatter on
