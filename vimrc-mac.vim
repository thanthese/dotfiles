" file and directory mappings
" ===========================

" shortcuts to various places
nmap \b :e ~/.bashrc<CR>
nmap \d :e ~/Desktop/<C-d>
nmap \h :e ~/
nmap \o :e ~/Dropbox/all-notes.md<CR>
nmap \O :e ~/Dropbox/all-notes.md<CR>Gzv?^#<CR>0zt
nmap \r :e ~/scratch.txt<CR>
nmap \s :e /sandbox/scratch.md<CR>
nmap \v1 :e ~/dotfiles/vimrc-core.vim<CR>
nmap \v2 :e ~/dotfiles/vimrc-mac.vim<CR>
nmap \v :e ~/.vimrc<CR>
nmap \vs :so ~/.vimrc<CR>

" notes file
" ==========

autocmd! BufWritePost all-notes.md silent !python2.7 ~/markdown-outline/transform.py -i ~/Dropbox/all-notes.md -o ~/Dropbox/view-notes.html
