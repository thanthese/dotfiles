" <c-d> is the prefix key for most of my mappings. The following letter is a
" namespace for a collection of functionality. Thus, most shortcuts are 3 keys
" long.

" # Look and feel, passive settings

set nocompatible
filetype plugin indent on
syntax on

set guioptions-=T  " no tool bar
set guioptions-=m  " no menu bar
set guioptions-=r  " no right scroll bar
set guioptions-=L  " no left  scroll bar
set guioptions+=c  " use console dialogs
set guioptions+=v  " vertical layout for dialogs

" appearance
set cursorline           " highlight line with cursor
set number               " show line numbers
set ruler                " show cursor position
set showcmd              " show command in progress
set showmode             " show what mode we're in
set shortmess+=I         " hide vim intro message
set conceallevel=2       " allow javascript lambdas
set concealcursor=nv     " conceal in normal and visual modes only
set vb t_vb=             " no beep on esc in normal mode
set spell wrap linebreak " default to prose
set wildmenu
set wildmode=list:longest

" expected behaviors settings
set hidden               " allows changing of buffers without saving
set lazyredraw           " don't redraw screen during macros
set splitright           " vertical splits appear on right
set mouse=a              " enable the mouse in the terminal
set autoread             " re-read file if file has changed
set timeoutlen=3000      " time to complete command
set cryptmethod=blowfish " use strong encryption

" backup files are terrible
set noswapfile
set nobackup

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

" # Auto commands

" on save any: trim trailing whitespace
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" on save a .vim file: source file
autocmd! BufWritePost *.vim source %

" # Mappings

" ## vanity mappings

" misc
nmap <Space> :wa<CR>
imap <c-r><c-r> <c-r>"
map gp `[v`]

" open new empty lines and leave in normal mode
map <c-p> O<Esc>cc<Esc>
map <c-n> o<Esc>cc<Esc>

" basic cursor movement in insert mode (emacs style)
inoremap <c-b> <Left>
inoremap <c-f> <Right>

" whitespace visual surrounds
vmap s<Space> <Esc>'>a<Space><Esc>'<i<Space><Esc>
vmap s<CR> <Esc>'>a<cr><Esc>'<i<cr><Esc>

" ## make keys work as expected

" search on visual mode
vnoremap <silent> * y:/<c-r>"<CR>
vnoremap <silent> # y:?<c-r>"<CR>

" move cursor by screen lines, not by logical lines
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

" yank matches change convention
nmap Y y$

" more accurate jumping
nnoremap ' `
onoremap ' `

" ## clipboard

" yank current WORD to clipboard
nmap <c-d>yw "+yiW:echo "-- WORD Yanked to Clipboard --"<CR>"

" yank all (file) to system clipboard
nmap <c-d>ya gg"+yG<c-o><c-o>:echo "-- File Yanked to Clipboard --"<CR>

" yank selection to system clipboard
vmap <c-d>ys "+y:echo "-- Selection Yanked to Clipboard --"<CR>

" put from system clipboard
nmap <c-d>yp "+P
vmap <c-d>yp "+P
imap <c-d>yp <c-r>+

" ## windows

" switch window
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap <c-k> <c-w>k
nmap <c-j> <c-w>j

" resize window
nmap <c-Up>    <c-W>-
nmap <c-Down>  <c-W>+
nmap <c-Left>  <c-W><
nmap <c-Right> <c-W>>

" ## system commands

" calendar
nmap <c-d>cc !!cal<CR>

" par
nmap <c-d>cp !!par<CR>
vmap <c-d>cp !par<CR>

" sort
nmap <c-d>cs vip!sort -n<CR>
vmap <c-d>cs !sort -n<CR>

" unique
nmap <c-d>cu :%!uniq<CR>
vmap <c-d>cu !uniq<CR>

" dc
nmap <c-d>cd yip}O<Esc>pvip!dc<CR>
vmap <c-d>cd !dc<CR>

" bc
nmap <c-d>cb !!bc<CR>
vmap <c-d>cb !bc<CR>

" sparkup
nmap <c-d>ck !!~/sparkup/sparkup<CR>
vmap <c-d>ck !~/sparkup/sparkup<CR>

" tidy json
nmap <c-d>ca :%!python -mjson.tool<CR>
vmap <c-d>ca :!python -mjson.tool<CR>

" tidy xml
nmap <c-d>cx :Tidy<CR>
vmap <c-d>cx :Tidy<CR>

" sum column
vmap <c-d>1 !awk '{s+=$1}END{print s}'<CR>
vmap <c-d>2 !awk '{s+=$2}END{print s}'<CR>
vmap <c-d>3 !awk '{s+=$3}END{print s}'<CR>
vmap <c-d>4 !awk '{s+=$4}END{print s}'<CR>
vmap <c-d>5 !awk '{s+=$5}END{print s}'<CR>
nmap <c-d>1 vip<c-d>1
nmap <c-d>2 vip<c-d>2
nmap <c-d>3 vip<c-d>3
nmap <c-d>4 vip<c-d>4
nmap <c-d>5 vip<c-d>5

" add line numbers to selection
vmap <c-d>cn :!cat<space>-n<cr>gv:s/\v^<space>*//g<cr>gv:s/\v\t/<space>/g<cr>

" ## vim settings

" toggle spell
nmap <c-d>ts :set spell!<CR>

