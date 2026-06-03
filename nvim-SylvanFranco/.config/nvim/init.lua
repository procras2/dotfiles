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
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.incsearch = true
vim.o.signcolumn = "yes"

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
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    -- { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/chomosuke/typst-preview.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
})

-- Mason
require "mason".setup()

-- Mini.pick
require "mini.pick".setup()
map('n', '<leader>f', ":Pick files<CR>")
map('n', '<leader>h', ":Pick help<CR>")

-- Treesitter
require "nvim-treesitter".setup({
    ensure_installed = { "svelte", "typescript", "javascript", "css" },
    highlight = { enable = true }
})

-- Oil
require "oil".setup()
map('n', '<leader>e', ":Oil<CR>")

map('t', '', "")
map('t', '', "")

-- LSP
-- Note you must have installed these either with mason or by your package manager
vim.lsp.enable({ "lua_ls", "svelte", "tinymist", "emmetls", "clangd" })
vim.lsp.config("lua_ls", {
})

vim.lsp.config("emmetls", {})

map('n', '<leader>lf', vim.lsp.buf.format)

-- LSP autocomplete
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})
vim.cmd("set completeopt+=noselect")

-- Setup colors and vague
require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
