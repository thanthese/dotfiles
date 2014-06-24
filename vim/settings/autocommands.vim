" on save any: trim trailing whitespace
autocmd BufWritePre * :call StripTrailingWhitespaces()
function! StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" on save a .vim file: source file
autocmd! BufWritePost *.vim source %
