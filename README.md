- `vimrc-core`   : the core `.vimrc` I take with me to every computer I use
- `vimrc-mac`    : the modifications to the core `.vimrc` I use on my home computer
- `vimrc-ubuntu` : modifications on my work computer

My actual `.vimrc` points to the `.vimrc` files I use on a given system.
For example, on my mac it looks like this (at the moment):

    source ~/dotfiles/vimrc-vundle.vim
    source ~/dotfiles/vimrc-core.vim
    source ~/dotfiles/vimrc-mac.vim

The same trick is used with other files -- for example my `.zshrc` config
files.
