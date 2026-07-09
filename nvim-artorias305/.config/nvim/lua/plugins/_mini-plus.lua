-- Mini
require("mini.icons").setup()
-- require("mini.notify").setup()
-- require("mini.indentscope").setup()
require("mini.pick").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
-- require("mini.statusline").setup()

vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>g", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>")
