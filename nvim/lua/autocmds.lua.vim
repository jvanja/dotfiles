" -- Automatic reloading of .vimrc
" -- vim.cmd('autocmd! bufwritepost .vimrc source %')


" -- Vue.js syntax
" -- vim.cmd('autocmd BufRead,BufNewFile *.vue setlocal filetype=vue')
"

augroup INDENT_GUIDES_C0LORS
  autocmd! 
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444444   ctermbg=3
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#353535 ctermbg=4
augroup END 

augroup FORMAT_JS_ON_SAVE
  autocmd!
  autocmd BufWritePre *.js,*.vue,*.ts :lua vim.lsp.buf.formatting_seq_sync()
augroup END
