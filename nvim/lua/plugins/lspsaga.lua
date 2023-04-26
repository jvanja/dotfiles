return {
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    },
    opts = {},
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<CR>", mode = "n", desc = "Hover Doc" }
      keys[#keys + 1] = { ",ct", "<cmd>Lspsaga peek_type_definition<CR>", mode = "n", desc = "Peek Type Definition" }
      keys[#keys + 1] = { ",cd", "<cmd>Lspsaga show_line_diagnostics<CR>", mode = "n", desc = "Show Line Diagnostic" }
    end
  }
}
