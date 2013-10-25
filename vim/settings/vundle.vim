set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" # original repos on github
Bundle 'Lokaltog/vim-powerline'
Bundle 'godlygeek/tabular'
Bundle 'benmills/vimux'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
" Bundle 'jamessan/vim-gnupg'
" Bundle 'thanthese/markdown-outline'
" Bundle 'tpope/vim-markdown'
" Bundle 'thanthese/Tortoise-Typing'
" Bundle 'Shougo/neocomplcache'
" Bundle 'scrooloose/syntastic'
" Bundle 'wgibbs/vim-irblack'
"
" # vim-scripts repos
Bundle 'vimwiki'
Bundle 'matchit.zip'
Bundle 'L9'
Bundle 'FuzzyFinder'
" Bundle 'bufexplorer.zip'
" Bundle 'VimClojure'
" Bundle 'rails.vim'
"
" # non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache
" first) for foo
" :BundleClean(!)      - confirm(or auto-approve)
" removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not
" allowed..
