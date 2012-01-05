" clipboard magic
" ===============

set guioptions+=aA " use system clipboard
set clipboard=unnamed " make "* the anonymous register


" navigation to files
" ===================

nmap \b :e ~/.bashrc<CR>
nmap \d :e ~/Desktop/
nmap \e :cd ~/NetBeansProjects/EOC/<CR>
nmap \h :e ~/
nmap \nn :cd ~/NN/04/<CR>
nmap \n :NERDTree<CR>
nmap \o :e ~/Dropbox/all-notes.txt<CR>
nmap \O :e ~/Dropbox/all-notes.txt<CR>Gzv?^#<CR>0zt
nmap \w :e ~/Dropbox/all-notes.txt<CR>/what i've done<cr>0zvzt
nmap \s :e /sandbox/scratch.md<CR>
nmap \v1 :e ~/dotfiles/vimrc-core.vim<CR>
nmap \v2 :e ~/dotfiles/vimrc-ubuntu.vim<CR>
nmap \v :e ~/.vimrc<CR>
nmap \vs :so ~/.vimrc<CR>


" plugin-specific settings
" ========================

" command-t (NITES next version)
set wildignore+=.svn,*.ear,**/target/**,target/**,**/target,/target/,*/target/*,target,WebUI/target/**,**/WebUI/target/**


" dictionary
" ==========

set dictionary+=/usr/share/dict/words


" notes file
" ==========

autocmd! BufWritePost all-notes.txt silent !python2.7 ~/markdown-outline/transform.py -i ~/Dropbox/all-notes.txt -o ~/Dropbox/view-notes.html
