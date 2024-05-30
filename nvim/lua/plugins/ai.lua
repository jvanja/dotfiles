return {
  {
    "Exafunction/codeium.nvim",
    event = "VeryLazy",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({})
    end,
  },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        -- all the options are set via cmp
        disable_inline_completion = true, -- disables inline completion for use with cmp
        disable_keymaps = true -- disables built in keymaps for more manual control
      })
    end,
  },
}
