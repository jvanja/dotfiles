" toggle relativenumber
nnoremap <C-n> :set relativenumber!<cr>

" save file with leader s
noremap <leader>s :w<cr>
inoremap ,s :w<cr>

" save and quit 
noremap <leader>x :wq<cr>
" quit file with leader q
noremap <leader>q :q<cr>
" delete buffer with leader w
noremap <leader>w :bdelete<cr>
" save file with leader s when in insert mode
inoremap <leader>s <C-c>:w<cr>
" save and quit file with leader x when in insert mode
inoremap <leader>x <C-c>:wq<cr>

"in the news execute shell command under cursor
noremap Q !!$SHELL<cr>

"copy in visual mode with ctrc c to system clipboard
vnoremap <leader>y "*y

" paste mode toggle
map <leader>p :set paste!<CR>

" move lines with ALT j and ALT k
nnoremap ˚ :m .-2<CR>==
nnoremap ∆ :m .+1<CR>==

inoremap ˚ <Esc>:m .-2<CR>==gi
inoremap ∆ <Esc>:m .+1<CR>==gi

vnoremap ˚ :m '<-2<CR>gv=gv
vnoremap ∆ :m '>+1<CR>gv=gv

noremap <leader>i gg=G``

"
" NAVIGATION
"
" move rows up and down and not lines.. for wrapped text
nnoremap j gj
nnoremap k gk

" move to begining and end of line with H and L
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" go to line number with 12<enter> instead of 12G 
nnoremap <CR> G 

" noremap /nt :NERDTreeToggle<CR>
"
"" QUICKFIX
""
nnoremap <Down> :cn<CR>
nnoremap <Up> :cp<CR>

" Bufferline nav
nnoremap <leader>1 :BufferLineGoToBuffer 1<CR>
nnoremap <leader>2 :BufferLineGoToBuffer 2<CR>
nnoremap <leader>3 :BufferLineGoToBuffer 3<CR>
nnoremap <leader>4 :BufferLineGoToBuffer 4<CR>
nnoremap <leader>5 :BufferLineGoToBuffer 5<CR>
nnoremap <leader>6 :BufferLineGoToBuffer 6<CR>
nnoremap <leader>7 :BufferLineGoToBuffer 7<CR>
nnoremap <leader>8 :BufferLineGoToBuffer 8<CR>
nnoremap <leader>9 :BufferLineGoToBuffer 9<CR>

" " These commands will navigate through buffers in order regardless of which mode you are using
" " e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent><TAB> :BufferLineCycleNext<CR>
nnoremap <silent><S-Tab> :BufferLineCyclePrev<CR>

""
"" FUGITIVE
""
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit -v -q<CR>
"" nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
" nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gac :Git add -A . && git commit<CR><CR>
nnoremap <leader>glo :silent! Glog<CR>:bot copen<CR>
" nnoremap <leader>grp :Ggrep<Space>
" nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gl :Gpull<CR>
"
" SEARCHING
"
" search and replace in file with ctrl f
nmap <C-f> :%s///g<left><left><left>
vmap <C-f> :s///g<left><left><left>
map <leader>r :Far  **/*.*<left><left><left><left><left><left><left>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

"turn off highlight with ,n
nnoremap <leader>n :nohl<CR>


