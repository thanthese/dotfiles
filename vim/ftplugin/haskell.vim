" load current file
nmap <f5> :w<cr><c-c>p:load <c-r>%<cr>

" lint file
nmap <f6> :w<cr>:!~/.cabal/bin/hlint %<cr>

" print type under cursor
nmap <f7> yiw:w<cr>k:r!ghc -e ":i <c-r>"" %<cr>
