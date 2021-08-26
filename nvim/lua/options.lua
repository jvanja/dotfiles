local opt = vim.opt
local g = vim.g

opt.termguicolors = true

opt.timeoutlen = 1000
opt.ttimeoutlen = 0

-- Showing line numbers and length
opt.number = true
-- width of document (used by gd)
opt.tw = 79

-- setting relative numbers
opt.relativenumber = true

-- permanent undo
opt.undodir='~/.config/nvim/undodir'
opt.undofile = true

opt.wrap = true
opt.linebreak = true

-- Tab size
opt.shiftwidth = 2

opt.smartindent = true

-- show existing tab with 2 spaces width
opt.tabstop = 2
-- On pressing tab, insert 2 spaces
opt.expandtab = true

-- autocompletion for command menu on TAB
opt.wildmenu = true
opt.wildmode = "full"

-- Proper backspace behavior.
opt.backspace = 'indent,eol,start'

-- block select pass shortest line
opt.virtualedit = 'block'

-- turn on search highlight
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- enable scroll
opt.mouse = 'a'

--show status bar always
opt.laststatus = 2

-- disable some builtin vim plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   -- "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
