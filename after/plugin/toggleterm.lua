local utils = require("almagest.utils")

utils.cfgplugin("toggleterm", function(toggleterm)

    local Terminal = require('toggleterm.terminal').Terminal

    toggleterm.setup({
        size = 20,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {border = "curved", winblend = 0}
    })

    local lazygit = Terminal:new({cmd = "lazygit", hidden = true})

    function _lazygit_toggle() lazygit:toggle() end

    utils.wkmap({
        t = {
            name = "+terminal",
            t = {"<cmd>ToggleTerm<CR>", "Toogle Float Terminal"},
            g = {"<cmd>lua _lazygit_toggle()<CR>", "Toogle Lazygit"}
        }
    })

end)
