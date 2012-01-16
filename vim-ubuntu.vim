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
nmap \s :e /sandbox/scratch.md<CR>
nmap \v1 :e ~/dotfiles/vim-core.vim<CR>
nmap \v2 :e ~/dotfiles/vim-ubuntu.vim<CR>
nmap \v :e ~/.vimrc<CR>
nmap \vs :so ~/.vimrc<CR>


" plugin-specific settings
" ========================

" command-t (NITES next version)
set wildignore+=.svn,*.ear,**/target/**,target/**,**/target,/target/,*/target/*,target,WebUI/target/**,**/WebUI/target/**


" dictionary
" ==========

set dictionary+=/usr/share/dict/words
