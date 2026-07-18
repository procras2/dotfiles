--
-- Nice mapping to move lines selections up and down with alt
--
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

--
-- Clipboard keymaps
--
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"+d<CR>')

--
-- Tab switching
--
vim.keymap.set("n", "<leader>>", ":bnext<CR>", { desc = "[>] Next buffer" })
vim.keymap.set("n", "<leader><", ":bprevious<CR>", { desc = "[<] Previous buffer" })
vim.keymap.set("n", "<leader><Tab>", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

require("config.keymaps.filters")
