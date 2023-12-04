-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","
vim.g.maplocalleader = ","

local opt = vim.opt

opt.undofile = false
opt.clipboard = "" -- preserver the system clipboard
opt.wrap = true

vim.g.autoformat = false

-- local tokyotheme = require("tokyonight")
-- tokyotheme.setup({
--   on_highlights = function(highlights, colors)
--     highlights.LineNr = { fg = "#8888AA" }
--   end,
-- })
