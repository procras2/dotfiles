vim.pack.add({
	{ src = "https://github.com/arnamak/stay-centered.nvim" },
})

require("stay-centered").setup({})

vim.keymap.set({ "n", "v" }, "<leader>st", require("stay-centered").toggle, { desc = "Toggle stay-centered.nvim" })
