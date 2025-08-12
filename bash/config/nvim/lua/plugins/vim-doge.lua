return {
  "kkoomen/vim-doge",
  config = function()
    -- vim.cmd([[call doge#install()]])
    vim.keymap.set("n", "<Leader>gd", "<Plug>(doge-generate)", { desc = "Generate docs (vim-doge)" })
  end,
}
