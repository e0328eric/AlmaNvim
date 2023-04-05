local utils = require("almagest.utils")

utils.cfgplugin("harpoon", function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    utils.wkmap({
        h = {
            name = "+harpoon",
            a = {mark.add_file, "Add a file"},
            ["1"] = {function() ui.nav_file(1) end, "Navigate File 1"},
            ["2"] = {function() ui.nav_file(2) end, "Navigate File 2"},
            ["3"] = {function() ui.nav_file(3) end, "Navigate File 3"},
            ["4"] = {function() ui.nav_file(4) end, "Navigate File 4"},
            ["5"] = {function() ui.nav_file(5) end, "Navigate File 5"},
            ["6"] = {function() ui.nav_file(6) end, "Navigate File 6"},
            ["7"] = {function() ui.nav_file(7) end, "Navigate File 7"},
            ["8"] = {function() ui.nav_file(8) end, "Navigate File 8"},
            ["9"] = {function() ui.nav_file(9) end, "Navigate File 9"},
            ["0"] = {function() ui.nav_file(10) end, "Navigate File 10"}
        }
    })

    vim.keymap.set("n", "<C-q>", ui.nav_prev)
    vim.keymap.set("n", "<C-e>", ui.nav_next)
    vim.keymap.set("n", "<C-z>", ui.toggle_quick_menu)
end)
