return {
  {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    dependencies = "rafamadriz/friendly-snippets",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "default" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      sources = {
        default = { "supermaven", "snippets", "lsp", "path", "buffer" },
        -- optionally disable cmdline completions
        -- cmdline = {},
      },
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.default" },
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "hrsh7th/cmp-emoji",
  --   },
  --   opts = function(_, opts)
  --     vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", { fg = "#6CC644" })
  --
  --     local cmp = require("cmp")
  --     table.insert(opts.sources, 1, {
  --       name = "supermaven",
  --       group_index = 1,
  --       priority = 100,
  --     })
  --     opts.window = {
  --       completion = cmp.config.window.bordered(),
  --       documentation = cmp.config.window.bordered(),
  --     }
  --     opts.formatting = {
  --       format = function(_, item)
  --         local icons = require("lazyvim.config").icons.kinds
  --         if icons[item.kind] then
  --           icons["Codeium"] = " "
  --           icons["Supermaven"] = " "
  --           item.kind = icons[item.kind] .. item.kind
  --         end
  --         return item
  --       end,
  --     }
  --   end,
  -- },
  -- {
  --   "garymjr/nvim-snippets",
  --   opts = {
  --     extended_filetypes = {
  --       typescript = { "javascript" },
  --       typescriptreact = { "javascript" },
  --       javascriptreact = { "javascript" },
  --     },
  --   },
  -- },
}
