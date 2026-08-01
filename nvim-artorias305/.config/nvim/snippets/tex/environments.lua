local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

return {
	-- Item
	s({ trig = ";i", snippetType = "autosnippet" }, {
		t("\\item"),
	}),

	-- environment
	s(
		"beg",
		fmt(
			[[
        \begin{{{}}}
            {}
        \end{{{}}}
        ]],
			{
				i(1),
				i(0),
				rep(1),
			}
		)
	),
}
