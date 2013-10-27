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

" bold and italics don't show up on the mac for some reason, so make them obvious
highlight VimwikiBold guifg=DarkKhaki
highlight VimwikiItalic guifg=goldenrod

" on save a .vim file: source file
autocmd! BufReadPre *.wiki call Prose()

" }}}
" ========== shell ==========" {{{

" required, apparently because of the awkward way I installed macvim
let g:vimshell_editor_command="macvim"

" open shell quickly
nmap \v :VimShellBufferDir<CR>

" }}}
" ========== fuzzy finder ==========" {{{

" nmap <c-d><c-f> :FufCoverageFile<CR>
" nmap <c-d><c-b> :FufBuffer<CR>
" nmap <c-d><c-h> :FufHelp<CR>
" nmap <c-d><c-c> :FufChangeList<CR>
" nmap <c-d><c-l> :FufLine<CR>

" }}}
" ========== unite ==========" {{{

" " select a file from the current project
" nmap <c-d><c-f> :Unite -start-insert file_rec/async:!<CR>
" " consider -no-split option
"
" " select buffer
" nmap <c-d><c-b> :Unite -start-insert buffer<CR>
"
" " grep in current directory (note, not from .git root)
" nmap <c-d><c-g> :Unite grep:.<CR>
"
" use fuzzy matching
" call unite#filters#matcher_default#use(['matcher_fuzzy'])

" }}}
