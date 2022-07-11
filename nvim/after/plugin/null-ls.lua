local present, null_ls = pcall(require, 'null-ls')
if not (present) then
 return
end

-- local M = {}

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- function M.setup(opts)
  null_ls.setup({
    sources = {
      -- formatting.prettierd,
      formatting.eslint.with({
        filetypes = { 'javascript' }
      }),
      formatting.eslint_d,
      diagnostics.eslint.with({
        filetypes = { 'vue', 'javascript' },
        diagnostics_format = '[#{c}] #{m} (#{s})'
      }),
    },
    on_attach = require("core.config").on_attach
  })
-- end

-- return M
