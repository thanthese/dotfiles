" ========== vanity mappings ========== {{{

" quick save
nmap <Space> :wa<CR>

" quickly insert default register
imap <c-r><c-r> <c-r>"

" quick macro access
nmap Q @q

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
inoremap <c-s> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <c-s> [s1z=``

" git save: push current repository to remote git
nmap \gs :wa<CR>
  \:!cd %:h;
  \pwd;
  \git add --all;
  \git commit -m "$(date)";
  \git pull;
  \git push;
  \git status<CR>

" git commit: commit current repository
nmap \gc :wa<CR>
  \:!cd %:h;
  \pwd;
  \git add --all;
  \git commit -m "$(date)";
  \git status<CR>

" moving lines around up
nnoremap ˚ ddkP
nnoremap ∆ ddp
vnoremap ˚ dkP'[V']
vnoremap ∆ dp'[V']

" adding blank lines above (alt-h) and below (alt-l)
nmap ˙ O<esc>cc<esc>
nmap ¬ o<esc>cc<esc>

" clear current line (alt-c)
nmap ç cc<esc>

" alternative to macros for a selection
vmap , :norm<space>

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

" run line directly through the shell as a command
nmap <c-d>ch yyp!!sh<cr>k

" workflowy-bump
nmap _ !!node ~/workflowy-bump/workflowy-bump.js terminal<cr>jddk0

" }}}
" ========== vim settings ========== {{{

" turn off highlight search
nnoremap ÷ :nohl<cr>

" toggle spell
nmap <c-d>ss :setlocal spell!<CR>

" toggle wrap
nmap <c-d>sw :setlocal wrap! linebreak!<CR>

" toggle prose
nmap <c-d>sp :setlocal spell! wrap! linebreak!<CR>

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
" ========== poor man's seek ========== {{{

nmap fa /a<cr>
nmap fb /b<cr>
nmap fc /c<cr>
nmap fd /d<cr>
nmap fe /e<cr>
nmap ff /f<cr>
nmap fg /g<cr>
nmap fh /h<cr>
nmap fi /i<cr>
nmap fj /j<cr>
nmap fk /k<cr>
nmap fl /l<cr>
nmap fm /m<cr>
nmap fn /n<cr>
nmap fo /o<cr>
nmap fp /p<cr>
nmap fq /q<cr>
nmap fr /r<cr>
nmap fs /s<cr>
nmap ft /t<cr>
nmap fu /u<cr>
nmap fv /v<cr>
nmap fw /w<cr>
nmap fx /x<cr>
nmap fy /y<cr>
nmap fz /z<cr>
nmap fA /A<cr>
nmap fB /B<cr>
nmap fC /C<cr>
nmap fD /D<cr>
nmap fE /E<cr>
nmap fF /F<cr>
nmap fG /G<cr>
nmap fH /H<cr>
nmap fI /I<cr>
nmap fJ /J<cr>
nmap fK /K<cr>
nmap fL /L<cr>
nmap fM /M<cr>
nmap fN /N<cr>
nmap fO /O<cr>
nmap fP /P<cr>
nmap fQ /Q<cr>
nmap fR /R<cr>
nmap fS /S<cr>
nmap fT /T<cr>
nmap fU /U<cr>
nmap fV /V<cr>
nmap fW /W<cr>
nmap fX /X<cr>
nmap fY /Y<cr>
nmap fZ /Z<cr>
nmap f1 /1<cr>
nmap f2 /2<cr>
nmap f3 /3<cr>
nmap f4 /4<cr>
nmap f5 /5<cr>
nmap f6 /6<cr>
nmap f7 /7<cr>
nmap f8 /8<cr>
nmap f9 /9<cr>
nmap f0 /0<cr>

" }}}
