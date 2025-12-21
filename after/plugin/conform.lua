require("conform").setup({
  formatters_by_ft = {
    go = { "gofmt" },
    lua = { "stylua" },
    nix = { "nixfmt" },
    python = { "isort", "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    zig = { "zigfmt" },
  },
})
