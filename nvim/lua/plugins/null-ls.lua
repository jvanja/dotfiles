return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      ---@diagnostic disable-next-line: missing-parameter
      opts.sources = vim.list_extend(opts.sources, {
        nls.builtins.formatting.prettierd.with({
          filetypes = { "vue", "javascript", "scss", "css" },
          disabed_filetypes = { "ts" },
        }),
        -- nls.builtins.formatting.eslint_d.with({
        --   filetypes = { "vue", "javascript" },
        --   disabed_filetypes = { "ts" },
        -- }),
        nls.builtins.diagnostics.eslint_d.with({
          filetypes = { "vue", "javascript" },
          diagnostics_format = "[#{c}] #{m} (#{s})",
        }),
      })
    end,
  },
}
