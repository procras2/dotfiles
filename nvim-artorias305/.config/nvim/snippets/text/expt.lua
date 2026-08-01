local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("text", {
	s("ri", {
		t({
			"Reaction to local anaesthetic including anaphylaxis - rare",
			"Bleeding may require re-intervention - rare",
			"Infection - 2%",
			"Damage to adjacent structures",
			"Ugly scars - 1%",
			"Recurrence - can occur",
		}),
	}),

	s("hello", {
		t('print("hello '),
		i(1),
		t(' world")'),
	}),

	s("if", {
		t("if "),
		i(1, "true"),
		t(" then "),
		i(2),
		t(" end"),
	}),
})
