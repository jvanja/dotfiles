return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        -- flavour = "macchiato",         -- latte, frappe, macchiato, mocha
        transparent_background = true, -- disables setting the background color.
        highlight_overrides = {
          all = function(colors)
            return {
              LineNr = { fg = "#8888AA" },
            }
          end,
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "monokai-pro",
      colorscheme = "catppuccin",
    },
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
    opts = {
      transparent = false,
    },
  },
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      return {
        -- options = {
        --   theme = "monokai-pro",
        -- },
        sections = {
          lualine_x = {},
          lualine_y = {
            function ()
              local col = vim.fn.virtcol('.')
              local cur = vim.fn.line('.')
              local total = vim.fn.line('$')
              local progress = math.floor(cur / total * 100)
              return string.format('column: %s : %s', col, progress) .. "%%"
            end
          },
          lualine_z = {
            function()
              local msg = "No Active Lsp"
              local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
              local clients = vim.lsp.get_clients()
              if next(clients) == nil then
                return msg
              end
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return " LSP: " .. client.name
                end
              end
              return msg
            end,
          },
        },
      }
    end,
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
}
