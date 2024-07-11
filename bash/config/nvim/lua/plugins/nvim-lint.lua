return {
  "mfussenegger/nvim-lint",
  -- opts = {
  --   linters_by_ft = {
  --     vue = { "eslint" },
  --     javascript = { "eslint" },
  --     typescript = { "eslint" },
  --     htmldjango = { "djlint" },
  --   },
  -- },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      vue = { "eslint" },
      javascript = { "eslint" },
      javascriptreact = { "eslint" },
      typescript = { "eslint" },
      typescriptreact = { "eslint" },
      htmldjango = { "djlint" },
    }

    -- fixes this https://github.com/mfussenegger/nvim-lint/issues/610
    local eslint = require("lint.linters.eslint")
    eslint.args = vim.tbl_extend("force", {
      "--config",
      function()
        return vim.fn.getcwd() .. "/eslint.config.js"
      end,
    }, eslint.args)

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
