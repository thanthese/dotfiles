coreVim   : the core .vimrc I take with me to every computer I use
macVim    : the modifications to the core .vimrc I use on my home computer
ubuntuVim : modifications on my work computer

My actual .vimrc points to the .vimrc files I use on a given system.  For
example, on my mac it looks like this (at the moment):

  source ~/dotfiles/coreVimrc.vim
  source ~/dotfiles/macVimrc.vim