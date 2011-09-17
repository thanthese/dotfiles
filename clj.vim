nmap <C-c>d :call Clojure_finddoc()<CR>
nmap <C-c>D :call Clojure_finddoc(<C-r><C-w>)<CR>
nmap <C-c>t :call Clojure_run_all_tests()<CR>

" add or remove surrounding ()
nmap <C-c>a v%s)a
nmap <C-c>d ds)

function! Clojure_finddoc()
  let find_doc = input("clojure find doc: ")
  call Send_to_Tmux("(find-doc \"" . find_doc . "\")\n")
endfunction

function! Clojure_run_all_tests()
  call Send_to_Tmux("(run-tests)\n")
endfunction
