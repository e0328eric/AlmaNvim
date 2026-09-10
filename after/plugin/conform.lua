require("conform").setup({
  formatters_by_ft = {
    go = { "gofmt" },
    lua = { "stylua" },
    nix = { "nixfmt" },
    html = { "prettier" },
    python = { "isort", "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    zig = { "zigfmt" },
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
