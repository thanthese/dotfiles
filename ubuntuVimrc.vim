" dictionary
" ==========

set dictionary+=/usr/share/dict/words


" navigation
" ==========

nmap \b :e ~/.bashrc<CR>
nmap \d :e ~/Desktop/
nmap \h :e ~/
nmap \n :NERDTree<CR>
nmap \s :e ~/scratch.txt<CR>
nmap \v1 :e ~/dotfiles/coreVimrc.vim<CR>
nmap \v2 :e ~/dotfiles/ubuntuVimrc.vim<CR>
nmap \v :e ~/.vimrc<CR>

" commands
" ========

nmap \p ^Yiprintln "A is ${pA}"^
