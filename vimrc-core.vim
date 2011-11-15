""
" Stephen Mann
"
" Contains system-independent vim settings.
"

" # shortcut prefix conventions
" - \     : navigation, aka shortcuts-to-files
" - <C-k> : run a command that will have an effect on the code
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
highlight ColorColumn guibg=#111111 ctermbg=LightGrey
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
nnoremap z== 1z=
nnoremap <silent> <Space> :silent wa<CR>:echo "-- Saved All [" . strftime("%H:%M %a") . "] --"<CR>
nnoremap <CR> o<Esc>

" insert mode cursor movement
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" whitespace visual surrounds
vmap s<Space> <Esc>'>a<Space><Esc>'<i<Space><Esc>
vmap s<CR> <Esc>'>o<Esc>'<O<Esc>j

" ## make keys work as expected

" search on visual mode
vnoremap <silent> * y:/<C-r>"<CR>
vnoremap <silent> # y:?<C-r>"<CR>

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
nmap <F8> gg"+yG<C-o><C-o>:echo "-- File Yanked to Clipboard --"<CR>
vmap <F8> "+y:echo "-- Selection Yanked to Clipboard --"<CR>

" put from system clipboard
nmap <F9> "+P
vmap <F9> "+P
imap <F9> <C-r>+

" ## windows

" switch window
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" resize window
nmap <C-Up>    <C-W>-
nmap <C-Down>  <C-W>+
nmap <C-Left>  <C-W><
nmap <C-Right> <C-W>>

" ## refactoring and code manipulation mappings (<C-k>)

" par
nmap <C-k>p !!par<CR>
vmap <C-k>p !par<CR>

" sort
nmap <C-k>s :%!sort<CR>
vmap <C-k>s !sort<CR>

" unique
nmap <C-k>u :%!uniq<CR>
vmap <C-k>u !uniq<CR>

" dc
nmap <C-k>d yip}O<Esc>pvip!dc<CR>
vmap <C-k>d !dc<CR>

" bc
nmap <C-k>b !!bc<CR>
vmap <C-k>b !bc<CR>

" sparkup
nmap <C-k>k !!~/sparkup/sparkup<CR>
vmap <C-k>k !~/sparkup/sparkup<CR>

" format code in paragraph
nmap <silent> <C-k>f :mark '<CR>=ip<CR>''

" tidy xml
nmap <C-k>t :Tidy<CR>
vmap <C-k>t :Tidy<CR>

" tidy json
nmap <C-k>j :%!python -mjson.tool<CR>
vmap <C-k>j :!python -mjson.tool<CR>

" toggle wrap
nmap <C-k>w :set wrap! linebreak!<CR>

" toggle spell
nmap <C-k>l :set spell!<CR>

" insert datestamp
imap <C-d> <C-r>=ShortDate()<CR>
imap <C-y> <C-r>=LongDate()<CR>

" sum column
vmap <C-k>1 !awk '{s+=$1}END{print s}'<CR>
vmap <C-k>2 !awk '{s+=$2}END{print s}'<CR>
vmap <C-k>3 !awk '{s+=$3}END{print s}'<CR>
vmap <C-k>4 !awk '{s+=$4}END{print s}'<CR>
vmap <C-k>5 !awk '{s+=$5}END{print s}'<CR>
nmap <C-k>1 vip<C-k>1
nmap <C-k>2 vip<C-k>2
nmap <C-k>3 vip<C-k>3
nmap <C-k>4 vip<C-k>4
nmap <C-k>5 vip<C-k>5

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
nmap <C-k><C-f> :FufCoverageFile<CR>
nmap <C-k><C-b> :FufBuffer<CR>
nmap <C-k><C-h> :FufHelp<CR>
nmap <C-k><C-c> :FufChangeList<CR>
nmap <C-k>/ :FufLine<CR>

" bufexplorer
nmap \\ \be

" command-t
nmap <C-t> :CommandT<CR>
set wildignore+=.git,test/**,*.class,*.war,lib/**,**/GeoExt/*,**/OpenLayers-2.11/*,**/ext-3.2.1/*,**/ext-3.4.0/*,**/ext-4.0.2a/*,**/classes*

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
imap <C-k>jf function
imap <C-k>jc console.log()<Left>
vmap <C-k>jc cconsole.log()<Esc>P^
nmap <C-k>jc ^Cconsole.log()<Esc>P^
nmap <C-k>jf vip!~/js-beautify/python/js-beautify --indent-size=2 -i<CR>
vmap <C-k>jf !~/js-beautify/python/js-beautify --indent-size=2 -i<CR>

" markdown
au BufRead,BufNewFile *.md hi shyDate guifg=#555555 ctermfg=DarkGray
au BufRead,BufNewFile *.md syn match shyDate /\[.*\]/

" # General abbreviations

abbr teh the
abbr Teh The
