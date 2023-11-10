return {
  "L3MON4D3/LuaSnip",
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
  config = function()
    require("luasnip.loaders.from_lua").load({ paths = "./snippets" }) -- for anything dynamic
    require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets" }) -- simple snippets in json files
  end,
}
