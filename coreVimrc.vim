""
" Stephen Mann
"

" preferred plugins
" - NERDTree
" - bufexplorer
" - surround
" - align

" shortcut conventions:
" - control    : window command
" - meta       : command shortcut
" - meta-shift : opposite meta command, or meta command harder
" - shift      : (not used)
" - \          : navigation, aka shortcuts-to-files
" - ,          : buffers


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
set guioptions+=c  " use console dialogs

" appearance
colors slate
set nowrap
set number
set ruler
set showcmd
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

" omni-completion
set omnifunc=syntaxcomplete#Complete

" folding
set foldmethod=marker

" show whitespace characters
set list listchars=tab:>-


" events
" ======

" on save any: trim trailing whitespace
autocmd! BufWrite * mark ` | silent! %s/\s\+$// | norm ``

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

" yanking matches changing conventions
nmap Y y$


" meta (shortcut commands)
" ------------------------

" saving
nmap <M-s> :update<CR>
nmap <M-S> :wa<CR>

" yank-paste from system clipboard
vmap <M-y> "+y:echo       "Yanked selection"<CR>
nmap <M-y> v$h"+y:echo    "Yanked to end-of-line"<CR>
nmap <M-Y> ggVG"+y'':echo "Yanked file"<CR>
vmap <M-p> "+P
nmap <M-p> "+P
imap <M-p> <C-o>"+p

" paste last yanked text
nmap yp "0p
nmap yP "0P
vmap yp "0p
vmap yP "0P

" toggle highlight search
nmap <M-h> :setlocal hlsearch!<CR>:setlocal hlsearch?<CR>

" toggle highlight word under cursor
nmap <M-H> :setlocal hlsearch!<CR>m'*''
vmap <M-H> y:setlocal hlsearch!<CR>m'/"<CR>''

" toggle wrap
nmap <M-w> :setlocal wrap!<CR>:setlocal wrap?<CR>

" toggle spell
nmap <M-q> :setlocal spell!<CR>:setlocal spell?<CR>

" source vimrc and retab
nmap <M-o> :so ~/.vimrc<CR>:retab<CR>

" show system uptime
nmap <M-u> :! uptime<CR>

" search file for argument
nmap <M-g> :SearchFile<Space>
vmap <M-g> y:SearchFile<Space>"<CR>

" quickfix navigation
nmap <M-j> :cn<CR>
nmap <M-k> :cp<CR>
nmap <M-l> :cclose<CR>

" fill with char to end of line; useful for headers
nmap <M--> v$hr-
nmap <M-=> v$hr=

" set filetype
nmap <M-i> :set filetype=

" execute current line or selection in screen
vmap <buffer> <silent> <M-e> y:SendToScreen "<CR>
nmap <buffer> <silent> <M-e> m'^v$hy:SendToScreen "<CR>''

" standardized meta commands across filetype plugins:
"   <M-c>: insert/remove comment
"   <M-d>: insert debug line
"   <M-r>: run


" control (for windows)
" ---------------------

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
" --------

" search file for argument
command! -nargs=+ SearchFile vimgrep /<args>/j % | cw 30

" foo it!
command! -range=% FooIt <line1>,<line2>s;\<\w*\>;foo;g


" plugin specific shortcuts
" -------------------------

" NERDTree
nmap \n :NERDTree<CR>

" bufexplorer
nmap , \be

" align
vmap <M-a> :Align<Space>


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

" initialize buffer variables
function! InitBuffer()
  if !exists("b:runTimeOpts")
    let b:runTimeOpts = ""
  endif
endfunction


" commands
" --------

" switch window
command! -nargs=1 SwitchToWindow call SwitchToScreenWindow(<q-args>)

" set run-time options
command! -nargs=+ SetRunTimeOptions   let b:runTimeOpts=<q-args>
command!          ClearRunTimeOptions let b:runTimeOpts=""

" send text to active window
command! -nargs=+ SendToScreen call SendToScreenWindow("", <q-args>)
