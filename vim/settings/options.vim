set nocompatible
filetype plugin indent on
syntax on

colorscheme slate

set autoread             " reload when underlying file changes (on gvim focus)
set cryptmethod=blowfish " use strong encryption
set hidden               " allows changing of buffers without saving
set lazyredraw           " don't redraw screen during macros
set mouse=a              " enable the mouse in the terminal
set noautochdir          " auto change directory to current file's
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
set noswapfile
set nowritebackup

" searching
set ignorecase
set incsearch
set nohlsearch
set smartcase

" just make tabs do what I want
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set softtabstop=2

" menus and completion
set wildmenu  " command line completion
set completeopt-=preview

" so I don't need to zR all the time, hopefully
set foldlevel=20
