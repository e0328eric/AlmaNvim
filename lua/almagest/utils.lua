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

function M.wkmap(contents, prefix_str)
    prefix_str = prefix_str or "<leader>"
    local present, wk = pcall(require, "which-key")
    if present then wk.register(contents, {prefix = prefix_str}) end
end

return M
