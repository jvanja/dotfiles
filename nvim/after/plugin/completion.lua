if not pcall(require, "completion") then
   return
end

local opt = vim.opt
local g = vim.g

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noinsert,noselect"

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. "c"

local function set_keymap(mode, key, val)
  local options = { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, key, val, options)
end

set_keymap("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"')
set_keymap("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"')

g.completion_confirm_key = ""
set_keymap("i", "<cr>", 'pumvisible() ? complete_info()["selected"] != "-1" ? "<Plug>(completion_confirm_completion)" : "<c-e><CR>" :  "<CR>"')

set_keymap("i", "<Tab>", "<cmd>lua require'completion'.smart_tab()<CR>")
set_keymap("i", "<S-Tab>", "<cmd>lua require'completion'.smart_s_tab()<CR>")

g.completion_enable_snippet = 'UltiSnips'
g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }

