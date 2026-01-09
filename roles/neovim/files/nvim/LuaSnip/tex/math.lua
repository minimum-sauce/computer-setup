local ls = require("luasnip")
local s = ls.snippet

ls.config.setup({
  enable_autosnippets = true,
  update_events = 'TextChanged,TextChangedI'
})

return {
s({trig="ff", dscr="Expands 'ff' into '\frac{}{}'"},
{ t("\\frac{"), i(1), t("}{"), i(2), t("}") }),

-- get theorem box
s({trig="theo", dscr="Generate Theorem Environment"},
        fmta([[
\begin{theo}{<>}{<>}
<>
\end{theo}
]], {i(1), i(2), i(3)})),

s({trig="def", dscr="Generate Definition Environment"},
        fmta([[
\begin{defin}{<>}{<>}
<>
\end{defin}
]], {i(1), i(2), i(3)})),

-- get example box
s({trig="exam", dscr="Generate Example Environment"},
        fmta([[
\begin{exam}{<>}{<>}
<>
\end{exam}
]], {i(1), i(2), i(3)})),

s({trig=":int", dscr="Generate Definition Environment", snippetType="autosnippet"},
        fmta([[\int_{<>}^{<>} <>]], 
	{i(1), i(2), i(3)})),

s({trig=":sum", dscr="Generate Definition Environment", snippetType="autosnippet"},
        fmta([[\sum_{<>}^{<>} <>]], 
	{i(1), i(2), i(3)})),
s({trig=":set", dscr="Generate Definition Environment", snippetType="autosnippet"},
        fmta([[\{<> | <>\}]], 
	{i(1), i(2)})),
s({trig=":vec", dscr="Generate Definition Environment", snippetType="autosnippet"},
        fmta([[
(<>_1, \cdots, <>_<>)\in\mathbb{R}^<>
]], {i(1), rep(1), i(2), rep(2)})),

s({trig=":xy", dscr="vector in 2-space", snippetType="autosnippet"},
{t("(x, y)\\in \\mathbb{R}^2"),}),

s({trig=":xyz", dscr="vector in 3-space", snippetType="autosnippet"},
{t("(x, y, z)\\in \\mathbb{R}^3"),}),
s({trig=":r", dscr="vector in 3-space", snippetType="autosnippet"},
{t("\\rightarrow"),}),
s({trig=":R", dscr="vector in 3-space", snippetType="autosnippet"},
{t("\\Rightarrow"),}),
s({trig=":m", dscr="Generate Definition Environment", snippetType="autosnippet"},
        fmta([[
        \( <> \)
]], {i(1)})),
}
