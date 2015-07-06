" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()
call pathogen#helptags()

set wildchar=<Tab> wildmenu wildmode=full

" remove arrows navigation! learn 'hjkl' already!
no <down> <NOP>
no <up> <NOP>
no <left> <NOP>
no <right> <NOP>

ino <down> <NOP>
ino <up> <NOP>
ino <left> <NOP>
ino <right> <NOP>

" navtigate file up and down with CTRL j and CTRL k...
nnoremap <silent> <C-j> :<C-u>
nnoremap <silent> <C-k> :<C-d>

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

" activate snipMate with **
imap ** <esc>a<Plug>snipMateNextOrTrigger

"map /nt to :NERDTree
nnoremap /nt :NERDTree<CR>
"auto open NERDTree
" autocmd vimenter * NERDTree

"map /o to :CommantT
" nnoremap <C-P> :CommandT<CR>

" move lines with ALT j and ALT k
nnoremap ˚ :m .-2<CR>==
nnoremap ∆ :m .+1<CR>==

inoremap ˚ <Esc>:m .-2<CR>==gi
inoremap ∆ <Esc>:m .+1<CR>==gi

vnoremap ˚ :m '<-2<CR>gv=gv
vnoremap ∆ :m '>+1<CR>gv=gv

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

function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
    let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%f'])
    let g:airline_section_c = airline#section#create(['filetype'])
    let g:airline_section_x = airline#section#create(['%P'])
    let g:airline_section_y = airline#section#create(['%B'])
    let g:airline_section_z = airline#section#create_right(['%l', '%c'])
endfunction
autocmd VimEnter * call AirlineInit()

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
" set colorcolumn=80
" highlight ColorColumn ctermbg=233

" Tab size
set shiftwidth=2
set tabstop=2

" Pathogen plugins configs
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
set laststatus=2

" javascript syntax
"let g:used_javascript_libs = 'underscore,backbone'
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

let mapleader = ","

noremap <leader>s :w<cr> " save file with leader s
noremap <leader>x :wq<cr> " save and quit 
noremap <leader>q :q<cr> " quit file with leader q
inoremap <leader>s <C-c>:w<cr> " save file with leader s when in insert mode 
inoremap <leader>x <C-c>:wq<cr> " save and quit file with leader x when in insert mode 

" copy in visual mode with ctrc c to system clipboard
vnoremap <C-c> :w !pbcopy<CR><CR> 
noremap <C-v> :r !pbpaste<CR><CR>

