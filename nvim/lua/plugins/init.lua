
local Plug = vim.fn['plug#']

vim.fn['plug#begin']('~/.config/nvim/bundle')

Plug('tweekmonster/startuptime.vim')
Plug('monsonjeremy/onedark.nvim')
Plug('airblade/vim-gitgutter')
Plug('kyazdani42/nvim-web-devicons')
Plug('hoob3rt/lualine.nvim')
Plug('akinsho/bufferline.nvim')
Plug('brooth/far.vim')
Plug('cohama/lexima.vim')
Plug('editorconfig/editorconfig-vim')
Plug('flazz/vim-colorschemes')
Plug('godlygeek/tabular')
Plug('SirVer/ultisnips')
Plug('honza/vim-snippets')
Plug('jvanja/vim-bootstrap4-snippets')
Plug('junegunn/vim-peekaboo')
-- Plug('scrooloose/nerdtree', { on = 'NERDTreeToggle' }) -- load the plugin only when ND is fired
-- Plug('Xuyuanp/nerdtree-git-plugin')
-- Plug('tiagofumo/vim-nerdtree-syntax-highlight')
Plug('tpope/vim-commentary')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-repeat')
Plug('tpope/vim-surround')
Plug('nathanaelkane/vim-indent-guides')

-- nvim >=0.5
Plug('glepnir/lspsaga.nvim')
Plug('neovim/nvim-lspconfig')
Plug('kabouzeid/nvim-lspinstall')
Plug('folke/lsp-colors.nvim')
Plug('nvim-lua/completion-nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn[':TSUpdate'] })
Plug('nvim-treesitter/nvim-treesitter-textobjects')
Plug('JoosepAlviste/nvim-ts-context-commentstring') -- needs vim-commentary plugin to work
Plug('windwp/nvim-ts-autotag')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
-- Plug('nvim-telescope/telescope.nvim')
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = function() vim.call('make') end })

vim.fn['plug#end']()

