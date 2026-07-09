-- mason to install lsp etc.
require("mason").setup()
require("mason-lspconfig").setup()

require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"marksman",
		"texlab",
		"phpactor",
		-- "stylua",
		"prettierd",
		"phpcbf",
	},
})

-- LSP config stuff
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim", "require" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
})

-- LSP keymaps (not already set)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "[L]sp [F]ormat buffer (vim.lsp.buf.format)" })
vim.keymap.set(
	"n",
	"gd",
	vim.lsp.buf.definition,
	{ desc = "[G]o [D]efinition - Go to Definition (vim.lsp.buf.defintion)" }
)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[N]ame - Rename symbol (vim.lsp.buf.rename)" })
