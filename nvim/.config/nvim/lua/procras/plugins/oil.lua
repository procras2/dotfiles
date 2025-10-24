return {
    "stevearc/oil.nvim",
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    lazy = false,
    config = function()
        require("oil").setup {
            default_file_explorer = true,
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
                natural_order = true,
                is_always_hidden = function(name, _)
                    return name == '..' or name == '.git'
                end,
            },
            win_options = {
                wrap = true,
            }
        }

        -- Open parent directory in current window
        vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open Parent Directory in Oil" })

        -- Open parent directory in floating window
        vim.keymap.set("n", "<space>-", require("oil").toggle_float, { desc = "Open floating in Oil" })
    end,
}
