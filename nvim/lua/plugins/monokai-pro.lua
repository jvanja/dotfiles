return {
  "loctvl842/monokai-pro.nvim",
  config = function()
    require("monokai-pro").setup({
      override = function()
        return {
          LineNr = { fg = "#666699" },
        }
      end,
    })
  end,
}
