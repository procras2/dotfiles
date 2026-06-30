-- Options
vim.g.mapleader = " "

require('options')
require('functions')
require('plugins')
require('keymaps')

-- Native vim 0.12 autocompletion
-- We don't need this is we use blink
-- opt.autocomplete = true

-- mason autoconfig does this but does not do autotrigger
-- We don't need this is we use blink
-- vim.api.nvim_create_autocmd('LspAttach', {
--     callback = function(ev)
--         local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
--         if client:supports_method('textDocument/completion') then
--             vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
--         end
--     end,
-- })

-- opt.complete:append('o')
-- opt.completeopt = "menuone,noinsert,noselect"

-- Language servers array
-- Don't need this with mason-lspconfig.nvim which autmatically enables servers installed by mason
-- local servers = { "clangd", "emmet_ls", "lua_ls", "phpactor", "ts_ls", "marksman", "texlab" }
--
-- for _, server in ipairs(servers) do
--     vim.lsp.enable(server)
-- end
--
--
--
-- Treesitter
-- local setup_treesitter = function()
--     local treesitter = require("nvim-treesitter")
--     treesitter.setup({})
--     local ensure_installed = {
--         "vim",
--         "vimdoc",
--         "rust",
--         "c",
--         "cpp",
--         "go",
--         "html",
--         "css",
--         "javascript",
--         "json",
--         "lua",
--         "markdown",
--         "python",
--         "typescript",
--         "vue",
--         "svelte",
--         "bash",
--         "php",
--         "latex",
--     }
--
--     local config = require("nvim-treesitter.config")
--
--     local already_installed = config.get_installed()
--     local parsers_to_install = {}
--
--     for _, parser in ipairs(ensure_installed) do
--         if not vim.tbl_contains(already_installed, parser) then
--             table.insert(parsers_to_install, parser)
--         end
--     end
--
--     if #parsers_to_install > 0 then
--         treesitter.install(parsers_to_install)
--     end
--
--     local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
--     vim.api.nvim_create_autocmd("FileType", {
--         group = group,
--         callback = function(args)
--             if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
--                 vim.treesitter.start(args.buf)
--             end
--         end,
--     })
--
--     local highlight = { enable = true, disable = { "latex" } }
-- end
--
-- setup_treesitter()

