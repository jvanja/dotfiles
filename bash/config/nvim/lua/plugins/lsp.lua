return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        "stylua",
        "djlint",
      },
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
          vtsls = {
            filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            settings = {
              vtsls = { tsserver = { globalPlugins = {} } },
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
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          },
        },
        setup = {},
      }
      return ret
    end,
  },
}
