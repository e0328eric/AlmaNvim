local greeting = function()
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

-- Plugins are handled by Neovim's builtin package manager (:help vim.pack),
-- which ships with Neovim 0.12 and newer.
if vim.fn.has("nvim-0.12") == 0 or vim.pack == nil then
	vim.api.nvim_echo({
		{ "ERROR: AlmaNvim needs Neovim 0.12 or newer (builtin package manager `vim.pack`)", "ErrorMsg" },
	}, true, {})
	return
end

vim.opt.termguicolors = true

-- Nothing installed yet: show the banner while the plugins are being cloned.
local pack_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site", "pack", "core", "opt")
if not vim.uv.fs_stat(pack_dir) then
	greeting()
end

-- Run a plugin's build step (declared as `data.build` in lua/almagest/plugins.lua)
-- right after it has been installed or updated. This has to be registered
-- before `vim.pack.add()` so that it also fires on the very first install.
vim.api.nvim_create_autocmd("PackChanged", {
	group = vim.api.nvim_create_augroup("almagest_pack_hooks", { clear = true }),
	callback = function(ev)
		local build = vim.tbl_get(ev.data, "spec", "data", "build")
		if build and (ev.data.kind == "install" or ev.data.kind == "update") then
			build(ev.data.path)
		end
	end,
})

-- Install missing plugins and put all of them on 'runtimepath'. Their `plugin/`
-- files are sourced by the regular startup, followed by our after/plugin/*.lua.
vim.pack.add(require("almagest.plugins"), { confirm = false })

-- :PackUpdate [name ...]  Download updates and review them in a confirmation
--                         buffer (:write applies them, :quit discards them).
-- :PackClean              Delete plugins from disk that are no longer listed in
--                         lua/almagest/plugins.lua.
vim.api.nvim_create_user_command("PackUpdate", function(cmd)
	vim.pack.update(#cmd.fargs > 0 and cmd.fargs or nil)
end, {
	nargs = "*",
	complete = function()
		return vim.tbl_map(function(plugin)
			return plugin.spec.name
		end, vim.pack.get(nil, { info = false }))
	end,
	desc = "Update plugins managed by vim.pack",
})

vim.api.nvim_create_user_command("PackClean", function()
	local unused = vim.iter(vim.pack.get(nil, { info = false }))
		:filter(function(plugin)
			return not plugin.active
		end)
		:map(function(plugin)
			return plugin.spec.name
		end)
		:totable()
	if #unused == 0 then
		vim.notify("PackClean: nothing to remove", vim.log.levels.INFO)
		return
	end
	local answer = vim.fn.confirm("Delete " .. table.concat(unused, ", ") .. "?", "&Yes\n&No", 2)
	if answer == 1 then
		vim.pack.del(unused)
	end
end, { desc = "Remove plugins that are not listed in lua/almagest/plugins.lua" })

require("almagest")
