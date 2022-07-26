local indentColors = vim.api.nvim_create_augroup('INDENT_GUIDES_C0LORS', { clear = false })
vim.api.nvim_create_autocmd(
  { "VimEnter", "Colorscheme" },
  { pattern = "*", command = "hi IndentGuidesOdd  guibg=#444444   ctermbg=3", group = indentColors }
)
vim.api.nvim_create_autocmd(
  { "VimEnter", "Colorscheme" },
  { pattern = "*", command = "hi IndentGuidesEven guibg=#353535 ctermbg=4", group = indentColors }
)

-- SEE NULL_LS config for this
-- local autoFormatJs = vim.api.nvim_create_augroup('FORMAT_JS_ON_SAVE', { clear = true })
-- vim.api.nvim_create_autocmd(
--   { "BufWritePre", "Colorscheme" },
--   { pattern = {"*.js", "*.vue", "*.ts"},
--     command = "lua vim.lsp.buf.formatting_sync(nil, 2000)",
--     group = autoFormatJs
--   }
-- )
