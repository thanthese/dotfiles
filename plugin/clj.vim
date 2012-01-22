" add surrounding ()
nmap <C-c>a %v%s)a
nmap <C-c><C-a> <C-c>a

" evaluate s-expr
nmap <C-c><C-v> %v%<C-c><C-c><Left>

" save/load current file
nmap <C-c>s :w<CR>:call Send_to_Tmux("(load-file \"<C-r>%\")\n")<CR><CR>
nmap <C-c><C-s> <C-c>s

" run tests
nmap <C-c>t :call Send_to_Tmux("(run-tests)\n")<CR>
nmap <C-c><C-t> <C-c>t

" THIS IS THE OMEGA COMMAND
" 1.  Save file.
" 2.  Load current file in repl.
" 3.  Run all tests under main namespace.
"     For example, if we're in namespace "a.b.c", run all tests in "a.*".
nmap <C-c>c <c-c>s:call Send_to_Tmux("(run-all-tests (re-pattern (str (re-find #\"^.*\\.\" (str (ns-name *ns*))) \"*\")))\n")<cr><cr>

" find documentation
nmap <C-c>D :call Doc_input()<CR>
nmap <C-c>d :call Doc("<C-r><C-w>")<CR>
nmap <C-c><C-d> <C-c>d
imap <C-c>d <Left><C-o><C-c>d<Right>
imap <C-c><C-d> <C-c>d

" add pretty print
nmap <C-c>p %v%s)aclojure.pprint/pprint <Esc>F(
nmap <C-c><C-p> <C-c>p

" show source
nmap <C-c>O :call Source_input()<CR>
nmap <C-c>o :call Source("<C-r><C-w>")<CR>
nmap <C-c><C-o> <C-c>o
imap <C-c>o <C-o><C-c>o
imap <C-c><C-o> <C-c>o

function! Doc_input()
  let s = input("clojure doc (fn name): ")
  call Doc(s)
endfunction

function! Doc(fn)
  call Send_to_Tmux("(clojure.repl/doc " . a:fn . ")\n")
endfunction

function! Source_input()
  let s = input("clojure source (fn name): ")
  call Source(s)
endfunction

function! Source(fn)
  call Send_to_Tmux("(clojure.repl/source " . a:fn . ")\n")
endfunction
