##################################################
## common settings

autoload colors zsh/terminfo && colors
autoload zmv

bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^L' push-line

setopt AUTO_CD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME PUSHDIGNOREDUPS
setopt EXTENDEDGLOB
setopt HIST_IGNORE_DUPS
setopt NO_CASE_GLOB
setopt SHARE_HISTORY

HISTSIZE=1000
HISTFILE=~/.history
SAVEHIST=1000

PROMPT="%{$fg[red]%}%n%{$fg[white]%}@%{$fg[green]%}%m%{$fg[white]%}:%{$fg[cyan]%}%~%{$fg[white]%}$ "

export REPORTTIME=2
export TERM='xterm-256color'
export EDITOR=vim


## -----------------------------------------------
## functions

# set terminal title to args
function title { print -Pn "\e]0;$*\a" }

# "Change Directory to File"
#
# Change to directory containing the given filename. Only enough of the
# initial characters of the filename are required to create uniqueness.
function cdf { cd **/$1*(.:h) }

# "Change Directory to Directory"
#
# Like `cdf`, but takes a directory name instead of a file name.
function cdd { cd **/$1*(/) }

# "Vi a File"
#
# Like `cdf`, but opens the matching file in vim.
function vif { vim **/$1*(.) }

# ls after every cd
#
# source: http://stackoverflow.com/questions/3964068/zsh-automatically-run-ls-after-ever-cd
function chpwd() {
  emulate -LR zsh
  ls
}


## -----------------------------------------------
## completion

# activate completion
autoload -U compinit && compinit

# completion styles
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
#zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


## -----------------------------------------------
## aliases

# short aliases
alias a=ack-grep
alias b=bash
alias c=clear
alias f=find
alias g=grep
alias py=python
alias p="print -l"
alias vz="vi ~/.zshrc; b"
alias x=exit
alias z=". ~/.zshrc"

# svn aliases
alias sc="svn commit"
alias sd="svn diff -x --ignore-all-space"
alias sda="svn diff -x --ignore-all-space | colordiff | less"
alias ss="svn status"
alias su="svn update"

# long aliases
alias nytimes="lynx -tna --accept-all-cookies mobile.nytimes.com"
alias start-simple-web-server="python -m SimpleHTTPServer"
alias pwgen-standard="pwgen -sy 20 1"
alias apt-get-all="sudo apt-get -y check; sudo apt-get -y update; sudo apt-get -y upgrade; sudo apt-get -y autoremove; sudo apt-get -y clean; sudo apt-get -y autoclean; sudo apt-get -y dist-upgrade;"
alias today="p **/*(m0)"

# command aliases (add constant options)
alias -g grep="grep -i --color=auto"
alias -g less="less -R"
alias -g ls="ls --color=auto"
alias -g ll="ls --color=auto -lthr"

# pipe aliases
alias -g B="; beep"
alias -g C=" | colordiff"
alias -g G=" | grep -i --color=auto"
alias -g L=" | less -R"
alias -g S=" | sort"
alias -g V=" | grep -iv"
alias -g W=' | wc'
alias -g X=' | xargs'

# cd aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# open-with aliases
alias -s md=vim
alias -s txt=vim
alias -s xml=vim
alias -s java=vim


## -----------------------------------------------
## git aliases

alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff --ignore-all-space"
alias gl="git log"
alias gk="git checkout"
alias gm="git merge"
alias gpush="git push"
alias gpull="git pull"
alias gs="git status"
alias gtoday="git log --since=\"today\""


## -----------------------------------------------
## git prompt

# source: http://stackoverflow.com/questions/1128496/to-get-a-prompt-which-indicates-git-branch-in-zsh
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'


##################################################
## mac specific

# path for git
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:/Applications/Racket-v5.1.1/bin

# clojure
alias clj="java -jar /Applications/clojure-1.2.0/clojure.jar"


##################################################
## work specific

# path variables
export GEOSERVER_HOME="/home/thanthese/geoserver-2.0.1/"
export GRAILS_HOME="/home/thanthese/grails-1.3.5"
export JAVA_HOME="/usr/lib/jvm/java-6-sun/"
export MAVEN_OPTS="-Xms512m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=512m"  ## NN
PATH=/home/thanthese/.cabal/bin/:$PATH
PATH=/home/thanthese/grails-1.3.5/bin:$PATH
PATH=/home/thanthese/sparkup/:$PATH
#export GRAILS_HOME="/home/thanthese/grails-1.1.1"
#export PATH=/home/thanthese/apache-maven-2.0.9/bin:$PATH
#export PATH=/home/thanthese/.gem/ruby/1.8/bin:$PATH
#export PGPORT=5432
#PATH=/home/thanthese/grails-1.1.1/bin:$PATH
#PATH=/opt/google/chrome:$PATH
#PATH=/usr/lib/jvm/java-6-sun-1.6.0.13/bin:$PATH
#source /usr/local/bin/ferret_paths

# host completion
zstyle ':completion:*' users-hosts smann@demo.geocent.com smann@geo-demo4.geocent.com

# directory aliases
hash -d nn=~/NN/04/
hash -d e=~/NetBeansProjects/EOC/
hash -d n=~/nutrition

# quick open aliases
alias o="gnome-open"
alias n="nautilus"

# starting programs
alias start-geoserver="sh ~/geoserver-2.0.1/bin/startup.sh"
alias start-jboss-4="sh ~/jboss-4.2.3/jboss-4.2.3.GA/bin/run.sh -c OpenSSO -b sjm.test.com"
alias start-jboss-5="sh ~/jboss-5.1.0/jboss-5.1.0.GA/bin/run.sh"
alias s4="start-jboss-4"
alias s5="start-jboss-5"
alias clear-jboss-5="rm -rf ~/jboss-5.1.0/jboss-5.1.0.GA/**/(tmp|work)(/) ~/jboss-5.1.0/jboss-5.1.0.GA/**/*.ear(.)"

# servers
alias stage="ssh smann@geo-demo4.geocent.com"
alias demo="ssh smann@demo.geocent.com"


##################################################
## loading complete

uptime
