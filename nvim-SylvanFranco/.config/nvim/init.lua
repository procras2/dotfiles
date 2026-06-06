-- Options
vim.o.winborder = "rounded"
vim.o.tabstop = 4
vim.o.cursorcolumn = false
vim.o.ignorecase = true
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.incsearch = true
vim.o.signcolumn = "yes"
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- Keybinds
-- We will put binds from packs and language servers where they are set up
vim.g.mapleader = " "

local map = vim.keymap.set
map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')
map({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>')
map({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>')

-- Pack
vim.pack.add({
    { src = "https://github.com/vague2k/vague.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/olrtg/nvim-emmet" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/hrsh7th/nvim-cmp" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/saghen/blink.cmp.git" },
})

-- Lualine
require "lualine".setup()

-- Oil
require "oil".setup()
map('n', '<leader>e', ":Oil<CR>")

map('t', '', "")
map('t', '', "")

-- Mason
require "mason".setup()

-- Fzf-lua
require "fzf-lua".setup()

map("n", "<leader>ff",
function() require("fzf-lua").files() end,
{ silent = true, desc = "[F]ind [F]iles in project directory"})

map("n", "<leader>fg",
function() require("fzf-lua").live_grep() end,
{ silent = true, desc = "[F]ind [G]repping in project directory"})

map("n", "<leader>fc",
function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end,
{ silent = true, desc = "[F]ind in neovim [C]onfiguration"})

map("n", "<leader>fh",
function() require("fzf-lua").helptags() end,
{ silent = true, desc = "[F]ind [H]elp"})

map("n", "<leader>fk",
function() require("fzf-lua").keymaps() end,
{ silent = true, desc = "[F]ind [K]eymaps"})

map("n", "<leader>fb",
function() require("fzf-lua").builtin() end,
{ silent = true, desc = "[F]ind [B]uilt in fuzzy finders"})

map("n", "<leader>fw",
function() require("fzf-lua").grep_cword() end,
{ silent = true, desc = "[F]ind current [W]ord"})

map("n", "<leader>fW",
function() require("fzf-lua").grep_cWORD() end,
{ silent = true, desc = "[F]ind current [W]ORD"})

map("n", "<leader>fd",
function() require("fzf-lua").diagnostics_document() end,
{ silent = true, desc = "[F]ind [D]iagnostics"})

map("n", "<leader>fr",
function() require("fzf-lua").resume() end,
{ silent = true, desc = "[F]ind [R]esume"})

map("n", "<leader>fo",
function() require("fzf-lua").oldfiles() end,
{ silent = true, desc = "[F]ind [O]ld Files"})

map("n", "<leader><leader>",
function() require("fzf-lua").buffers() end,
{ silent = true, desc = "[<leader>] Find existing buffers"})

map("n", "<leader>/",
function() require("fzf-lua").lgrep_curbuf() end,
{ silent = true, desc = "[/] Live grep the curren buffer"})

map("n", "<leader>fs",
function() require("fzf-lua").spell_suggest() end,
{ silent = true, desc = "[F]ind [S]pelling Suggestions"})

-- Treesitter
require "nvim-treesitter".setup({
    ensure_installed = { "svelte", "typescript", "javascript", "css" },
    highlight = { enable = true }
})

-- LSP
-- Note you must have installed these either with mason or by your package manager
-- enable them

local lsp = vim.lsp

local servers = {"marksman", "lua_ls", "emmet_language_server", "clangd" , "phpactor"}

for _, server in ipairs(servers) do
    lsp.config(server, {
        capabilities =
        require("cmp_nvim_lsp").default_capabilities(),
        settings = {}
    })
    lsp.enable(server)
end

map('n', '<leader>lf', vim.lsp.buf.format)

-- LSP autocomplete
-- vim.api.nvim_create_autocmd('LspAttach', {
--     callback = function(ev)
--         local client = vim.lsp.get_client_by_id(ev.data.client_id)
--         if client:supports_method('textDocument/completion') then
--             vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--         end
--     end,
-- })
--
-- vim.cmd("set completeopt+=noselect")

local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
    },
    experimental = { ghost_text = true },
})

pcall(require, "blink.cmp")

-- Setup colors and vague
require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
