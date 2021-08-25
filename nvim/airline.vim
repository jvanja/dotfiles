""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" AIRLINE
""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Enable the list of buffers
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#enabled = 0

" show buffer index in airline tabline
" let g:airline#extensions#tabline#buffer_idx_mode = 1

" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9

" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'

" Powerline symbols to show in airline 
let g:airline_powerline_fonts = 1

function! AirlineInit()
  " let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
  " let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%f'])
  " let g:airline_section_c = airline#section#create(['filetype'])
  let g:airline_section_x = airline#section#create(['%P'])
  let g:airline_section_y = airline#section#create(['%B'])
  let g:airline_section_z = airline#section#create_right(['%l', '%c'])
endfunction
autocmd VimEnter * call AirlineInit()
