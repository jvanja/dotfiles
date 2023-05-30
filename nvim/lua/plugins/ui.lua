return {
  -- theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro-spectrum",
    },
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     transparent = false,
  --   },
  -- },
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    -- opts = function(_, opts)
    opts = function()
      return {
        options = {
          theme = "monokai-pro",
        },
        sections = {
          lualine_z = {
            function()
              local msg = "No Active Lsp"
              local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
              local clients = vim.lsp.get_active_clients()
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
}
