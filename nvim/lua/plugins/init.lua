local Plug = vim.fn['plug#']

vim.fn['plug#begin']('~/.config/nvim/bundle')

Plug('tweekmonster/startuptime.vim')
Plug('monsonjeremy/onedark.nvim')
Plug('airblade/vim-gitgutter')
Plug('kyazdani42/nvim-web-devicons')
Plug('nvim-lualine/lualine.nvim')
Plug('akinsho/bufferline.nvim')
Plug('brooth/far.vim')
Plug('cohama/lexima.vim')
Plug('editorconfig/editorconfig-vim')
Plug('flazz/vim-colorschemes')
Plug('godlygeek/tabular')
Plug('SirVer/ultisnips')
Plug('quangnguyen30192/cmp-nvim-ultisnips') -- necessary for nvm-cmp
Plug('honza/vim-snippets')
Plug('jvanja/vim-bootstrap4-snippets')
Plug('junegunn/vim-peekaboo')
Plug('tpope/vim-commentary')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-repeat')
Plug('tpope/vim-surround')
Plug('nathanaelkane/vim-indent-guides')


-- nvim >=0.5
Plug('glepnir/lspsaga.nvim')
Plug('neovim/nvim-lspconfig')
Plug('williamboman/nvim-lsp-installer')
Plug('folke/lsp-colors.nvim')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn[':TSUpdate'] })
Plug('nvim-treesitter/nvim-treesitter-textobjects')
Plug('JoosepAlviste/nvim-ts-context-commentstring') -- needs vim-commentary plugin to work
Plug('windwp/nvim-ts-autotag')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = function() vim.call('make') end })

vim.fn['plug#end']()

