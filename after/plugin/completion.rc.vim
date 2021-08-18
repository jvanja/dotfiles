if !exists('g:loaded_completion') | finish | endif

" Use completion-nvim in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()

set completeopt=menuone,noinsert,noselect

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

let g:completion_enable_snippet = 'UltiSnips'
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

