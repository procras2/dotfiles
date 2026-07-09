require("nvim-navbuddy").setup({
	opts = {
		lsp = { auto_attach = true },
	},
})

vim.keymap.set("n", "<leader>-", ":Navbuddy<CR>", { desc = "<leader>[-] open Navbuddy" })
