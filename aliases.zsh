#!/usr/bin/env zsh
###########################################
##  filename:    	aliases.zsh
##  filepath:     	/home/ZSH/
##  author:       	mxx
##  file save date: 	04.12.23
##  file creation\
##  date: 	[yy-mmm]: 23 oct
##  file status		 work in progess
##  comments: 	   - ^e edit
###########################################



### --------------- ##
##      N E U       ##
## ---------------- ##
alias lsblk='echo -e "\n\t${LILA}lsblk --width 80 --merge --zoned --ascii --topology --output MODEL,MOUNTPOINTS,PATH,SIZE,TRAN,LABEL,FSTYPE,TYPE${RESET}" && lsblk --width 80 --merge --zoned --ascii --topology --output MODEL,MOUNTPOINTS,PATH,SIZE,TRAN,LABEL,FSTYPE,TYPE'

alias MICsett='micro /home/mxx/.config/micro/settings.json'
alias MICbin='micro /home/mxx/.config/micro/bindings.json'

alias TRl2='tree -L 2 -s -h -F -C -a --du --prune $(pwd)'
alias TRl4='tree -L 4 -s -h -F -C -a --du --prune $(pwd)'
alias TRl8='tree -L 8 -s -h -F -C -a --du --prune $(pwd)'

# Terminal linker Screen, NordEast, 2x
alias Tl2x='gnome-terminal --geometry 70x26+387+514; gnome-terminal --geometry 70x26+387+4'
# Terminal rechter Screen, Nord, 2x
alias Tr2x='gnome-terminal --geometry 79x21+1694+768; gnome-terminal --geometry 79x17+1692+1147'

### --------------- ##
##      ANSAGE      ##
## ---------------- ##
alias VOCtime='echo -e "Es ist jetzte $(date "+%R").Heute ist $(date "+%A")" > $HOME/temp/time.tmp && espeak-ng -v mb-de5 -s 130 -p 40 95 -g 20 -k 20 -b 2 -f $HOME/temp/time.tmp'
alias VOCdate='echo -e "Heute ist $(date "+%A")! \vWir haben den $(date "+%-d ten %BNach unserer neuen Zeitrechnung sind wir im Jahre %Y! ")" > $HOME/temp/date.tmp && espeak-ng -v mb-de5 -s 130 -p 40 95 -g 20 -k 20 -b 2 -f $HOME/temp/date.tmp'

## ---------------------------  ## 
##  Z S H           ##  #  .zshenv .zshrc aliases.zsh  
## ---------------------------  ## 
alias ZRC='nano "$ZDOTDIR/.zshrc" && source "$ZDOTDIR/.zshrc" && echo -e "\n\t${PINK}source $ZDOTDIR/.zshrc erfolgreich!${RESET}\n" || echo -e "\n\t${GELB}source $ZDOTDIR/.zshrc  ---NICHT---  erfolgreich!${RESET}\n"'

alias ZENV='nano "$HOME/.zshenv" && source "$HOME/.zshenv" && echo -e "\n\t${PINK}source ~/.zshenv erfolgreich!${RESET}\n" || echo -e "\n\t${GELB}source ~/.zshenv ---NICHT---  erfolgreich!${RESET}\n"'

alias ZALI='nano $ZDOTDIR/aliases.zsh && source $ZDOTDIR/aliases.zsh && echo -e "\n\t${PINK}source $ZDOTDIR/aliases.zsh erfolgreich!${RESET}\n" || echo -e "\n\t${GELB}source $ZDOTDIR/aliases.zsh   ---NICHT---  erfolgreich!${RESET}\n"'	 
alias ZSAVE='echo -e "\n" && cp "$ZDOTDIR/.zshrc" "$ZDOTDIR/bkp/$(date +'%F').zshrc.zsh" && cp "$HOME/.zshenv" "$ZDOTDIR/bkp/$(date +'%F').zshenv.zsh"  && cp "$ZDOTDIR/aliases.zsh" "$ZDOTDIR/bkp/$(date +'%F').aliases.zsh"'
alias ZSHoptions=setopt
alias wh_fuck='dpkg -L' # alle Dateien finden, die mit 'apt install' installiert wurde

