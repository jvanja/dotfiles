local present, null_ls = pcall(require, 'null-ls')
if not (present) then
 return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.eslint_d.with({
      filetypes = { 'vue', 'javascript' }
    }),
    diagnostics.eslint_d.with({
      filetypes = { 'vue', 'javascript' },
      diagnostics_format = '[#{c}] #{m} (#{s})'
    }),
  },
})
