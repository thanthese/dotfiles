command! -range=% Tidy <line1>,<line2>!tidy
  \-xml
  \-quiet
  \-indent
  \--indent-attributes yes
  \--sort-attributes alpha
  \-wrap
  \--show-warnings no

" makes the selection (or the current line) title case (from lower case)
command! -range TitleCase <line1>,<line2>s/\<./\u&/g<bar>nohl

" change hard wrap to soft wrap
" src: http://stackoverflow.com/questions/5651454/vim-join-all-lines-in-paragraph
command! MergeLines v#\v^\s*$#.,//-1 join