### -------------------- ##
##     gnome gui windows ##
### -------------------- ##
alias WMinfo='echo -e "\n\t${PINK}...2xklicken!  zeigt Parameter des Windows an!${RESET}\n" && xprop | grep --color=auto -E WM_CLASS && xwininfo | grep --color=auto geometry'
alias WMverbose='echo -e "\n\t${PINK}\n 2xklicken!... zeigt Parameter des Windows an!${RESET}\n" && xprop | grep --color=auto -e "WM_CLASS(STRING)" -e "*SIZE*" -e "WM_PROTOCOLS(ATOM):" -e "geometry" -e "_NET_WM_ALLOWED_ACTIONS(ATOM)" && xwininfo | grep --color=auto geometry'
## --------------------  ## 
##     mittelneu
## --------------------  ##
alias nano=micro
alias edit=micro
alias DATE='echo -e "\t${PINK}Zeige das aktuelle Datum  $(date "+%A, %-d. %B %Y"):{$RESET}" && echo -e "${GELB} $(date "+%A, %-d. %B %Y")${RESET} \n "&& echo -e "${PINK} oder $ (date +%F_%H-%M)\t ${RESET}" 	&& echo -e "${GELB} $(date "+%F_%H-%M") ${RESET}"'

alias CHmod='chmod --verbose --recursive u+x $(pwd)/*.sh && chmod --verbose --recursive u+x $(pwd)/*.zsh'
#alias debug='echo "Debugging..."; set -x'

alias LOG='cat "$ZDOTDIR/log_error/log_error.txt" | grep "error" | sort'
alias LOGseparate='tail -f "$ZDOTDIR/log_error/log_error.txt"'
alias LOGinline='less -F "$ZDOTDIR/log_error/log_error.txt"'

## ---------------------------  ## 
##    globale aliase (zsh only)
## ---------------------------  ##
alias -g SRC='source'

alias -g L='|less -F'
alias -g G='|grep --ignore-case  --color=auto' # ..usage$ file G pattern
alias -g H='--help'
alias -g F='|tldr'
alias -g T='tldr'
## ---------------------------  ## 
##    suffix alias (zsh only)
## ---------------------------  ## 
alias -s ffuck='tldr'
alias -s mp4='vlc --fullscreen --no-video-title-show --no-video-border --no-video-menu'
alias -s mp3='vlc'
alias -s avi='vlc'
alias -s opus='vlc'
alias -s flac='vlc'
alias -s m4a='vlc'
alias -s mkv='vlc'
alias -s jpg='img2sixel'
alias -s jpeg='img2sixel'
alias -s png='img2sixel'
alias -s jpeg='img2sixel'
alias -s sh='micro'
alias -s zsh='micro'

## ---------------------------  ## 
##  CAT/ BATCAT      
## ---------------------------  ## 
# gute themes für batcat ansi OneHalfDark Dracula Coldark-Dark
alias cat='batcat --plain --terminal-width 80'

alias cat1='batcat --force-colorization --terminal-width 80 --theme=ansi'
alias cat4='batcat --force-colorization --number --terminal-width 80 --wrap=auto --theme=Dracula'
alias cat2='batcat --number --terminal-width 80 --decorations=always --color=always --wrap=auto --theme=Coldark-Dark'
alias cat3='batcat --number --terminal-width 80 --decorations=always --color=always --wrap=auto --theme=OneHalfDark'

## ---------------------------  ## 
## biggest stuff
## ---------------------------  ## 
# alias DU='echo -e "\t${PINK}Zeige die 22 größten Verzeichnisse und Dateien${RESET}\n" && command du -cah --exclude='*cache' --exclude='*run' --exclude='*sys' --exclude='*proc' | sort -hr | head -n 22' 
D3() {
 echo -e "\n\t${GELB} du --max-depth=3 --separate-dirs --threshold=16K -BM -x $(pwd) 2> /dev/null | sort -hr | head -n 24${LILA} \t... wir reden über Pfad $(pwd)${RESET}}\n"
du --human-readable --max-depth=3 --separate-dirs --threshold=16K --block-size=M --one-file-system --exclude='*cache' --exclude='*run' --exclude='*sys' --exclude='*proc'$pwd 2> /dev/null | sort -hr | head -n 24
}
D1() {
 echo -e "\n\t${GELB} du --max-depth=1 --separate-dirs --threshold=16K -BM -x $(pwd) 2> /dev/null | sort -hr | head -n 24${LILA} \t... wir reden über Pfad $(pwd)${RESET}}\n"
du --human-readable --max-depth=1 --separate-dirs --threshold=16K --block-size=M --one-file-system --exclude='*cache' --exclude='*run' --exclude='*sys' --exclude='*proc'$pwd 2> /dev/null | sort -hr | head -n 24
}

