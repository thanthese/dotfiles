" find documentation
nmap <C-c>D :call Doc_input()<CR>
nmap <C-c>d :call Doc("<C-r><C-w>")<CR>
nmap <C-c><C-d> <C-c>d
imap <C-c>d <C-o><C-c>d
imap <C-c><C-d> <C-c>d

" show source
nmap <C-c>S :call Source_input()<CR>
nmap <C-c>s :call Source("<C-r><C-w>")<CR>
nmap <C-c><C-s> <C-c>s
imap <C-c>s <C-o><C-c>s
imap <C-c><C-s> <C-c>s

" search-replace, whole word
nmap <C-c>R :%s/\<<C-r><C-w>\>//g<Left><Left>
nmap <C-c>r yiwvip:s/\<<C-r>"\>//g<Left><Left>
nmap <C-c><C-r> <C-c>r

" load current file
nmap <C-c>l :w<CR>:call Load_current_file("<C-r>%")<CR>
nmap <C-c><C-l> <C-c>l

" add surrounding ()
nmap <C-c>a %v%s)a
nmap <C-c><C-a> <C-c>a

" run tests
nmap <C-c>t :call Run_all_tests()<CR>
nmap <C-c><C-t> <C-c>t

function! Doc_input()
  let s = input("clojure doc (fn name): ")
  call Doc(s)
endfunction

function! Doc(fn)
  call Send_to_Tmux("(doc " . a:fn . ")\n")
endfunction

function! Source_input()
  let s = input("clojure source (fn name): ")
  call Source(s)
endfunction

function! Source(fn)
  call Send_to_Tmux("(clojure.repl/source " . a:fn . ")\n")
endfunction

function! Run_all_tests()
  call Send_to_Tmux("(run-tests)\n")
endfunction

function! Load_current_file(filename)
  call Send_to_Tmux("(load-file \"" . a:filename . "\")\n")
endfunction
