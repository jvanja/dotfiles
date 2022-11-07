local present, indent_blankline = pcall(require, "indent_blankline")
if not present then return end

indent_blankline.setup {
  viewport_buffer = 100,
  char = "┊",
  filetype_exclude = {
    -- "vimwiki",
    -- "man",
    -- "gitmessengerpopup",
    -- "diagnosticpopup",
    -- "lspinfo",
    -- "packer",
    -- "checkhealth",
    -- "TelescopePrompt",
    -- "TelescopeResults",
    -- "",
  },
  space_char_blankline = " ",
  show_foldtext = false,
  strict_tabs = true,
  max_indent_increase = 1,
  use_treesitter_scope = true,
}
