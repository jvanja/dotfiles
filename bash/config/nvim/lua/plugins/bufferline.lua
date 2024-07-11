return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      numbers = function(opts)
        return string.format("%s", opts.lower(opts.ordinal))
      end,
    },
  },
}
