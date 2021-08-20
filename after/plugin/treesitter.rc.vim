if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "javascript",
    "typescript",
    "vue",
    "lua",
    "php",
    "json",
    "html",
    "scss",
    "css"
  },
  textobjects = {
    select = {
    enable = true,
    -- Automatically jump forward to textobj, similar to targets.vim 
    lookahead = true,
    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner"
      }
    },
  move = {
    enable = true,
    set_jumps = true, 
    goto_next_start = {
      [']m'] = '@function.outer',
      [']]'] = '@class.outer'
      },
    goto_next_end = {
      [']M'] = '@function.outer',
      [']['] = '@class.outer'
      },
    goto_previous_start = {
      ['[m'] = '@function.outer',
      ['[['] = '@class.outer'
      },
    goto_previous_end = {
      ['[M'] = '@function.outer',
      ['[]'] = '@class.outer'
      }
    }
  },
   context_commentstring = {
    enable = true
  }
}
EOF
