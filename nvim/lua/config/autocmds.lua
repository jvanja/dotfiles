-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = augroup("css"),
  callback = function()
    if string.find(vim.api.nvim_buf_get_name(0), 'theme%-overrides.css') ~= nil then
      vim.diagnostic.disable()
    else
      vim.diagnostic.enable()
    end
  end,
})
