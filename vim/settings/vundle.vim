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
Bundle 'tpope/vim-markdown'
Bundle 'godlygeek/tabular'
Bundle 'Shougo/neocomplcache'
Bundle 'benmills/vimux'
"Bundle 'tpope/vim-fugitive'
"Bundle 'wgibbs/vim-irblack'
"
" # vim-scripts repos
Bundle 'bufexplorer.zip'
Bundle 'surround.vim'
Bundle 'repeat.vim'
Bundle 'matchit.zip'
Bundle 'L9'
Bundle 'tComment'
Bundle 'FuzzyFinder'
Bundle 'VimClojure'
"Bundle 'rails.vim'
"
" # non github repos
Bundle 'git://git.wincent.com/command-t.git'
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
