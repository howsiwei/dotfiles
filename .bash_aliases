# vim: ft=sh
alias als='vi ~/.bash_aliases && . ~/.bash_aliases'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -l'
alias grep='grep --color=auto'
alias tm='tmux new-session -As'
alias inp='vi ~/.inputrc && bind -f ~/.inputrc'
alias z='zathura --fork'
alias gu='guile'
alias lj='rlwrap luajit'
alias oc='octave -q'
alias ot='octave -q --traditional'
alias tcl='rlwrap tclsh8.6'
alias sd='sdcv'
alias speedtest='~/Downloads/linux/speedtest-cli/speedtest_cli.py'
alias pi='ping google.com'
alias make5='make LDLIBS="-lcs50 -lm"'

md() { mkdir -p "$@" && cd "$_"; }
timevi() { rm -f "$@" && vi --startuptime "$_"; }

CDPATH=.:~:~/Downloads

