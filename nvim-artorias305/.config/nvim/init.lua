-- Set map leader
vim.g.mapleader = " "

-- Options
require("config")
require("functions")
require("plugins")

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
