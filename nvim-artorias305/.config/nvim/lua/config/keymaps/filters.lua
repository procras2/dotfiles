--
-- Mapping using external programs
--

--
-- Filter mappings
--
-- Visual mode for several lines
-- Normal mode for whole file
--
vim.keymap.set(
	"v",
	"<leader>sce",
	":!column -s '=' -t -o '=' <CR>",
	{ desc = "[S]end lines to [C]olumn align [E]qual" }
)
vim.keymap.set("v", "<leader>scp", ":!column -s '|' -t -o '|' <CR>", { desc = "[S]end lines to [C]olumn align [P]ipe" })
vim.keymap.set({ "v", "n" }, "<leader>sf", ":!fmt --width=79 <CR>", { desc = "[S]end lines to [F]ormat (fmt)" })
vim.keymap.set({ "v", "n" }, "<leader>sd", ":!fold -w 79 <CR>", { desc = "[S]end lines to fol[D] (fold)" })
vim.keymap.set(
	"v",
	"<leader>st",
	":!tr -s ' ' | column -s '|' -t -o '|' <CR>",
	{ desc = "[S]end lines to [T]able format" }
)

vim.keymap.set("v", "<leader>ss", ":!sort <CR>", { desc = "[S]end lines to [S]ort" })
vim.keymap.set("v", "<leader>sbi", ":!boxes -d javadoc <CR>", { desc = "[S]end to [B]oxes [I]nsert box]" })
vim.keymap.set("v", "<leader>sbr", ":!boxes -d -r javadoc <CR>", { desc = "[S]end to [B]oxes [R]emove box" })

--
-- Send file or visual selection to external program and see output in command area
--
-- Visual mode for several lines
-- Normal mode for whole file
--
vim.keymap.set({ "n", "v" }, "<leader>swc", ":w !wc <CR>", { desc = "[S]end file or selection to [W]c, read result" })

--
-- Normal mode for single line
--
vim.keymap.set("n", "<leader>se", ":.!bash -e <CR>", { desc = "[S]end line to bash, [E]xecute and replace content" })

--
-- Send current word to external program and see output in command area
--
vim.keymap.set("n", "<leader>swd", ":!dict <C-R><C-W> <CR>", { desc = "[S]end [W]ord under cursor to [D]ict" })
vim.keymap.set("n", "<leader>swm", ":!man <C-R><C-W> <CR>", { desc = "[S]end [W]ord under cursor to [M]an" })
