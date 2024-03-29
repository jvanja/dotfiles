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
      format = {
        formatting_options = nil,
        timeout_ms = 3000,
      },
      servers = {
        intelephense = {
          settings = require("config.intelephense_conf"),
        },
        emmet_language_server = {
          filetypes = {
            "css",
            "scss",
            "eruby",
            "html",
            "htmldjango",
            "php",
            "javascript",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "svelte",
            "pug",
            "typescriptreact",
            "vue",
          },
        },
        lua_ls = {
          format = {
            enable = false,
          },
        },
      },
    },
  },
}
