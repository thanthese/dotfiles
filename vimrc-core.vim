""
" Stephen Mann
"
" Contains system-independent vim settings.
"

" # shortcut prefix conventions
" - \     : navigation, aka shortcuts-to-files
" - <c-d> : run a command that will have an effect on the code
" - <C-c> : filetype/tslime-specific
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
autocmd! BufWrite * mark ` | silent! %s/\s\+$// | norm ``

" on save a .vim file: source file
autocmd! BufWritePost *.vim source %

" highlight matches of word under cursor
autocmd CursorMoved * silent! exe printf('match StatusLine /\<%s\>/', expand('<cword>'))

" # Helpful mappings

" vanity mappings
map <silent> <Space> :silent wa<CR>:echo "-- Saved All [" . strftime("%H:%M %a") . "] --"<CR>
map <CR> :
map <c-j> <Esc>
map =z 1z=

" line navigation
map H 0
map L $

" open new lines
map <c-p> O<Esc>
map <c-n> o<Esc>

" insert mode cursor movement
inoremap <c-h> <Left>
inoremap <c-l> <Right>

" whitespace visual surrounds
vmap s<Space> <Esc>'>a<Space><Esc>'<i<Space><Esc>
vmap s<CR> <Esc>'>o<Esc>'<O<Esc>j

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

" yank to system clipboard
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

" par
nmap <c-d>p !!par<CR>
vmap <c-d>p !par<CR>

" sort
nmap <c-d>s :%!sort<CR>
vmap <c-d>s !sort<CR>

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

" search-replace, whole word
nmap <c-d>R :%s/\<<c-r><c-w>\>//g<Left><Left>
nmap <c-d>r yiwvip:s/\<<c-r>"\>//g<Left><Left>
vmap <c-d>r yvip:s/<c-r>"//g<Left><Left>

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
  return "[" . ShortDay(strftime("%a")) . tolower(strftime("%d%b")) . "]"
endfunction

function! LongDate()
  return "[" . ShortDay(strftime("%a")) . tolower(strftime("%d%b'%y")) . "]"
endfunction

" # Plugin-specific settings

" fuzzy finder
nmap <c-d><c-f> :FufCoverageFile<CR>
nmap <c-d><c-b> :FufBuffer<CR>
nmap <c-d><c-h> :FufHelp<CR>
nmap <c-d><c-c> :FufChangeList<CR>
nmap <c-d>/ :FufLine<CR>

" bufexplorer
nmap \\ \be

" command-t
nmap <c-t> :CommandT<CR>
set wildignore+=.git,*.class,*.war,**/OpenLayers-2.11/*,**/classes*

" ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nmap \a :Ack<Space>
nmap \aa :Ack<Space>

" fugitive
nmap \gs :Gstatus<CR>
nmap \gd :Gdiff<CR>
nmap \gc :Gcommit<CR>

" # Filetype-specific settings

" javascript
vmap <c-d>jc cconsole.log()<Esc>P^
nmap <c-d>jc ^Cconsole.log()<Esc>P^
nmap <c-d>jC ^Cconsole.log("<c-r>"")<Esc>^
nmap <c-d>jf vip!~/js-beautify/python/js-beautify --indent-size=2 -i<CR>
vmap <c-d>jf !~/js-beautify/python/js-beautify --indent-size=2 -i<CR>

" markdown
au BufRead,BufNewFile *.md hi shyDate guifg=#555555 ctermfg=DarkGray
au BufRead,BufNewFile *.md syn match shyDate /\[.*\]/

" # General abbreviations

abbr teh the
abbr Teh The
