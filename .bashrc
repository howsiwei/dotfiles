# Source global definitions
if [ -r /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi

if [ -r "$HOME/.bash_aliases" ]; then
	. "$HOME/.bash_aliases"
fi

stty -ixon

