" designed for vim 8+
" see https://rwx.gg/vi for help

if has("eval")
    let skip_defaults_vim = 1
endif

set encoding=UTF-8

set nocompatible

"####################### Vi Compatible (~/.exrc) #######################

" automatically indent new lines
set autoindent

" automatically write files when changing when multiple files open
set autowrite

" deactivate line numbers
set number

" turn col and row position on in bottom right
set ruler " see ruf for formatting

" show command and insert mode
set showmode

set tabstop=4

"#######################################################################

" disable visual bell (also disable in .inputrc)
set t_vb=

let mapleader=","

set softtabstop=4

" mostly used with >> and <<
set shiftwidth=4

set smartindent

set smarttab

if v:version >= 800
  " stop vim from silently messing with files that it shouldn't
  set nofixendofline

  " better ascii friendly listchars
  set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>

  " i hate automatic folding
  set foldmethod=manual
  set nofoldenable
endif

" mark trailing spaces as errors
match IncSearch '\s\+$'

" enough for line numbers + gutter within 80 standard
set textwidth=78
"set colorcolumn=78

" replace tabs with spaces automatically
set expandtab

" disable relative line numbers, remove no to sample it
set norelativenumber

" makes ~ effectively invisible
"highlight NonText guifg=bg

" turn on default spell checking
"set spell

" disable spellcapcheck
set spc=

" more risky, but cleaner
set nobackup
set noswapfile
set nowritebackup

set icon

" center the cursor always on the screen
"set scrolloff=999

" highlight search hits
set hlsearch
set incsearch
set linebreak

" avoid most of the 'Hit Enter ...' messages
set shortmess=aoOtTI

" prevents truncated yanks, deletes, etc.
set viminfo='20,<1000,s1000

" not a fan of bracket matching or folding
if has("eval") " vim-tiny detection
  let g:loaded_matchparen=1
endif
set showmatch

" stop annoying beep in php with showmatch not finding a <
" when you type >
au BufWinEnter *.php set mps-=<:>

" wrap around when searching
set wrapscan

" stop complaints about switching buffer with changes
set hidden

" command history
set history=100

"
"#######################################################################
" Mouse support
set mouse=a

" ttyprequired to get mouse working in alacritty
" for Kitty
"set ttymouse=sgr
" for urxvt
"set ttymouse=urxvt

set balloonevalterm
" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''
" here because plugins and stuff need it
if has("syntax")
  syntax enable
endif

" faster scrolling
set ttyfast

" allow sensing the filetype
filetype plugin on

" allow filetype specific indentation
filetype indent on

" high contrast for streaming, etc.
set background=dark

" base default color changes (gruvbox dark friendly)
hi StatusLine ctermfg=black ctermbg=NONE
hi StatusLineNC ctermfg=black ctermbg=NONE
hi Normal ctermbg=NONE
hi Special ctermfg=cyan
hi LineNr ctermfg=black ctermbg=NONE
hi SpecialKey ctermfg=black ctermbg=NONE
hi ModeMsg ctermfg=black cterm=NONE ctermbg=NONE
hi MoreMsg ctermfg=black ctermbg=NONE
hi NonText ctermfg=black ctermbg=NONE
hi vimGlobal ctermfg=black ctermbg=NONE
hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
hi Error ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
hi Search ctermbg=236 ctermfg=darkred
hi vimTodo ctermbg=236 ctermfg=darkred
hi Todo ctermbg=236 ctermfg=darkred
hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
hi MatchParen ctermbg=236 ctermfg=darkred

" color overrides
au FileType * hi StatusLine ctermfg=black ctermbg=NONE
au FileType * hi StatusLineNC ctermfg=black ctermbg=NONE
au FileType * hi Normal ctermbg=NONE
au FileType * hi Special ctermfg=cyan
au FileType * hi LineNr ctermfg=black ctermbg=NONE
au FileType * hi SpecialKey ctermfg=black ctermbg=NONE
au FileType * hi ModeMsg ctermfg=black cterm=NONE ctermbg=NONE
au FileType * hi MoreMsg ctermfg=black ctermbg=NONE
au FileType * hi NonText ctermfg=black ctermbg=NONE
au FileType * hi vimGlobal ctermfg=black ctermbg=NONE
au FileType * hi goComment ctermfg=black ctermbg=NONE
au FileType * hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi Error ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi Search ctermbg=236 ctermfg=darkred
au FileType * hi vimTodo ctermbg=236 ctermfg=darkred
au FileType * hi Todo ctermbg=236 ctermfg=darkred
au FileType * hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
au FileType * hi MatchParen ctermbg=236 ctermfg=darkred
au FileType markdown,pandoc hi Title ctermfg=yellow ctermbg=NONE
au FileType markdown,pandoc hi Operator ctermfg=yellow ctermbg=NONE
au FileType yaml hi yamlBlockMappingKey ctermfg=NONE
au FileType yaml set sw=4
au FileType bash set sw=2
au FileType c set sw=8

set cinoptions+=:0

" Edit/Reload vimr configuration file
nnoremap confe :e $HOME/.vimrc<CR>
nnoremap confr :source $HOME/.vimrc<CR>

" We can comment this out if we are using airline
" set ruf=%30(%=%#LineNr#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)

" truecolor
if (has("termguicolors"))
    set termguicolors
endif

