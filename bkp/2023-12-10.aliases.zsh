#!/usr/bin/env zsh
###########################################
##  filename:    	aliases.zsh
##  filepath:     	/home/ZSH/
##  author:       	mxx
##  file save date: 04.12.23
##  file creation\
##			date: 	[yy-mmm]: 23 oct
##  file status		 work in progess
##  comments: 	   - ^e edit
###########################################
# Farb- und Formatierungsvariablen für den Text
#inv="\e[7m" # invert
res="\e[0m" # reset
inv="\033[38;2;219;41;200m\033[48;2;59;0;69m" #pink
inv2="\033[38;2;232;197;54m\033[48;2;128;87;0m" #gelb
#inv="\033[1;34m\033[48;2;0;0;0m"
#inv="\033[38;2;17;197;54m\033[48;2;128;87;0m"

#inv="\033[38;2;138;226;52m\033[48;2;0;0;0m"



#neu
alias WMinfo='echo -e "\n\t${inv}...2xklicken!  zeigt Parameter des Windows an!${res}\n" && xprop | grep --color=auto -E WM_CLASS && xwininfo | grep --color=auto geometry'
alias WMverbose='echo -e "\n\t${inv}\n 2xklicken!... zeigt Parameter des Windows an!${res}\n" && xprop | grep --color=auto -e "WM_CLASS(STRING)" -e "*SIZE*" -e "WM_PROTOCOLS(ATOM):" -e "geometry" -e "_NET_WM_ALLOWED_ACTIONS(ATOM)" && xwininfo | grep --color=auto geometry'
 

#mittelneu
alias CHmod='chmod --verbose --recursive u+x $(pwd)/*.sh && chmod --verbose --recursive u+x $(pwd)/*.zsh'
alias debug='echo "Debugging..."; set -x'
alias LOG='cat "$ZDOTDIR/log_error/log_error.txt" | grep "error" | sort'
alias LOGseparate='tail -f "$ZDOTDIR/log_error/log_error.txt"'
alias LOGinline='less -F "$ZDOTDIR/log_error/log_error.txt"'

alias nano=micro
alias edit=micro


## globale aliase (zsh only)
alias -g L='|less -F'
alias -g G='|grep --ignore-case  --color=auto' # ..usage$ file G pattern
alias -g H='--help'
alias -g fuck='|tldr'

# NOK ncdu is an interactive ncurses display that you can browse and use to perform simple file actions
alias ="ncdu"

## suffix alias (zsh only)
alias -s ffuck='tldr'
alias -s mp4='vlc --fullscreen --no-video-title-show --no-video-border --no-video-menu'
alias -s mp3='vlc'
alias -s avi='vlc'
alias -s opus='vlc'
alias -s flac='vlc'
alias -s m4a='vlc'
alias -s mkv='vlc'
alias -s mp4='vlc'
alias -s mp4='vlc'
alias -s sh='gedit'
alias -s zsh='micro'

#gute themes für batcat ansi OneHalfDark Dracula Coldark-Dark
alias cat='batcat --force-colorization --terminal-width 80 --theme=ansi'
alias cat4='batcat --force-colorization --number --terminal-width 80 --wrap=auto --theme=Dracula'
alias cat2='batcat --number --terminal-width 80 --decorations=always --color=always --wrap=auto --theme=Coldark-Dark'
alias cat3='batcat --number --terminal-width 80 --decorations=always --color=always --wrap=auto --theme=OneHalfDark'


# ZSH
alias ZRC='nano "$ZDOTDIR/.zshrc" && source "$ZDOTDIR/.zshrc" && echo -e "\n\t${inv}source $ZDOTDIR/.zshrc erfolgreich!${res}\n"'
alias ZRCg='gedit "$ZDOTDIR/.zshrc" & && source "$ZDOTDIR/.zshrc"&& xcowsay "source $ZDOTDIR/.zshrc erfolgreich!"'

alias ZALI='nano $ZDOTDIR/aliases.zsh && source $ZDOTDIR/aliases.zsh && echo -e "\n\t${inv}source $ZDOTDIR/aliases.zsh erfolgreich!${res}\n"'

alias ZALIg='gedit "$ZDOTDIR/aliases.zsh" &  && source "$ZDOTDIR/aliases.zsh" && xcowsay "source $ZDOTDIR/aliases.zsh erfolgreich!"'
 			 
alias ZSAVE='echo -e "\n" && cp "$ZDOTDIR/.zshrc" "$ZDOTDIR/bkp/$(date +'%F').zshrc.zsh" && cp "$HOME/.zshenv" "$ZDOTDIR/bkp/$(date +'%F').zshenv.zsh"  && cp "$ZDOTDIR/aliases.zsh" "$ZDOTDIR/bkp/$(date +'%F').aliases.zsh"'

