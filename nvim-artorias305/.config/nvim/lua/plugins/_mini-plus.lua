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

-- Here we define a keymap to select all the items in the Picker and send them to quickfix
-- Or
-- You can select the ones you want and the press <M-cr>
local choose_all = function()
	local mappings = MiniPick.get_picker_opts().mappings
	vim.api.nvim_input(mappings.mark_all .. mappings.choose_marked)
end
require("mini.pick").setup({
	mappings = {
		choose_all = { char = "<C-q>", func = choose_all },
	},
})
