return {
  {
    "ibhagwan/fzf-lua",
    opts = {
       previewers = {
        builtin = {
          syntax_limit_b = 1024 * 100, -- Don't preview files over 100KB (minified JS...)
        },
      },
      winopts = {
        preview = {
          layout = "horizontal",
        },
      },
    },
    keys = {
      { "<leader>,", "<cmd>lua require('fzf-lua').files()<CR>", desc = "Find files" },
      { "<leader>fd", "<cmd>lua require('fzf-lua').lsp_definitions()<CR>", desc = "LSP Definitions" },
      { "<leader>fr", "<cmd>lua require('fzf-lua').lsp_references()<CR>", desc = "LSP References" },
      { "<leader>fc", "<cmd>lua require('fzf-lua').git_bcommits()<CR>", desc = "Search in buffer commits" },
      -- { "<leader>fs", "<cmd>lua require('fzf-lua').git_status()<CR>", desc = "Git status" },
      {
        "<leader>sg",
        -- "<cmd>lua require('fzf-lua').live_grep({ cmd = 'git grep --line-number --column --color=always' })<CR>",
        "<cmd>FzfLua live_grep_native<CR>",
        desc = "Live grep",
      },
      { "<leader>?", "<cmd>lua require('fzf-lua').keymaps()<CR>", desc = "Lists normal mode keymappings" },
      { "<leader>fw", "<cmd>lua require('fzf-lua').grep_string()<CR>", desc = "Grep for word under cursor" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
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
      {
        "mollerhoj/telescope-recent-files.nvim",
        config = function()
          require("telescope").load_extension("recent-files")
        end,
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
        },
      }
      opts.pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
        },
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
      { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", desc = "Find files" },
      {
        "<leader>,",
        "<cmd>lua require('telescope').extensions['recent-files'].recent_files({})<CR>",
        desc = "Find files",
      },
      -- { '<leader>"', "<cmd>lua require('telescope.builtin').registers()<CR>",  desc = "Registers" },
      {
        "<leader>fd",
        "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>",
        desc = "LSP Definitions",
      },
      {
        "<leader>fr",
        "<cmd>lua require('telescope.builtin').lsp_references()<CR>",
        desc = "LSP References",
      },
      {
        "<leader>fc",
        "<cmd>lua require('telescope.builtin').git_bcommits()<CR>",
        desc = "Search in buffer commits",
      },
      {
        "<leader>fs",
        "<cmd>lua require('telescope.builtin').git_status()<CR>",
        desc = "Git status",
      },
      {
        "<leader>sg",
        "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        desc = "Live grep",
      },
      {
        "<leader>?",
        "<cmd>lua require('telescope.builtin').keymaps()<CR>",
        desc = "Lists normal mode keymappings",
      },
      {
        "<leader>fw",
        "<cmd>lua require('telescope.builtin').grep_string()<CR>",
        desc = "Grep for word under cursor",
      },
      { "<leader>gs", false },
    },
  },
}