alias wh_fuck='dpkg -L' # alle Dateien finden, die mit 'apt install' installiert wurde

alias DATE='echo -e "\t${inv}Zeige das aktuelle Datum  $(date "+%A, %-d. %B %Y"):{$res}" 									&& echo -e "${inv2} $(date "+%A, %-d. %B %Y")${res} \n "&& echo -e "${inv} oder $ (date +%F_%H-%M)\t ${res}" 	&& echo -e "${inv2} $(date "+%F_%H-%M") ${res}"'



# alias D='echo -e "\n\t${inv}Zeige das aktuelle Datum: date "+%A, %B %-d,%Y"\n" && $(date +%A, %B %-d,%Y) && echo -e "\n\t\n${inv} oder ${inv2} date +%F%X" && $(date +%F+%X)'

# alias DU='echo -e "\t${inv}Zeige die 22 größten Verzeichnisse und Dateien${res}\n" && command du -cah --exclude='*cache' --exclude='*run' --exclude='*sys' --exclude='*proc' | sort -hr | head -n 22' 

alias D1='echo -e "\n\t${inv} du -h --max-depth=2${res}\n" && du -h --max-depth=2 /home | sort -hr | head -n 24'
		




# LS   ###  LS  ### LS ###  LS  ### LS ###  LS  ### LS ###  LS  ### LS 
export LS_OPTS='--color=auto'
# all hidden ls -pshdr $(pwd) .* 
alias ls='ls ${LS_OPTS}'
alias sl='ls'
alias l='echo -e "\n\t${inv}ls -dsAhp --group-directories-first * \n ${res}\n"	&& ls -dsAhp --group-directories-first *'
alias lh='echo -e "\n\t${inv}Zeige nur versteckte Verzeichnisse und Dateien an${res}\n" && ls -pdAh --group-directories-first .*'
alias lf='echo -e "\n\t${inv}Zeige nur Dateien an${res}\n" 									&& ls -pshdr *.*'
alias ld='echo -e "\n\t${inv}Zeigt nur Ordner, exkl. versteckte${res}\n" && ls -pshdr */'
alias ll='	echo -e "\n\t${inv}Alles und als Liste und von unten nach OBEN${res}\n" 			&& ls -palhr'
alias la='echo -e "\n\t${inv}ls -plah: Zeigt alles, 											mit --group-directories-first${res}\n" && ls -plah --group-directories-first'
alias lt='
		echo -e "\n\t${inv}ls -AsltpGH: Liste, sortiert nach Änderungsdatum (älteste zuerst)${res}\n" && ls -AsltpGH'
alias lx='echo -e "\n\t${inv}ls -AXlGh: Liste sortiert nach File-EextensionÄnderungsdatum${res}\n" && ls -AXlGhp' 
 ###### -------------------------------------------------------------------------
 
 #... grep ... in History auf WORD
 alias h='history'
alias g2history='cat "$ZDOTDIR/.zhistory"  | grep -i--colour=always'
alias g2h=g2history

#grep...auf [ENV] printable enviroment variable auf WORD
alias g2env='printenv | grep -i --colour=always'

#... grep ... in printable aliases auf WORDnc	
alias g2ali='alias | grep -i --colour=always'
alias g2lol='lol | grep -i --colour=always'
alias lol2g='lol | grep -i --colour=always'


# www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions

# list our disk usage in human-readable units including filesystem type, and print a total at the bottom
alias df="df -Tha --total"

#	alias du="du -ach | sort -h" # -a...allfiles/path -c...complete
alias fhere="find . -name "
alias free="free -gt"
	alias ps="ps auxf"

	# searches process for an argument
	alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

alias wget="wget -c" # wget-c: continue download if problems
alias top="btop"
	

# upgraded utility for df as well that’s called pydf. It provides colorized output and text-based usage bars.
	alias DF="pydf"
# alias upload="sftp username@server.com</^>:/path/to/upload/directory<^>
mcd () {
    mkdir -p $1
    cd $1
	}

