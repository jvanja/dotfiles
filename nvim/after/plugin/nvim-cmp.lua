local present, cmp = pcall(require, "cmp")
if not present then
   return
end

local types   = require "cmp.types"
local str     = require "cmp.utils.str"
local lspkind = require "lspkind"


cmp.setup({

  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      -- vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` user.
      -- require("luasnip").lsp_expand(args.body)

      -- For `ultisnips` user.
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ["<C-d>"]      = cmp.mapping.scroll_docs(-4),
    ["<C-f>"]      = cmp.mapping.scroll_docs(4),
    ["<C-Space>"]  = cmp.mapping.complete(),
    ["<C-e>"]      = cmp.mapping.close(),
    ["<C-y>"]      = cmp.mapping.confirm({ select = true }),
    ["<leader-s>"] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":w<cr>", true, true, true), "n", true)
      else
        fallback()
      end
    end,
    -- read :h ins_completion to find out why TAB is baad ??
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    -- Order here is respected in the completion
    { name = "ultisnips" },
    { name = "nvim_lsp" },
    { name = "treesitter" },
    { name = "path" },
    { name = "buffer", keyword_length = 5 },
    { name = "spell" },
  },

  formatting = {
    fields = {
      cmp.ItemField.Abbr,
      cmp.ItemField.Kind,
      cmp.ItemField.Menu,
    },
    format = lspkind.cmp_format {
      mode = "symbol_text",
      maxwidth = 60,
      before = function(entry, vim_item)
        vim_item.menu = ({
          nvim_lsp = "ﲳ",
          nvim_lua = "",
          treesitter = "",
          path = "ﱮ",
          buffer = "﬘",
          zsh = "",
          ultisnips = "",
          spell = "暈",
        })[entry.source.name]

        -- Get the full snippet (and only keep first line)
        local word = entry:get_insert_text()
        if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
          word = vim.lsp.util.parse_snippet(word)
        end
        word = str.oneline(word)
        if
          entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
          and string.sub(vim_item.abbr, -1, -1) == "~"
        then
          word = word .. "~"
        end
        vim_item.abbr = word

        return vim_item
      end,
    },
  },

  experimental = {
    ghost_text = true
  },
})

