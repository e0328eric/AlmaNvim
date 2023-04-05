local utils = require("almagest.utils")

local colorscheme = "base16-ayu-dark"

utils.cfgplugin("base16-colorscheme", function()
    vim.cmd("colorscheme " .. colorscheme)
    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

    require("notify").setup({background_colour = "#000000"})
end)
