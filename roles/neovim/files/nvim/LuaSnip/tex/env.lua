local ls = require("luasnip")
local s = ls.snippet

return {
s({trig="eq", dscr="Creates Equation environment"},
  fmta([[
  \begin{equation}
    <>
  \end{equation}
  ]], {i(1)})),
s({trig="ali", dscr="Creates Align environment"},
  fmta([[
  \begin{align}
    <>
  \end{align}
  ]],{i(1)}
)),
-- General Environment
s({trig="env"},
  fmta(
    [[
      \begin{<>}
          <>
      \end{<>}
    ]],
    { i(1), i(2), rep(1)}
  )),
-- Setup simple image 
s({trig="fig"},
  fmta(
    [[
      \begin{figure}[h]
        \centering
        \includegraphics[width=0.9\linewidth]{<>}
        \caption{<>}
        \label{fig:<>}
      \end{figure}
    ]],
    { i(1), i(2), i(3) }
  )),
}
