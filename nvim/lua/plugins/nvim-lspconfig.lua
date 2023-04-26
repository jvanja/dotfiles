return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        "stylua",
        "eslint_d",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = true,

      format = {
        formatting_options = nil,
        timeout_ms = 3000,
      },
      servers = {
        intelephense = {
          -- settings = require("intelephense_conf"),
        },
        emmet_ls = {
          filetypes = { "php", "html", "css", "scss" },
          root_dir = function()
            return vim.loop.cwd()
          end,
          settings = {},
        },
        lua_ls = {
          format = {
            enable = false,
          },
        },
      },
    },
  },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "plugins.null-ls" },
}
