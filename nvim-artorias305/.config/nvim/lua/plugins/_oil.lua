-- Oil
require("oil").setup({
	columns = {
		-- "permissions",
		-- "size",
		-- "mtime"
		"icon",
	},
	view_options = {
		show_hidden = true,
	},
})

vim.keymap.set("n", "-", ":Oil<CR>", { desc = "[-] open Oil" })
