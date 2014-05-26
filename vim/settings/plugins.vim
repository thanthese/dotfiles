" ========== netrw ==========" {{{

let g:netrw_preview   = 1   " preview vertically
let g:netrw_liststyle = 3   " default to a tree layout
let g:netrw_winsize   = 30  " default preview width: 30 cols

" }}}
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
" ========== vimux ==========" {{{

" prompt
nmap <c-c>p :VimuxPromptCommand<CR>

" run command
vmap <c-c><c-c> "zy :call VimuxRunCommand(@z)<CR>
nmap <c-c><c-c> vip<c-c><c-c>

" repeat last
nmap <c-c>r :call VimuxRunLastCommand()<CR>

" inspect
nmap <c-c>i :call VimuxInspectRunner()<CR>

" close
nmap <c-c>c :call VimuxCloseRunner()<CR>

" break (interrupt running process)
"
nmap <c-c>b :call VimuxInterruptRunner()<CR>

" window settings
"let g:VimuxOrientation = "h"
"let g:VimuxHeight = "40"

" }}}
" ========== wiki ==========" {{{

" fold on headers
let g:vimwiki_folding='expr'

" bold and italics don't show up on the mac for some reason, so make them
" obvious
highlight VimwikiBold guifg=DarkKhaki
highlight VimwikiItalic guifg=goldenrod

" highlight fake tags
au BufEnter *.wiki hi appt guifg=DarkKhaki
au BufEnter *.wiki syn match appt /#appt/
au BufEnter *.wiki hi bday guifg=darkgray
au BufEnter *.wiki syn match bday
      \ /#bday\|#holiday\|#anniversary\|#gizappt/

" local wiki settings
autocmd! BufReadPre *.wiki call SetupWiki()
function! SetupWiki()
  setlocal nowrap
  setlocal textwidth=78
endfun

" easy toggle folds in wiki mode
nmap ` za

" easily (un)make list from visual selection
vmap - :s/^/- /<cr>
vmap _ :s/^- //<cr>

" Moves task -- line(s) -- in default register to appropriate file depending
" on context (that is, on the current file).
function! SmartTaskMove()
  if(match(bufname("%"), "tickler.wiki") > -1)
    silent exec "norm :e ~/vimwiki/todo.wiki\<cr>"
    silent exec "norm ggP"
    silent exec "norm :b #\<cr>"
    exec "norm :echo \"Line(s) moved to todo.\"\<cr>"
  else
    silent exec "norm :e ~/vimwiki/tickler.wiki\<cr>"
    silent exec "norm ggP"
    silent exec "norm :%!sort -n\<cr>"
    silent exec "norm :b #\<cr>"
    exec "norm :echo \"Line(s) moved to tickler.\"\<cr>"
  endif
endfun
vmap K d:call SmartTaskMove()<cr>
nmap K dd:call SmartTaskMove()<cr>

" quckly goto
nmap <c-d>gt :e ~/vimwiki/todo.wiki<cr>
nmap <c-d>gk :e ~/vimwiki/tickler.wiki<cr>
nmap <c-d><c-d> :e ~/vimwiki/todo.wiki<cr>
nmap <c-d>gK :wa<cr>:e ~/vimwiki/tickler_viz.wiki<cr>:%!python ~/PycharmProjects/tickler_visualization/tickler_visualization.py ~/vimwiki/tickler.wiki<cr>

" }}}
" ========== shell ==========" {{{

" required, apparently because of the awkward way I installed macvim
let g:vimshell_editor_command="macvim"

" open shell quickly
nmap \v :VimShellBufferDir<CR>

" }}}
" ========== fugitive ==========" {{{

nmap \fs :Gstatus<cr>
nmap \fp :Git pull<cr>:Git push<cr>

" }}}
" ========== ctrlp ==========" {{{

let g:ctrlp_extensions = ['line']
" let g:ctrlp_cmd = 'CtrlPMixed'

" convenience mappings
nmap <c-d><c-f> :CtrlP<cr>
" alias: alt-b
nmap ∫ :CtrlPBuffer<cr>
nmap <c-d><c-b> :CtrlPBuffer<cr>
nmap <c-d><c-m> :CtrlPMRU<cr>
" alias: alt-m
nmap µ :CtrlPMRU<cr>

" }}}
" ========== ack ==========" {{{

nmap \a :Ack <space><space>%:h<Left><Left><Left><Left>

" }}}
" ========== sneak ==========" {{{

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

" use smart case settings for case sensitivity
let g:sneak#use_ic_scs = 1

" }}}
" multi-cursors{{{

" let g:multi_cursor_exit_from_insert_mode = 0

" }}}
