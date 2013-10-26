" ========== vanity mappings ========== {{{

" quick save
nmap <Space> :wa<CR>

" quickly insert default register
imap <c-r><c-r> <c-r>"

" quick move current line to top of screen
nmap Q zt

" select whatever was just pasted
map gp `[v`]

" basic emacs in insert mode
inoremap <c-b> <Left>
inoremap <c-f> <Right>
inoremap <c-a> <Home>
inoremap <c-e> <End>

" whitespace visual surrounds
vmap s<Space> <Esc>'>a<Space><Esc>'<i<Space><Esc>
vmap s<CR> <Esc>'>a<cr><Esc>'<i<cr><Esc>

" correct spelling of last misselled word
imap <c-;> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-;> [s1z=`]

" git save: push current repository to remote git
nmap \gs :wa<CR>
  \:!cd %:h
  \&& git pull
  \&& git add --all
  \&& git commit -m "$(date)"
  \&& git push
  \&& git status<CR>

" moving lines around
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" }}}
" ========== make keys work as expected ========== {{{

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

" goto file opens vertical fold
map <c-w><c-f> <c-w><c-o>:vertical wincmd f<CR>

" }}}
" ========== clipboard ========== {{{

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

" }}}
" ========== windows ========== {{{

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

" }}}
" ========== system commands ========== {{{

" calendar
nmap <c-d>cc !!cal<CR>

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

" generate password
nmap <c-d>cp :r!pwgen -scny 20 1<CR>

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

" }}}
" ========== vim settings ========== {{{

" toggle spell
nmap <c-d>ss :set spell!<CR>

" toggle wrap
nmap <c-d>sw :set wrap! linebreak!<CR>

" toggle prose
nmap <c-d>sp :set spell! wrap! linebreak!<CR>

" }}}
" ========== search and replace ========== {{{

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

" }}}