alias EIN="sudo shutdown -r now"
alias AUS="sudo shutdown now"
# DEBIAN
## APT/dpkg
alias APTupdate='
	echo -e "\tAktualisiere Pakete\n\t\t" | lolcat
	sudo apt-get update
	apt list --upgradable
	echo -e "\t${inv} Pakete upgraden? ${res}\n"
	sudo apt-get upgrade
	sudo apt-get autoremove -y
	sudo apt-get autoclean
	echo -e "\tapt autoremove und apt autoclean \n\t\terfolgreich durch geballert!\n" | lolcat'

	alias APTpurge='echo -e "\t${inv}Entferne Paket${res}\n" && sudo apt purge' 
	alias APTsearch='echo -e "\t${inv}Durchsuche Paketdatenbank${res}\n" && apt-cache search'  # apt search / Paketdatenbank
	alias APTshow='echo -e "\t${inv}Zeige Paketinformationen${res}\n" && apt show'  # apt search / Paketinformationen
	alias APTinstall='echo -e "\t${inv}Installiere Paket${res}\n" && sudo apt install'

	alias DPlist='echo -e "\t${inv}Liste Dateien eines Pakets auf${res}\n" && dpkg --listfiles'
	alias DPinstalled='echo -e "\t${inv}Zeigt alle installierten Pakete auf Ihrem Debian-System ... wird mit cat /var/log/dpkg.log gemacht:${res}\n" && cat /var/log/dpkg.log | grep "status installed" | awk "{print \$5}" | cut -d ":" -f 1 | sort'
	# Filtert 'status installed' und sortiert nach der ersten Spalte (Datum) dann nach (Uhrzeit)
alias DPtime-all="echo -e '\n\t\tHeute und gestern installiert:\n' && cat /var/log/dpkg.log | grep 'status installed' | sort -k1,1 -k2,2"
	alias DPtime-36="echo -e '\n\t\tHeute und gestern installiert:\n' && grep -E \"\$(date -d 'yesterday' +'%Y-%m-%d')|\$(date +'%Y-%m-%d')\" /var/log/dpkg.log | grep 'status installed/n'"



# file mgmt
	#alias FOR='fortune 100% debian-hints '
	alias FORl='fortune -l 30% drugs 30% linux 10% paradoxum 10% ascii-art 10% education 10% zippy | lolcat'
	alias FORs='fortune -l 30% drugs 30% linux 10% paradoxum 10% ascii-art 10% education 10% zippy | lolcat'
	
	#alias --.='echo -e "\t${inv}Gehe zum vorherigen Verzeichnis${res}\n" && cd -' # Zurückgehen
	# alias ...='echo -e "\t${inv}Gehe zwei Verzeichnisse höher${res}\n" && cd ../..'
	# alias ....='echo -e "\t${inv}Gehe drei Verzeichnisse höher${res}\n" && cd ../../..'
#	alias ..='echo -e "\t${inv}Gehe ein Verzeichnis höher${res}\n" && cd ..'
#	alias cd..='echo -e "\t${inv}Gehe ein Verzeichnis höher${res}\n" && cd ..' # Häufige Rechtschreibfehler
	# -p flag to make any necessary parent directories, -v flag on top of that so we are told of every directory creation
	alias md='echo -e "\t${inv}Erstelle Verzeichnis (falls nicht vorhanden).\n /-p flag to make any necessary parent directories, /-v flag on top of that so we are told of every directory creation${res}\n" && mkdir -pv'
	alias rm='echo -e "\t${inv}Entferne Dateien/Verzeichnisse (bestätigt)${res}\n" && rm -vdr'
	alias cp='echo -e "\t${inv}Kopiere Dateien/Verzeichnisse cp -ivr(bestätigt)${res}\n" && cp -ivr'
	alias mv='echo -e "\t${inv}Verschiebe/umbenenne Dateien/Verzeichnisse (interacive, verbose)${res}\n" && mv -v -i'
	alias alais='echo -e "\t${inv}Alias für Alias${res}\n" && alias'
	alias tdlr='echo -e "\t${inv}Zeige verkürzte Handbücher (TL;DR)${res}\n" && tldr'
	alias _='echo -e "\t${inv}Führe als Superuser (sudo) aus${res}\n" && sudo'
	alias c='echo -e "\t${inv}Bildschirm löschen${res}\n" zsh && clear'
	alias q='echo -e "\t${inv}Beenden${res}\n" && exit'

alias lol="alias | lolcat"
alias ZSHoptions=setopt

### git
alias gs='git status'
alias ga='git add'
alias gp='git push' # sync a fork of a repo
alias gpo='git push origin'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias gr='git branch -r'
alias gplo='git pull origin'
alias gb='git branch' # list all of the branches in the current repo and show you which one you’re on
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log'
alias gr='git remote'
alias grs='git remote show'
alias glo='git log --pretty="oneline"'

alias glol='git log --graph --oneline --decorate' #pretty git branch graph
alias GLOG='git log --graph --format=format:"%C(blue)%h%C(reset) - %C(green)(%ar)%C(reset) %C(white %an%C(reset)%C(yellow)%d%C(reset) %C(white)- %s%C(reset)" --all'
alias gcb='git checkout -b' #allows you to create a new branch
alias gcm='git checkout master' #This returns you to the master branch.
alias gdc='git diff --cached'  #allows you to diff any files you’ve staged for commit
#alias g='   '  #
#alias g='   '  #
#alias g='   '  #
#alias g='   '  #
#alias g='   '  #
#alias g='   '  #
#alias g='   '  #
#alias g='   '  #
#alias g='   '  #
