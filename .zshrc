##################################################
## common settings

autoload colors zsh/terminfo && colors
autoload zmv

bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^L' push-line

setopt auto_cd
setopt autopushd pushdminus pushdsilent pushdtohome pushdignoredups
setopt extendedglob
setopt hist_ignore_dups
setopt no_case_glob
setopt share_history

histsize=1000
savehist=1000
histfile=~/.history
prompt="%{$fg[red]%}%n%{$fg[white]%}@%{$fg[green]%}%m%{$fg[white]%}:%{$fg[cyan]%}%~%{$fg[white]%}$ "

export reporttime=2
export TERM='xterm-256color'
export EDITOR=vim

# set terminal title to args
function title { print -Pn "\e]0;$*\a" }


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

# git aliases
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff --ignore-all-space"
alias gl="git log"
alias gp="git push origin master"
alias gpush="git push origin master"
alias gpull="git pull origin master"
alias gs="git status"

# svn aliases
alias sc="svn commit"
alias sd="svn diff -x --ignore-all-space"
alias ss="svn status"
alias su="svn update"

# long aliases
alias nytimes="lynx -tna --accept-all-cookies mobile.nytimes.com"
alias start-simple-web-server="python -m SimpleHTTPServer"

# command aliases (add constant options)
alias -g grep="grep -i --color=auto"
alias -g less="less -R"
alias -g ls="ls --color=auto"

# global aliases
alias -g B="; beep"
alias -g C=" | colordiff"
alias -g G=" | grep -i --color=auto"
alias -g L=" | less -R"
alias -g S=" | sort"
alias -g V=" | grep -iv"
alias -g W=' | wc'
alias -g X=' | xargs'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# open-with aliases
alias -s md=vim
alias -s txt=vim
alias -s xml=vim
alias -s java=vim


##################################################
## mac specific

# path for git
export PATH=$PATH:/opt/local/bin


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

# quick open aliases
alias o="gnome-open"
alias n="nautilus"

# for building EOC
alias grails-build="grails prod war"
alias grails-app="grails run-app"
alias grails-war="grails run-war"

# starting programs
alias start-geoserver="sh ~/geoserver-2.0.1/bin/startup.sh"
alias start-jboss-4="sh ~/jboss-4.2.3/jboss-4.2.3.GA/bin/run.sh -c OpenSSO -b sjm.test.com"
alias start-jboss-5="sh ~/jboss-5.1.0/jboss-5.1.0.GA/bin/run.sh"
alias s4="start-jboss-4"
alias s5="start-jboss-5"
alias clear-jboss-5="rm -rf ~/jboss-5.1.0/jboss-5.1.0.GA/**/(tmp|work)(/) ~/jboss-5.1.0/jboss-5.1.0.GA/**/*.ear(.)"


##################################################
## loading complete

uptime
