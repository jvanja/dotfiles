return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "windwp/nvim-ts-autotag" },
    },
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "vue",
        "php",
        "scss",
        "css",
        "bash",
        "regex",
        "markdown",
      })
      opts.autotag = {
        enable = true,
      }
      opts.incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      }
    end,
  },
}
