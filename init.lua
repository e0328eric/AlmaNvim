local gretting = function()
	local signature = [[


 ________  ___       _____ ______   ________  ________   ___      ___ ___  _____ ______
|\   __  \|\  \     |\   _ \  _   \|\   __  \|\   ___  \|\  \    /  /|\  \|\   _ \  _   \
\ \  \|\  \ \  \    \ \  \\\__\ \  \ \  \|\  \ \  \\ \  \ \  \  /  / | \  \ \  \\\__\ \  \
 \ \   __  \ \  \    \ \  \\|__| \  \ \   __  \ \  \\ \  \ \  \/  / / \ \  \ \  \\|__| \  \
  \ \  \ \  \ \  \____\ \  \    \ \  \ \  \ \  \ \  \\ \  \ \    / /   \ \  \ \  \    \ \  \
   \ \__\ \__\ \_______\ \__\    \ \__\ \__\ \__\ \__\\ \__\ \__/ /     \ \__\ \__\    \ \__\
    \|__|\|__|\|_______|\|__|     \|__|\|__|\|__|\|__| \|__|\|__|/       \|__|\|__|     \|__|


]]
	print(signature)
	print()
	print("Welcome to AlmaVim!")
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	gretting()
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.opt.termguicolors = true

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	print("ERROR: Something wrong to bootstrap neovim")
	return
end

local plugins = require("almagest.plugins")

lazy.setup({
	root = vim.fn.stdpath("data") .. "/lazy",
	defaults = {
		lazy = false,
		version = "*", -- this means that trying to install the latest version of plugins
	},
	spec = plugins,
})

require("almagest")
