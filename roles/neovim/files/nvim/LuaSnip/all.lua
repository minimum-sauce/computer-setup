local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

ls.config.setup({
  enable_autosnippets = true,
    update_events = 'TextChanged,TextChangedI'
})

return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  -- Example: how to set snippet parameters
  s({trig = "hi"}, {t("Hello, world!")}),
  -- To return multiple snippets, use one `return` statement per snippet file
  -- and return a table of Lua snippets.
  s({ trig = "foo",
  snippetType="autosnippet"},
    { t("Another snippet.") }
  ),
}
