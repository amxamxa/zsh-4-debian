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

#FARBEN LILA=#39257D PINK=#db29c8 LILA-DARK=#100438 LILA-med=#3B0045 
#FARBEN GELB #E8C536 #FFCA5B #805700 #edd400 #8ae234

### --------------- ##
##   COLORS         ##  Farb- und Formatierungsvariablen
## ---------------- ##
	#SYNTAX: echo -e "\033[38;2;<red>;<green>;<blue>m \033[48;2;<red>;<green>;<blue>m  ...  hallo Welt!"
	#inv=            "\033[38;2; 17;   197;    54m    \033[48;2; 128;   87;     0   m  ...  hallo Welt!"
	PINK="\033[38;2;219;41;200m\033[48;2;59;0;69m" #PINK auf dunkel
	GELB="\033[38;2;232;197;54m\033[48;2;128;87;0m" #gelb auf dunkel
	LILA="\033[38;2;85;85;255m\033[48;2;21;16;46m" # LILA auf dunkel
	INVERT="\e[7m" # invert
	RESET="\e[0m" # RESET
#rxvt-256color-Terminalsteuerung ist eine erweiterte Version der 
#xterm-256color zusätzlichen Funktionen bietet
	TERM=rxvt-256color
#Farbausgabe aktivieren, unabhängig von den Terminal-Einstellungen
 export CLICOLOR_FORCE=1 #Farbausgabe deaktivieren = 0


# nur kleiner Test
if [ -d ~/Desktop ]; then
  rm -vr ~/Desktop &> /dev/null
fi
#setzt nemo =standard file mgmt
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-searches
# export XDG_CONFIG_HOME="$HOME" # so hat ich bei Installatioan
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/.local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/.cache"
export ZDOTDIR="$XDG_CONFIG_HOME/ZSH"

# export XDG_CONFIG_HOME="$HOME # Schwachsinn"



# Created by `pipx` on 2023-12-11 14:52:13
export PATH="$PATH:/home/mxx/.local/bin"
# Set Micro as default editor
export VISUAL=micro
export EDITOR="$VISUAL"


export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

## ---------------- ##
##   f z f config   ##
## ---------------- ##
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

FZF_COLORS="bg+:-1,\
fg:#805700,\
fg+:white,\
border:#09F573,\
spinner:#3B0045,\
hl:yellow,\
header:blue,\
info:green,\
pointer:red,\
marker:blue,\
prompt:#A9F9AD,\
hl+:red"

export FZF_DEFAULT_OPTS="--height 60% \
--border sharp \
--layout reverse \
--color '$FZF_COLORS' \
--prompt '∷ ' \
--pointer ▶ \
--marker ⇒"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls exa"

## ---------------- ##
##   x r a n d r    ##  Bildschirausrichtunmg anpassen
## ---------------- ##
if [[ "$XDG_SESSION_TYPE" == "x11" ]]; then
	 # X11 wird verwendet
	 cowsay "X11 wird verwendet, xrandr für x11 sowie und 2 Bildschirme wurde erfolgreich ausgeführt"|lolcat      
	 xrandr --output VGA-1 --mode 1920x1080 --pos 0x0 --rotate left --output HDMI-1 --primary --mode 1920x1080 --pos 1080x650 --rotate normal --output DP-1 --off
	else
	  # Wayland wird verwendet
	  echo "Wayland wird verwendet"|lolcat|cowsay
fi




# source $ZDOTDIR/.zshrc # erfolgt automatisch
