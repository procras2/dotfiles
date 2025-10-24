-- Better indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Enable break indent
vim.opt.breakindent = true

-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Show line under cursor
vim.opt.cursorline = true
-- Show column of cursor
-- vim.opt/cursorcolumn = true

-- Store undoes between sessions
vim.opt.undofile = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Don't show the mode, since it is already in the statusline
vim.opt.showmode = false

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep sign column on by default, nicer output from language servers
vim.opt.signcolumn = "yes"

-- Decrease our update time
vim.opt.updatetime = 250

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- How to display whitespace characters, see 'listchars'
vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", lead = "·", trail = "·", nbsp = "␣" }
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Minimal number of lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Disable commandline until it is needed
-- vim.opt.Icmdheight = 0

-- Hightlight test for some time after yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
    desc = "Highlight yank",
})
