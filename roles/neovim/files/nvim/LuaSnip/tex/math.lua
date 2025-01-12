local ls = require("luasnip")
local s = ls.snippet

return {
  s({trig="ff", dscr="Expands 'ff' into '\frac{}{}'"},
  { t("\\frac{"), i(1), t("}{"), i(2), t("}") }
),
}
