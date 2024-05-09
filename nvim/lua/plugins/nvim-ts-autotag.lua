return {
  "windwp/nvim-ts-autotag",
  ft = { "html", "vue", "markdown" },
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-ts-autotag").setup({
      enable = true,
      enable_rename = true,
      enable_close = true,
      enable_close_on_clash = true,
      filetypes = { "vue", "html" },
    })
  end,
}
