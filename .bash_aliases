#!/bin/bash

alias als='$EDITOR ~/.bash_aliases && . ~/.bash_aliases'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -l'
alias grep='grep --color=auto'
alias info='info --vi-keys'
alias tm='tmux new-session -As'
alias inp='$EDITOR ~/.inputrc && bind -f ~/.inputrc'
alias z='zathura --fork > /dev/null 2>&1'
alias gl='guile'
alias li='light'
alias lis='light -S'
alias lj='rlwrap luajit'
alias oc='octave -q'
alias ot='octave -q --traditional'
alias d='sdcv'
alias pi='ping duckduckgo.com'
alias make5='make LDLIBS="-lcs50 -lm"'
alias kc='eval `keychain --eval id_rsa`'
# alias t='$TERMINAL -e'
# alias tvi='te vim'
# alias mpv='mpv --keep-open'
alias csc='csc -C -D_DEFAULT_SOURCE'
alias mpv='mpv --keep-open'
alias nasum='netctl-auto-switch wlp3s0-UM-{Staff,Student}'
alias rl='rlwrap'
alias tt='tabbed -d -p s+1 -o "#333" -O "#aaa" -t "#000" -T "#ccc" -r 2 urxvtc -embed _ -e'
alias tembed='urxvtc -embed $XEMBED -e'
alias ttcl='$TERMINAL -e tclsh'
alias g='git'

md() { mkdir -p "$@" && cd "$@"; }
timevi() { rm -f "$@" && vi --startuptime "$@"; }

HISTCONTROL=ignorespace:erasedups
HISTSIZE=10000
HISTFILESIZE=20000
# PS1='[\u@\h \W]\$ '
PS1='\W$ '

export CPPFLAGS='-O2'
export CWFLAGS='-Wall -Wextra -Wno-sign-compare -Wno-parentheses'
export CFLAGS="-std=c99 $CWFLAGS"
export CXXFLAGS="-std=c++11 $CWFLAGS"

