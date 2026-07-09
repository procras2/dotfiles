--
-- function to show lsp progress, works with Ghostty terminal
--
vim.api.nvim_create_autocmd("LspProgress", {
	callback = function(ev)
		-- vim.print(ev.data)
		local value = ev.data.params.value or {}

		vim.api.nvim_echo({ { value.message or "done" } }, false, {
			id = "lsp." .. ev.data.client_id,
			kind = "progress",
			source = "vim.lsp",
			title = value.title,
			status = value.kind ~= "end" and "running" or "success",
			percent = value.percentage,
		})
	end,
})
