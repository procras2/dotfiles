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

opt.pumheight = 10
opt.pumborder = "rounded"

vim.diagnostic.config({virtual_text = true}) -- inline diagnostics
