-- codeberg.org/anabasis/telescope-mythes.nvim
return {
    "nvim-telescope/telescope.nvim",

    opts = {
        extensions = {
            mythes = {
                -- choose from "ivy", "dropdown", "cursor"
                theme = "cursor",

                -- defaults to using /usr/share/mythes/th_en_US_v2.{dat,idx}
                default_thesaurus = {
                    dat_path = "/usr/share/mythes/th_es_v2.dat",
                    idx_path = "/usr/share/mythes/th_es_v2.idx",
                },
            },
        },
    },

    -- key bindings to open telescope-mythes
    keys = {
        {
            "<leader>st",
            "<cmd>Telescope mythes<cr>",
            desc = "open Telescope mythes",
        },
    },

    -- necessary dependencies (including telescope-mythes!)
    dependencies = {
        "nvim-lua/plenary.nvim",

        {
            "https://codeberg.org/anabasis/telescope-mythes.nvim",
            build = "make", -- needed!
        },
    },

    -- default config to setup plugin
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)

        telescope.load_extension("mythes")
    end,
}
