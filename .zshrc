# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/home/thanthese/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
bindkey -v
# End of lines configured by zsh-newuser-install
#

autoload -U promptinit
promptinit
prompt suse

alias x=exit
alias b=bash

unsetopt caseglob
export TERM='xterm-256color'
