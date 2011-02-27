" file and directory mappings
" ===========================

" shortcuts to various places
nmap \b :e ~/.bashrc<CR>
nmap \d :e ~/Desktop/<C-d>
nmap \h :e ~/
nmap \o :e ~/Dropbox/all-notes.txt<CR>
nmap \r :e ~/scratch.txt<CR>
nmap \v1 :e ~/dotfiles/coreVimrc.vim<CR>
nmap \v2 :e ~/dotfiles/macVimrc.vim<CR>
nmap \v :e ~/.vimrc<CR>
nmap \vs :so ~/.vimrc<CR>


" reStructured Text
" =================

" file rst blog post into html
com! FileRst w | norm :%!python2.5 /Users/thanthese/RstTools/rst2html-highlight
  \ --initial-header-level=3<CR>
  \ /class="document"<CR>vit"+y
  \u:echo "RST post filed into clipboard"<CR>

" insert code-block for RST
com! -nargs=1 InsertCodeBlockDirective norm o.. code-block:: <args><Esc>


" notes file
" ==========

autocmd! BufWritePost all-notes.txt silent !python2.7 ~/markdown-outline/transform.py -i ~/Dropbox/all-notes.txt -o ~/Dropbox/view-notes.html
