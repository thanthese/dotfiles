" file and directory mappings
" ===========================

" shortcuts to various places
nmap \O :e ~/Dropbox/all-notes.txt<CR>Gzv?^#<CR>0zt
nmap \w :e ~/Dropbox/all-notes.txt<CR>/what i've done<cr>0zvzt
nmap \b :e ~/.bashrc<CR>
nmap \d :e ~/Desktop/<C-d>
nmap \f :e ~/Dropbox/french/french.flash<CR>
nmap \h :e ~/
nmap \o :e ~/Dropbox/all-notes.txt<CR>
nmap \r :e ~/scratch.txt<CR>
nmap \s :e /sandbox/scratch.md<CR>
nmap \v :e ~/.vimrc<CR>
nmap \v1 :e ~/dotfiles/vimrc-core.vim<CR>
nmap \v2 :e ~/dotfiles/vimrc-mac.vim<CR>
nmap \vs :so ~/.vimrc<CR>

" notes file
" ==========

autocmd! BufWritePost all-notes.txt silent !python2.7 ~/markdown-outline/transform.py -i ~/Dropbox/all-notes.txt -o ~/Dropbox/view-notes.html
