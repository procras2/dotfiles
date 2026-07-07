return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "clangd",
            "ts_ls",
            "html",
            "cssls",
            "lua_ls",
            "marksman",
            "phpactor",
            "emmet_ls",
            "eslint",
            "ltex",
            "texlab",
        },
    },
    dependencies = {
        {
            "williamboman/mason.nvim",
            opts = {
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            },
        },
        "neovim/nvim-lspconfig",
    },
}
