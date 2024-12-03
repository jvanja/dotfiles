return {
  "rachartier/tiny-inline-diagnostic.nvim",
  -- event = "VeryLazy",
  event = { "LspAttach" },
  priority = 1000, -- needs to be loaded in first
  config = function()
    vim.diagnostic.config({ virtual_text = false })
    require("tiny-inline-diagnostic").setup({
      preset = "modern", -- Can be: "modern", "classic", "minimal", "ghost", "simple", "nonerdfont", "amongus"
      options = {
        show_source = true,
        multiple_diag_under_cursor = true,
        overflow = {
          mode = "wrap",
        },
        break_line = {
          enabled = false,
        },
      },
    })
  end,
}
