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


" switch windows
" ==============

nmap \0 :SwitchToWindow 0<CR>
nmap \1 :SwitchToWindow 1<CR>
nmap \2 :SwitchToWindow 2<CR>
nmap \3 :SwitchToWindow 3<CR>
nmap \4 :SwitchToWindow 4<CR>
nmap \5 :SwitchToWindow 5<CR>
nmap \6 :SwitchToWindow 6<CR>
nmap \7 :SwitchToWindow 7<CR>
nmap \8 :SwitchToWindow 8<CR>
nmap \9 :SwitchToWindow 9<CR>

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
