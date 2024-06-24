-- LuaFormatter off
return {
	-- Colorscheme
	"RRethy/nvim-base16",
	"EdenEast/nightfox.nvim",
	"freddiehaddad/feline.nvim",
	"akinsho/bufferline.nvim",
	"rcarriga/nvim-notify",
	"stevearc/dressing.nvim",
	"norcalli/nvim-colorizer.lua",
	"tribela/vim-transparent",

	-- main page
	"goolord/alpha-nvim",

	-- Utilities
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"akinsho/toggleterm.nvim",
	"prabirshrestha/asyncomplete.vim",
	"lukas-reineke/indent-blankline.nvim",
	"mbbill/undotree",
	"numToStr/Comment.nvim",
	"https://git.sr.ht/~reggie/licenses.nvim",
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
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		branch = "master",
		commit = nil,
	},
	"mhartington/formatter.nvim",
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
	"chip/telescope-software-licenses.nvim",

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
	"ranjithshegde/ccls.nvim",
	"gleam-lang/gleam.vim",
	"qnighy/lalrpop.vim",
	"fedorenchik/fasm.vim",
	"ollykel/v-vim",
	"alaviss/nim.nvim",
	"perillo/qbe.vim",
	"NoahTheDuke/vim-just",
	"JuliaEditorSupport/julia-vim",
	"dpezto/gnuplot.vim",
	"ron-rs/ron.vim",
	"kaarmu/typst.vim",
	{
		"e0328eric/vesti-vim",
		branch = "main",
	},
	-- "simrat39/rust-tools.nvim",
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
