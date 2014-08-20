" use markers, {{{ and }}}
set foldmethod=marker

" no C-style comments
set commentstring=

" so I don't need to zR all the time, hopefully
set foldlevel=1

" toggle folds easily
nmap ` za

" add fold text objects
xnoremap az :<C-U>silent!normal![zV]z<CR>
onoremap az :normal viz<CR>

" simplify what displays on folded lines
set fillchars="fold: "
set foldtext=FoldText()
function! FoldText()
  return substitute(getline(v:foldstart), '{{{', '{…}', '')
endfunction
