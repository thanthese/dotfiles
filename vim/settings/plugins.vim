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
      \ /#bday\|#holiday\|#bday\|#anniversary\|#gizappt/

" local wiki settings
autocmd! BufReadPre *.wiki call SetupWiki()
function! SetupWiki()
  setlocal nowrap
  setlocal textwidth=78
endfun

" easy toggle folds in wiki mode
nmap ` za

" move line(s) to todo.wiki
vmap <c-d>mt d
      \:e ~/vimwiki/todo.wiki<cr>
      \ggP
      \:b #<cr>
      \:echo "Line(s) moved to todo."<cr>
nmap <c-d>mt V<c-d>mt

" move line(s) to tickler.wiki and sort
vmap <c-d>mk d
      \:e ~/vimwiki/tickler.wiki<cr>
      \ggP
      \:%!sort -n<cr>
      \:b #<cr>
      \:echo "Line(s) moved to tickler."<cr>
nmap <c-d>mk V<c-d>mk

" easily (un)make list from visual selection
vmap - :s/^/- /<cr>
vmap _ :s/^- //<cr>

" quckly goto
nmap <c-d>gt :e ~/vimwiki/todo.wiki<cr>
nmap <c-d>gk :e ~/vimwiki/tickler.wiki<cr>
nmap <c-d><c-d> :e ~/vimwiki/todo.wiki<cr>

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

" }}}
" ========== ack ==========" {{{

nmap \a :Ack --all<space><space>%:h<Left><Left><Left><Left>

" }}}
" ========== sneak ==========" {{{

nnoremap f :Sneak! 1<cr>
nnoremap F :SneakBackward! 1<cr>
xnoremap f <esc>:<c-u>SneakV! 1<cr>
xnoremap F <esc>:<c-u>SneakVBackward! 1<cr>

" }}}
