return {
    "praem90/nvim-phpcsf",
    config = function()
        vim.api.nvim_create_augroup("PHPCSGroup", { clear = true })

        vim.g.nvim_phpcs_config_phpcs_path = "/usr/bin/phpcs"
        vim.g.nvim_phpcs_config_phpcbf_path = "/usr/bin/phpcbf"
        vim.g.nvim_phpcs_config_phpcbf_standard = "PSR12"

        -- Setup autoformatting for php files using phpcs
        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
            group = "PHPCSGroup",
            pattern = "*.php",
            command = "lua require'phpcs'.cs()",
        })
        vim.api.nvim_create_autocmd("BufWritePost", {
            group = "PHPCSGroup",
            pattern = "*.php",
            command = "lua require'phpcs'.cbf()",
        })

        vim.keymap.set("n", "<leader>lp", function()
            require("phpcs").cbf()
        end, {
            silent = true,
            noremap = true,
            desc = "PHP Beautify",
        })

        vim.keymap.set("n", "<leader>lc", function()
            require("phpcs").cs()
        end, {
            silent = true,
            noremap = true,
            desc = "PHP CS",
        })

        -- require("phpcs").setup({
        --     phpcs = "phpcs",
        --     phpcbf = "phpcbf",
        --     standard = "PSR12",
        -- })
    end,
    -- keys = {
    --     {
    --         "<leader>ps",
    --         function()
    --             require("phpcs").cs()
    --         end,
    --         desc = "[P]HPCS [S]niffer",
    --     },
    --     {
    --         "<leader>pb",
    --         function()
    --             require("phpcs").cbf()
    --         end,
    --         desc = "[P]HPCS [B]eautifier",
    --     },
    -- },
}
