# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

export EDITOR=vi
export VISUAL=vi
export TERMINAL=xterm
export XDG_CONFIG_HOME=~/.config
export CWFLAGS='-Wall -Wextra -Wno-sign-compare '
export CFLAGS="-std=c11 $CWFLAGS"
export CXXFLAGS="-std=c++11 $CWFLAGS"
export CWNOUNUSEDFLAGS='-Wno-unused-variable -Wno-unused-but-set-variable -Wno-unused-parameter '

