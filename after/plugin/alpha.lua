local utils = require("almagest.utils")

utils.cfgplugin("alpha", function(alpha)
	local dashboard = require("alpha.themes.dashboard")
	dashboard.section.header.val = {
		[[                                                                                             ]],
		[[                                                                                             ]],
		[[ ________  ___       _____ ______   ________  ________   ___      ___ ___  _____ ______      ]],
		[[|\   __  \|\  \     |\   _ \  _   \|\   __  \|\   ___  \|\  \    /  /|\  \|\   _ \  _   \    ]],
		[[\ \  \|\  \ \  \    \ \  \\\__\ \  \ \  \|\  \ \  \\ \  \ \  \  /  / | \  \ \  \\\__\ \  \   ]],
		[[ \ \   __  \ \  \    \ \  \\|__| \  \ \   __  \ \  \\ \  \ \  \/  / / \ \  \ \  \\|__| \  \  ]],
		[[  \ \  \ \  \ \  \____\ \  \    \ \  \ \  \ \  \ \  \\ \  \ \    / /   \ \  \ \  \    \ \  \ ]],
		[[   \ \__\ \__\ \_______\ \__\    \ \__\ \__\ \__\ \__\\ \__\ \__/ /     \ \__\ \__\    \ \__\]],
		[[    \|__|\|__|\|_______|\|__|     \|__|\|__|\|__|\|__| \|__|\|__|/       \|__|\|__|     \|__|]],
		[[                                                                                             ]],
		[[                                                                                             ]],
	}

	dashboard.section.buttons.val = {
		dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
		dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
		dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
		dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
		dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
	}

	dashboard.section.footer.opts.hl = "Type"
	dashboard.section.header.opts.hl = "Include"
	dashboard.section.buttons.opts.hl = "Keyword"

	dashboard.opts.opts.noautocmd = true
	alpha.setup(dashboard.opts)
end)
