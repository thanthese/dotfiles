" find documentation
nmap <C-c>F :call Finddoc_input()<CR>
nmap <C-c>f :call Finddoc("<C-r><C-w>")<CR>
imap <C-c>f <C-o><C-c>f

" search-replace
nmap <C-c>R :%s/<C-r><C-w>//g<Left><Left>
nmap <C-c>r yiwvip:s/<C-r>"//g<Left><Left>

" add surrounding ()
nmap <C-c>a %v%s)a

" run tests
nmap <C-c>t :call Run_all_tests()<CR>

" # functions

function! Finddoc_input()
  let find_doc = input("clojure find doc: ")
  call Finddoc(find_doc)
endfunction

function! Finddoc(term)
  call Send_to_Tmux("(find-doc \"" . a:term . "\")\n")
endfunction

function! Run_all_tests()
  call Send_to_Tmux("(run-tests)\n")
endfunction
