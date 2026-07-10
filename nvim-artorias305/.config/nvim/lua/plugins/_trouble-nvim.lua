--
-- Trouble
--
vim.pack.add({
    { src = "https://github.com/folke/trouble.nvim" },
})

require("trouble").setup()

vim.keymap.set("n", "<leader>q", ":Trouble diagnostics toggle<CR>", { desc = "[Q]... trouble diagnostics" })