## ---------------------------  ## 
##    ls  ll  lh  ld ...
## ---------------------------  ## 
export LS_OPTS='--color=force'
alias ls='ls ${LS_OPTS}'
alias sl='ls'
# all hidden ls -shdrp $(pwd) .* 
# ls -shAdp --group-directories-first --color=force * 

alias l='echo -e "\n\t${PINK}ls -dsAhp --group-directories-first * ${RESET}\n"	&& ls -dsAhp --group-directories-first *'
alias lh='echo -e "\n\t${PINK}Zeige nur versteckte Verzeichnisse und Dateien an${RESET}\n" && ls -pdAh --group-directories-first .*'
alias lf='echo -e "\n\t${PINK}Zeige nur Dateien an${RESET}\n\t\t" && ls -shdrp *.*'
alias ld='echo -e "\n\t${PINK}Zeigt nur Ordner, exkl. versteckte${RESET}\n" && ls -shdrp */'
alias ll='	echo -e "\n\t${PINK}Alles und als Liste und von unten nach OBEN${RESET}\n" 			&& ls -alhrp'
alias la='echo -e "\n\t${PINK}ls -lahp: Zeigt alles, mit --group-directories-first${RESET}\n" && ls -lahp --group-directories-first'
alias lt='echo -e "\n\t${PINK}Liste TIME: sortiert nach Änderungsdatum (älteste zuerst)${RESET}\n\t${GELB}ls -AsltpGHp${RESET}" && ls -AsltGHp'
alias lx='echo -e "\n\t${PINK} Liste EXT:  sortiert nach File-Eextension${RESET}\n\t${GELB}ls -AXlGhp${RESET}\n" && ls -AXlGhp' 


## ---------------------------  ## 
##       e x a 
## ---------------------------  ## 
 alias e1='echo -e "\n\t${GELB} exa -A -l --tree --level 1--no-time --no-permissions --git --group-directories-first     ${RESET}\n" && exa --no-time --no-permissions --tree --level 1 --all --long --color-scale --icons --git --group-directories-first'
  alias e2='echo -e "\n\t${GELB} exa --no-time --no-permissions -A -l --tree --level 2 --git --group-directories-first${RESET}\n" && exa --tree --level 2 --all --long --color-scale --icons --no-time --no-permissions --git --group-directories-first'
 alias e3='echo -e "\t${GELB} exa -A -l --tree -level 3--no-time --no-permissions --git --group-directories-first${RESET}\n" && exa --tree --level 3 --all --long --color-scale --icons --no-time --no-permissions --git --group-directories-first'
 alias e4='echo -e "\t${GELB} exa --no-time --no-permissions --A -l --tree -level 4 --git--group-directories-first${RESET}\n" && exa --tree --level 4 --all --long --color-scale --icons --no-time --no-permissions --git --group-directories-first'

 alias fgrep='fgrep --color=auto'
 alias egrep='egrep --color=auto'
 #... grep ... in History auf WORD
 alias h='history'
alias g2history='cat "$ZDOTDIR/.zhistory"  | grep -i--colour=always'
alias g2h=g2history

#grep...auf [ENV] printable enviroment variable auf WORD
alias g2env='printenv | grep -i --colour=always'

#... grep ... in printable aliases auf WORDnc	
alias g2ali='alias | grep -i --colour=always'
alias g2lol='g2ali'
alias lol2g='g2ali'

## ---------------------------  ## 
##  digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions
## ---------------------------  ## 
# NOK ncdu is an interactive ncurses display that you can browse and use to perform simple file actions
# alias NC ="ncdu"

# list our disk usage in human-readable units including filesystem type, and print a total at the bottom
alias df="df -Tha --total"

