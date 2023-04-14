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
      },
    },
    dependencies = {
      {
        "nvim-telescope/telescope-file-browser.nvim",
        config = function()
          require("telescope").load_extension("file_browser")
        end,
      },
      -- {
      --   "nvim-telescope/telescope-fzf-native.nvim",
      --   build = "make",
      --   config = function()
      --     require("telescope").load_extension("fzf")
      --   end,
      -- },
    },
    keys = {
      { "<leader>o", "<cmd>lua require('telescope.builtin').find_files()<CR>", desc = "Find files" },
      { "<leader>ff", ":Telescope file_browser<CR>", desc = "File Browser" },
      { '<leader>"', "<cmd>lua require('telescope.builtin').registers()<CR>", desc = "Registers" },
      { "<leader>fd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", desc = "LSP Definitions" },
      { "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", desc = "LSP References" },
      { "<leader>fc", "<cmd>lua require('telescope.builtin').git_bcommits()<CR>", desc = "Search in buffer commits" },
      { "<leader>gs", false },
    },

    -- replace all Telescope keymaps with below
    -- keys = function()
    --   return {
    --     { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>" },
    --     { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>" },
    --     { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>" },
    --     -- git
    --     { "<leader>fc", "<cmd>lua require('telescope.builtin').git_bcommits()<CR>" },
    --     { "<leader>fs", "<cmd>lua require('telescope.builtin').git_status()<CR>" },
    --     -- lsp
    --   }
    -- end,
  },
}
