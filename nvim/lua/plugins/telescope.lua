return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_ignore_patterns = {
          "node_modules",
          "build",
        },
      },
    },
    dependencies = {
      {
        "nvim-telescope/telescope-file-browser.nvim",
        config = function()
          require("telescope").load_extension("file_browser")
        end,
      },
    },
    keys = {
      { "<leader>o",  "<cmd>lua require('telescope.builtin').find_files()<CR>",      desc = "Find files" },
      { "<leader>ff", ":Telescope file_browser<CR>",                                 desc = "File Browser" },
      { '<leader>"',  "<cmd>lua require('telescope.builtin').registers()<CR>",       desc = "Registers" },
      { "<leader>fd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", desc = "LSP Definitions" },
      { "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>",  desc = "LSP References" },
      { "<leader>fc", "<cmd>lua require('telescope.builtin').git_bcommits()<CR>",    desc = "Search in buffer commits" },
      { "<leader>fs", "<cmd>lua require('telescope.builtin').git_status()<CR>" },
      {
        "<leader>?",
        "<cmd>lua require('telescope.builtin').keymaps()<CR>",
        desc =
        "Lists normal mode keymappings"
      },
      { "<leader>fw", "<cmd>lua require('telescope.builtin').grep_string()<CR>", desc = "Grep for word under cursor" },
      { "<leader>gs", false },
    },
  },
}
