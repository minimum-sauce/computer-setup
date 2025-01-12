local ls = require("luasnip")
local s = ls.snippet

ls.config.setup({
  enable_autosnippets = true,
  update_events = 'TextChanged,TextChangedI'
})

return {
-- 
s({trig="up", dscr="generates use package "},
  {fmta(
      [[\\usepackage{<>}]],
      {i(1)})),

s({trig="upx", dscr="generates use package "},
  {fmta(
      [[
      \\usepackage[<>]{<>}
      ]],
      {i(2), i(1)})}),

s({trig="lb", dscr="generates a label"},
  {fmta([[
  \\label{<>}
]], { i(1)})}),

s({trig="ct", dscr="generates a label"},
  {fmta([[
  \\cite{<>}
]], { i(1)})}),
}

