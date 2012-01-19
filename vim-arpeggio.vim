" # all-notes.txt

" insert dates
au! BufRead,BufNewFile all-notes.txt Arpeggio inoremap df <c-r>=ShortDate()<CR>
au! BufRead,BufNewFile all-notes.txt Arpeggio inoremap dy <c-r>=LongDate()<CR>
au! BufRead,BufNewFile all-notes.txt Arpeggio nnoremap df I<c-r>=ShortDate()<cr><space><esc>
au! BufRead,BufNewFile all-notes.txt Arpeggio nnoremap dy I<c-r>=LongDate()<cr><space><esc>

" # javascript

au! filetype javascript Arpeggio inoremap fn function<space>
au! filetype javascript Arpeggio inoremap re return<space>

" # clojure

" add/remove let
au! filetype clojure Arpeggio imap lt let [
au! filetype clojure Arpeggio nmap lt %v%s)alet<space>[]<space><left><left>
au! filetype clojure Arpeggio nmap dl ds(d%x

" move an s-expr
au! filetype clojure Arpeggio nmap sh %d%hhv%pllP%hh%
au! filetype clojure Arpeggio nmap sl %d%lv%p%hPll

" move an atom
au! filetype clojure Arpeggio nmap ah diWBPa<space><esc>ElxBB
au! filetype clojure Arpeggio nmap al diWWWPa<space><esc>BBXW
