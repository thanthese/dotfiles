""
" Stephen Mann
"
" Contains system-independent vim settings.
"

" # Documentation

" ## preferred plugins
" - bufexplorer
" - command-t
" - CSApprox, makes colorschemes work in terminals
" - fugitive (git plugin)
" - ir_black, preferred colorscheme
" - lustyExplorer
" - matchit
" - NERD_tree
" - tslime.vim
" - surround (with repeat.vim)

" ## shortcut conventions
" - prefer custom Ex commands
" - \    : navigation, aka shortcuts-to-files
" - \r   : run a command that will have an effect on the code
" - ctrl : window management
" - alt  : - not used -

" # Look and feel, passive settings

" vi compatibility mode
set nocompatible

" filetype plugins and detection
filetype plugin indent on
syntax on

" gui options
set guioptions-=T  " no tool bar
set guioptions-=m  " no menu bar
set guioptions-=r  " no right scroll bar
set guioptions-=L  " no left  scroll bar
set guioptions+=c  " use console dialogs

" appearance
colorscheme molokai
set cursorline
set nowrap
set number
set ruler
set showcmd
set showmatch
set showmode
set wildmenu
set wildmode=list:longest

" expected behaviors settings
set hidden      " allows changing of buffers without saving
set lazyredraw  " don't redraw screen during macros
set splitright  " vertical splits appear on right
set mouse=a     " enable the mouse in the terminal

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

" put all swap files together in one place
set directory^=$HOME/.vim_swap

" put all tilde files together in one place
set backupdir^=$HOME/.vim_swap

" # On events

" on save any: trim trailing whitespace
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | ''

" on save a .vim file: source file
autocmd! BufWritePost *.vim source %

" # Helpful mappings

" ## make keys work as expected

" move cursor by screen lines, not by logical lines
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

" yank matches change convention
nmap Y y$

" more accurate jumping
nnoremap ' `

" ## extras (system commands, ctrl/alt based)

" yank/put to system clipboard
nmap <M-Y> gg"+yG<C-o><C-o>:echo "-- File Yanked to Clipboard --"<CR>
nmap <M-y> "+yy:echo "-- Line Yanked to Clipboard --"<CR>
vmap <M-y> "+y:echo "-- Selection Yanked to Clipboard --"<CR>

nmap <M-p> "+P
vmap <M-p> "+P
imap <M-p> <C-r>+

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

" ## refactoring and code manipulation mappings (\r)

" par
nmap \rp !!par<CR>
vmap \rp !par<CR>

" sort
nmap \rs :%!sort<CR>
vmap \rs !sort<CR>

" unique
nmap \ru :%!uniq<CR>
vmap \ru !uniq<CR>

" dc
nmap \rd yip}O<Esc>pvip!dc<CR>
vmap \rd !dc<CR>

" sparkup
nmap \rsu !!~/sparkup/sparkup<CR>
vmap \rsu !~/sparkup/sparkup<CR>

" tidy
nmap \rt :Tidy<CR>
vmap \rt :Tidy<CR>

" toggle wrap
nmap \rw :set wrap! linebreak!<CR>

" toggle spell
nmap \rsp :set spell!<CR>

" toggle wrap and spell
nmap \rws \rw\rsp

" insert timestamp
imap <C-d> <C-r>="[" . strftime("%d %b %Y") . "]"<CR>

" sum column
vmap \s1 !awk '{s+=$1}END{print s}'<CR>
vmap \s2 !awk '{s+=$2}END{print s}'<CR>
vmap \s3 !awk '{s+=$3}END{print s}'<CR>
vmap \s4 !awk '{s+=$4}END{print s}'<CR>
vmap \s5 !awk '{s+=$5}END{print s}'<CR>
nmap \s1 vip\s1
nmap \s2 vip\s2
nmap \s3 vip\s3
nmap \s4 vip\s4
nmap \s5 vip\s5

" # Commands
com! -range=% Tidy <line1>,<line2>!tidy -xml -quiet -indent --indent-attributes yes --sort-attributes alpha -wrap --show-warnings no

" # Plugin-specific settings

" command-t
set wildignore+=.git,test/**,*.class,*.war

" ack
let g:ackprg="ack-grep"
nmap \a :Ack<Space>

" fugitive
nmap \gs :Gstatus<CR>
nmap \gd :Gdiff<CR>
nmap \gw :Gwrite<CR>
nmap \gc :Gcommit<CR>

" # Filetype-specific settings
" Note: only the most simple settings can live in the .vimrc

" clojure, navigating (), [], and {}
au FileType clojure nmap <buffer> ) /[([{]<CR>
au FileType clojure vmap <buffer> ) /[([{]<CR>
au FileType clojure omap <buffer> ) /[([{]<CR>

au FileType clojure nmap <buffer> ( ?[([{]<CR>
au FileType clojure vmap <buffer> ( ?[([{]<CR>
au FileType clojure omap <buffer> ( ?[([{]<CR>