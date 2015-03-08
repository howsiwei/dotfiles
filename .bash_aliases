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
alias z='zathura --fork > /dev/null 2>&1'
alias gl='guile'
alias lj='rlwrap luajit'
alias oc='octave -q'
alias ot='octave -q --traditional'
alias sd='sdcv'
alias speedtest='~/Downloads/linux/speedtest-cli/speedtest_cli.py'
alias pi='ping google.com'
alias make5='make LDLIBS="-lcs50 -lm"'
alias kc='eval `keychain --eval id_rsa`'

md() { mkdir -p "$@" && cd "$_"; }
timevi() { rm -f "$@" && vi --startuptime "$_"; }

HISTCONTROL=ignorespace:erasedups
HISTSIZE=10000
HISTFILESIZE=20000
CPPFLAGS='-O2'
CWFLAGS='-Wall -Wextra -Wno-sign-compare -Wno-parentheses'
CFLAGS="-std=c99 $CWFLAGS"
CXXFLAGS="-std=c++11 $CWFLAGS"
CWNOUNUSEDFLAGS='-Wno-unused-variable -Wno-unused-but-set-variable -Wno-unused-parameter'

