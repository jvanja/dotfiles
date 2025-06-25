return {
  "Sebastian-Nielsen/better-type-hover",
  ft = { "typescript", "typescriptreact", "vue" },
  config = function()
    require("better-type-hover").setup({
      -- The primary key to hit to open the main window
      openTypeDocKeymap = "<C-x>",
      -- Whether to fallback to the old `vim.lsp.buf.hover()` when triggered on anything but an interface or type.
      -- Strongly adviced to keep this on true as it's not stable otherwise.
      fallback_to_old_on_anything_but_interface_and_type = true,
      -- If the declaration in the window is longer than 20 lines remove all lines after the 20th line.
      fold_lines_after_line = 20,
      -- These letters/digits are used in order
      keys_that_open_nested_types = { "a", "s", "b", "i", "e", "u", "r", "x" },
      -- This is to avoid a type hint (i.e. a letter) showing up in the main window
      types_to_not_expand = { "string", "number", "boolean", "Date" },
    })
  end,
}
