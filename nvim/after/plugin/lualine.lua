require'lualine'.setup {
  options = {
    icons_enabled = true,
    -- theme = 'gruvbox',
    theme = 'onedark',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    -- lualine_b = {'branch'},
    lualine_b = {
      'branch',
      'filename',
    },
    lualine_c = {'diff'},
    -- lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_x = {
      'diagnostics',
      'treesitter',
      'lsp',
      'filetype',
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