# alias du="du -ach | sort -h" # -a...allfiles/path -c...complete
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


alias EIN="sudo shutdown -r now"
alias AUS="sudo shutdown now"

## ---------------------------  ## 
##        D E B I A N
##      -- apt /dpkg -- 
## ---------------------------  ## 

UPdate () {
  if which nala > /dev/null; then
	echo -e "\tAktualisiere Pakete\n\t\t" | lolcat
	sudo nala update
	nala list --upgradable
	echo -e "\t${PINK} Pakete upgraden? ${RESET}\n"
	read -r answer\?"Pakete upgraden (j/N)? "
     if [[ "$answer" =~ ^[Jj] ]]; then
  	   nala upgrade
	fi
	#nala autopurge
    nala autoremove
	else
	 echo -e "\tAktualisiere Pakete\n\t\t" | lolcat
	  sudo apt-get update
	  apt list --upgradable
	 echo -e "\t${PINK} Pakete upgraden? ${RESET}\n"
   	 read -r answer\?"Pakete upgraden (j/N)? "
	      if [[ "$answer" =~ ^[Jj] ]]; then
	      	apt-get upgrade
	      fi	
	 	 apt-get autoremove
	 	apt-get autoclean
 	 echo -e "\tapt autoremove und apt autoclean 
 	 \n\t\terfolgreich durch geballert!\n" | lolcat
	fi      }

alais APTsugg='apt install --dry-run --install-suggests'

alias APTpurge='nala purge |updateecho -e "\t${PINK}Entferne Paket${RESET}\n" && sudo apt purge' 
# Funktion ersetzt: alias APTsearch='nala search |echo -e "\t${PINK}Durchsuche Paketdatenbank${RESET}\n" && apt-cache search'  # apt search / Paketdatenbank
alias APTshow='nala show |echo -e "\t${PINK}Zeige Paketinformationen${RESET}\n" && apt show'  # apt search / Paketinformationen

alias APTinstall='nala show install | echo -e "\t${PINK}Installiere Paket${RESET}\n" && sudo apt install'

	alias DPlist='echo -e "\t${PINK}Liste Dateien eines Pakets auf${RESET}\n" && dpkg --listfiles'
	alias DPinstalled='echo -e "\t${PINK}Zeigt alle installierten Pakete auf Ihrem Debian-System ... wird mit cat /var/log/dpkg.log gemacht:${RESET}\n" && cat /var/log/dpkg.log | grep "status installed" | awk "{print \$5}" | cut -d ":" -f 1 | sort'

# Filtert 'status installed' und sortiert nach der ersten Spalte (Datum) dann nach (Uhrzeit)
alias DPtime-all="echo -e '\n\t${LILA}Seit 100 Jahren installiert:\n${RESET}' && cat /var/log/dpkg.log | grep 'status installed' | sort -k1,1 -k2,2"
alias DPtime-36="echo -e '\n\t${GELB}Heute und gestern installiert:\n${RESET}' && grep -E \"\$(date -d 'yesterday' +'%Y-%m-%d')|\$(date +'%Y-%m-%d')\" /var/log/dpkg.log | grep 'status installed/n'"

# file mgmt
alias FOR='fortune 100% debian-hints '
alias FORl='fortune -l 30% drugs 30% linux 10% paradoxum 10% ascii-art 10% education 10% zippy | lolcat'
alias FORs='fortune -l 30% drugs 30% linux 10% paradoxum 10% ascii-art 10% education 10% zippy | lolcat'

mcd () {  # make DIR
    mkdir -p $1
    cd $1
	}
