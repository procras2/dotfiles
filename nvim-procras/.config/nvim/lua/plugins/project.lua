return {
    "DrKJeff16/project.nvim",
    version = false, -- Get the latest release
    dependencies = { -- OPTIONAL
        -- "nvim-lua/plenary.nvim",
        -- "nvim-telescope/telescope.nvim",
        "ibhagwan/fzf-lua",
    },
    ---@module 'project'

    ---@type Project.Config.Options
    opts = {},
    cond = vim.fn.has("nvim-0.11") == 1, -- RECOMMENDED
}
