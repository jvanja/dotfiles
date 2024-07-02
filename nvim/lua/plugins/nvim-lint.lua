return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      vue = {'eslint',},
      javascript = {'eslint',},
      typescript = {'eslint',},
      htmldjango = {'djlint',}
    }
  }
}
