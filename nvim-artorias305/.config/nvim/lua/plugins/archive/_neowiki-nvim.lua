vim.pack.add({
	{ src = "https://github.com/echaya/neowiki.nvim" },
})

require("neowiki").setup({
	wiki_dirs = {
		-- neowiki.nvim supports both absolute and tilde-expanded paths
		{ name = "Kabir", path = "~/kabir/wiki" },
		{ name = "Procras", path = "~/procras/wiki" },
	},
})

vim.keymap.set("n", "<leader>ww", "<cmd>lua require('neowiki').open_wiki()<cr>", { desc = "Open Wiki" })
vim.keymap.set(
	"n",
	"<leader>wW",
	"<cmd>lua require('neowiki').open_wiki_floating()<cr>",
	{ desc = "Open Wiki in Floating Window" }
)
vim.keymap.set("n", "<leader>wT", "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>", { desc = "Open Wiki in Tab" })
