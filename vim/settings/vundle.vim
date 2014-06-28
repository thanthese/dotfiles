set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" ======================================================================

" install vundle like this:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Plugin 'PeterRincker/vim-argumentative'
Plugin 'coderifous/textobj-word-column.vim'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'justinmk/vim-sneak'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'thinca/vim-quickrun'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vimwiki/vimwiki'
Plugin 'wellle/targets.vim'

" Plugin 'Blackrush/vim-gocode'
" Plugin 'Lokaltog/vim-powerline'
" Plugin 'Shougo/neocomplcache'
" Plugin 'Shougo/unite.vim'
" Plugin 'Shougo/vimshell.vim'
" Plugin 'Townk/vim-autoclose'
" Plugin 'arecarn/crunch'
" Plugin 'benmills/vimux'
" Plugin 'bling/vim-airline'
" Plugin 'dgryski/vim-godef'
" Plugin 'jamessan/vim-gnupg'
" Plugin 'jnwhiteh/vim-golang'
" Plugin 'junegunn/vim-easy-align'
" Plugin 'majutsushi/tagbar'
" Plugin 'nelstrom/vim-markdown-folding'
" Plugin 'osyo-manga/vim-over'
" Plugin 'scrooloose/syntastic'
" Plugin 'terryma/vim-expand-region'
" Plugin 'terryma/vim-multiple-cursors'
" Plugin 'terryma/vim-smooth-scroll'
" Plugin 'thanthese/Tortoise-Typing'
" Plugin 'thanthese/markdown-outline'
" Plugin 'tpope/vim-markdown'
" Plugin 'vim-pandoc/vim-pandoc'
" Plugin 'vim-pandoc/vim-pandoc-syntax'
" Plugin 'wgibbs/vim-irblack'

" ======================================================================

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
