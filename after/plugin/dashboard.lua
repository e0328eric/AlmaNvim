local utils = require("almagest.utils")

utils.cfgplugin("dashboard", {
	theme = "hyper",
	config = {
		header = {
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
		}, --your header
		shortcut = {
			{ desc = " Update", group = "@property", action = "Lazy update", key = "u" },
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " Apps",
				group = "DiagnosticHint",
				action = "Telescope app",
				key = "a",
			},
			{
				desc = " dotfiles",
				group = "Number",
				action = "Telescope dotfiles",
				key = "d",
			},
			{
				desc = " quit",
				action = "q!",
				key = "q",
			},
		},
	},
})
