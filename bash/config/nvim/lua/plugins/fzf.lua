return {
  {
    "folke/which-key.nvim",
    keys = {
      { "<leader>?", false }, -- disable it here so fzf-lua does it instead
    },
  },
  {
    "ibhagwan/fzf-lua",
    opts = {
      previewers = {
        builtin = {
          syntax_limit_b = 1024 * 100, -- Don't preview files over 100KB (minified JS...)
          snacks_image = { enabled = false, render_inline = true },
        },
      },
      winopts = {
        fullscreen = true,
        preview = {
          layout = "horizontal",
        },
      },
    },
    keys = {
      { "<leader>,", "<cmd>lua require('fzf-lua').files()<CR>", desc = "Find files" },
      { "<leader>fd", "<cmd>lua require('fzf-lua').lsp_definitions()<CR>", desc = "LSP Definitions" },
      { "<leader>fr", "<cmd>lua require('fzf-lua').lsp_references()<CR>", desc = "LSP References" },
      { "<leader>fs", "<cmd>lua require('fzf-lua').lsp_workspace_symbols()<CR>", desc = "LSP Symbols" },
      { "<leader>fc", "<cmd>lua require('fzf-lua').git_bcommits()<CR>", desc = "Search buffer GIT commits" },
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
}
