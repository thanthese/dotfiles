""
" Stephen Mann
"

" preferred plugins
" - align
" - conque
" - command-t
" - bufexplorer (with q map changed to esc)
" - matchit
" - NERD_tree
" - surround (with repeat.vim)
" - CSApprox, makes colorschemes work in terminals
" - ir_black, preferred colorscheme

" shortcut conventions:
" - preference for custom Ex commands
" - \    : navigation, aka shortcuts-to-files
" - ctrl : window management


" look and feel, passive settings
" ===============================

" vi compatibility mode
set nocompatible

" filetype plugins and detection
filetype plugin on

" gui options
set guioptions-=T  " no tool bar
set guioptions-=m  " no menu bar
set guioptions-=r  " no right scroll bar
set guioptions-=L  " no left  scroll bar
set guioptions+=c  " use console dialogs

" appearance
colorscheme ir_black
set cursorline
set nowrap
set number
set ruler
set showcmd
set showmode
set wildmenu
set wildmode=list:longest

" expected behaviors settings
set hidden      " allows changing of buffers without saving
set lazyredraw  " don't redraw screen during macros
set splitright  " vertical splits appear on right

" tabs
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

" searching
set ignorecase
set smartcase
set incsearch

" omni-completion
set omnifunc=syntaxcomplete#Complete


" events
" ======

" on save any: trim trailing whitespace
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | ''

" on save a .vim file: source file
autocmd! BufWritePost *.vim source %


" helpful mappings
" ================

" make keys work as expected
" --------------------------

" move cursor by screen lines, not by logical lines
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

" yank matches change convention
nmap Y y$

" better jumping
nnoremap ` '


" extras
" ------

" yank/put to system clipboard
nmap <M-y> :%yank<CR>
vmap <M-y> "+y
nmap <M-p> "+P

" switch window
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k

" resize window
nmap <C-Up>    <C-W>-
nmap <C-Down>  <C-W>+
nmap <C-Left>  <C-W><
nmap <C-Right> <C-W>>

" commands
com! -range=% Tidy <line1>,<line2>!tidy -xml -quiet -indent -wrap --indent-attributes yes --sort-attributes alpha
