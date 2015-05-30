# System settings before starting X
if [ -r "$HOME/.profile" ]; then
	. "$HOME/.profile"
fi

if [ -r "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
fi

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

