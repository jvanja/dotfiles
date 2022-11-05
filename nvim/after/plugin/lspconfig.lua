local present, mason = pcall(require, "mason")
if not present then return end

local present1, mason_config = pcall(require, "mason-lspconfig")
if not present1 then return end

local present2, lspconfig = pcall(require, "lspconfig")
if not (present2) then return end

local util = require 'lspconfig.util'

local function get_typescript_server_path(root_dir)
  local global_ts = '/Users/vanjajelic/.nvm/versions/node/v14.18.2/lib/node_modules/typescript/lib'
  local found_ts = ''
  local function check_dir(path)
    found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

mason.setup()
mason_config.setup()

-------- lsp options
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local _border = "single"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)

vim.diagnostic.config{
  float={border=_border}
}
---------

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
    filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
    on_new_config = function(new_config, new_root_dir)
      new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
    end,
    -- init_options = {
    --   languageFeatures = {
    --     diagnostics = false,
    --   }
    -- }
  }
end

setup_servers()
