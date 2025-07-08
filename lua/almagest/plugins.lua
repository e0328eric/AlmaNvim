-- LuaFormatter off
return {
	-- Colorscheme
	"RRethy/nvim-base16",
	"EdenEast/nightfox.nvim",
	"akinsho/bufferline.nvim",
	"rcarriga/nvim-notify",
	"stevearc/dressing.nvim",
	"norcalli/nvim-colorizer.lua",
	"tribela/vim-transparent",
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

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
		"saecki/crates.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	},
	{
		"Julian/lean.nvim",
		event = { "BufReadPre *.lean", "BufNewFile *.lean" },

		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",

			-- optional dependencies:

			-- a completion engine
			--    hrsh7th/nvim-cmp or Saghen/blink.cmp are popular choices

			-- 'nvim-telescope/telescope.nvim', -- for 2 Lean-specific pickers
			-- 'andymass/vim-matchup',          -- for enhanced % motion behavior
			-- 'andrewradev/switch.vim',        -- for switch support
			-- 'tomtom/tcomment_vim',           -- for commenting
		},

		---@type lean.Config
		opts = { -- see below for full configuration options
			mappings = true,
		},
	},
}
-- LuaFormatter on
