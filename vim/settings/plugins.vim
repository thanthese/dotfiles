" ========== vimwiki ==========" {{{

" set wiki location and extension
let g:vimwiki_list = [{
      \ 'path': '~/Dropbox/vimwiki/',
      \ 'ext': '.txt',
      \ 'template_path': '~/Dropbox/vimwiki_html/templates/',
      \ 'template_ext': '.html'}]

" use .txt extension
let g:vimwiki_global_ext = 0

" fold on headers
let g:vimwiki_folding='expr'

" bold and italics don't show up on the mac for some reason, so make them
" obvious
highlight VimwikiBold guifg=DarkKhaki
highlight VimwikiItalic guifg=goldenrod

" highlight fake tags
au BufEnter ~/Dropbox/vimwiki/*.txt hi bday guifg=darkgray
au BufEnter ~/Dropbox/vimwiki/*.txt syn match bday /#\w*/
au BufEnter ~/Dropbox/vimwiki/*.txt hi appt guifg=DarkKhaki
au BufEnter ~/Dropbox/vimwiki/*.txt syn match appt /#appt/

" local wiki settings
autocmd! BufReadPre ~/Dropbox/vimwiki/*.txt call SetupWiki()
function! SetupWiki()
  setlocal nowrap
  setlocal textwidth=78
endfun

" make agenda file read only
autocmd! BufEnter ~/Dropbox/vimwiki/tickler_agenda.txt setlocal nomodifiable

" sync agenda file automatically
autocmd! BufWritePost ~/Dropbox/vimwiki/tickler.txt
      \ silent !grep "\#\|___" ~/Dropbox/vimwiki/tickler.txt
      \ > ~/Dropbox/vimwiki/tickler_agenda.txt

" cooking: pull recipe ingredients into file
nmap <c-d><c-k> <cr>ggjyi=<c-^>Gpgp:v/^-/d<cr>''j

" quckly goto
nmap <c-d><c-d> :e ~/Dropbox/vimwiki/todo.txt<cr>
nmap <c-d>k :e ~/Dropbox/vimwiki/tickler.txt<cr>
nmap <c-d>a :e ~/Dropbox/vimwiki/tickler_agenda.txt<cr>

" pull today's (and missed days') tickler items into todo
nmap <c-d>u :call UpdateTodo()<cr>
function! UpdateTodo()
  silent exec "norm :e ~/Dropbox/vimwiki/todo.txt\<cr>"
  silent exec "norm _A DELETEKHSHE4W0anyISS\<esc>K"
  silent exec "norm :e ~/Dropbox/vimwiki/tickler.txt\<cr>"
  silent exec "norm gg?^\<c-r>=strftime(\"%y.%m.%d.%a\")\<cr>\<cr>"
  silent exec "norm dgg"
  silent exec "norm :e ~/Dropbox/vimwiki/todo.txt\<cr>ggP"
  silent exec "norm :g/___\\|DELETEKHSHE4W0anyISS/d\<cr>"
  silent exec "norm :wa\<cr>"
  exec "norm :echo \"Todo updated from tickler.\"\<cr>"
endfun

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

" }}}
" ========== speeddating ==========" {{{

autocmd VimEnter * SpeedDatingFormat %y.%m.%d.%a
nmap _ O<c-r>=strftime("%y.%m.%d.%a")<cr><esc>

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
" ========== vim-go ==========" {{{

au FileType go nmap <buffer> <Leader>ds <Plug>(go-def-split)
au FileType go nmap <buffer> <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <buffer> <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <buffer> <Leader>gd <Plug>(go-doc)
au FileType go nmap <buffer> <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <buffer> <Leader>i <Plug>(go-info)
au FileType go nmap <buffer> <leader>b <Plug>(go-build)
au FileType go nmap <buffer> <leader>r <Plug>(go-run)
au FileType go nmap <buffer> <leader>t <Plug>(go-test)
au FileType go nmap <buffer> gd <Plug>(go-def)

" }}}
" ========== expand region ==========" {{{

nmap <c-n> <Plug>(expand_region_expand)
vmap <c-p> <Plug>(expand_region_shrink)

" }}}
