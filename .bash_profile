# System settings before starting X
if [ -r "$HOME/.profile" ]; then
	. "$HOME/.profile"
fi

# set up alsa
/usr/bin/amixer sset Master Mono 90% unmute  &> /dev/null
/usr/bin/amixer sset Master 90% unmute  &> /dev/null
/usr/bin/amixer sset PCM 90% unmute &> /dev/null

if [ -r "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
fi

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

