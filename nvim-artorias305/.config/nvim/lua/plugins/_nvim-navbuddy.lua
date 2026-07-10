--
-- Nvim navbuddy
--
vim.pack.add({
    { src = "https://github.com/MunifTanjim/nui.nvim" },        -- Required by nvim-navbuddy
    { src = "https://github.com/hasansujon786/nvim-navbuddy" }, -- fork from SmitheshP
})

require("nvim-navbuddy").setup({
    opts = {
        lsp = { auto_attach = true },
    },
})

vim.keymap.set("n", "<leader>-", ":Navbuddy<CR>", { desc = "<leader>[-] open Navbuddy" })
