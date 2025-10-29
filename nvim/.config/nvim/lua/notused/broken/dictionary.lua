return {
    "paysancorrezien/dictionary.nvim",
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("dictionary").setup({
            dictionary_paths = {
                "/home/adrian/.config/nvim/dict/medical.utf-8.spl",
                "/home/adrian/.config/nvim/dict/en.utf-8.add.spl",
            },
            override_zg = true,
            ltex_dictionary = true, -- if you are use ltex-ls extra and want to use zg to also update ltex-ls dictionary
            cmp = {
                enabled = true,
                custom_dict_path = local_ltex_ls,
                max_spell_suggestions = 10,
                filetypes = { "markdown", "tex" },
                priority = 20000,
                name = "mydictionary",
                source_label = "[Dict]",
                kind_icon = " ",
            },
        })
    end,
}
