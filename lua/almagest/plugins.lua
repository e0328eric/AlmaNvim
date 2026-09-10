-- Plugin list for Neovim's builtin package manager (:help vim.pack).
--
-- Every entry is a `vim.pack.Spec` (a plain URL string is accepted as well):
--   src      git URL to clone from
--   name     directory name, defaults to the repository name
--   version  nil                     -> follow the repository's default branch
--            "branch" / "tag"        -> follow that branch or stay on that tag
--            vim.version.range(...)  -> newest semver tag inside the range
--   data     free-form table; `data.build(path)` is run by init.lua after the
--            plugin has been installed or updated
--
-- Plugins are cloned into stdpath("data") .. "/site/pack/core/opt/<name>" and
-- configured in after/plugin/<name>.lua.

local gh = function(repo)
	return "https://github.com/" .. repo
end

-- Newest tagged release, the equivalent of lazy.nvim's `version = "*"`.
-- Only usable for repositories that actually have `v1.2.3`-style tags.
local release = vim.version.range("*")

-- telescope-fzf-native.nvim ships C code that has to be compiled once.
-- Uses `make` like upstream suggests and falls back to cmake (e.g. on Windows).
local function build_fzf_native(path)
	local steps = vim.fn.executable("make") == 1 and { { "make" } }
		or {
			{ "cmake", "-S.", "-Bbuild", "-DCMAKE_BUILD_TYPE=Release" },
			{ "cmake", "--build", "build", "--config", "Release" },
			{ "cmake", "--install", "build", "--prefix", "build" },
		}
	for _, argv in ipairs(steps) do
		local result = vim.system(argv, { cwd = path, text = true }):wait()
		if result.code ~= 0 then
			vim.notify(
				("telescope-fzf-native: `%s` failed, telescope falls back to its default sorter:\n%s"):format(
					table.concat(argv, " "),
					result.stderr
				),
				vim.log.levels.WARN
			)
			return
		end
	end
end

-- LuaFormatter off
return {
	-- Libraries shared by several plugins below
	{ src = gh("nvim-lua/plenary.nvim"), version = release },
	gh("nvim-tree/nvim-web-devicons"),

	-- Colorscheme
	gh("RRethy/base16-nvim"),
	{ src = gh("EdenEast/nightfox.nvim"), version = release },
	{ src = gh("rcarriga/nvim-notify"), version = release },
	{ src = gh("stevearc/dressing.nvim"), version = release },
	gh("norcalli/nvim-colorizer.lua"),
	gh("tribela/vim-transparent"),
	gh("nvim-lualine/lualine.nvim"),

	-- main page
	gh("goolord/alpha-nvim"),

	-- Utilities
	{ src = gh("prabirshrestha/asyncomplete.vim"), version = release },
	{ src = gh("lukas-reineke/indent-blankline.nvim"), version = release },
	gh("mbbill/undotree"),
	{ src = gh("numToStr/Comment.nvim"), version = release },
	{ src = gh("j-hui/fidget.nvim"), version = "legacy" },
	{ src = gh("nvim-tree/nvim-tree.lua"), version = release },
	{ src = gh("LudoPinelli/comment-box.nvim"), version = release },
	{ src = gh("folke/which-key.nvim"), version = release },
	{ src = gh("mg979/vim-visual-multi"), version = "master" },
	{ src = gh("OXY2DEV/markview.nvim"), version = release },
	{ src = gh("folke/todo-comments.nvim"), version = release },
	{ src = gh("ThePrimeagen/harpoon"), version = "harpoon2" },

	-- LSP
	{ src = gh("neovim/nvim-lspconfig"), version = release },
	{ src = gh("stevearc/conform.nvim"), version = release },
	{ src = gh("mason-org/mason.nvim"), version = release },
	{ src = gh("mason-org/mason-lspconfig.nvim"), version = release },
	gh("hrsh7th/cmp-buffer"),
	gh("hrsh7th/cmp-nvim-lsp"),
	{ src = gh("hrsh7th/nvim-cmp"), version = release },
	{ src = gh("L3MON4D3/LuaSnip"), version = release },

	-- Telescope
	{ src = gh("nvim-telescope/telescope.nvim"), version = vim.version.range("0.1.x") },
	{ src = gh("nvim-telescope/telescope-fzf-native.nvim"), data = { build = build_fzf_native } },
	gh("nvim-telescope/telescope-symbols.nvim"),
	gh("nvim-telescope/telescope-hop.nvim"),
	gh("renerocksai/telekasten.nvim"),
	gh("renerocksai/calendar-vim"),
	{ src = gh("chip/telescope-software-licenses.nvim"), version = release },

	-- Language Specific
	gh("gleam-lang/gleam.vim"),
	gh("qnighy/lalrpop.vim"),
	gh("fedorenchik/fasm.vim"),
	gh("ollykel/v-vim"),
	gh("alaviss/nim.nvim"),
	gh("perillo/qbe.vim"),
	gh("NoahTheDuke/vim-just"),
	gh("JuliaEditorSupport/julia-vim"),
	{ src = gh("dpezto/gnuplot.vim"), version = release },
	gh("ron-rs/ron.vim"),
	{ src = gh("whonore/Coqtail"), version = release },
	gh("kaarmu/typst.vim"),
	{ src = gh("saecki/crates.nvim"), version = release }, -- set up in after/plugin/crates.lua
	{ src = gh("Julian/lean.nvim"), version = release }, -- set up in after/plugin/lean.lua
}
-- LuaFormatter on
