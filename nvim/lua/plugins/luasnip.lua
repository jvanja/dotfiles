return {
  "L3MON4D3/LuaSnip",
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
  config = function()
    require("luasnip.loaders.from_lua").load({ paths = "./snippets" })
  end,
}
