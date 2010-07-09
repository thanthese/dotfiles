" mac specific
" ============

" make it easier to hit an escape key
vmap <C-l> <Esc>
imap <C-l> <Esc>


" terminal-specific commands
" ==========================

" all about colors
"syntax on
"colorscheme darkblue
"set nocursorline

" execute current line or selection in screen (specific to terminal)
vmap <buffer> <silent> R y:SendToScreen <c-r>"<CR>
nmap <buffer> <silent> R ^v$hy:SendToScreen <c-r>"<CR>


" macvim-specific commands
" ========================

" set colors for macvim
com! FixColors colorscheme ir_black | set cursorline


" running tests
" =============
nmap <F6> :wa\|silent make<CR>
nmap T <F6>


" file and directory mappings
" ===========================

" shortcuts to various places
nmap \b :e ~/.bashrc<CR>
nmap \d :e ~/Desktop/<C-d>
nmap \f :e ~/.vim/ftplugin/
nmap \h :e ~/
nmap \i :e ~/interesting<CR>
nmap \j :e ~/WACM/journal.txt<CR>
nmap \r :e ~/scratch.txt<CR>
nmap \t :e ~/todo.txt<CR>
nmap \v :e ~/.vimrc<CR>
nmap \v1 :e ~/dotfiles/coreVimrc.vim<CR>
nmap \v2 :e ~/dotfiles/macVimrc.vim<CR>


" reStructured Text
" =================

" file rst blog post into html
com! FileRst w | norm :%!python2.5 /Users/thanthese/RstTools/rst2html-highlight
  \ --initial-header-level=3<CR>
  \ /class="document"<CR>vit"+y
  \u:echo "RST post filed into clipboard"<CR>

" insert code-block for RST
com! -nargs=1 InsertCodeBlockDirective norm o.. code-block:: <args><Esc>


" summing
" =======

" call Sum() on current selection
vmap <M-s> y:call Sum()<CR>

" sum column of numbers in yanked register, save result to " register
function! Sum()
python << EOF
import vim

# find total from input
items = vim.eval("@0").split("\n")
floatsList = map(float, filter(bool, items))
total = sum(floatsList)

# set register and echo result
vim.command("call setreg('\"', '%s\n')" % total)
vim.command("echo '%s saved to clipboard'" % total)
EOF
endfunction
