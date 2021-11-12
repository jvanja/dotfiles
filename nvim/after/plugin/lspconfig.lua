local present1, lspconfig = pcall(require, 'lspconfig')
local present2, lsp_installer = pcall(require, 'nvim-lsp-installer')
local present3, null_ls = pcall(require, 'null-ls')

if not (present1 or present2 or present3) then
 return
end

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')


  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>j', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ focusable = false })<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local disableFormat = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local setup_servers = function()

  lsp_installer.on_server_ready(function(server)
    local default_opts = {
      on_attach = on_attach,
      capabilities = capabilities
    }
    local server_opts = {
      ['sumneko_lua'] = function()
        return vim.tbl_deep_extend('force', default_opts, {
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
          },
        })
      end,
      ['tsserver'] = function()
        return vim.tbl_deep_extend('force', default_opts, {
          on_attach = disableFormat,
          filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'json' }
      })
      end,
      ['intelephense'] = function()
        return vim.tbl_deep_extend('force', default_opts, {
          settings = require('intelephense_conf')
        })
      end,
        ['emmet_ls'] = function()
        return vim.tbl_deep_extend('force', default_opts, {
          -- cmd = {'emmet-ls', '--stdio'};
          filetypes = {'html', 'css', 'scss'};
          root_dir = function()
            return vim.loop.cwd()
          end;
          settings = {};
        })
      end,
    }

    server:setup(server_opts[server.name] and server_opts[server.name]() or default_opts)
  end)
end

setup_servers()

null_ls.config({
  sources = {
    null_ls.builtins.formatting.eslint_d.with({
      filetypes = { 'html', 'json', 'javascript', 'vue' },
    }),
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[#{c}] #{m} (#{s})'
    }),
  },
})
lspconfig['null-ls'].setup({
    on_attach = on_attach,
})

-- icon
-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     underline = true,
--     -- This sets the spacing and the prefix, obviously.
--     virtual_text = {
--       spacing = 4,
--       prefix = ''
--     }
--   }
-- )

