--
-- THEME
--
vim.opt.guifont = 'Hack Nerd Font Regular:h1'
vim.opt.background = 'dark'

-- vim.cmd('colorscheme dracula')
require('onedark').setup({
  colors = {
    bg = "#171a1f",
  }
})


-- highlight  the current  line number
vim.cmd('hi CursorLineNr cterm=bold ctermfg=NONE gui=bold guifg=white')


-- vim.cmd('source ~/.config/nvim/airline.vim')

-- set search highlight color
-- hi Search cterm=NONE ctermfg=white ctermbg=blue
vim.cmd('highlight search ctermfg=white ctermbg=3423513')
