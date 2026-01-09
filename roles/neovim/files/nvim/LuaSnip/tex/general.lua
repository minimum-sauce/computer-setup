local ls = require("luasnip")
local s = ls.snippet

ls.config.setup({
  enable_autosnippets = true
})
-- update_events = 'TextChanged,TextChangedI'
return {
s({trig="up", dscr="generates use package "},
  fmta([[
  \usepackage{<>}
  ]], {i(1)})),
s({trig="upx", dscr="generates use package "},
  fmta([[
  \usepackage[<>]{<>}
  ]], {i(1), i(2)})),
s({trig="lb", dscr="generates a label"},
  fmta([[
  \label{<>}
  ]], { i(1)})),
s({trig="ct", dscr="generates a label"},
  fmta([[
  \cite{<>}
  ]], { i(1)})),

-- Sections
s({trig="se", dscr="generates section"},
  fmta([[
  \section{<>}
  ]], {i(1)})),
s({trig="su", dscr="generates a subsection section"},
  fmta([[
  \subsection{<>}
  ]], {i(1)})),
s({trig="so", dscr="generates a subsubsection"},
  fmta([[
  \subsubsection{<>}
  ]], {i(1)})),

s({trig=":i", snippetType="autosnippet"},
  {t("\\item"),}
),
s({trig=":t", snippetType="autosnippet"},
  {t("\\item["), i(1), t("]")}
),
s({trig="mathdoc", dscr="setup document for math notes"},
        fmta([[\documentclass[a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{textcomp}
\usepackage[english]{babel}

% For math
\usepackage{amsmath, amssymb}
\usepackage{tikz,lipsum,lmodern}
\usepackage[most]{tcolorbox}

\newtcbtheorem[number within=section]{theo}{Theorem}%
{colback=green!5,colframe=green!35!black,fonttitle=\bfseries}{th}

\newtcbtheorem[number within=section]{defin}{Definition}%
{colback=green!5,colframe=green!35!black,fonttitle=\bfseries}{def}

\newtcbtheorem[number within=section]{exam}{Example}%
{colback=!5,colframe=blue!35!black,fonttitle=\bfseries}{ex}

\begin{document}
<>
\end{document}
]], {i(1)})),
}


-- FOR 
-- % figure support
-- \usepackage{import}
-- \usepackage{xifthen}
-- \pdfminorversion=7
-- \usepackage{pdfpages}
-- \usepackage{transparent}
-- \newcommand{\incfig}[1]{%
-- 	\def\svgwidth{\columnwidth}
-- 	\import{./figures/}{#1.pdf_tex}
-- }
--\pdfsuppresswarningpagegroup=1
