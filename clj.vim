" find documentation
nmap <C-c>D :call Doc_input()<CR>
nmap <C-c>d :call Doc("<C-r><C-w>")<CR>
imap <C-c>d <C-o><C-c>f

" search-replace
nmap <C-c>R :%s/\<<C-r><C-w>\>//g<Left><Left>
nmap <C-c>r yiwvip:s/\<<C-r>"\>//g<Left><Left>

" add surrounding ()
nmap <C-c>a %v%s)a

" run tests
nmap <C-c>t :call Run_all_tests()<CR>

function! Doc_input()
  let s = input("clojure doc (fn name): ")
  call Doc(s)
endfunction

function! Doc(fn)
  call Send_to_Tmux("(doc " . a:fn . ")\n")
endfunction

function! Run_all_tests()
  call Send_to_Tmux("(run-tests)\n")
endfunction
