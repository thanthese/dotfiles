""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" original source: https://github.com/jpalardy/vim-slime/
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Send_to_Screen(text)
  if !exists("b:slime")
    call Screen_Vars()
  end

  let escaped_text = substitute(shellescape(a:text), "\\\\\n", "\n", "g")
  call system("screen -S " . b:slime["sessionname"] . " -p " . b:slime["windowname"] . " -X stuff " . escaped_text)
endfunction

function! Screen_Session_Names(A,L,P)
  return system("screen -ls | awk '/Attached/ {print $1}'")
endfunction

function! Screen_Vars()
  if !exists("b:slime")
    let b:slime = {"sessionname": "", "windowname": "0"}
  end

  let b:slime["sessionname"] = input("session name: ", b:slime["sessionname"], "custom,Screen_Session_Names")
  let b:slime["windowname"]  = input("window name: ", b:slime["windowname"])
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" default maps
""

vmap <C-c><C-c> "ry :call Send_to_Screen(@r . "\n")<CR>
nmap <C-c>v :call Screen_Vars()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" custom maps
""

nmap <C-c><C-c> vip<C-c><C-c>
nmap <C-c><CR> :call Send_to_Screen("\n")<CR>
nmap <C-c><Space> ggVG<C-c><C-c><C-o><C-o>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" clojure-specific
""

nmap Kd :call Clojure_lookup_doc()<CR>
nmap Ks :call Clojure_lookup_source()<CR>
nmap Kf :call Clojure_finddoc()<CR>

function! Clojure_lookup_doc()
  let doc = input("clojure lookup doc: ")
  call Send_to_Screen("(doc " . doc . ")\n")
endfunction

function! Clojure_lookup_source()
  let source = input("clojure lookup source: ")
  call Send_to_Screen("(source " . source . ")\n")
endfunction

function! Clojure_finddoc()
  let find_doc = input("clojure find doc: ")
  call Send_to_Screen("(find-doc \"" . find_doc . "\")\n")
endfunction
