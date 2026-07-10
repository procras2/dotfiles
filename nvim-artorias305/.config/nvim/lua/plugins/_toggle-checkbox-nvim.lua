--
-- Toggle Checkbox
--
vim.pack.add({
    { src = "https://github.com/opdavies/toggle-checkbox.nvim" },
})

-- Just set a keymap
vim.keymap.set('n', "<leader>tt", ":lua require('toggle-checkbox').toggle()<CR>")
