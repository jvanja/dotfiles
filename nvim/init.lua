-- for use in snippets
vim.g.snips_author = "vanja"
vim.g.snips_email = "jelicvanja@gmail.com"
vim.g.snips_github = "https://github.com/jvanja"

-- let vim know to use BREW version of python
vim.g.python3_host_prog = '/usr/local/bin/python3'

-- set leader key to ,
vim.g.mapleader = ","

-- OPTIONS
require('options')

-- PLUGINS
require('plugins')

-- THEME
require('theme')

-- AUTO COMMANDS
require('autocmds')

-- MAPPINGS
require('mappings')
-- vim.cmd('source ~/.config/nvim/lua/mappings.lua.vim')

