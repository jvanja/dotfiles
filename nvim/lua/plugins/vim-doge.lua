return {
  "kkoomen/vim-doge",
  lazy = true,
  config = function()
    vim.cmd([[call doge#install()]])
  end,
}
