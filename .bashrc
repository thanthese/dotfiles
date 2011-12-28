###
# Stephen Mann
#
# Contains .bashrc lines that will be common to all computers. Put this
# line (or something very like it) in the main ~/.bashrc:
#
#   . ~/dotfiles/.bashrc
#

# need vi
set -o vi

# colors in terminal
export TERM="xterm-256color"

# bash completion
source /etc/bash_completion

# one-characters, and combinations
alias a="ack-grep"
alias b=". ~/.bashrc"
alias c="clear"
alias d="cd ~/Desktop; ls"
alias f="find . | g -i"
alias g="grep -i"
alias o="gnome-open"
alias t="tree"
alias up="uptime"
alias vb="vi ~/.bashrc; b"
alias s="cd /sandbox; ls"
alias v="grep -iv"
alias x="exit"

# ls on cd, plus pushd instead of cd
push() { pushd ${1} ; ls -lth ; }
alias cc="push"

# git
alias ga="git add"
alias gk="git checkout"
alias gc="git commit"
alias gd="git diff"
alias gl="git log"
alias gs="git status"
alias gb="git branch"
alias gpush="git push"
alias gpull="git pull"

# read nytimes
alias nytimes="lynx -tna --accept-all-cookies mobile.nytimes.com"

# start python server in current directory
alias start-simple-web-server="python -m SimpleHTTPServer"

# show uptime on terminal open
up
