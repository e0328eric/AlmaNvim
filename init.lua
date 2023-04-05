local gretting = function()
	local signature = [[
   ___      _                    __   __    _
  /   \    | |    _ __    __ _   \ \ / /   (_)    _ __
  | - |    | |   | '  \  / _` |   \ V /    | |   | '  \
  |_|_|   _|_|_  |_|_|_| \__,_|   _\_/_   _|_|_  |_|_|_|
_|"""""|_|"""""|_|"""""|_|"""""|_| """"|_|"""""|_|"""""|
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-']]

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
