local utils = require("almagest.utils")
local wk = require("which-key")

utils.cfgplugin("nvim-tree", {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {},
    },
    system_open = {
        cmd = nil,
        args = {},
    },

    view = {
        width = 30,
        side = "left",
    },
})

wk.add({
    { "<leader>e", vim.cmd.NvimTreeToggle, desc = "Open default neovim Ex" },
})
