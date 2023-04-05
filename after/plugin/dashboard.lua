local utils = require("almagest.utils")

utils.cfgplugin("dashboard", {
	theme = "doom",
	config = {
		header = {
			[[                                                        ]],
			[[                                                        ]],
			[[                                                        ]],
			[[                                                        ]],
			[[   ___      _                    __   __    _           ]],
			[[  /   \    | |    _ __    __ _   \ \ / /   (_)    _ __  ]],
			[[  | - |    | |   | '  \  / _` |   \ V /    | |   | '  \ ]],
			[[  |_|_|   _|_|_  |_|_|_| \__,_|   _\_/_   _|_|_  |_|_|_|]],
			[[_|"""""|_|"""""|_|"""""|_|"""""|_| """"|_|"""""|_|"""""|]],
			[["`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-']],
			[[                                                        ]],
			[[                                                        ]],
			[[                                                        ]],
			[[                                                        ]],
			[[                                                        ]],
		}, --your header
		center = {
			{
				icon = " ",
				icon_hl = "Title",
				desc = "Find File           ",
				desc_hl = "String",
				key = "b",
				keymap = "SPC f f",
				key_hl = "Number",
				action = "lua print(2)",
			},
			{
				icon = " ",
				desc = "Find Dotfiles",
				key = "f",
				keymap = "SPC f d",
				action = "lua print(3)",
			},
		},
		footer = {}, --your footer
	},
})
