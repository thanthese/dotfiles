" fonts and colors
colorscheme ir_black


" commands
" ========

" insert function header
command! InsertFunctionHeader norm yiwoprintln "p()"yypwwvi"r=kbOprintln ""^


" configure grails
" ================

" creating a pseudo-grails type
function! ConfigureGrails()
  call InitBuffer()

  " deploys grails from vim
  nmap <silent> <F5> :wa<CR> :silent !pkill -f grails<CR> :call SendToScreenWindow("eoc", "clear; date; grails run-war"  . b:runTimeOpts)<CR>
  nmap <silent> <F6> :wa<CR> :silent !pkill -f grails<CR> :call SendToScreenWindow("eoc", "clear; date; grails run-app"  . b:runTimeOpts)<CR>
  nmap <silent> <F7> :wa<CR> :silent !pkill -f grails<CR> :call SendToScreenWindow("eoc", "clear; date; grails test-app" . b:runTimeOpts)<CR>
  nmap <silent> <F8> :silent !chrome http://localhost:8080/EOC/<CR>
endfunction

" configure for grails
call ConfigureGrails()


" dictionary
" ==========

set dictionary+=/usr/share/dict/words


" navigation
" ==========

nmap \b :e ~/.bashrc<CR>
nmap \d :e ~/Desktop/
nmap \e :NERDTree /home/thanthese/NetBeansProjects/EOC/<CR><C-l>\t
nmap \f :e ~/.vim/ftplugin/
nmap \h :e ~/
nmap \n :NERDTree /home/thanthese/NetBeansProjects/<CR>
nmap \o :e ~/todo.txt<CR>
nmap \r :e ~/scratch.txt<CR>
nmap \t :e ~/todo.txt<CR>
nmap \v :e ~/.vimrc<CR>
nmap \v1 :e ~/dotfiles/coreVimrc.vim<CR>
nmap \v2 :e ~/dotfiles/ubuntuVimrc.vim<CR>
nmap \w :e /home/thanthese/What\ I\'ve\ done.txt<CR>


" search EOC
" ==========

nmap <M-G> :SearchProject<Space>
vmap <M-G> y:SearchProject<Space>"<CR>
command! -nargs=+ SearchProject vimgrep /<args>/j
  \ ~/NetBeansProjects/EOC/grails-app/**
  \ ~/NetBeansProjects/EOC/src/**
  \ ~/NetBeansProjects/EOC/web-app/css/**
  \ ~/NetBeansProjects/EOC/web-app/js/Eoc/**
  \ ~/NetBeansProjects/EOC/web-app/js/EocAdmin/**
  \ | cw 30 | setlocal cursorline
