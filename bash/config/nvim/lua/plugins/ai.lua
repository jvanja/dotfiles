return {
  {
    -- also investigate https://github.com/David-Kunz/gen.nvim
    "supermaven-inc/supermaven-nvim",
    -- enabled = false,
    commit = 'df3ecf7',
    config = function()
      require("supermaven-nvim").setup({
        -- all the options are set via cmp
        disable_inline_completion = true, -- disables inline completion for use with cmp
        disable_keymaps = true -- disables built in keymaps for more manual control
      })
    end,
  },
}
