--
-- Vimtex setup
--
vim.pack.add({
	{ src = "https://github.com/lervag/vimtex" },
})

vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_forward_search_on_start = false

-- We need to disable treesitter for (la)tex files
