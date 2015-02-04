" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()
call pathogen#helptags()

" remove arrows navigation! learn 'hjkl' already!
no <down> <NOP>
no <up> <NOP>
no <left> <NOP>
no <right> <NOP>

ino <down> <NOP>
ino <up> <NOP>
ino <left> <NOP>
ino <right> <NOP>

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

"map /nt to :NERDTree
nnoremap /nt :NERDTree<CR> 

"map /o to :CommantT
nnoremap <C-P> :CommandT<CR>

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
"test
"enable system clipboard
set clipboard=unnamed

"highlight the search match in red...
highlight WhiteOnRed ctermbg=red guibg=red

function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

" Powerline
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod
" set background=dark
" color solarized

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
    au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
    endif

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Tab size
set shiftwidth=2
set tabstop=2

" Pathogen plugins configs
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
set laststatus=2

let mapleader = ","


" javascript syntax
"let g:used_javascript_libs = 'underscore,backbone'
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
