set nocompatible
filetype plugin indent on
syntax on

colorscheme slate

set autoread             " re-read file if file has changed
set cryptmethod=blowfish " use strong encryption
set hidden               " allows changing of buffers without saving
set lazyredraw           " don't redraw screen during macros
set mouse=a              " enable the mouse in the terminal
set nocursorline         " controls highlighting line with cursor
set number               " show line numbers
set ruler                " show cursor position
set scrolloff=0          " number of lines to keep above and below cursor
set shortmess+=I         " hide vim intro message
set showcmd              " show command in progress
set showmode             " show what mode we're in
set splitright           " vertical splits appear on right
set timeoutlen=3000      " time to complete command
set vb t_vb=             " no beep on esc in normal mode
set noautochdir          " auto change directory to current file's

" conceal
set concealcursor=nv " conceal in normal and visual modes only
set conceallevel=2   " allow concealing magic

" hide silly gui options
set guioptions+=c  " use console dialogs
set guioptions+=v  " vertical layout for dialogs
set guioptions-=L  " no left  scroll bar
set guioptions-=T  " no tool bar
set guioptions-=m  " no menu bar
set guioptions-=r  " no right scroll bar

" backup files are unnecessary and messy
set nobackup
set nowritebackup
set noswapfile

" searching
set ignorecase
set smartcase
set incsearch
set nohlsearch

" just make tabs do what I want
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

" menus and completion
set completeopt=longest   " insert mode completion
set wildmenu              " command line completion
set wildmode=list:longest " command line completion options
set omnifunc=syntaxcomplete#Complete

" so I don't need to zR all the time, hopefully
set foldlevel=20
