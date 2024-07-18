local utils = require("almagest.utils")
local wk = require("which-key")

utils.cfgplugin("telescope", function(telescope)
    local builtin = require("telescope.builtin")
    local themes = require("telescope.themes")

    telescope.setup({
        defaults = { mappings = { i = { ["<C-u>"] = false, ["<C-d>"] = false } } },
        pickers = {
            find_files = {
                theme = "ivy",
            },
        },
    })

    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "software-licenses")

    wk.add({
        {
            "<leader>/",
            function()
                builtin.current_buffer_fuzzy_find(themes.get_dropdown({ winblend = 10, previewer = false }))
            end,
            desc = "Fuzzily search in current buffer",
        },
        { "<leader>?",  group = "+help" },
        {
            "<leader>?k",
            builtin.keymaps,
            desc = "Show all keymaps for neovim",
        },
        { "<leader>bb", builtin.buffers,                             desc = "Find existing buffers" },
        { "<leader>L",  "<cmd>Telescope software-licenses find<CR>", desc = "insert license" },
        { "<leader>f",  group = "+files" },
        { "<leader>ff", builtin.find_files,                          desc = "Find Files" },
        { "<leader>fg", builtin.git_files,                           desc = "Find Files" },
        { "<leader>fr", builtin.oldfiles,                            desc = "Find recently opened files" },
        { "<leader>s",  group = "+search" },
        { "<leader>sh", builtin.help_tags,                           desc = "Search Help" },
        {
            "<leader>sw",
            function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end,
            desc = "Search current word",
        },
        { "<leader>sg", builtin.live_grep,   desc = "Search by grep" },
        { "<leader>sd", builtin.diagnostics, desc = "Search Diagnostics" },
    })
end)
