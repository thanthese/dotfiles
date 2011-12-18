" this file goes at ~/.vim/after/syntax/javascript.vim

if !has('conceal')
    finish
endif

syntax keyword javaScriptFunction function conceal cchar=λ
syntax keyword javaScriptFunction return   conceal cchar=←
hi! link Conceal javaScriptFunction
