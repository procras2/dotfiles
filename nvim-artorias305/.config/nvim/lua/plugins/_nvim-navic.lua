--
-- Nvim-navic
--
vim.pack.add({
    { src = "https://github.com/SmiteshP/nvim-navic" },
})

require("nvim-navic").setup({})

vim.o.winbar = "%n %t %m %{%v:lua.require'nvim-navic'.get_location()%}"
