--
-- Luasnip
--
vim.pack.add({
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
})

-- Set up LuaSnip
require("luasnip").config.set_config({

	-- Enable autotriggered snippets
	enable_autosnippets = true,

	-- Use Tab (or some other key if you prefer) to trigger visual selection
	store_selection_keys = "<Tab>",
})

local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<Tab>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-n>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

-- Lazy-load snippets, i.e. only load when required, e.g. for a given filetype
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/snippets/" } })
