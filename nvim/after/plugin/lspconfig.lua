local present, mason = pcall(require, "mason")
if not present then return end

local present1, mason_config = pcall(require, "mason-lspconfig")
if not present1 then return end

local present2, lspconfig = pcall(require, "lspconfig")
if not (present2) then return end

mason.setup()
mason_config.setup()

local on_attach = require("core.config").on_attach
local capabilities = require("core.config").capabilities

local setup_servers = function()

  lspconfig.sumneko_lua.setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          enable = true,
          globals = { 'vim' },
        },
        workspace = {
          library = {
            [vim.fn.expand '$VIMRUNTIME/lua'] = true,
            [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
        telemetry = {
          enable = false,
        },
      },
    }
  }

  lspconfig.tsserver.setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'json', 'javascript' }
  }

  lspconfig.intelephense.setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    settings = require('intelephense_conf')
  }

  lspconfig.emmet_ls.setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    filetypes = {'php', 'html', 'css', 'scss'},
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {}
  }

  -- lspconfig.cssls.setup {
  --   on_attach = function(client, bufnr)
  --     on_attach(client, bufnr)
  --   end,
  --   capabilities = capabilities
  -- }

  lspconfig.volar.setup {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'json', 'vue'},
    -- init_options = {
    --   languageFeatures = {
    --     diagnostics = false,
    --   }
    -- }
  }
end

setup_servers()
