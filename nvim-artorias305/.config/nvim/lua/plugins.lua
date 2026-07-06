-- Plugins to load
vim.pack.add({
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/brenoprata10/nvim-highlight-colors" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim"},
    { src = "https://github.com/mason-org/mason-lspconfig.nvim"}, -- automatically enable servers installed by mason
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim"}, -- automatically enable servers installed by mason
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    -- { src = "https://github.com/Kaiser-Yang/blink-cmp-dictionary"},
    { src = "https://github.com/archie-judd/blink-cmp-words"},
    { src = "https://github.com/saghen/blink.cmp", version = 'v1.8.0' },
    { src = "https://github.com/nvim-mini/mini.nvim" },
    -- {
    --     src = "https://github.com/nvim-treesitter/nvim-treesitter",
    --     branch = "main",
    --     build = ":TSUpdate"
    -- },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/SmiteshP/nvim-navic" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/akinsho/toggleterm.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/lervag/vimtex" },
    { src = "https://github.com/chentoast/marks.nvim" },
    { src = "https://github.com/folke/trouble.nvim" },
})

-- tokyonight.nvim
vim.cmd.colorscheme("tokyonight-night")

-- nvim-highlight-colors
require("nvim-highlight-colors").setup()

-- mason to install lsp etc.
require('mason').setup()
require('mason-lspconfig').setup()

require('mason-tool-installer').setup({
    ensure_installed = {
        "lua_ls",
        "stylua",
        "marksman",
        "texlab",
        "phpactor",
    }
})

-- LSP config stuff
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim", "require" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true),},
            telemetry = { enable = false },
        },
    },
})

-- Set up LuaSnip
require("luasnip").config.set_config({

    -- Enable autotriggered snippets
    enable_autosnippets = true,

    -- Use Tab (or some other key if you prefer) to trigger visual selection
    store_selection_keys = "<Tab>",

})

vim.cmd([[
" Expand or jump in insert mode
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'

" Jump forward through tabstops in visual mode
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Expand snippets in insert mode with Tab
"imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>'

" Jump forward in through tabstops in insert and visual mode with Control-f
"imap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'
"smap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'

" Jump backward through snippet tabstops with Shift-Tab (for example)
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

" Cycle forward through choice nodes with Control-f (for example)
imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
]])

-- Lazy-load snippets, i.e. only load when required, e.g. for a given filetype
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/LuaSnip/" } })

-- Blink CMP
require("blink.cmp").setup({
	signature = { enabled = true },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
	},
    sources = {
        default = { "lsp", "path", "buffer", "snippets" },
        providers = {

            -- Use the thesaurus source
            thesaurus = {
                name = "blink-cmp-words",
                module = "blink-cmp-words.thesaurus",
                -- All available options
                opts = {
                    -- A score offset applied to returned items. 
                    -- By default the highest score is 0 (item 1 has a score of -1, item 2 of -2 etc..).
                    score_offset = 0,

                    -- Default pointers define the lexical relations listed under each definition,
                    -- see Pointer Symbols below.
                    -- Default is as below ("antonyms", "similar to" and "also see").
                    definition_pointers = { "!", "&", "^" },

                    -- The pointers that are considered similar words when using the thesaurus,
                    -- see Pointer Symbols below.
                    -- Default is as below ("similar to", "also see" }
                    similarity_pointers = { "&", "^" },

                    -- The depth of similar words to recurse when collecting synonyms. 1 is similar words, 
                    -- 2 is similar words of similar words, etc. Increasing this may slow results. 
                    similarity_depth = 2,
                },
            },

            -- Use the dictionary source
            dictionary = {
                name = "blink-cmp-words",
                module = "blink-cmp-words.dictionary",
                -- All available options
                opts = {
                    -- The number of characters required to trigger completion. 
                    -- Set this higher if completion is slow, 3 is default.
                    dictionary_search_threshold = 3,

                    -- See above
                    score_offset = 0,

                    -- See above
                    definition_pointers = { "!", "&", "^" },
                },
            },
        },

        -- Setup completion by filetype
        per_filetype = {
            text = { "dictionary" },
            markdown = { "thesaurus" },
        },
    },
})
    -- sources = {
    --     default = { "dictionary", "lsp", "path", "buffer", "snippets" },
    --     providers = {
    --         dictionary = {
    --             module = 'blink-cmp-dictionary',
    --             name = 'Dict',
    --             min_keyword_length = 1,
    --             opts = {
    --                 dictionary_files = nil,
    --                 dictionary_directories = nil,
    --                 -- dictionary_files = { vim.fn.expand('~/.config/nvim/dictionary') }
    --                 -- Optional: explicitly force fallback mode
    --                 -- (By default, fallback is used when fzf is not found)
    --                 force_fallback = true
    --             }
    --         },
    --     }
    -- }
-- })

-- Mini
require("mini.icons").setup()
-- require("mini.notify").setup()
-- require("mini.indentscope").setup()
require("mini.pick").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
-- require("mini.statusline").setup()

-- Lualine
require('lualine').setup({
    options = { theme = 'auto' },
    winbar = {
        lualine_c = {
            'filename',
            {
                function()
                    return require("nvim-navic").get_location()
                end,
                cond = function()
                    return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
                end,
            },
        },
    },
    sections = {
        lualine_c = {
            'filename',
            'lsp_status',
        }
    }
})

-- which-key setup
require("which-key").setup()

-- vimtex setup
vim.g.vimtex_view_method = 'zathura'

-- marks.nvim
require("marks").setup()

-- nvim-navic
require('nvim-navic').setup()

vim.lsp.config("phpactor", {
    on_attach = function(client, bufnr)
        require("nvim-navic").attach(client, bufnr)
    end
})
--
-- vim.lsp.config("clangd", {
--     on_attach = function(client, bufnr)
--         require("nvim-navic").attach(client, bufnr)
--     end
-- })

-- Indent Blankline
require("ibl").setup()

-- Toggleterm
require("toggleterm").setup({
    open_mapping = [[<c-\>]],
    direction = "float",
    float_opts = {
        border = "curved"
    }
})

-- Oil
require("oil").setup({
    columns = {
        -- "permissions",
        -- "size",
        -- "mtime"
        "icon"
    },
    view_options = {
        show_hidden = true
    }
})

-- Gitsigns
require("gitsigns").setup({
    signs = {
        add = { text = "\u{2590}" },          -- ▏
        change = { text = "\u{2590}" },       -- ▐
        delete = { text = "\u{2590}" },       -- ◦
        topdelete = { text = "\u{25e6}" },    -- ◦
        changedelete = { text = "\u{25cf}" }, -- ●
        untracked = { text = "\u{25cb}" },    -- ○
    },
    signcolumn = true,
    current_line_blame = false,
})


-- Trouble
require("trouble").setup()
