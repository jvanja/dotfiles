local M = {}

function M.set_keymaps(mode, key, val)
  local opt = { noremap = true, silent = true }
  if type(val) == "table" then
    opt = val[2]
    val = val[1]
  end
  vim.api.nvim_set_keymap(mode, key, val, opt)
end

-- toggle relativenumber
M.set_keymaps('n', '<leader>n', ':set relativenumber!<cr>')

-- save file with leader s
M.set_keymaps('n', '<leader>s', ':w<cr>')
M.set_keymaps('i', ',s', ':w<cr>')

-- save and quit
M.set_keymaps('n', '<leader>x', ':wq<cr>')
-- quit file with leader q
M.set_keymaps('n', '<leader>q', ':q<cr>')
-- delete buffer with leader w
M.set_keymaps('n', '<leader>w', ':bdelete<cr>')
-- save file with leader s when in insert mode
M.set_keymaps('i', '<leader>s', '<C-c>:w<cr>')
-- save and quit file with leader x when in insert mode
M.set_keymaps('i', '<leader>x', '<C-c>:wq<cr>')

--copy in visual mode with ctrc c to system clipboard
M.set_keymaps('v', '<leader>y', '"*y')

-- paste mode toggle
M.set_keymaps('n', '<leader>p', ':set paste!<CR>')

-- move lines with ALT j and ALT k
M.set_keymaps('n', '<A-j>', ':m .+1<CR>==')
M.set_keymaps('n', '<A-k>', ':m .-2<CR>==')
M.set_keymaps('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
M.set_keymaps('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
M.set_keymaps('v', '<A-j>', ":m '>+1<CR>gv=gv")
M.set_keymaps('v', '<A-k>', ":m '<-2<CR>gv=gv")


-- NAVIGATION
--
-- move rows up and down and not lines.. for wrapped text
M.set_keymaps('n', 'j', 'gj')
M.set_keymaps('n', 'k', 'gk')

-- move to begining and end of line with H and L
M.set_keymaps('n', 'H', '^')
M.set_keymaps('n', 'L', '$')
M.set_keymaps('v', 'H', '^')
M.set_keymaps('v', 'L', '$')


-- QUICKFIX
--
M.set_keymaps('n', '<Down>', ':cn<CR>')
M.set_keymaps('n', '<Up>', ':cp<CR>')


-- LOCATION LIST
--
M.set_keymaps('n', '<C-j>', ':lnext<CR>')
M.set_keymaps('n', '<C-k>', ':lprev<CR>')
M.set_keymaps('n', '<C-q>', ':cclose | lclose<CR>')


-- BUFFERLINE
--
M.set_keymaps('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>')
M.set_keymaps('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>')
M.set_keymaps('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>')
M.set_keymaps('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>')
M.set_keymaps('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>')
M.set_keymaps('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>')
M.set_keymaps('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>')
M.set_keymaps('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>')
M.set_keymaps('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>')

-- -- These commands will navigate through buffers in order regardless of which mode you are using
-- -- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
M.set_keymaps('n', '<TAB>', ':BufferLineCycleNext<CR>')
M.set_keymaps('n', '<S-Tab>', ':BufferLineCyclePrev<CR>')
-- toggle between the last two buffers with ,,
M.set_keymaps('n', '<leader>,', '<C-^><cr>')


-- FUGITIVE
--
M.set_keymaps('n', '<leader>ga', ':Git add %:p<CR><CR>')
M.set_keymaps('n', '<leader>gs', ':Git<CR>')
M.set_keymaps('n', '<leader>gc', ':Git commit -v -q<CR>')
M.set_keymaps('n', '<leader>gd', ':Gdiff<CR>')
M.set_keymaps('n', '<leader>ge', ':Gedit<CR>')
M.set_keymaps('n', '<leader>gw', ':Gwrite<CR><CR>')
M.set_keymaps('n', '<leader>gac', ':Git add -A . && git commit<CR><CR>')
M.set_keymaps('n', '<leader>glo', ':silent! Gclog<CR>:bot copen<CR>')
M.set_keymaps('n', '<leader>gb', ':Git branch<Space>')
M.set_keymaps('n', '<leader>go', ':Git checkout<Space>')
M.set_keymaps('n', '<leader>gp', ':Git push<CR>')
M.set_keymaps('n', '<leader>gl', ':Git pull<CR>')


-- SEARCHING
--
-- search and replace in file with ctrl f
M.set_keymaps('n', '<C-f>', {':%s///g<left><left><left>', {noremap = true, silent = false}})
M.set_keymaps('v', '<C-f>', {':s///g<left><left><left>', {noremap = true, silent = false}})
M.set_keymaps('n', '<leader>r', {':Far  **/*.*<left><left><left><left><left><left><left>', {noremap = true, silent = false}})

-- Keep search matches in the middle of the window.
M.set_keymaps('n', 'n', 'nzzzv')
M.set_keymaps('n', 'N', 'Nzzzv')

--turn off highlight with ,n
M.set_keymaps('n', '<leader>n', ':nohl<CR>')

-- this makes the DOT work in the visual mode (this was originally only for xmap
-- for select mode)
M.set_keymaps('v', '<silent>.', ':normal .<CR>')

return M
