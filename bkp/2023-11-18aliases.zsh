###########################################
##  filename:    aliases
##  filepath:     /home/ZSH/
##  author:       mxx
##  file save date:   
##  file creation date: 23 oct
##  file status		 work in progess
##  comments: 	- die Datei ist für Bash-Aliase 
##		- ALT + s nano Zeilenumbruch
###########################################

## suffix alias
# S O U R C E plugins
alias -s mp4='vlc --fullscreen --no-video-title-show --no-video-border --no-video-menu'
alias -s mp3='vlc'
alias -s avi='vlc'
alias -s opus='vlc'
alias -s flac='vlc'
alias -s m4a='vlc'
alias -s mkv='vlc'
alias -s mp4='vlc'
alias -s mp4='vlc'
alias -s mp4='vlc'

alias -s L='|less -F'
alias -s G='|grep -i --color=auto' # $* nicht, fehler....usage$file G pattern


#neu
alias CHmod="chmod --verbose --recursive u+x $(pwd)/*.sh"
#gute themes für batcat ansi OneHalfDark Dracula Coldark-Dark
alias cat="batcat --decorations=always --color=always --wrap=auto --theme=Dracula"
alias cat2="batcat --decorations=always --color=always --wrap=auto --theme=Coldark-Dark"
alias cat3="batcat --decorations=always --color=always --wrap=auto --theme=OneHalfDark"

#xrandr --output VGA-1 --primary --mode 1920x1080 --pos 1080x652 --rotate normal --output HDMI-1 --off --output DP-1 --off --output DVI-I-1-1 --mode 1920x1080 --pos 0x0 --rotate left --output HDMI-1-2 --off --output VGA-1-2 --off

#find / -name “looking_for” -print 2>/dev/null

#gnome-terminal --geometry 118x26+-94+802; gnome-terminal --geometry 118x26+-94--100
#gnome-terminal --geometry 118x26+-94+802; gnome-terminal --geometry 105x15--95+130

#
alias WINsize="xwininfo"
alias D='echo -e "\t${inv}Zeige das aktuelle Datum${res}\n" && date "+%A, %B %-d,%Y"'
#alias DU='echo -e "\t${inv}Zeige die 22 größten Verzeichnisse und Dateien${res}\n" && command du -cah --exclude='*cache' --exclude='*run' --exclude='*sys' --exclude='*proc' | sort -hr | head -n 22' 

alias D1='echo -e "\t${inv}du -h --max-depth=2${res}\n" && du -h --max-depth=2 /home | sort -hr | head -n 24'

	# Farb- und Formatierungsvariablen für den Text
	# B:     echo -e "${inv} 'apt' errfolgreich ${res}"
	# invert
	inv="\e[7m"
	# reset
	res="\e[0m"
	# ````

# ALI IV
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

	# Aktiviere die Farbunterstützung für ls und füge nützliche Aliase hinzu
#if [ -x /usr/bin/dircolors ]; then
    # Prüfe, ob ~/.dircolors lesbar ist und verwende es, andernfalls verwende Standardfarbkonfiguration
  #  if test -r ~/.dircolors; then
#	eval "$(dircolors -b ~/.dircolors)"
#	    else
#		eval "$(dircolors -b)"
    #fi
#    alias ls='ls --color=auto'
   # siehe ls #  alias dir='dir --color=auto'
   # siehe ls #  alias vdir='vdir --color=auto'
   
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
#fi	

alias e1="exa --tree --all --long --color-scale --icons --level 1"
alias e2="exa --tree --level 2 --all --long --color-scale --icons"
alias e3="exa --tree --level 3 --all --long --color-scale --icons"
alias e4="exa --tree --level 4 --all --long --color-scale --icons"


alias l='
echo -e "\t${inv}ls -dsAhp --group-directories-first * \n_A: alle Dateien und Verz. inkl. versteckte exkl. `.` und `..` aus. \n  _p: Fügt einen Schrägstrich `/` an Verz. _s: Zeigt die Größe jeder Datei in Blocks an.\n ${res}\n" && ls -dsAhp --group-directories-first *'

alias ls='ls --color=auto'
#alias ls='exa'
alias sl='ls'
alias vdir=ll
# alias dir=ls -A
alias lh='echo -e "\t${inv}Zeige nur versteckte Verzeichnisse und Dateien an${res}\n" && ls -pdAh --group-directories-first .*'
#alias lh='echo -e "\t${inv}Zeige nur versteckte Verzeichnisse und Dateien an${res}\n" && ls -dsAh --group-directories-first .*'
alias lf='echo -e "\t${inv}Zeige nur Dateien an${res}\n" && ls -pshdr *.*'
alias ld='echo -e "\t${inv}Zeigt nur Ordner, exkl. versteckte${res}\n" && ls -pshdr */'
alias ll='echo -e "\t${inv}Alles und als Liste und von unten nach OBEN${res}\n" && ls -palhr'
alias la='echo -e "\t${inv}Zeigt alles${res}\n" && ls -plah'
alias lt='echo -e "\t${inv}Liste aller Ordner u. Dateien, sortiert nach Änderungsdatum (älteste zuerst)${res}\n" && ls -sltph
' 
 #... grep ... in History auf WORD
alias h='history'
alias g2history='cat "$ZDOTFILES/.zhistory" | grep --colour=always'
alias g2h=g2history

#grep...auf [ENV] printable enviroment variable auf WORD
alias g2env='printenv | grep --colour=always'
#... grep ... in printable aliases auf WORD	
alias g2ali='alias | grep --colour=always'

# ALI III
# NOK ncdu is an interactive ncurses display that you can browse and use to perform simple file actions
#	alias du ="ncdu"

	#````bash
# www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions

# list our disk usage in human-readable units including filesystem type, and print a total at the bottom
	alias df="df -Tha --total"

#	alias du="du -ach | sort -h"
	alias fhere="find . -name "
	alias free="free -gt"
	alias ps="ps auxf"

	# searches process for an argument
	alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

	#wget-c: continue download if problems
	alias wget="wget -c" 
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

	# ZSH
alias ZRC="nano $HOME/ZSH/.zshrc"
alias ZRCg="gedit $HOME/ZSH/.zshrc &"
alias ZSAV='cp "$HOME/ZSH/.zshrc" "$HOME/ZSH/bkp/$(date +'%F').zshrc" && cp "$HOME/.zshenv" "$HOME/ZSH/bkp/$(date +'%F').zshenv" && cp "$HOME/ZSH/aliases" "$HOME/ZSH/bkp/$(date +'%F')aliases.zsh"'
alias ZALI='nano $HOME/ZSH/aliases && source $HOME/ZSH/aliases'


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
alias gp='git push'
alias gpo='git push origin'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias gr='git branch -r'
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log'
alias gr='git remote'
alias grs='git remote show'
alias glo='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'

