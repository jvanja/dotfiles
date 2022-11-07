local present, indent_blankline = pcall(require, "indent_blankline")
if not present then return end

indent_blankline.setup {
  viewport_buffer = 100,
  char = "┊",
  -- char = "▏",
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  use_treesitter = false,
  show_current_context = false,
}
