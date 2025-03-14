return {
  {
    "folke/snacks.nvim",
    opts = {
      indent = { enabled = false },
      animate = {
        duration = 20, -- ms per step
        easing = "linear",
        fps = 60, -- frames per second. Global setting for all animations
      },
      scroll = { enabled = true },
    },
  },
}
