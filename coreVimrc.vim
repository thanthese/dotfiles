""
" Stephen Mann
"

" preferred plugins
" - align
" - bufexplorer (with q map changed to esc)
" - fuzzyfinder (still deciding...)
" - matchit
" - NERD_commenter (with ,c leader changed: _ to toggle)
" - NERD_tree
" - ragtag, <c-x><space> to expand tag
" - snipMate, tab to complete supported snippets
" - surround (with repeat.vim)
" - tortoiseTyping
" - SApprox, makes colorschemes work in terminals
" - ir_black, preferred colorscheme

" shortcut conventions:
" - preference for custom Ex commands
" - \ : navigation, aka shortcuts-to-files
" - , : buffers

" function key conventions:
" - F5: run
" - F6: run, version 2
" - F7: test
" - F8: send to screen


" look and feel, passive settings
" ===============================

" vi compatibility mode
set nocompatible

" filetype plugins and detection
filetype plugin on

" restore buffers on startup
set viminfo^=%

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

" expected behaviors settings
set autochdir   " change current directory to directory of current doc
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
set gdefault  " assume gflag for :s substitutions

" omni-completion
set omnifunc=syntaxcomplete#Complete

" folding
set foldmethod=marker


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

" make ' work like ` in normal and operator-pending modes
nmap ' `
omap ' `

" move cursor by screen lines, not by logical lines
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

" yank matches change convention
nmap Y y$


" Ex command laziness
" -------------------

" easy entry into Ex command line
nmap <space> :
vmap <space> :

" easy enry into Ex command window
nmap Q q:
vmap Q q:

" repeat last Ex command
nmap <tab> @:
vmap <tab> @:


" commands
" --------

" internal commands
com! Wrap setlocal wrap!
com! Spell setlocal spell!
com! HlSearch setlocal hlsearch! | norm :let @/="<c-r><c-w>"<CR>
com! SourceVimrc source ~/.vimrc
com! Uptime !uptime
com! -nargs=1 FileType setlocal filetype=<args>
com! -nargs=1 Title norm v$hr<args>

" external commands
com! -range=% Tidy <line1>,<line2>!tidy -xml -quiet -indent -wrap --indent-attributes yes
com! -nargs=1 Commit !git commit -a -m <q-args>
com! -nargs=0 Log    !git log
com! -nargs=0 Status !git status
com! -nargs=0 Push   !git push


" manipulate windows
" ------------------

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


" plugin specific shortcuts
" -------------------------

" bufexplorer
nmap , \be


" interacting with screen
" =======================


" core functions
" --------------

" sending function
" - window can be blank
" - %p expands to full path
" - %r expands to root of file name, no extension
function! SendToScreenWindow(window, text)
 let pArg = a:window == "" ? "" : "-p " . a:window
 let toStuff = substitute(a:text,  "%p", fnamemodify(@%, ":p"  ), "g")
 let toStuff = substitute(toStuff, "%r", fnamemodify(@%, ":p:r"), "g")
 let toStuff = substitute(toStuff, '"', '\\\"', "g")
 let toStuff = substitute(toStuff, '`', '\\\`', "g")
 call system('screen ' . pArg . ' -X stuff "' . toStuff . '"')
endfunction

" switch to window
function! SwitchToScreenWindow(window)
  call system("screen -X select " . a:window)
endfunction


" commands
" --------

" switch window
com! -nargs=1 SwitchToWindow call SwitchToScreenWindow(<q-args>)

" send text to active window
com! -nargs=+ SendToScreen call SendToScreenWindow("", <q-args>)


" quick execute
" -------------

" execute current line or selection in screen
vmap <buffer> <silent> <F8> y:SendToScreen <c-r>"<CR>
nmap <buffer> <silent> <F8> ^v$hy:SendToScreen <c-r>"<CR>


" switch windows
" --------------

nmap \0 :SwitchToWindow 0<CR>
nmap \1 :SwitchToWindow 1<CR>
nmap \2 :SwitchToWindow 2<CR>
nmap \3 :SwitchToWindow 3<CR>
nmap \4 :SwitchToWindow 4<CR>
nmap \5 :SwitchToWindow 5<CR>
nmap \6 :SwitchToWindow 6<CR>
nmap \7 :SwitchToWindow 7<CR>
nmap \8 :SwitchToWindow 8<CR>
nmap \9 :SwitchToWindow 9<CR>


" runtime options (not always used)
" ---------------------------------

" initialize buffer variables
function! InitBuffer()
  if !exists("b:runTimeOpts")
    let b:runTimeOpts = ""
  endif
endfunction

" set run-time options
com! -nargs=+ SetRunTimeOptions   let b:runTimeOpts=<q-args>
com!          ClearRunTimeOptions let b:runTimeOpts=""
