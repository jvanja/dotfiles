-- for SquareSpace temaplates
vim.cmd('au BufReadPost *.item set syntax=html')
vim.cmd('au BufRead,BufNewFile *.ejs set filetype=html')

-- Automatic reloading of .vimrc
-- vim.cmd('autocmd! bufwritepost .vimrc source %')

-- temp file for crontab
vim.cmd('autocmd filetype crontab setlocal nobackup nowritebackup')

-- 'matchit.vim' is built-in so let's enable it!
-- Hit '%' on 'if' to jump to 'else'.
vim.cmd('runtime macros/matchit.vim')

-- Vue.js syntax
-- vim.cmd('autocmd BufRead,BufNewFile *.vue setlocal filetype=vue')

vim.cmd('autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444444   ctermbg=3')
vim.cmd('autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#353535 ctermbg=4')
