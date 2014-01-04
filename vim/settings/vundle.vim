" ========== vundle setup ========== {{{
set nocompatible  " be iMproved
filetype off      " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle. Required!
Bundle 'gmarik/vundle'

" }}}
" ========== github ========== {{{

Bundle 'Shougo/vimshell.vim'
Bundle 'arecarn/crunch'
Bundle 'benmills/vimux'
Bundle 'bling/vim-airline'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'godlygeek/tabular'
Bundle 'justinmk/vim-sneak'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'osyo-manga/vim-over'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'

" Bundle 'Lokaltog/vim-powerline'
" Bundle 'Shougo/neocomplcache'
" Bundle 'Shougo/unite.vim'
" Bundle 'jamessan/vim-gnupg'
" Bundle 'scrooloose/syntastic'
" Bundle 'terryma/vim-expand-region'
" Bundle 'terryma/vim-smooth-scroll'
" Bundle 'thanthese/Tortoise-Typing'
" Bundle 'thanthese/markdown-outline'
" Bundle 'tpope/vim-markdown'
" Bundle 'wgibbs/vim-irblack'

" }}}
" ========== vim scripts ========== {{{

Bundle 'matchit.zip'
Bundle 'vimwiki'

" Bundle 'FuzzyFinder'
" Bundle 'L9'
" Bundle 'VimClojure'
" Bundle 'bufexplorer.zip'
" Bundle 'rails.vim'

" }}}
" ========== other sources ========== {{{

" Bundle 'git://git.wincent.com/command-t.git'

" }}}
" ========== vundle cleanup and help ========== {{{

filetype plugin indent on     " required!

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" See :h vundle for more details or wiki for FAQ

" }}}
