command! -range=% Tidy <line1>,<line2>!tidy
  \-xml
  \-quiet
  \-indent
  \--indent-attributes yes
  \--sort-attributes alpha
  \-wrap
  \--show-warnings no
