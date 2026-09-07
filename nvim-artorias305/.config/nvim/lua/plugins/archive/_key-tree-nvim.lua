--
-- Key Tree
--
vim.pack.add({

	"https://github.com/punktigel/key-tree.nvim",
})

local keytree = require("key-tree")

vim.keymap.set("n", "<leader>tkt", function()
	keytree.toggle_win()
end)
