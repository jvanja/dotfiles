return {
  {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    dependencies = "rafamadriz/friendly-snippets",

    opts = {
      keymap = { preset = "default" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      sources = {
        default = { "supermaven", "snippets", "lsp", "path", "buffer" },
      },
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    -- opts_extend = { "sources.default" },
  }
}
