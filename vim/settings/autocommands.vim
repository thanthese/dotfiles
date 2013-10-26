" on save any: trim trailing whitespace
autocmd BufWritePre * :call StripTrailingWhitespaces()

" on save a .vim file: source file
autocmd! BufWritePost *.vim source %
