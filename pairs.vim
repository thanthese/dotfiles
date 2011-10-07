""
" An extremely simple paredit for vim.
"
" Usage:
"   Inserting (), [], {}, and \"\" should work just as you expect.
"
"   Double '', ``, "" to add pair: "|"
"
"   Delete empty pair two ways: "|" or ""|
"
" inspiration: http://vim.wikia.com/wiki/Automatically_append_closing_characters
"

" insert easy pairs
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap {<CR> {<CR>}<C-o>O

" smart close easy pairs
inoremap <expr> ) Right(1) == ")" ? "\<Right>" : ")"
inoremap <expr> ] Right(1) == "]" ? "\<Right>" : "]"
inoremap <expr> } Right(1) == "}" ? "\<Right>" : "}"

" insert trouble pairs
inoremap '' ''<Left>
inoremap `` ``<Left>
inoremap "" ""<Left>

" smart close trouble pairs
inoremap <expr> ' Right(1) == "'" ? "\<Right>" : "'"
inoremap <expr> ` Right(1) == "`" ? "\<Right>" : "`"
inoremap <expr> " Right(1) == "\"" ? "\<Right>" : "\""

" insert or smart close hardest pair (\"\")
inoremap <expr> \" Right(2) == "\\\"" ? "\<Right>\<Right>" : "\\\"\\\"\<left><left>"

" smart backspace
imap <expr> <Backspace> SmartBackspace()
function! SmartBackspace()
  " example: delete "|"
  if IsPair(Left(1,2))
    return "\<Delete>\<Backspace>"
  endif

  " example: delete ""|
  if IsPair(Left(2,2))
    return "\<Backspace>\<Backspace>"
  endif

  return "\<Backspace>"
endfunction
function! IsPair(pair)
  return a:pair == "()" || a:pair == "[]" || a:pair == "{}" || a:pair == "''" || a:pair == "``" || a:pair == "\"\""
endfunction

" get count chars right of the cursor
function! Right(count)
  return strpart(getline('.'), col('.')-1, a:count)
endfunction

" get count chars left of the cursor less the offset
function! Left(offset, count)
  return strpart(getline('.'), col('.')-a:offset-1, a:count)
endfunction
