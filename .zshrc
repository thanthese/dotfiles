##################################################
## common settings

autoload colors zsh/terminfo && colors
autoload zmv

bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

setopt auto_cd
setopt autopushd pushdminus pushdsilent pushdtohome pushdignoredups
setopt extendedglob
setopt glob_dots
setopt hist_ignore_dups
setopt share_history
unsetopt caseglob

reporttime=5
histsize=10000
savehist=10000
prompt="%{$fg[red]%}%n%{$fg[white]%}@%{$fg[green]%}%m%{$fg[white]%}:%{$fg[cyan]%}%~%{$fg[white]%}$ "

export TERM='xterm-256color'
export EDITOR=vim


## -----------------------------------------------
## completion

# activate completion
autoload -U compinit && compinit

# completion styles
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


## -----------------------------------------------
## aliases

# short aliases
alias b=bash
alias c=clear
alias vz="vi ~/.zshrc; b"
alias x=exit
alias z=". ~/.zshrc"

# git aliases
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff"
alias gl="git log"
alias gs="git status"

# long aliases
alias nytimes="lynx -tna --accept-all-cookies mobile.nytimes.com"
alias start-simple-web-server="python -m SimpleHTTPServer"

# command aliases
alias grep="grep --color=auto"
alias ls="ls -G"

# global aliases
alias -g G=" | grep -i"
alias -g L=" | less"
alias -g V=" | grep -iv"
alias -g X=' | xargs'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# open-with aliases
alias -s md=vim
alias -s txt=vim
alias -s xml=vim


##################################################
## mac specific

# path for git
export PATH=$PATH:/opt/local/bin


##################################################
## work specific

# directory aliases
hash -d nn=~/NN/04/

# completion
zstyle ':completion:*' users-hosts smann@demo.geocent.com smann@geo-demo4.geocent.com

# quick open aliases
alias o="gnome-open"
alias n="nautilis"


##################################################
## loading file complete

uptime
