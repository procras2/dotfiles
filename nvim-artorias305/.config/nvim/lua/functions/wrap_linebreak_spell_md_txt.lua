--
-- wrap, linebreak and spellcheck on markdown and text files
--
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "markdown", "text", "gitcommit", "tex" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
		vim.opt_local.textwidth = 79
		vim.opt_local.spelllang = "en_gb,medical"
	end,
})
