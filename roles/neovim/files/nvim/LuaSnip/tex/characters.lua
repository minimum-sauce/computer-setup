local ls = require("luasnip")
local s = ls.snippet

ls.config.setup({
  enable_autosnippets = true,
  update_events = 'TextChanged,TextChangedI'
})

return {
-- Examples of Greek letter snippets, autotriggered for efficiency
s({trig=";a", snippetType="autosnippet"},
  {t("\\alpha"),}
),
s({trig=";b", snippetType="autosnippet"},
  {t("\\beta"),}
),
s({trig=";e", snippetType="autosnippet"},
  {t("\\epsilon"),}
),
s({trig=";E", snippetType="autosnippet"},
  {t("\\Epsilon"),}
),
s({trig=";g", snippetType="autosnippet"},
  {t("\\gamma"),}
),
s({trig=";G", snippetType="autosnippet"},
  {t("\\Gamma"),}
),
s({trig=";p", snippetType="autosnippet"},
  {t("\\phi"),}
),
s({trig=";P", snippetType="autosnippet"},
  {t("\\Phi"),}
),
s({trig=";s", snippetType="autosnippet"},
  {t("\\sigma"),}
),
s({trig=";S", snippetType="autosnippet"},
  {t("\\Sigma"),}
),
s({trig=";o", snippetType="autosnippet"},
  {t("\\omega"),}
),
s({trig=";O", snippetType="autosnippet"},
  {t("\\Omega"),}
),
s({trig=";;d", snippetType="autosnippet"},
  {t("\\cdot"),}
),
s({trig=";;p", snippetType="autosnippet"},
  {t("\\partial"),}
),
s({trig=";r", snippetType="autosnippet"},
  {t("\\mathbb{R}"),}
),
s({trig=";n", snippetType="autosnippet"},
  {t("\\mathbb{R}^n"),}
),

}
