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
