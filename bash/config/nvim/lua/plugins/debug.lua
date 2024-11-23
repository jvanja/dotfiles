return {
  "andrewferrier/debugprint.nvim",
  opts = {
    keymaps = {
      normal = {
        variable_below = ",cl",
      },
    },
    commands = {
      toggle_comment_debug_prints = "ToggleCommentDebugPrints",
      delete_debug_prints = "DeleteDebugPrints",
    },
  },
  version = "*", -- Remove if you DON'T want to use the stable version
}
