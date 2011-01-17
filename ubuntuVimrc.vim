" navigation to files
" ===================

nmap \b :e ~/.bashrc<CR>
nmap \d :e ~/Desktop/
nmap \e :cd ~/NetBeansProjects/EOC/<CR>
nmap \h :e ~/
nmap \nn :cd ~/NN/04/<CR>
nmap \n :NERDTree<CR>
nmap \o :e ~/todo.txt<CR>
nmap \v1 :e ~/dotfiles/coreVimrc.vim<CR>
nmap \v2 :e ~/dotfiles/ubuntuVimrc.vim<CR>
nmap \v :e ~/.vimrc<CR>
nmap \vs :so ~/.vimrc<CR>


" system-utility-specific settings
" ========================

" command-t (NITES next version)
nmap \rsu !!~/sparkup/sparkup<CR>
vmap \rsu !~/sparkup/sparkup<CR>


" dictionary
" ==========

set dictionary+=/usr/share/dict/words


" plugin-specific settings
" ========================

" command-t (NITES next version)
set wildignore+=.svn,*.ear,**/target/**,target/**,**/target,/target/,*/target/*,target,WebUI/target/**,**/WebUI/target/**


" project specific
" ================

" NITES next specific
au BufNewFile,BufRead *.ftl setfiletype html
