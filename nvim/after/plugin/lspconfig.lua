local present1, lspconfig = pcall(require, 'lspconfig')
local present2, lsp_installer = pcall(require, 'nvim-lsp-installer')

if not (present1 or present2) then
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
  -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
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
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  -- buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>', opts)

  -- auto format on buffer save
  -- if client.resolved_capabilities.document_formatting then
  --   vim.api.nvim_command [[augroup Format]]
  --   vim.api.nvim_command [[autocmd! * <buffer>]]
  --   vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
  --   vim.api.nvim_command [[augroup END]]
  -- end

end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local setup_servers = function()

  lsp_installer.on_server_ready(function(server)
    local default_opts = {
      on_attach = on_attach,
      capabilities = capabilities
    }
    local server_opts = {
      ["sumneko_lua"] = function()
        return vim.tbl_deep_extend("force", default_opts, {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = {
                  [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                  [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
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
      ["tsserver"] = function()
        return vim.tbl_deep_extend("force", default_opts, {
          filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'json' }
      })
      end,
      ["intelephense"] = function()
        return vim.tbl_deep_extend("force", default_opts, {
          settings = require('intelephense_conf')
        })
      end,
        ["emmet_ls"] = function()
        return vim.tbl_deep_extend("force", default_opts, {
          cmd = {'emmet-ls', '--stdio'};
          filetypes = {'html', 'css', 'scss'};
          root_dir = function(fname)
            return vim.loop.cwd()
          end;
          settings = {};
        })
      end,
      ["diagnosticls"] = function()
        return vim.tbl_deep_extend("force", default_opts, {
          filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'vue', 'lua' },
          init_options = {
            linters = {
              eslint = {
                command = 'eslint_d',
                rootPatterns = { '.git' },
                debounce = 100,
                args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
                sourceName = 'eslint_d',
                parseJson = {
                  errorsRoot = '[0].messages',
                  line = 'line',
                  column = 'column',
                  endLine = 'endLine',
                  endColumn = 'endColumn',
                  message = '[eslint] ${message} [${ruleId}]',
                  security = 'severity'
                },
                securities = {
                  [2] = 'error',
                  [1] = 'warning'
                }
              },
            },
            filetypes = {
              javascript = 'eslint',
              javascriptreact = 'eslint',
              typescript = 'eslint',
              typescriptreact = 'eslint',
            },
            formatters = {
              eslint_d = {
                command = 'eslint_d',
                args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
                rootPatterns = { '.git' },
              },
              prettier = {
                command = 'prettier',
                args = { '--stdin-filepath', '%filename' }
              }
            },
            formatFiletypes = {
              javascript = 'eslint_d',
              javascriptreact = 'eslint_d',
              css = 'prettier',
              scss = 'prettier',
              less = 'prettier',
              typescript = 'eslint_d',
              typescriptreact = 'eslint_d',
              json = 'prettier',
              vue = 'eslint_d',
            }
          }
        })
      end,
    }

    server:setup(server_opts[server.name] and server_opts[server.name]() or default_opts)

  end)
end

setup_servers()

-- icon
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)

