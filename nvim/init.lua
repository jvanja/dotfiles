-- for use in snippets
vim.g.snips_author = "vanja"
vim.g.snips_email = "jelicvanja@gmail.com"
vim.g.snips_github = "https://github.com/jvanja"

-- let vim know to use BREW version of pythons
vim.g.python3_host_prog = '/usr/local/bin/python3'


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

