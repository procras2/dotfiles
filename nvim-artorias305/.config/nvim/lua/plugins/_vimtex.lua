--
-- Vimtex setup
--
vim.pack.add({
    { src = "https://github.com/lervag/vimtex" },
})

vim.g.vimtex_view_method = 'zathura'

-- We need to disable treesitter for (la)tex files
