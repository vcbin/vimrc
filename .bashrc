# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export TERM=xterm-256color
MANPATH=$MANPATH:$HOME/share/man

# add this configuration to ~/.bashrc
export HH_CONFIG=hicolor         # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=100000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
## if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
#if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi
