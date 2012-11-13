" clipboard magic
" ===============

set guioptions+=aA " use system clipboard
set clipboard=unnamed " make "* the anonymous register


" navigation to files
" ===================

nmap \b :e ~/.bashrc<CR>
nmap \d :e ~/Dropbox/dream-journal.md<cr>
nmap \e :cd ~/NetBeansProjects/EOC/<CR>
nmap \h :e ~/
nmap \n :NERDTree<CR>
nmap \nn :cd ~/NN/04/<CR>
nmap \p :e ~/Dropbox<cr>
nmap \s :e /sandbox/scratch.md<CR>
nmap \u :e ~/Dropbox/usernames.txt<cr>
nmap \v :e ~/.vimrc<CR>
nmap \v1 :e ~/dotfiles/vim/settings/core.vim<CR>
nmap \v2 :e ~/dotfiles/vim/settings/ubuntu.vim<CR>
nmap \vs :so ~/.vimrc<CR>
nmap \w :e ~/Dropbox/work-log.md<cr>


" plugin-specific settings
" ========================

" command-t (NITES next version)
set wildignore+=.svn,*.ear,**/target/**,target/**,**/target,/target/,*/target/*,target,WebUI/target/**,**/WebUI/target/**


" dictionary
" ==========

" this takes too long to run when running automatic word completion
"set dictionary+=/usr/share/dict/words
