-- Options
vim.g.mapleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

opt.signcolumn = "yes"
-- opt.colorcolumn = "100"
opt.showmatch = true
opt.cmdheight = 1
opt.showmode = false

opt.conceallevel = 0
opt.concealcursor = ""
opt.lazyredraw = true
opt.synmaxcol = 300

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true
opt.matchtime = 2

opt.winborder = "rounded"

opt.listchars = 'tab:» ,lead:•,trail:•'
opt.list = false

local undodir = vim.fn.expand("~/.vim/undodir")
if
    vim.fn.isdirectory(undodir) == 0
then
    vim.fn.mkdir(undodir, "p")
end

opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.undodir = undodir

opt.updatetime = 300
opt.timeoutlen = 500
opt.ttimeoutlen = 0
opt.autoread = true
opt.autowrite = false

opt.hidden = true
opt.errorbells = false
opt.backspace = "indent,eol,start"
opt.autochdir = false
opt.iskeyword:append("-")
opt.path:append("**")
opt.selection = "inclusive"
opt.mouse = "a"
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "utf-8"

vim.opt.guicursor =
"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99

opt.splitbelow = true
opt.splitright = true

opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.diffopt:append("linematch:60")
opt.redrawtime = 10000
opt.maxmempattern = 20000

-- Native vim 0.12 autocompletion
opt.autocomplete = true

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
        end
    end,
})

opt.complete:append('o')
opt.completeopt = "menuone,noinsert,noselect"
opt.pumheight = 10
opt.pumborder = "rounded"

-- Language servers array
local servers = { "clangd", "emmet_ls", "lua_ls", "phpactor", "ts_ls", "marksman", "texlab" }

for _, server in ipairs(servers) do
    vim.lsp.enable(server)
end

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup,
    callback = function()
        vim.hl.on_yank()
    end,
})

-- return to last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup,
    desc = "Restore last cursor position",
    callback = function()
        if vim.o.diff then -- except in diff mode
            return
        end

        local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
        local last_line = vim.api.nvim_buf_line_count(0)

        local row = last_pos[1]
        if row < 1 or row > last_line then
            return
        end

        pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
    end,
})

-- Nice mapping to move lines selections up and down with alt
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- wrap, linebreak and spellcheck on markdown and text files
vim.api.nvim_create_autocmd("FileType", {
    group = augroup,
    pattern = { "markdown", "text", "gitcommit", "tex" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.spell = true
        vim.opt_local.textwidth = 79
        vim.opt_local.spelllang = "en_gb,medical"
    end,
})

-- Plugins to load
vim.pack.add({
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/brenoprata10/nvim-highlight-colors" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-mini/mini.nvim" },
    -- {
    --     src = "https://github.com/nvim-treesitter/nvim-treesitter",
    --     branch = "main",
    --     build = ":TSUpdate"
    -- },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/folke/which-key.nvim" },
    -- { src = "https://github.com/SmiteshP/nvim-navic" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    -- { src = "https://github.com/saghen/blink.lib" },
    -- { src = "https://github.com/saghen/blink.cmp",                   version = 'v1.8.0' },
    { src = "https://github.com/akinsho/toggleterm.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/lervag/vimtex" },
    { src = "https://github.com/chentoast/marks.nvim" },
    { src = "https://github.com/folke/trouble.nvim" },
    -- { src = "https://github.com/L3MON4D3/LuaSnip" },
})

-- Set up LuaSnip
-- require("luasnip").config.set_config({
--
--     -- Enable autotriggered snippets
--     enable_autosnippets = true,
--
--     -- Use Tab (or some other key if you prefer) to trigger visual selection
--     store_selection_keys = "<Tab>",
--
--     vim.cmd([[
-- " Expand or jump in insert mode
-- imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
--
-- " Jump forward through tabstops in visual mode
-- smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
--
-- " Expand snippets in insert mode with Tab
-- "imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>'
--
-- " Jump forward in through tabstops in insert and visual mode with Control-f
-- "imap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'
-- "smap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'
--
-- " Jump backward through snippet tabstops with Shift-Tab (for example)
-- imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
-- smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
--
-- " Cycle forward through choice nodes with Control-f (for example)
-- imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
-- smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
--         ]]),
-- })
--
-- -- Lazy-load snippets, i.e. only load when required, e.g. for a given filetype
-- require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/LuaSnip/" } })
--
--
-- Treesitter
-- local setup_treesitter = function()
--     local treesitter = require("nvim-treesitter")
--     treesitter.setup({})
--     local ensure_installed = {
--         "vim",
--         "vimdoc",
--         "rust",
--         "c",
--         "cpp",
--         "go",
--         "html",
--         "css",
--         "javascript",
--         "json",
--         "lua",
--         "markdown",
--         "python",
--         "typescript",
--         "vue",
--         "svelte",
--         "bash",
--         "php",
--         "latex",
--     }
--
--     local config = require("nvim-treesitter.config")
--
--     local already_installed = config.get_installed()
--     local parsers_to_install = {}
--
--     for _, parser in ipairs(ensure_installed) do
--         if not vim.tbl_contains(already_installed, parser) then
--             table.insert(parsers_to_install, parser)
--         end
--     end
--
--     if #parsers_to_install > 0 then
--         treesitter.install(parsers_to_install)
--     end
--
--     local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
--     vim.api.nvim_create_autocmd("FileType", {
--         group = group,
--         callback = function(args)
--             if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
--                 vim.treesitter.start(args.buf)
--             end
--         end,
--     })
--
--     local highlight = { enable = true, disable = { "latex" } }
-- end
--
-- setup_treesitter()

-- which-key setup
require("which-key").setup()

-- vimtex setup
vim.g.vimtex_view_method = 'zathura'

-- marks.nvim
require('marks').setup()

-- nvim-navic
-- require('nvim-navic').setup()

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            telemetry = { enable = false },
        },
    },
})

