" file and directory mappings
" ===========================

" shortcuts to various places
nmap \b :e ~/.bashrc<CR>
nmap \d :e ~/Desktop/<C-d>
nmap \h :e ~/
nmap \r :e ~/scratch.txt<CR>
nmap \o :e ~/all-notes.txt<CR>
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
