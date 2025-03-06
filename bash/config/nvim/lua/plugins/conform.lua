return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = nil,
    formatters_by_ft = {
      lua = { "stylua" },
      php = { "php-cs-fixer" },
      javascript = { "prettier" },
      vue = { "prettier" },
      htmldjango = { "djlint" },
      blade = { "blade-formatter" },
    },
  },
}
