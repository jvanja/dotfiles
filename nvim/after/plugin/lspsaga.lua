local present, lspsaga = pcall(require, "lspsaga")
if not present then
   return
end

lspsaga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

vim.lsp.diagnostic.show_line_diagnostics()
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false
  }
)

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "K", "<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ld", "<Cmd>:Lspsaga show_line_diagnostics<CR>", opts)
