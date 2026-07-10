-- Lualine
vim.pack.add({
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

local winbar = {
    '%m%4n:%t',
}

require('lualine').setup({
    sections = {
        lualine_c = {
            'filename',
            'lsp_status',
        }
    },
    winbar = {
        lualine_c = {
            {
                function()
                    return require("nvim-navic").get_location()
                end,
                cond = function()
                    return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
                end,
            },
        },
        lualine_z = winbar
    },
    inactive_winbar = {
        lualine_z = winbar
    },
    options = {
        theme = 'auto'
    }
})
