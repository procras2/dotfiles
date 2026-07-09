-- Trouble
require("trouble").setup()

vim.keymap.set("n", "<leader>q", ":Trouble diagnostics toggle<CR>", { desc = "[Q]... trouble diagnostics" })
