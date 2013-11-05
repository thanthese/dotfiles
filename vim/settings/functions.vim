function! ShortDay(longDay)
  if a:longDay == "Mon" | return "m" | endif
  if a:longDay == "Tue" | return "t" | endif
  if a:longDay == "Wed" | return "w" | endif
  if a:longDay == "Thu" | return "r" | endif
  if a:longDay == "Fri" | return "f" | endif
  if a:longDay == "Sat" | return "s" | endif
  if a:longDay == "Sun" | return "u" | endif
  return "-- Invalid Day Format '" . longDay . "'. --"
endfunction

function! ShortDate()
  return "[" . tolower(strftime("%b%d")) . ShortDay(strftime("%a")) . "]"
endfunction

function! LongDate()
  return "[" . tolower(strftime("'%y%b%d")) . ShortDay(strftime("%a")) . "]"
endfunction

function! StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" setup current buffer for writing prose
function! Prose()
  setlocal nowrap
  setlocal linebreak
  setlocal textwidth=72
  setlocal spell
  setlocal fo+=a
endfun
