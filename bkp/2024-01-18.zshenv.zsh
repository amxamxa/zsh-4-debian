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

### --------------- ##
##   COLORS         ##  Farb- und Formatierungsvariablen
## ---------------- ##
# LILA HEX: 39257D PINK=#db29c8 LILA-DARK=#100438 LILA-med=#3B0045 
# GELB HEX: #E8C536 #FFCA5B #805700 #edd400 #8ae234
	INVERT="\e[7m" 	 # invert 	 txt color
	RESET="\e[0m" 	 # reset  	 txt color
	BOLD="\033[1m"	 # bold 	 txt color
	UNDER="\033[4m"  # underline txt color
	BLINK="\033[5m"  # blink	 txt color
###	SYNTAX:
##	FARBE= "\033[38;2;"*R*;*G*;*B*"m\033[48;2;"*R*;*G*;*B*m"" # FARBE(fg) auf farbe (bg)
# Z-B=echo -e  "\033[38;2; INTEGERm  \033[48;2;#IN;TE;GERm m  txt hallo Welt!"
	PINK="\033[38;2;219;41;200m\033[48;2;59;0;69m" #PINK auf dunkel
	GELB="\033[38;2;232;197;54m\033[48;2;128;87;0m" #gelb auf dunkel
	LILA="\033[38;2;85;85;255m\033[48;2;21;16;46m" # LILA auf dunkel
	GREEN="\033[38;2;0;255;0m\033[48;2;0;25;2m" 

#rxvt-256color-Steuerung mit zusätzlichen Funktionen 
#...  erweiterte Version der xterm-256color  bietet
TERM=rxvt-256color
#Farbausgabe aktivieren, unabhängig von den Terminal-Einstellungen
 export CLICOLOR_FORCE=1 #Farbausgabe deaktivieren = 0

# nur kleiner Test
if [ -d ~/Desktop ]; then
  rm -vr ~/Desktop &> /dev/null
fi
#setzt nemo =standard file mgmt
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-searches

# export XDG_CONFIG_HOME="$HOME" # so hat ich bei Installation, aba Schwachsinn"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/.local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/.cache"
export ZDOTDIR="$XDG_CONFIG_HOME/ZSH"

# Created by `pipx` on 2023-12-11 14:52:13
export PATH="$PATH:/home/mxx/.local/bin"
# Set Micro as default editor
export VISUAL=micro
export EDITOR="$VISUAL"
 # History filepath
export HISTFILE="$ZDOTDIR/.zhistory"   
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

## ---------------- ##
##  exec w a l      ## select terminal colorschema by wallpaper
## ---------------- ##
# Überprüfen, ob das Skript pywall.sh  bereits ausgeführt wurde
if [ -z "$SCRIPT_RUN_PYWALL" ]; 
    then
# *stdout* >/dev/null:  redirects stdout to null device. 
#        ... jede Ausgabe, die auf der Konsole ausgegeben worden wäre, wird verworfen.
# *stderr*  2>&1: redirects  stderr  to null device. 
#          ... in this case, both stdout and stderr are redirected to /dev/null.
    sh -c /home/mxx/project/pywall/pywall.sh >/dev/null 2>&1 &
      # Variable wird TRUE gesetzt, um anzuzeigen, dass das Skript bereits ausgeführt wurde
    export SCRIPT_RUN_PYWALL="true"
fi



## ---------------- ##
##   f z f config   ##
## ---------------- ##
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS="--height 60% \
--border sharp \
--layout reverse \
--color '$FZF_COLORS' \
--prompt '∷ ' \
--pointer ▶ \
--marker ⇒"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"

export FZF_COMPLETION_DIR_COMMANDS="\
cd pushd rmdir tree ls exa zoxide"


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

## ---------------- ##
##   x r a n d r    ##  Bildschirausrichtunmg anpassen
## ---------------- ##
if [[ "$XDG_SESSION_TYPE" == "x11" ]]; then
	 # X11 wird verwendet
	 xrandr --output VGA-1 --mode 1920x1080 --pos 0x0 --rotate left --output HDMI-1 --primary --mode 1920x1080 --pos 1080x650 --rotate normal --output DP-1 --off
	 export x11_set="true"
	 # MESSAGE über greeting.zsh

	 else
	  # x11 wird NICHT verwendet
	 printf "${GELB}x11 wird ${PINK} \n* NICHT* ${RESET} \n ${GELB}verwendet ${RESET}\n" | cowsay -n -fbong
	  #echo "x11 wird nicht verwendet"|lolcat|cowsay
fi

# MESSAGE über greeting.zsh
export SCRIPT_RUN_zenv="true"

# source $ZDOTDIR/.zshrc # erfolgt automatisch
