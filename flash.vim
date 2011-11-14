" Flash card program written to be used inside of vim.  This "program"
" operates directly on its data structures.

" Make "database" entry.
"
" Before:
" |a = b
"
" After:
" 0 a = b
" 0 b = a
" |
au BufRead,BufNewFile *.flash nmap M I0<Space><Esc>yypwdt=wv$hpBBPa<Space><Esc>0j:echo "Entry made"<CR>

" Show answer
au BufRead,BufNewFile *.flash nmap H :silent! %s/\[//<CR>:silent! %s/\]//<CR>gg:echo "All answers shown."<CR>
au BufRead,BufNewFile *.flash nmap <Left> :silent! s/\[//<CR>:silent! s/\]//<CR>:echo "Answer shown."<CR>

" Hide answer
au BufRead,BufNewFile *.flash nmap L H:silent! %s/= /= [/<CR>:silent! %s/$/]/<CR>gg:echo "All answers hidden."<CR>
au BufRead,BufNewFile *.flash nmap <Right> <Left>:silent! s/= /= [/<CR>:silent! s/$/]/<CR>:echo "Answer hidden."<CR>

" Mark right or wrong, and hide answer
au BufRead,BufNewFile *.flash nmap <Up> 1<C-a>0<Right>j:echo "Right"<CR>
au BufRead,BufNewFile *.flash nmap <Down> 2<C-x>0<Right>j:echo "Wrong"<CR>

" Shuffle
au BufRead,BufNewFile *.flash nmap S :g/^$/d<CR>L:%!sort -n<CR><Esc>gg:echo "Shuffle"<CR>

" hide answers color scheme
au BufRead,BufNewFile *.flash hi shyAnswer guifg=#000000 ctermfg=Black
au BufRead,BufNewFile *.flash syn match shyAnswer /\[.*\]/

" hide score color scheme
au BufRead,BufNewFile *.flash hi shyScore guifg=#222222 ctermfg=LightGrey
au BufRead,BufNewFile *.flash syn match shyScore /^-\?\d*/
au BufRead,BufNewFile *.flash set nocursorline
