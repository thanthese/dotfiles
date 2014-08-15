" ========== vanity mappings ========== {{{

" save
nmap <Space> :wa<CR>

" play macro
nmap Q @q

" insert default register
imap <c-r><c-r> <c-r>"

" correct spelling of last misselled word
inoremap <c-s> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <c-s> [s1z=``

" quick toggle buffers
nnoremap <bs> <c-^>

" select whatever was just pasted
nnoremap gp `[v`]

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
nmap <c-d>yw "+yiW:echo "-- WORD Yanked to Clipboard --"<CR>

" yank line to clipboard
nmap <c-d>yy 0v$h"+y:echo "-- Line Yanked to Clipboard --"<CR>

" yank all (file) to system clipboard
nmap <c-d>ya gg"+yG<c-o><c-o>:echo "-- File Yanked to Clipboard --"<CR>

" yank selection to system clipboard
vmap <c-d>ys "+y:echo "-- Selection Yanked to Clipboard --"<CR>

" put from system clipboard
nmap <c-d>yp "+P
vmap <c-d>yp "+P
imap <c-d>yp <c-r>+

" }}}
" ========== system commands ========== {{{

" sort
nmap <c-d>cs vip!sort -n<CR>
vmap <c-d>cs !sort -n<CR>

" generate password
nmap <c-d>cp :r!pwgen -scny 20 1<CR>

" execute current line as on shell prompt
nmap <c-d>ch yyp!!sh<cr>k

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

" smart sum
vnoremap <c-d>0 !smart_sum<cr>
nnoremap <c-d>0 !!smart_sum<cr>

" }}}
" ========== search and replace ========== {{{

" search-replace word-under-cursor in file
nmap <c-d><c-r> :%s/\<<c-r><c-w>\>//gc<Left><Left><Left>

" search-replace selection in file
vmap <c-d><c-r> y:%s/<c-r>"//gc<left><left><Left>

" }}}
