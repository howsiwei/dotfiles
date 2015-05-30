# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

polipo &

prepend_path() {
	if test -d "$1"; then
		case ":$PATH:" in
			*":$1:"*) :;;
			*) PATH="$1:$PATH"
		esac
	fi
}

prepend_path "/usr/local/texlive/2014/bin/i386-linux" 
prepend_path "$HOME/.gem/ruby/2.2.0/bin" 
prepend_path "$HOME/.local/bin" 
prepend_path "$HOME/bin" 

export EDITOR=vim
export VISUAL=vim
export XDG_CONFIG_HOME="$HOME/.config"
export http_proxy=http://localhost:8123/

