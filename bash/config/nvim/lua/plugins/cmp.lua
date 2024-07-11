return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-emoji",
  },
  opts = function(_, opts)
    vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", {fg ="#6CC644"})

    local cmp = require("cmp")
    -- opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "codeium" } }))
    table.insert(opts.sources, 1, {
      name = "supermaven",
      group_index = 1,
      priority = 100,
    })
    opts.window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }
    opts.formatting = {
      format = function(_, item)
        local icons = require("lazyvim.config").icons.kinds
        if icons[item.kind] then
          icons["Codeium"] = " "
          icons["Supermaven"] = " "
          item.kind = icons[item.kind] .. item.kind
        end
        return item
      end,
    }
  end,
}

