-- for use in snippets
vim.g.snips_author = "vanja"
vim.g.snips_email = "jelicvanja@gmail.com"
vim.g.snips_github = "https://github.com/jvanja"

-- let vim know to use BREW version of pythons
vim.g.python3_host_prog = '/usr/local/bin/python3'

-- disable some builtin vim plugins
vim.g.loaded_2html_plugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_logipat = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_matchit = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1

-- set leader key to ,
vim.g.mapleader = ","

-- OPTIONS
-- vim.cmd('source ~/.config/nvim/lua/options.lua')
require('options')

-- PLUGINS
-- vim.cmd('source ~/.config/nvim/lua/plugins/init.lua')
require('plugins')

-- vim.cmd('source ~/.config/nvim/lua/plugins/plugins_conf.lua')
require('plugins.plugins_conf')
-- require ( "plugins.configs.bufferline" )


-- THEME
require('theme')


-- AUTO COMMANDS
require('autocmds')

-- MAPPINGS
vim.cmd('source ~/.config/nvim/lua/mappings.lua.vim')