alias cd..='echo -e "\t${PINK}Gehe ein Verzeichnis höher${RESET}\n" && cd ..' 
# Häufige Rechtschreibfehler
alias rm='echo -e "\t${PINK}Entferne Dateien/Verzeichnisse (bestätigt)${RESET}\n" && rm -vdr'
alias cp='echo -e "\t${PINK}Kopiere Dateien/Verzeichnisse cp -ivr(bestätigt)${RESET}\n" && cp -ivr'
alias mv='echo -e "\t${PINK}Verschiebe/umbenenne Dateien/Verzeichnisse (interacive, verbose)${RESET}\n" && mv -v -i'
alias alais='echo -e "\t${PINK}Alias für Alias${RESET}\n" && alias'
alias tdlr='echo -e "\t${GELB}Zeige verkürzte Handbücher (TL;DR)${RESET}\n" && tldr'
alias T='echo -e "\t${GELB}Zeige verkürzte Handbücher (TL;DR)${RESET}\n" && tldr'
alias _='echo -e "\t${PINK}Führe als Superuser (sudo) aus${RESET}\n" && sudo'
alias c='echo -e "\t${PINK}Bildschirm löschen${RESET}\n"  && clear'
alias q='echo -e "\t${PINK}Beenden${RESET}\n" && exit'
alias lol="alias | lolcat"



# Git Status
alias gs='git status'          # Zeigt den Status des Arbeitsverzeichnisses und des Staging-Bereichs an
alias gss='git status -s'      # Zeigt den Status des Arbeitsverzeichnisses und des Staging-Bereichs in Kurzform an

# Git Add
alias ga='git add'             # Fügt Änderungen im Arbeitsverzeichnis zum Staging-Bereich hinzu

# Git Push
alias gp='git push'            # Pushed lokale Änderungen auf den Remote-Branch
alias gpo='git push origin'    # Pushed lokale Änderungen auf den Remote-Branch "origin"
alias gpof='git push origin --force-with-lease'    # Force-Pushed lokale Änderungen auf den Remote-Branch "origin" mit Lease-Check
alias gpofn='git push origin --force-with-lease --no-verify'    # Force-Pushed lokale Änderungen auf den Remote-Branch "origin" mit Lease-Check und ohne Verifizierung
alias gpt='git push --tag'     # Pushed alle Tags auf den Remote-Branch

# Git Tag
alias gtd='git tag --delete'   # Löscht einen lokalen Tag
alias gtdr='git tag --delete origin'   # Löscht einen Remote-Tag

# Git Branch
alias grb='git branch -r'      # Zeigt die Remote-Branches an
alias gb='git branch'          # Zeigt alle Branches im aktuellen Repository an

# Git Pull
alias gplo='git pull origin'   # Holt die neuesten Änderungen vom Remote-Branch "origin"

# Git Commit
alias gc='git commit'          # Erstellt einen Commit mit den im Staging-Bereich befindlichen Änderungen

# Git Diff
alias gd='git diff'            # Zeigt die Unterschiede zwischen Arbeitsverzeichnis und Staging-Bereich an
alias gdc='git diff --cached'  # Zeigt die Unterschiede zwischen Staging-Bereich und letztem Commit an

# Git Checkout
alias gco='git checkout'       # Wechselt zu einem anderen Branch oder Commit

# Git Log
alias gl='git log --pretty=oneline'   # Zeigt die Commit-Historie in einer Zeile an
alias glol='git log --graph --abbrev-commit --oneline --decorate'   # Zeigt die Commit-Historie in einer graphischen Darstellung an

# Git Remote
alias gr='git remote'          # Zeigt die Namen der Remote-Repositories an
alias grs='git remote show'    # Zeigt Informationen zu den Remote-Repositories an

# Andere Aliase
alias gcb='git checkout -b'    # Erstellt einen neuen Branch und wechselt zu diesem
alias gcm='git checkout master'    # Wechselt zum Branch "master"
alias gclean="git branch --merged | grep -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d"    # Löscht lokale Branches, die in den Branch "master" gemerged wurden
alias gblog="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:red)%(refname:short)%(color:reset) - %(color:yellow)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:blue)%(committerdate:relative)%(color:reset))'"    # Zeigt die Commit-Historie für jeden Branch an
alias gsub="git submodule update --remote"   # Aktualisiert alle Submodule auf die neueste Version
alias gj="git-jump"    # Öffnet in der Vim-Quickfix-Liste Dateien von Interesse (z.B. bei "git diff" oder gemergten Dateien)
alias dif="git diff --no-index"   # Vergleicht zwei Dateien, auch wenn sie nicht im Git-Repository sind

#alias g='   '  #
#alias g='   '  #
#alias g='   '  #
#alias g='   '  #
#alias g='   '  #
#alias XX='exa' #test
