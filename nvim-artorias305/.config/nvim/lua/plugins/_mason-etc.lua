--
-- Mason set up for LSP
--
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" }, -- automatically enable servers installed by mason
	-- { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" }, -- automatically enable servers installed by mason
})

-- mason to install lsp etc.
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"bashls",
		"clangd",
		"emmet_ls",
		"eslint",
		"lua_ls",
		"marksman",
		"phpactor",
		"stylua",
		"texlab",
		"ltex",
		"ts_ls",
		"efm",
	},
})

-- Mason will not install these as they are not language servers
-- "eslint_d", "phpcbf", "prettierd",
-- -- If you wish to get mason to install all the things above you need this
-- -- Otherwise install them manually with :MasonInstall
-- require("mason-tool-installer").setup({
-- })

--
-- On attach
--
local on_attach = function(client, bufnr)
	require("nvim-navic").attach(client, bufnr)
	require("nvim-navbuddy").attach(client, bufnr)
end

--
-- Extra config for language servers
--
vim.lsp.config("emmet_ls", {
	on_attach = on_attach,
	filetypes = { "htmldjango", "djangohtml", "html" },
})

vim.lsp.config("eslint", { on_attach = on_attach })

vim.lsp.config("lua_ls", {
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim", "require" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
})

vim.lsp.config("marksman", { on_attach = on_attach })

vim.lsp.config("phpactor", { on_attach = on_attach })

vim.lsp.config("stylua", {})

vim.lsp.config("texlab", { on_attach = on_attach })
vim.lsp.config("ltex", { on_attach = on_attach })

vim.lsp.config("ts_ls", { on_attach = on_attach })

-- vim.lsp.config("ts_ls", {
-- 	cmd = { "/usr/sbin/typescript-language-server", "--stdio" },
-- 	filetypes = { "javascript", "typescript" },
-- 	root_dir = nvim_lsp.util.root_pattern("package.json", ".git"),
-- })

--
-- Linting and formatting with efm, ensure efm is installed with Mason
--
-- Also install all the linters and formatters you need
--

vim.pack.add({
	{ src = "https://github.com/creativenull/efmls-configs-nvim" },
})
-- require("efmls-configs-nvim").setup()

-- Register linters and formatters per language
-- local eslint = require('efmls-configs.linters.eslint')
-- local prettier = require('efmls-configs.formatters.prettier')
-- local stylua = require('efmls-configs.formatters.stylua')
-- local languages = {
--   typescript = { eslint, prettier },
--   lua = { stylua },
-- }
--
-- Or use the defaults provided by this plugin
-- check doc/SUPPORTED_LIST.md for the supported languages
--
-- local languages = require('efmls-configs.defaults').languages()
local languages = require("efmls-configs.defaults").languages()

languages = vim.tbl_extend("force", languages, {
	-- you custom languages, or overrides
	-- javascript = {
	-- 	require("efmls-configs.formatters.prettier"),
	-- },
	markdown = {
		require("efmls-configs.formatters.prettier"),
		require("efmls-configs.linters.markdownlint"),
	},
	-- php = {
	-- 	require("efmls-configs.formatters.phpcbf"),
	-- },
})

local efmls_config = {
	filetypes = vim.tbl_keys(languages),
	settings = {
		rootMarkers = { ".git/" },
		languages = languages,
	},
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
	},
}

-- If using nvim >= 0.11 then use the following
vim.lsp.config(
	"efm",
	vim.tbl_extend("force", efmls_config, {
		cmd = { "efm-langserver" },

		-- Pass your custom lsp config below like on_attach and capabilities
		--
		-- on_attach = on_attach,
		-- capabilities = capabilities,
	})
)

---
--- Automatically do format on save
---
vim.pack.add({
	{ src = "https://github.com/lukas-reineke/lsp-format.nvim" },
})

require("lsp-format").setup({})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		require("lsp-format").on_attach(client, args.buf)
	end,
})

--
-- To be sure enable your LSP, I think this is not needed as Mason does it
--
local enable = vim.lsp.enable

enable("bashls", true)
enable("clangd", true)
enable("emmet_ls", true)
enable("eslint", true)
enable("lua_ls", true)
enable("marksman", true)
enable("phpactor", true)
enable("stylua", true)
enable("texlab", true)
-- enable("ts_ls", true)
enable("efm", true)

--
-- LSP keymaps (not already set)
--
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "[L]sp [F]ormat buffer (vim.lsp.buf.format)" })
vim.keymap.set(
	"n",
	"gd",
	vim.lsp.buf.definition,
	{ desc = "[G]o [D]efinition - Go to Definition (vim.lsp.buf.defintion)" }
)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[N]ame - Rename symbol (vim.lsp.buf.rename)" })
