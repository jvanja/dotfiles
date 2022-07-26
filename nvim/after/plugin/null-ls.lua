local present, null_ls = pcall(require, "null-ls")
if not (present) then
 return
end

local on_attach = require("core.config").on_attach
local formatting_callback = require("core.config").formatting_callback

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  sources = {
    code_actions.eslint,
    -- formatting.eslint.with({
    --   filetypes = { "javascript" }
    -- }),
    formatting.eslint_d,
    diagnostics.eslint.with({
      filetypes = { "vue", "javascript" },
      diagnostics_format = "[#{c}] #{m} (#{s})"
    }),
  },
  on_attach = function(client, bufnr)
    formatting_callback(client, bufnr)
    on_attach(client, bufnr)
    -- when 0.8 add this: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
  end,
})