" toggle wrap
nmap <c-d>tw :set wrap! linebreak!<CR>

" ## modify text with vim commands

" insert datestamp
imap <c-d> <c-r>=ShortDate()<CR>
imap <c-y> <c-r>=LongDate()<CR>

" format a uri
nmap <c-d>i 0:s/[&?]/\r&<space>/g<CR>vipoj>\=k0

" ## search and replace

" search-replace word-under-cursor in file
nmap <c-d>R :%s/\<<c-r><c-w>\>//gc<Left><Left><Left>

" search-replace selection in file
vmap <c-d>R y:%s/<c-r>"//gc<left><left><Left>

" search-replace word-under-cursor in paragraph
nmap <c-d>r yiwvip:s/\<<c-r>"\>//gc<Left><Left><Left>

" search-replace selection in paragraph
vmap <c-d>r yvip:s/<c-r>"//gc<Left><Left><Left>

" substitute only within last selection
vmap <C-d>S <Esc><C-d>S
nmap <C-d>S :%s/\%V

" search only within (last) selection
vmap <C-d>/ <Esc>/\%V
nmap <C-d>/ /\%V

" ## pairs
imap <C-d>6 ``<Left>
imap <C-d>7 ''<Left>
imap <C-d>8 ""<Left>
imap <C-d>9 ()<Left>
imap <C-d>0 []<Left>
imap <C-d>- {}<Left>
imap <C-d>= {<CR>}<Esc>O<space><space>

" ## split string
vmap <C-d>" c"<space>+<space><c-r>"<space>+<space>"<Esc>
vmap <C-d>' c'<space>+<space><c-r>'<space>+<space>'<Esc>
vmap <C-d>` c`<space>+<space><c-r>`<space>+<space>`<Esc>

nmap <C-d>" viw<C-d>"
nmap <C-d>' viw<C-d>'
nmap <C-d>` viw<C-d>`

" # Commands
com! -range=% Tidy <line1>,<line2>!tidy -xml -quiet -indent --indent-attributes yes --sort-attributes alpha -wrap --show-warnings no

" # Functions

function! ShortDay(longDay)
  if a:longDay == "Mon" | return "m" | endif
  if a:longDay == "Tue" | return "t" | endif
  if a:longDay == "Wed" | return "w" | endif
  if a:longDay == "Thu" | return "r" | endif
  if a:longDay == "Fri" | return "f" | endif
  if a:longDay == "Sat" | return "s" | endif
  if a:longDay == "Sun" | return "u" | endif
  return "-- Invalid Day Format '" . longDay . "'. --"
endfunction

function! ShortDate()
  return "[" . tolower(strftime("%b%d")) . ShortDay(strftime("%a")) . "]"
endfunction

function! LongDate()
  return "[" . tolower(strftime("'%y%b%d")) . ShortDay(strftime("%a")) . "]"
endfunction

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" # Plugin-specific settings

" bufexplorer
nmap \\ \be

" netrw
let g:netrw_preview   = 1   " preview vertically
let g:netrw_liststyle = 3   " default to a tree layout
let g:netrw_winsize   = 30  " default preview width: 30 cols

" tabular
nmap \: :Tabu /:<CR>
vmap \: :Tabu /:<CR>
vmap \" :Tabu /"<CR>
nmap \= :Tabu /=<CR>
vmap \= :Tabu /=<CR>
nmap \| :Tabu /\|<CR>
vmap \| :Tabu /\|<CR>

" surround
nmap ds0 ds)
nmap da0 da)
nmap di0 di)
nmap ca0 ca)
nmap ci0 ci)
nmap va0 va)
nmap vi0 vi)
vmap s0 s)
nmap vv v%s)

" vimux
" prompt
nmap <c-c>p :VimuxPromptCommand<CR>
" run command
vmap <c-c><c-c> "zy :call VimuxRunCommand(@z)<CR>
nmap <c-c><c-c> vip<c-c><c-c>
" repeat last
nmap <c-c>r :call VimuxRunLastCommand()<CR>
" inspect
nmap <c-c>i :call VimuxInspectRunner()<CR>
" close
nmap <c-c>c :call VimuxCloseRunner()<CR>
" break (interrupt running process)
nmap <c-c>b :call VimuxInterruptRunner()<CR>
" window settings
"let g:VimuxOrientation = "h"
"let g:VimuxHeight = "40"

" fuzzy finder
nmap <c-d><c-f> :FufCoverageFile<CR>
nmap <c-d><c-b> :FufBuffer<CR>
nmap <c-d><c-h> :FufHelp<CR>
nmap <c-d><c-c> :FufChangeList<CR>
nmap <c-d><c-l> :FufLine<CR>

" powerline
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" # Filetype-specific settings

" javascript
nmap <c-d>jf vip!~/js-beautify/python/js-beautify --indent-size=2 -i<CR>
vmap <c-d>jf !~/js-beautify/python/js-beautify --indent-size=2 -i<CR>

" # Abbreviations

abbr teh the
abbr Teh The

" # Folds

" use markers
set foldmethod=marker

" simplify what displays on folded lines
set fillchars="fold: "
set foldtext=GetFoldText()
function! GetFoldText()
  return getline(v:foldstart)
endfunction

" highlight folded lines, but in a subtle way
highlight Folded guibg=#EFEFEF

" make it easy to toggle folds
nmap <tab> za
