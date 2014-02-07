" go{{{

nmap <c-r> :wa<cr>:!go run %<cr>

autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd FileType go autocmd BufRead,BufNew <buffer> :setlocal ts=2

" }}}
