" use markers
set foldmethod=marker

" no C-style comments
set commentstring=

" toggle folds easily
nmap <tab> za

" add fold text objects
xnoremap az :<C-U>silent!normal![zV]z<CR>
onoremap az :normal viz<CR>

" simplify what displays on folded lines
set fillchars="fold: "
set foldtext=FoldText()
function! FoldText()
  return substitute(getline(v:foldstart), '{{{', '{…}', '')
endfunction
