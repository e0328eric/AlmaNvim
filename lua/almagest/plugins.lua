-- LuaFormatter off
return {
	-- Colorscheme
	"RRethy/nvim-base16",
	{ "kartikp10/noctis.nvim", dependencies = { "rktjmp/lush.nvim" } },
	"freddiehaddad/feline.nvim",
	"akinsho/bufferline.nvim",
	"rcarriga/nvim-notify",
	"stevearc/dressing.nvim",
	"norcalli/nvim-colorizer.lua",
	"tribela/vim-transparent",

	-- main page
	"goolord/alpha-nvim",

	-- Utilities
	{ "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
	"akinsho/toggleterm.nvim",
	"prabirshrestha/asyncomplete.vim",
	"lukas-reineke/indent-blankline.nvim",
	"theprimeagen/harpoon",
	"mhartington/formatter.nvim",
	"mbbill/undotree",
	"numToStr/Comment.nvim",
	{
		"j-hui/fidget.nvim",
		branch = "legacy",
	},
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
		"neovim/nvim-lspconfig",
		branch = "master",
		commit = nil,
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"jose-elias-alvarez/null-ls.nvim",

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
	"e0328eric/vesti-vim",
	"simrat39/rust-tools.nvim",
	{
		"kaarmu/typst.vim",
		ft = "typst",
		lazy = false,
	},
	{
		"saecki/crates.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	},
	{
		"LhKipp/nvim-nu",
		cmd = "TSInstall nu",
	},
}
-- LuaFormatter on
