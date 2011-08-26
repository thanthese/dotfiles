colorscheme ir_black

" file and directory mappings
" ===========================

" shortcuts to various places
nmap \b :e ~/.bashrc<CR>
nmap \d :e ~/Desktop/<C-d>
nmap \h :e ~/
nmap \o :e ~/Dropbox/all-notes.txt<CR>
nmap \r :e ~/scratch.txt<CR>
nmap \v1 :e ~/dotfiles/vimrc-core.vim<CR>
nmap \v2 :e ~/dotfiles/vimrc-mac.vim<CR>
nmap \v :e ~/.vimrc<CR>
nmap \vs :so ~/.vimrc<CR>

" notes file
" ==========

autocmd! BufWritePost all-notes.txt silent !python2.7 ~/markdown-outline/transform.py -i ~/Dropbox/all-notes.txt -o ~/Dropbox/view-notes.html


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" clojure-specific
""

nmap KD :call Clojure_lookup_doc()<CR>
nmap KS :call Clojure_lookup_source()<CR>
nmap KF :call Clojure_finddoc()<CR>
nmap KT :call Clojure_run_all_tests()<CR>

nmap Ka v%s)a

function! Clojure_lookup_doc()
  let doc = input("clojure lookup doc: ")
  call Send_to_Screen("(doc " . doc . ")\n")
endfunction

function! Clojure_lookup_source()
  let source = input("clojure lookup source: ")
  call Send_to_Screen("(source " . source . ")\n")
endfunction

function! Clojure_finddoc()
  let find_doc = input("clojure find doc: ")
  call Send_to_Screen("(find-doc \"" . find_doc . "\")\n")
endfunction

function! Clojure_run_all_tests()
  call Send_to_Screen("(run-tests)\n")
endfunction
