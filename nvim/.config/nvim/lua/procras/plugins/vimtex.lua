return {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    config = function()
        vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
        vim.g.vimtex_quickfix_methos = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
    end,
    keys = {
        { "<localLeader>l", "", desc = "+vimtex", ft = "tex" },
    },
    init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "zathura"
    end,
}
