return {
  {
    "williamboman/mason.nvim",
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
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { ",cl", false }
      local ret = {
        diagnostics = {},
        codelens = {},
        document_highlight = { enabled = false },
        capabilities = {},
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
          -- this mess down should be deleted once this gets resolved:
          -- LazyExtra is configured to use vue-language-server (aka Volar), but starting from version 3.0.0, the config is no longer compatible with the 2.x setup. Plus, Volar has been renamed to vue_ls, so the old LazyExtra setup doesn’t work anymore.
          -- https://github.com/vuejs/language-tools/wiki/Neovim
          -- https://github.com/LazyVim/LazyVim/discussions/2697#discussioncomment-13669985
          -- https://github.com/LazyVim/LazyVim/pull/6238
          volar = {
            enabled = false,
            init_options = {
              vue = {
                hybridMode = true,
              },
            },
          },
          vtsls = {
            filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            settings = {
              vtsls = {
                tsserver = {
                  globalPlugins = {},
                },
              },
            },
            before_init = function(params, config)
              local result = vim
                .system({ "npm", "query", "#vue" }, { cwd = params.workspaceFolders[1].name, text = true })
                :wait()
              if result.stdout ~= "[]" then
                local vuePluginConfig = {
                  name = "@vue/typescript-plugin",
                  location = require("mason-registry").get_package("vue-language-server"):get_install_path()
                    .. "/node_modules/@vue/language-server",
                  languages = { "vue" },
                  configNamespace = "typescript",
                  enableForWorkspaceTypeScriptVersions = true,
                }
                table.insert(config.settings.vtsls.tsserver.globalPlugins, vuePluginConfig)
              end
            end,
          },
          -- end of the mess above
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
