return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "bash",
                "bibtex",
                "c",
                "csv",
                "editorconfig",
                "elixir",
                "git_config",
                "gitcommit",
                "gitignore",
                "heex",
                "html",
                "javascript",
                "json",
                "latex",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "php",
                "query",
                "sql",
                "tsv",
                "vim",
                "vimdoc",
                "zathurarc",
            },
            auto_install = true,
            sync_install = false,
            highlight = { enable = true, disable = { "latex" } },
            indent = { enable = true },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<Enter>", -- set to `false` to disable on of the mappings
                    node_incremental = "<Enter>",
                    scope_incremental = false,
                    node_decremental = "<Backspace>",
                },
            },
        })
    end,
}
