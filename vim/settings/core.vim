""
" Stephen Mann
"
" Contains system-independent vim settings.
"

" # Shortcut prefix conventions
" - \     : navigation, aka shortcuts-to-files
" - <c-d> : run a command that will have an effect on the code
" - <c-c> : filetype/tslime-specific
" - ctrl  : window management

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
set guioptions+=v  " vertical layout for dialogs

" appearance
colorscheme ir_black
set cursorline
set nowrap
set number
set ruler
set showcmd
set showmatch
set showmode
set wildmenu
set wildmode=list:longest
set shortmess+=I
set colorcolumn=80
highlight ColorColumn guibg=#111111 ctermbg=233
set conceallevel=2
set concealcursor=nv

" expected behaviors settings
set hidden      " allows changing of buffers without saving
set lazyredraw  " don't redraw screen during macros
set splitright  " vertical splits appear on right
set mouse=a     " enable the mouse in the terminal
set autoread    " re-read file if file has changed

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
autocmd! BufWrite * mark ` | silent! %s/\s\+$// | norm ``

" on save a .vim file: source file
autocmd! BufWritePost *.vim source %

" highlight matches of word under cursor
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
" set eventignore=CursorMoved

" # Mappings

" ## vanity mappings

" misc
map <silent> <Space> :silent wa<CR>:echo "-- Saved All [" . strftime("%H:%M %a") . "] --"<CR>
map =z 1z=
map Q zt
imap <c-r><c-r> <c-r>"
map gp `[v`]

" open new empty lines
map <c-p> O<Esc>cc<Esc>
map <c-n> o<Esc>cc<Esc>

" insert mode cursor movement
inoremap <c-h> <Left>
inoremap <c-l> <Right>

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
nmap <F7> "+yiW:echo "-- WORD Yanked to Clipboard --"<CR>"

" yank file or selection to system clipboard
nmap <F8> gg"+yG<c-o><c-o>:echo "-- File Yanked to Clipboard --"<CR>
vmap <F8> "+y:echo "-- Selection Yanked to Clipboard --"<CR>

" put from system clipboard
nmap <F9> "+P
vmap <F9> "+P
imap <F9> <c-r>+

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

" ## refactoring and code manipulation mappings (<c-d>)

" copy line(s) to top of file
nmap <c-d>o :mark '<cr>:copy 1<cr>:echo "-- Line copied to top of file --"<cr>''
vmap <c-d>o :mark '<cr>gv:copy 1<cr>:echo "-- Line(s) copied to top of file --"<cr>''

" calendar
nmap <c-d>c !!cal<CR>

" par
nmap <c-d>p !!par<CR>
vmap <c-d>p !par<CR>

" sort
nmap <c-d>s vip!sort -n<CR>
vmap <c-d>s !sort -n<CR>

" unique
nmap <c-d>u :%!uniq<CR>
vmap <c-d>u !uniq<CR>

" dc
nmap <c-d>d yip}O<Esc>pvip!dc<CR>
vmap <c-d>d !dc<CR>

" bc
nmap <c-d>b !!bc<CR>
vmap <c-d>b !bc<CR>

" sparkup
nmap <c-d>k !!~/sparkup/sparkup<CR>
vmap <c-d>k !~/sparkup/sparkup<CR>

" format code in paragraph
nmap <silent> <c-d>f :mark '<CR>=ip''

" tidy json
nmap <c-d>a :%!python -mjson.tool<CR>
vmap <c-d>a :!python -mjson.tool<CR>

" tidy xml
nmap <c-d>x :Tidy<CR>
vmap <c-d>x :Tidy<CR>

" toggle wrap
nmap <c-d>w :set wrap! linebreak!<CR>

" toggle spell
nmap <c-d>l :set spell!<CR>

" insert datestamp
imap <c-d> <c-r>=ShortDate()<CR>
imap <c-y> <c-r>=LongDate()<CR>

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
vmap <c-d>n :!cat<space>-n<cr>gv:s/\v^<space>*//g<cr>gv:s/\v\t/<space>/g<cr>

" format a uri
nmap <c-d>i 0:s/[&?]/\r&<space>/g<CR>vipoj>\=k0

" navigate through logical sections of code
nmap ( ?`\\|'\\|"\\|[\\|(\\|{\\|\\<function\\>\\|\\<fn\\>\\|<<CR>
nmap ) /`\\|'\\|"\\|[\\|(\\|{\\|\\<function\\>\\|\\<fn\\>\\|<<CR>

" ## search and replace

" search-replace word in file
nmap <c-d>R :%s/\<<c-r><c-w>\>//gc<Left><Left><Left>

" search-replace selection in file
vmap <c-d>R y:%s/<c-r>"//gc<left><left><Left>

" search-replace word in paragraph
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

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
inoremap <expr><TAB> pumvisible() ? "\<CR>" : "\<TAB>"

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
let g:Powerline_symbols='fancy'

" command-t
nmap <c-t> :CommandT<CR>
set wildignore+=.git,*.class,*.war,**/OpenLayers-2.11/*,**/classes*

" # Filetype-specific settings

" all notes
nmap \o :e ~/Dropbox/all-notes.txt<CR>
nmap \O :e ~/Dropbox/all-notes.txt<CR>Gzv?^#<CR>0zt
nmap \w :e ~/Dropbox/work-log.md<CR>
autocmd! BufWritePost all-notes.txt silent !python2.7 ~/markdown-outline/transform.py -i ~/Dropbox/all-notes.txt -o ~/Dropbox/view-notes.html

" javascript
vmap <c-d>jc cconsole.log()<Esc>P^
nmap <c-d>jc ^Cconsole.log()<Esc>P^
nmap <c-d>jC ^Cconsole.log("<c-r>"")<Esc>^
nmap <c-d>jf vip!~/js-beautify/python/js-beautify --indent-size=2 -i<CR>
vmap <c-d>jf !~/js-beautify/python/js-beautify --indent-size=2 -i<CR>

" # Abbreviations

abbr teh the
abbr Teh The
