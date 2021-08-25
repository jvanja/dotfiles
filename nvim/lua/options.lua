vim.opt.termguicolors = true
-- vim.opt.guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
--   \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
--   \,sm:block-blinkwait175-blinkoff150-blinkon175

vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0

-- Enable syntax highlighting
vim.cmd('filetype off')
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')


-- Showing line numbers and length
vim.opt.number = true
-- width of document (used by gd)
vim.opt.tw = 79

-- setting relative numbers
vim.opt.relativenumber = true


vim.opt.wrap = true
vim.opt.linebreak = true

-- Tab size
vim.opt.shiftwidth = 2
-- show existing tab with 2 spaces width
vim.opt.tabstop = 2
-- On pressing tab, insert 2 spaces
vim.opt.expandtab = true

-- autocompletion for command menu on TAB
vim.opt.wildmenu = true
vim.opt.wildmode = "full"

-- Proper backspace behavior.
vim.opt.backspace = 'indent,eol,start'

-- block select pass shortest line
vim.opt.virtualedit = 'block'

-- turn on search highlight
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- enable scroll
vim.opt.mouse = 'a'

--show status bar always
vim.opt.laststatus = 2

-- javascript syntax
-- vim.g.used_javascript_libs = 'jquery, react, angularjs'
-- autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

