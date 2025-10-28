return {
    "praem90/nvim-phpcsf",
    opts = {},
    config = function()
        require("phpcs").setup({
            phpcs = "phpcs",
            phpcbf = "phpcbf",
            standard = "PSR12",
        })
    end,
    keys = {
        {
            "<leader>rs",
            function()
                require("phpcs").cs()
            end,
            desc = "[R]un PHPCS [S]niffer",
        },
        {
            "<leader>rb",
            function()
                require("phpcs").cbf()
            end,
            desc = "[R]un PHPCS [B]eautifier",
        },
    },
}
