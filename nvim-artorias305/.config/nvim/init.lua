-- Options
vim.g.mapleader = " "

local opt = vim.opt

opt.termguicolors = true
opt.showmatch = true
opt.matchtime = 2

opt.number = true
opt.relativenumber = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.wrap = false

opt.signcolumn = "yes"
opt.winborder = "rounded"

opt.listchars = 'tab:» ,lead:•,trail:•'
opt.list = true

opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.autoindent = true

opt.cursorline = true
opt.scrolloff = 8
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
opt.undofile = true

-- Language servers array
local servers = { "clangd", "emmet_ls", "lua_ls", "phpactor", "ts_ls", "marksman", "texlab" }

for _, server in ipairs(servers) do
    vim.lsp.enable(server)
end

-- Plugins to load

vim.pack.add({
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/brenoprata10/nvim-highlight-colors" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-mini/mini.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/saghen/blink.lib" },
    { src = "https://github.com/saghen/blink.cmp" },
    { src = "https://github.com/akinsho/toggleterm.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/lervag/vimtex" },
    { src = "https://github.com/folke/trouble.nvim" },
})


-- Setup plugins
vim.g.vimtex_view_method = 'zathura'

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
require("mini.pick").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.statusline").setup()

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
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '-' },
        changedelete = { text = '~' },
    }
})

-- Blink
require("blink.cmp").setup({
    fuzzy = { implementation = "prefer_rust" },
    completion = {
        menu = {
            draw = {
                components = {
                    -- customize the drawing of kind icons
                    kind_icon = {
                        text = function(ctx)
                            -- default kind icon
                            local icon = ctx.kind_icon
                            -- if LSP source, check for color derived from documentation
                            if ctx.item.source_name == "LSP" then
                                local color_item = require("nvim-highlight-colors").format(ctx.item.documentation,
                                    { kind = ctx.kind })
                                if color_item and color_item.abbr ~= "" then
                                    icon = color_item.abbr
                                end
                            end
                            return icon .. ctx.icon_gap
                        end,
                        highlight = function(ctx)
                            -- default highlight group
                            local highlight = "BlinkCmpKind" .. ctx.kind
                            -- if LSP source, check for color derived from documentation
                            if ctx.item.source_name == "LSP" then
                                local color_item = require("nvim-highlight-colors").format(ctx.item.documentation,
                                    { kind = ctx.kind })
                                if color_item and color_item.abbr_hl_group then
                                    highlight = color_item.abbr_hl_group
                                end
                            end
                            return highlight
                        end,
                    },
                },
            },
        },
    },
})

-- nvim-highlight-colors
require("nvim-highlight-colors").setup()

-- Trouble
require("trouble").setup()

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
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>e", ":Oil<CR>")
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>g", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>")
vim.keymap.set("n", "<leader>pc", pack_clean)
vim.keymap.set("n", "<leader>q", ":Trouble diagnostics toggle<CR>")
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"+d<CR>')
