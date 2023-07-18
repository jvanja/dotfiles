local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local date = os.date("%x")

return {
  s({ trig = "todo", dscr = "TODO Snippet" }, {
    t({ "// - TODO:  <" .. date .. ", vanja> -" }),
    t({ "", "//" }),
    i(1),
  }),
  s({ trig = "scom", dscr = "Section comment" }, {
    t({ "/* ==========================================================================" }),
    t({ "", "  " }),
    i(1),
    t({ "", "  ========================================================================== */" }),
  }),
}
