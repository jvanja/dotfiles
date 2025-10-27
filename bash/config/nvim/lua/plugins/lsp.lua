return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Non LSP tools
        "prettierd",
        "stylua",
        "djlint",
        -- LSP servers
        "vue-language-server",
        "intelephense",
        "phpactor",
        "emmet-language-server",
        "lua-language-server",
        "vtsls",
        "css-lsp",
        "css-variables-language-server",
        -- neccessary for nvim-treesitter
        "tree-sitter-cli",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      -- local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- keys[#keys + 1] = { ",cl", false }
      local ret = {
        diagnostics = {},
        codelens = {},
        document_highlight = { enabled = false },
        folds = {},
        inlay_hints = {
          enabled = false,
        },
        format = {
          formatting_options = nil,
          timeout_ms = 3000,
        },
        servers = {
          intelephense = {
            settings = require("config.intelephense_conf"),
          },
          phpactor = {
            init_options = {
              ["language_server.diagnostics_on_open"] = false,
              ["language_server.diagnostics_on_update"] = false,
              ["language_server.diagnostics_on_save"] = false,
            },
          },
          vtsls = {
            filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            settings = {
              vtsls = {
                tsserver = {
                  globalPlugins = {
                    {
                      name = "@vue/typescript-plugin",
                      location = LazyVim.get_pkg_path("vue-language-server", "/node_modules/@vue/language-server"),
                      languages = { "vue" },
                      configNamespace = "typescript",
                      enableForWorkspaceTypeScriptVersions = true,
                    },
                  },
                },
              },
            },
          },
          emmet_language_server = {
            filetypes = {
              "css",
              "scss",
              "eruby",
              "html",
              "htmldjango",
              "blade",
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
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          },
          tailwindcss = {
            filetypes_include = { "php" },
          },
        },
        setup = {},
      }
      return ret
    end,
  },
}
