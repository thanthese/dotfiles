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

# one-characters, and combinations
alias a="ack-grep"
alias b=". ~/.bashrc"
alias c="clear"
alias d="cd ~/Desktop; ls"
alias g="grep"
alias o="open"
alias t="tree"
alias up="uptime"
alias vb="vi ~/.bashrc; b"
alias x="exit"

# git
alias ga="git add ."
alias gc="git commit -a"
alias gd="git diff"
alias gl="git log"
alias gs="git status"
alias gb="git branch"

# show uptime on terminal open
up
