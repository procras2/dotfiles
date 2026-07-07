-- nvim-navic
require('nvim-navic').setup({})

vim.lsp.config("phpactor", {
    on_attach = function(client, bufnr)
        require("nvim-navic").attach(client, bufnr)
    end
})
--
-- vim.lsp.config("clangd", {
--     on_attach = function(client, bufnr)
--         require("nvim-navic").attach(client, bufnr)
--     end
-- })
