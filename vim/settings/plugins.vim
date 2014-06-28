" ========== tabular ==========" {{{

nmap \: :Tabu /:<CR>
vmap \: :Tabu /:<CR>
nmap \" :Tabu /"<CR>
vmap \" :Tabu /"<CR>
nmap \= :Tabu /=<CR>
vmap \= :Tabu /=<CR>
nmap \| :Tabu /\|<CR>
vmap \| :Tabu /\|<CR>

" }}}
" ========== vimwiki ==========" {{{

" set wiki location and extension
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'ext': '.txt'}]

" use .txt extension
let g:vimwiki_global_ext = 0

" fold on headers
let g:vimwiki_folding='expr'

" easy toggle folds in wiki mode (tab is used for something else)
nmap ` za

" bold and italics don't show up on the mac for some reason, so make them
" obvious
highlight VimwikiBold guifg=DarkKhaki
highlight VimwikiItalic guifg=goldenrod

" highlight fake tags
au BufEnter ~/Dropbox/vimwiki/*.txt hi appt guifg=DarkKhaki
au BufEnter ~/Dropbox/vimwiki/*.txt syn match appt /#appt/
au BufEnter ~/Dropbox/vimwiki/*.txt hi bday guifg=darkgray
au BufEnter ~/Dropbox/vimwiki/*.txt syn match bday
      \ /#bday\|#holiday\|#anniversary\|#gizappt/

" local wiki settings
autocmd! BufReadPre ~/Dropbox/vimwiki/*.txt call SetupWiki()
function! SetupWiki()
  setlocal nowrap
  setlocal textwidth=78
endfun

" quckly goto
nmap <c-d>gt :e ~/Dropbox/vimwiki/todo.txt<cr>
nmap <c-d>gk :e ~/Dropbox/vimwiki/tickler.txt<cr>
nmap <c-d><c-d> :e ~/Dropbox/vimwiki/todo.txt<cr>
nmap <c-d>gK :wa<cr>:e ~/Dropbox/vimwiki/tickler_viz.txt<cr>:%!python ~/PycharmProjects/tickler_visualization/tickler_visualization.py ~/Dropbox/vimwiki/tickler.txt<cr>

" Moves task -- line(s) -- in default register to appropriate file depending
" on context (that is, on the current file).
function! SmartTaskMove()
  if(match(bufname("%"), "tickler.txt") > -1)
    silent exec "norm :e ~/Dropbox/vimwiki/todo.txt\<cr>"
    silent exec "norm ggP"
    silent exec "norm :b #\<cr>"
    exec "norm :echo \"Line(s) moved to todo.\"\<cr>"
  else
    silent exec "norm :e ~/Dropbox/vimwiki/tickler.txt\<cr>"
    silent exec "norm ggP"
    silent exec "norm :%!sort -n\<cr>"
    silent exec "norm :b #\<cr>"
    exec "norm :echo \"Line(s) moved to tickler.\"\<cr>"
  endif
endfun
vmap K d:call SmartTaskMove()<cr>
nmap K dd:call SmartTaskMove()<cr>

" workflowy-bump
nmap _ !!node ~/workflowy-bump/workflowy-bump.js terminal<cr>jddk0

" }}}
" ========== fugitive ==========" {{{

nmap \fs :Gstatus<cr>
nmap \fp :Git pull<cr>:Git push<cr>

" }}}
" ========== ctrlp ==========" {{{

nmap <c-d><c-f> :CtrlP<cr>
nmap <c-d><c-b> :CtrlPBuffer<cr>
nmap <c-d><c-m> :CtrlPMRU<cr>

" }}}
" ========== ack ==========" {{{

nmap \a :Ack <space>%:h<Left><Left><Left><Left>

" }}}
" ========== sneak ==========" {{{

" use smart case settings for case sensitivity
let g:sneak#use_ic_scs = 1

" use s for normal, two character sneak

" replace 'f' with inclusive 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
" replace 't' with exclusive 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

" }}}
" ========== unimpaired ==========" {{{

" moving lines around up
nmap <c-j> ]e
nmap <c-k> [e
vmap <c-k> [egv
vmap <c-j> ]egv

" adding blank lines
nmap <c-l> ]<space>
nmap <c-h> [<space>

" }}}
