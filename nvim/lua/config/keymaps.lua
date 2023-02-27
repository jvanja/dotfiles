-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- function M.set_keymaps(mode, key, val)
--   local opt = { noremap = true, silent = true }
--   if type(val) == "table" then
--     opt = val[2]
--     val = val[1]
--   end
--   vim.api.nvim_set_keymap(mode, key, val, opt)
-- end

-- toggle relativenumber
-- map("n", "<leader>n", ":set relativenumber!<cr>")

-- save file with leader s
-- map("n", "<leader>s", ":w<cr>")

-- save and quit
map("n", "<leader>x", ":wq<cr>")
-- quit file with leader q
-- map("n", "<leader>q", ":q<cr>")
-- delete buffer with leader w
map("n", "<leader>w", ":bdelete<cr>")
-- save file with leader s when in insert mode
-- map("i", "<leader>s", "<C-c>:w<cr>")
-- save and quit file with leader x when in insert mode
-- map("i", "<leader>x", "<C-c>:wq<cr>")

--copy in visual mode with ctrc c to system clipboard
-- map("v", "<leader>y", '"*y')

map("n", "Y", "yy")

-- paste mode toggle
map("x", "<leader>p", '"_dP')

-- test the below mappings or just use https://github.com/vim-scripts/ReplaceWithRegister
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

map("n", "<leader>d", '"_d')
map("v", "<leader>d", '"_d')

map("v", "<leader>d", '"_d')

-- move lines with ALT j and ALT k
-- map("n", "<A-j>", ":m .+1<CR>==")
-- map("n", "<A-k>", ":m .-2<CR>==")
-- map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
-- map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
-- map("v", "<A-j>", ":m '>+1<CR>gv=gv")
-- map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- NAVIGATION
--
-- move rows up and down and not lines.. for wrapped text
-- map("n", "j", "gj")
-- map("n", "k", "gk")

-- move to begining and end of line with H and L
map("n", "H", "^")
map("n", "L", "$")
map("v", "H", "^")
map("v", "L", "$")

-- QUICKFIX
--
map("n", "<Down>", ":cn<CR>")
map("n", "<Up>", ":cp<CR>")

-- LOCATION LIST
--
map("n", "<C-j>", ":lnext<CR>")
map("n", "<C-k>", ":lprev<CR>")
map("n", "<C-q>", ":cclose | lclose<CR>")

-- BUFFERLINE
--
if Util.has("bufferline.nvim") then
  map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>")
  map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>")
  map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>")
  map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>")
  map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>")
  map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>")
  map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>")
  map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>")
  map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>")
end

-- -- These commands will navigate through buffers in order regardless of which mode you are using
-- -- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
map("n", "<TAB>", ":BufferLineCycleNext<CR>")
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
-- toggle between the last two buffers with ,,
map("n", "<leader>,", "<C-^><cr>")

-- FUGITIVE
--
map("n", "<leader>gg", "false") -- disable lazygit keyaps
map("n", "<leader>gG", "false") -- disable lazygit keyaps
map("n", "<leader>ga", ":Git add %:p<CR><CR>")
map("n", "<leader>gs", ":Git<CR>")
map("n", "<leader>gc", ":Git commit -v -q<CR>")
map("n", "<leader>gd", ":Gdiff<CR>")
map("n", "<leader>ge", ":Gedit<CR>")
map("n", "<leader>gw", ":Gwrite<CR><CR>")
map("n", "<leader>gac", ":Git add -A . && git commit<CR><CR>")
map("n", "<leader>glo", ":silent! Gclog<CR>:bot copen<CR>")
map("n", "<leader>gb", ":Git branch<Space>")
map("n", "<leader>go", ":Git checkout<Space>")
map("n", "<leader>gp", ":Git push<CR>")
map("n", "<leader>gl", ":Git pull<CR>")

-- SEARCHING
--
-- search and replace in file with ctrl f
map("n", "<C-f>", ":%s///g<left><left><left>", { noremap = true, silent = false })
map("v", "<C-f>", ":s///g<left><left><left>", { noremap = true, silent = false })
-- Use QuickFix to search and replace
-- map("n", "<leader>R", {":Far  **/*.*<left><left><left><left><left><left><left>", {noremap = true, silent = false}})

-- scroll up and down and center
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- Keep search matches in the middle of the window.
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

--turn off highlight with ,n
map("n", "<leader>n", ":nohl<CR>")

-- this makes the DOT work in the visual block mode
map("x", ".", ":normal .<CR>")

-- zoom in on the current split window. Useful for help
map("n", "<leader>z", "<C-w>_")
