local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({ trig = "cl", dscr = "console.log Snippet" }, {
    t({ "console.log('" }),
    i(1),
    t({ "')" }),
  }),
}
