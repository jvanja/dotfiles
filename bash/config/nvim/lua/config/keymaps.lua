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

-- SYSTEM CLIPBOARD
--
map("n", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("v", "<leader>y", '"+y', { desc = "Copy visual selection to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Copy the whole line to system clipboard" })
map("n", "<leader>ey","<cmd>lua vim.diagnostic.open_float()<CR><cmd>lua vim.diagnostic.open_float()<CR>ggVG\"+Y<CR>", { desc = "Copy the diagnostics line to system clipboard" })

-- move to begining and end of line with H and L
map("n", "H", "^")
map("n", "L", "$")
map("v", "H", "^")
map("v", "L", "$")

-- Move Lines
map("n", "∆", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "˚", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "∆", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "˚", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "∆", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "˚", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- QUICKFIX
--
map("n", "<Down>", ":lua vim.diagnostic.goto_next({float= false})<CR>")
map("n", "<Up>", ":lua vim.diagnostic.goto_prev({float= false})<CR>")

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

  -- -- These commands will navigate through buffers in order regardless of which mode you are using
  -- -- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
  map("n", "<TAB>", ":BufferLineCycleNext<CR>")
  map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
end

-- SEARCHING AND REPLACING
map(
  "n",
  "<C-f>",
  ":%s///g<left><left><left>",
  { noremap = true, silent = false, desc = "Search and replace in file with ctrl f" }
)
-- Search and replace word under the cursor
map(
  "n",
  "<leader>r",
  [[:%s/\<<C-r><C-w>\>//g<left><left>]],
  { noremap = true, silent = false, desc = "Search and replace word under the cursor" }
)

-- Keep search matches in the middle of the window.
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader>n", ":nohl<CR>", { desc = "Turn off highlight with" })

-- this makes the DOT work in the visual block mode
map("x", ".", ":normal .<CR>")

map("n", "<leader>z", "<C-w>_", { desc = "Zoom in on the current split window" })

map("n", '<leader>"', 'ciw"<c-r>-"<esc>', { desc = "Surround the word under cursor with double quotes" })
map("n", "<leader>'", "ciw'<c-r>-'<esc>", { desc = "Surround the word under cursor with single quotes" })

map("n", "<C-j>", ":Treewalker Down<CR>", { desc = "Move down in the tree", noremap = true })
map("n", "<C-k>", ":Treewalker Up<CR>", { desc = "Move up in the tree", noremap = true })
map("n", "<C-h>", ":Treewalker Left<CR>", { desc = "Move left in the tree", noremap = true })
map("n", "<C-l>", ":Treewalker Right<CR>", { desc = "Move right in the tree", noremap = true })
