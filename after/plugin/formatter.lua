local utils = require("almagest.utils")

utils.cfgplugin("formatter", function(formatter)
    local format_kind = function(ext)
        return require("formatter.filetypes." .. ext)
    end
    formatter.setup({
        logging = true,
        log_level = vim.log.levels.WARN,

        filetype = {
            c = {
                function()
                    return {
                        exe = "clang-format",
                        stdin = true,
                        try_node_modules = true
                    }
                end
            },
            cpp = {
                function()
                    return {
                        exe = "clang-format",
                        stdin = true,
                        try_node_modules = true
                    }
                end
            },
            go = format_kind("go").gofmt,
            javascript = format_kind("javascript").prettier,
            json = format_kind("json").prettier,
            lua = format_kind("lua").stylua,
            python = format_kind("python").black,
            rust = format_kind("rust").rustfmt,
            zig = format_kind("zig").zigfmt,
            ["*"] = format_kind("any").remove_trailing_whitespace
        }
    })
    utils.wkmap({c = {f = {":Format<CR>", "Format current file"}}})
    vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]])
end)
