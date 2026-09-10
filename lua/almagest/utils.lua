local M = {}

function M.cfgplugin(plugin_name, config)
	local present, plugin = pcall(require, plugin_name)
	if present then
		if type(config) == "nil" then
		elseif type(config) == "function" then
			config(plugin)
		else
			plugin.setup(config)
		end
	end
end

return M
