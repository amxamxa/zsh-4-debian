#!/usr/bin/env zsh
###########################################
##  filename:    	.zshenv
##  filepath:     	/home/
##  author:       	mxx
##  file save date:   
##  file creation date [yy-mmm]: 23 nov
##  file status		 work in progess
##  comments: 	   - ^e edit
###########################################
if [ -d ~/Desktop ]; then
  rm -vr ~/Desktop &> /dev/null
fi
#setzt nemo =standard file mgmt
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-searches
# export XDG_CONFIG_HOME="$HOME" # so hat ich bei Installatioan
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/.local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/.cache"
# export XDG_CONFIG_HOME="$HOME # Schwachsinn"

# Die rxvt-256color-Terminalsteuerung ist eine erweiterte Version der 
# xterm-256color zusätzlichen Funktionen bietet
TERM=rxvt-256color

# [[ ... ]] ist eine erweiterte Syntax für bedingte Anweisungen in der Zsh.
# -n Vergleichsoperator, prüft, ob der Ausdruck eine nicht-leere Zeichenkette ist
## == 
if [[ "$XDG_SESSION_TYPE" == "x11" ]]; then
 # X11 wird verwendet
  echo "X11 wird verwendet, xrandr für x11 und 2 Bildschirme"|lolcat
  xrandr --output VGA-1 --mode 1920x1080 --pos 0x0 --rotate left --output HDMI-1 --primary --mode 1920x1080 --pos 1080x764 --rotate normal --output DP-1 --off
else
  # Wayland wird verwendet
  echo "Wayland wird verwendet"|lolcat
fi


#export EDITOR="nano"
#export VISUAL="nvim"
export EDITOR="micro"
export ZDOTDIR="$XDG_CONFIG_HOME/ZSH"

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

#### ab hier unwichtig
# aber  für fzf Wichtig
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

FZF_COLORS="bg+:-1,\
fg:gray,\
fg+:white,\
border:black,\
spinner:0,\
hl:yellow,\
header:blue,\
info:green,\
pointer:red,\
marker:blue,\
prompt:gray,\
hl+:red"

export FZF_DEFAULT_OPTS="--height 60% \
--border sharp \
--layout reverse \
--color '$FZF_COLORS' \
--prompt '∷ ' \
--pointer ▶ \
--marker ⇒"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"

# source "$ZDOTDIR/.zshrc" erfolgt automatischr

