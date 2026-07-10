-- nvim-navic
require("nvim-navic").setup({})

vim.o.winbar = "%n %t %m %{%v:lua.require'nvim-navic'.get_location()%}"
--
-- vim.lsp.config("clangd", {
--     on_attach = function(client, bufnr)
--         require("nvim-navic").attach(client, bufnr)
--     end
-- })
