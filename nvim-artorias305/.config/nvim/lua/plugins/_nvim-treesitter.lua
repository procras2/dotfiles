--
-- Treesitter
--
vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
})

require("nvim-treesitter.config").setup {
	highlight = {
		enable = true,
		disable = { "latex" },
	},
	indent = {
		enable = true,
		disable = { "latex" },
	},
}

-- OLD FOLDING NOTES:
-- vim.opt.foldmethod			= 'expr'
-- vim.opt.foldexpr				= 'nvim_treesitter#foldexpr()'
---WORKAROUND
-- vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
-- 	group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
-- 	callback = function()
-- 		vim.opt.foldmethod = 'expr'
-- 		vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- 		vim.opt.foldcolumn = "1" -- DEFINES 1 COL AT WINDW LEFT TO INDICATE FOLDING
-- 		vim.opt.foldlevelstart = 99 -- START FILE WITH ALL FOLDS OPENED

-- -- let javaScript_fold=1 "activate folding by JS syntax
-- -- " let cs_fold=
-- -- " let xml_syntax_folding=1
-- -- let xml_folding=1
-- -- let yaml_fold=1
-- -- let vb_fold=1
-- 	end

-- })
--ENDWORKAROUND

-- :verbose set indentexpr?
-- Guy on the internets output: indentexpr=nvim_treesitter#indent()
-- My output: indentexpr=
-- :checkhealth nvim-treesitter
-- Stock Standard:
-- indentexpr=GetCSIndent(v:lnum)
-- Last set from /usr/share/nvim/runtime/indent/cs.vim line 19

-- TEMP INDENT SETTINGS TO TEST THINGS
-- vim.opt.autoindent = false
-- vim.opt.smartindent = false
-- vim.opt.expandtab = false
-- vim.opt.tabstop = 2
-- vim.opt.shiftwidth = 2
-- SEE: ftplugin/cs.lua for more lang specifics

-- vim.cmd[[filetype plugin on]]
-- vim.cmd[[filetype indent off]]
-- vim.cmd[[set indentexpr=nvim_treesitter#indent()]]

-- PARSERS TO INSTALL
local parsers = {
	"bash",
	"c",
	"c_sharp",
	"cmake",
	"cpp",
	"css",
	"diff",
	"dockerfile",
	"editorconfig",
	"git_config",
	"go",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	-- "norg", -- neorg bundles its own parser; not in the standard treesitter registry
	"powershell",
	"python",
	"query",
	"razor",
	"regex",
	"scss",
	"sql",
	"tsx",
	"typescript",
	"vim",
	"yaml",
}

require("nvim-treesitter").install(parsers)

-- ENABLE HIGHLIGHTING AND INDENTATION VIA AUTOCMD
-- vim.api.nvim_create_autocmd("FileType", {
-- 	group = vim.api.nvim_create_augroup("nvim_treesitter_start", { clear = true }),
-- 	callback = function(args)
-- 		if vim.treesitter.get_parser(args.buf, nil, { error = false }) then
-- 			vim.treesitter.start(args.buf)
-- 			vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
-- 		end
-- 	end,
-- })