-- vim.lsp.config("phpactor", {
--     on_attach = function(client, bufnr)
--         require("nvim-navic").attach(client, bufnr)
--     end
-- })
--
-- vim.lsp.config("clangd", {
--     on_attach = function(client, bufnr)
--         require("nvim-navic").attach(client, bufnr)
--     end
-- })

-- Lualine
require('lualine').setup({
    options = { theme = 'auto' },
    -- winbar = {
    --     lualine_c = {
    --         'filename',
    --         {
    --             function()
    --                 return require("nvim-navic").get_location()
    --             end,
    --             cond = function()
    --                 return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
    --             end,
    --         },
    --     },
    -- },
    sections = {
        lualine_c = {
            'filename',
            'lsp_status',
        }
    }
})

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

-- Mini
require("mini.icons").setup()
-- require("mini.notify").setup()
-- require("mini.indentscope").setup()
require("mini.pick").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
-- require("mini.statusline").setup()

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

-- Blink
-- require("blink.cmp").setup({
--     fuzzy = { implementation = "prefer_rust" },
--     completion = {
--         menu = {
--             draw = {
--                 components = {
--                     -- customize the drawing of kind icons
--                     kind_icon = {
--                         text = function(ctx)
--                             -- default kind icon
--                             local icon = ctx.kind_icon
--                             -- if LSP source, check for color derived from documentation
--                             if ctx.item.source_name == "LSP" then
--                                 local color_item = require("nvim-highlight-colors").format(ctx.item.documentation,
--                                     { kind = ctx.kind })
--                                 if color_item and color_item.abbr ~= "" then
--                                     icon = color_item.abbr
--                                 end
--                             end
--                             return icon .. ctx.icon_gap
--                         end,
--                         highlight = function(ctx)
--                             -- default highlight group
--                             local highlight = "BlinkCmpKind" .. ctx.kind
--                             -- if LSP source, check for color derived from documentation
--                             if ctx.item.source_name == "LSP" then
--                                 local color_item = require("nvim-highlight-colors").format(ctx.item.documentation,
--                                     { kind = ctx.kind })
--                                 if color_item and color_item.abbr_hl_group then
--                                     highlight = color_item.abbr_hl_group
--                                 end
--                             end
--                             return highlight
--                         end,
--                     },
--                 },
--             },
--         },
--     },
-- })

-- nvim-highlight-colors
require("nvim-highlight-colors").setup()

-- Trouble
require("trouble").setup()

-- function to show lsp progress, works with Ghostty terminal
vim.api.nvim_create_autocmd("LspProgress", {
  callback = function(ev)
    -- vim.print(ev.data)
    local value = ev.data.params.value or {}

    vim.api.nvim_echo({ { value.message or "done" } }, false, {
      id = "lsp." .. ev.data.client_id,
      kind = "progress",
      source = "vim.lsp",
      title = value.title,
      status = value.kind ~= "end" and "running" or "success",
      percent = value.percentage,
    })
  end,
})

-- Function to delete unused plugins
local function pack_clean()
    local active_plugins = {}
    local unused_plugins = {}

    for _, plugin in ipairs(vim.pack.get()) do
        active_plugins[plugin.spec.name] = plugin.active
    end

    for _, plugin in ipairs(vim.pack.get()) do
        if not active_plugins[plugin.spec.name] then
            table.insert(unused_plugins, plugin.spec.name)
        end
    end

    if #unused_plugins == 0 then
        print("No unused plugins.")
        return
    end

    local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
    if choice == 1 then
        vim.pack.del(unused_plugins)
    end
end

-- Colorscheme
vim.cmd.colorscheme("tokyonight-night")

-- Keymaps
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "[L]sp [F]ormat buffer (if available)" })
vim.keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "[E]xplorer, open Oil" })
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>g", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>")
vim.keymap.set("n", "<leader>pc", pack_clean)
vim.keymap.set("n", "<leader>q", ":Trouble diagnostics toggle<CR>", { desc = "[Q]... trouble diagnostics" })
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"+d<CR>')
