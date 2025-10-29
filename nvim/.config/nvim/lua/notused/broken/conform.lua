return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            python = { "isort", "black" },
            -- You can customize some of the format options for the filetype (:help conform.format)
            rust = { "rustfmt", lsp_format = "fallback" },
            -- Conform will run the first available formatter
            javascript = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            -- php = { "pint", lsp_format = "fallback" },
            php = { "php-cs-fixer", lsp_format = "fallback" },
        },
        formatter = {
            ["php-cs-fixer"] = {
                command = "php-cs-fixer-3.88.0",
                args = {
                    "fix",
                    "--rules=@PSR12",
                    "$FILENAME",
                },
                stdin = false,
            },
        },
        notify_on_error = true,
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
