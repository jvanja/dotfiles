return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-file-browser.nvim",
        config = function()
          require("telescope").load_extension("file_browser")
        end,
      },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
    },
    opts = function(_, opts)
      local lga_actions = require("telescope-live-grep-args.actions")

      opts.extensions = {
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            },
          },
        }
      }
      opts.pickers = {
        find_files = {
          find_command = { 'rg', '--files', '--hidden', '-g', '!.git' }
        }
      }
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
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
      })
    end,
    keys = {
      { "<leader>o", "<cmd>lua require('telescope.builtin').find_files()<CR>", desc = "Find files" },
      {
        "<leader>ff",
        ":Telescope file_browser<CR>",
        desc =
        "File Browser"
      },
      { '<leader>"', "<cmd>lua require('telescope.builtin').registers()<CR>",  desc = "Registers" },
      {
        "<leader>fd",
        "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>",
        desc =
        "LSP Definitions"
      },
      {
        "<leader>fr",
        "<cmd>lua require('telescope.builtin').lsp_references()<CR>",
        desc =
        "LSP References"
      },
      {
        "<leader>fc",
        "<cmd>lua require('telescope.builtin').git_bcommits()<CR>",
        desc =
        "Search in buffer commits"
      },
      { "<leader>fs", "<cmd>lua require('telescope.builtin').git_status()<CR>",                       desc = "Git status" },
      { "<leader>sg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc = "Git status" },
      {
        "<leader>?",
        "<cmd>lua require('telescope.builtin').keymaps()<CR>",
        desc =
        "Lists normal mode keymappings"
      },
      {
        "<leader>fw",
        "<cmd>lua require('telescope.builtin').grep_string()<CR>",
        desc =
        "Grep for word under cursor"
      },
      { "<leader>gs", false },
    },
  },
}
