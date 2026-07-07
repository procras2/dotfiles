-- mason to install lsp etc.
require("mason").setup()
require("mason-lspconfig").setup()

require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"marksman",
		"texlab",
		"phpactor",
		"stylua",
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
