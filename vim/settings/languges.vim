" go{{{

" opt-r to run
autocmd FileType go nmap ® :wa<cr>:!go run %<cr>

" format on save
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" set how to view tabs
autocmd FileType go autocmd BufEnter <buffer> :setlocal ts=2

" }}}
" python{{{

" opt-r to run
autocmd FileType python nmap ® :wa<cr>:!python %<cr>

" }}}
