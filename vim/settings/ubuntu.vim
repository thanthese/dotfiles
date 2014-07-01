" clipboard magic
" ===============

set guioptions+=aA " use system clipboard
set clipboard=unnamed " make "* the anonymous register


" navigation to files
" ===================

nmap <c-d>gh :e ~/
nmap <c-d>gb :e ~/.bashrc<cr>
nmap <c-d>gs :e ~/scratch.txt<cr>

nmap <c-d>gd :e ~/Dropbox<cr>
nmap <c-d>gu :e ~/Dropbox/vimwiki/usernames.txt<cr>

nmap <c-d>gv :e ~/.vimrc<cr>
nmap <c-d>gi :e ~/dotfiles/vim/settings/index.vim<cr>
nmap <c-d>gm :e ~/dotfiles/vim/settings/mac.vim<cr>