" only load plugins if Plug detected
if filereadable(expand("~/.vim/autoload/plug.vim"))

  " github.com/junegunn/vim-plug

  call plug#begin('~/.vim/plugged')
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
  Plug 'junegunn/fzf.vim'
  Plug 'iamcco/markdown-preview.nvim', {'do' : { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
  Plug 'vim-scripts/DrawIt'
  Plug 'vim-airline/vim-airline'
  Plug 'jamessan/vim-gnupg'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/syntastic'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'joom/vim-commentary'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'pangloss/vim-javascript'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'mattn/emmet-vim'
  Plug 'ap/vim-css-color'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'majutsushi/tagbar'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-easytags'
  Plug 'lervag/vimtex'
  Plug 'lumiliet/vim-twig'
  Plug 'morhetz/gruvbox'
  Plug 'dpelle/vim-languagetool'
  " Devicons must be the very last one
  Plug 'ryanoasis/vim-devicons'
  Plug 'ron89/thesaurus_query.vim'
  Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#util#install() }, 'for' : ['markdown', 'vim-plug']}
  call plug#end()

  " easytags
  let g:easytags_auto_hightlight = 0

  " vimtex setup
  "let g:tex_flavor = "latex"
  let g:vimtex_view_method = 'zathura'

  " gruvbox setup
  let g:gruvbox_italic = 1    " To enable italics
  colorscheme gruvbox

  " Syntastic set up
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_phph_phpcs_args = '--standard=PSR12 -n'

  " pandoc
  let g:pandoc#formatting#mode = 'h' " A'
  let g:pandoc#formatting#textwidth = 72

  " golang
  let g:go_fmt_fail_silently = 0
  let g:go_fmt_command = 'goimports'
  let g:go_fmt_autosave = 1
  let g:go_gopls_enabled = 1
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_variable_declarations = 1
  let g:go_highlight_variable_assignments = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_diagnostic_errors = 1
  let g:go_highlight_diagnostic_warnings = 1

  let g:go_auto_sameids = 0

  set updatetime=100
  "let g:go_gopls_analyses = { 'complisites' : v:false }
  au FileType go nmap <leader>t :GoTest!<CR>
  au FileType go nmap <leader>v :Go!<CR>
  au FileType go nmap <leader>b :GoBuild!<CR>
  au FileType go nmap <leader>c :GoCoverateToggle!<CR>
  au FileType go nmap <leader>i :GoInfo!<CR>
  au FileType go nmap <leader>l :GoMetaLinter!<CR>
  au FileType go nmap <leader>m ilog.Print("made")<CR><ESC>
  au FileType go nmap <leader>n iif err != nil {return err}<CR><ESC>

" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='.  a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'.  a:extension .'$#'
endfunction

"    call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
"    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
"    call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
"    call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
"    call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
"    call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
"    call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
"    call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
"    call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
"    call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
"    call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
"    call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
"    call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
"    call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
"    call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
"    call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
"    call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
"    call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

    " vim-airline setup
    let g:airline_powerline_fonts = 1
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_symbols.space = "\ua0"
    "let g:airline#extensions#tabline#enabled = 1
    "let g:airline#extensions#tabline#show_buffers = 1
    "let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline_theme = 'gruvbox'
    
    " fzf set up
    let g:fzf_action = {
                \ 'ctrl-t': 'tab split',
                \ 'ctrl-x': 'split',
                \ 'ctrl-v': 'vsplit',
                \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

  " devicons set up
  let g:webdevicons_enable_nerdtree = 1
  let g:webdevicons_conceal_nerdtree_brackets = 1
  let g:webdevicons_enable_airline_tabline = 1
  let g:webdevicons_enable_airline_statusline = 1
  let g:webdevicons_enable_ctrlp = 1


else
    autocmd vimleavepre *.go !gofmt -w % " backup if fatih fails
endif

"#######################################################################
" sql setting
let g:sql_type_default = 'mysql'

"#######################################################################
" netrw setting
let g:netrw_liststyle = 3   " show the tree listing
let g:netrw_winsize = 0     " set default windowsize to be always equal
let g:netrw_preview = 1     " open splits to the right
autocmd FileType netrw setl bufhidden=delete    " or use :qa!

" Search all subdirectories and recursively with :find
set path+=**
" better command-line completion
set wildmenu

" disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>

" enable omni-completion
set omnifunc=syntaxcomplete#Complete

"fix bork bash detection
if has("eval")  " vim-tiny detection
fun! s:DetectBash()
    if getline(1) == '#!/usr/bin/bash' || getline(1) == '#!/bin/bash'
        set ft=bash
        set shiftwidth=4
    endif
endfun
autocmd BufNewFile,BufRead * call s:DetectBash()
endif

" displays all the syntax rules for current position, useful
" when writing vimscript syntax plugins
if has("syntax")
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
endif


" start at last place you were editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"au BufWritePost ~/.vimrc so ~/.vimrc

" functions keys
map <F1> :set number!<CR> :set relativenumber!<CR>
nmap <F2> :call <SID>SynStack()<CR>
set pastetoggle=<F3>
map <F4> :set list!<CR>
map <F5> :set cursorline!<CR>
map <F7> :set spell!<CR>
nmap <F8> :TagbarToggle<CR>
map <F12> :set fdm=indent<CR>

nmap <leader>2 :set paste<CR>i

" disable arrow keys (vi muscle memory)
"noremap <up> :echoerr "Umm, use k instead"<CR>
"noremap <down> :echoerr "Umm, use j instead"<CR>
"noremap <left> :echoerr "Umm, use h instead"<CR>
" noremap <right> :echoerr "Umm, use l instead"<CR>
" inoremap <up> <NOP>
" inoremap <down> <NOP>
" inoremap <left> <NOP>
" inoremap <right> <NOP>
"
" better use of arrow keys, number increment/decrement
nnoremap <up> <C-a>
nnoremap <down> <C-x>

" Better page down and page up
noremap <C-n> <C-d>
noremap <C-p> <C-b>

" Set TMUX window name to name of file
"au fileopened * !tmux rename-window TESTING


runtime ftplugin/man.vim
nmap K :Man <cword><CR>

set grepprg=grep\ -nH\ $*
