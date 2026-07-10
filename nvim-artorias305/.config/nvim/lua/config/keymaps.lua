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
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader><Tab>", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

--
-- Experimental mappings
--

--
-- Filter mappings
-- Visual mode for several line
--
vim.keymap.set("v", "<leader>sc", ":!column -s= -t -o= <CR>", { desc = "[S]end lines to [C]olumn = align" })
vim.keymap.set("v", "<leader>ss", ":!sort <CR>", { desc = "[S]end lines to [S]ort" })
vim.keymap.set("v", "<leader>sb", ":!boxes -d javadoc <CR>", { desc = "[S]end lines to [B]oxes" })
vim.keymap.set("v", "<leader>sr", ":!boxes -d -r javadoc <CR>", { desc = "[S]end lines to boxes to [R]emove box" })
-- vim.keymap.set("v", "<leader>sc", ":!wc -l <CR> ", { desc = "[S]end to [W]c to count lines" })
--
-- Normal mode for single line
--
vim.keymap.set("n", "<leader>lb", ":!bash -e <CR> ", { desc = "Filter [L]ine through [B]ash" })

--
-- Send current word to external program
--
vim.keymap.set("n", "<leader>wd", ":!dict <C-R><C-W> <CR>", { desc = "[W]ord under cursor to [D]ict" })
vim.keymap.set("n", "<leader>wm", ":!man <C-R><C-W> <CR>", { desc = "[W]ord under cursor to [M]an" })
