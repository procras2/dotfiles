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
            "<leader>ps",
            function()
                require("phpcs").cs()
            end,
            desc = "[P]HPCS [S]niffer",
        },
        {
            "<leader>pb",
            function()
                require("phpcs").cbf()
            end,
            desc = "[P]HPCS [B]eautifier",
        },
    },
}
