#!/usr/bin/env zsh

###########################################
##  filename:    	.zshrc
##  filepath:     	/home/ZSH/
##  author:       	mxx
##  file save date: 	mxx 15.11.23
##  file creation\
##  date: [yy-mmm]:     23 oct
##  file status		work in progess
##  comments to HISTORY searches: 	
##   - GLOBAL:  (STRG)+R 	 
##   - PREFIX:  (ALT) +P   ## start search w/ previous cmd 
###########################################

### ------------------------------ ##
#      C M D    H I S T O R Y
### ------------------------------ ##
	setopt HIST_SAVE_NO_DUPS        # Do not write a duplicate event to the history file.
# unsetopt HIST_SAVE_NO_DUPS    # Write a duplicate event to the history file
setopt INC_APPEND_HISTORY 	# append the command without for shell exit
setopt SHARE_HISTORY 		# enable to see previous commands from different terminal
setopt EXTENDED_HISTORY 	# Save each command’s beginning timestamp

### ------------------------------ ##
# **ZSH DIRECTORY STACK** aka DS
### ------------------------------ ##
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
DIRSTACKSIZE=14
## wichtige Aliase für ZSH DIRECTORY STACK - DS
alias -g d='dirs -v'
for index ({1..14}) alias "$index"="cd -${index}"; unset index
setopt AUTO_CD   	# '..' statt 'cd ..'
REPORTTIME=3 		# display cpu usage, if command taking more than 3s

### ------------------------------ ##
## **ZSH GLOBBING**
### ------------------------------ ##
setopt EXTENDEDGLOB	# for superglob for ls **/*.txt oder ls -d *(D)
unsetopt CASEGLOB
setopt ALIAS_FUNC_DEF 	# if set, aliases can be used for defining functions
setopt INTERACTIVE_COMMENTS 	# allow comments even in interactive shells
setopt PRINT_EXIT_VALUE		# print the exit value of programs with non-zero exit status
setopt RM_STAR_WAIT		# wait 10s and ignore anything typed, avoid problem
				# of reflexively answering ‘yes’ to the query: rm *
setopt bsd_echo 	# print newline (\n) or tab (\t) characters as visible 
			# backslash escaped character present in a string
			# eg$ echo "\t\n"

setopt ksh_option_print	# change the list of options printed with "setopt" 
			# from showing only enabled options to showing each option

setopt csh_nullcmd  	# no overwrite of  "file.txt" by using redirect >file.txt

#ACHTUNG ksh_array produziert Fehler
#unsetopt ksh_arrays	# for intutive array to set with:
			# declare -a kitchen_items=(plates cutlery oven sink)
			# print ${kitchen_items[1]}

setopt sh_word_split	# split multi-word variables into individual elements
			# try (n)with, and "unsetopt sh_word_split":
			# for word in $kitchen_items; do print "$word"; end

setopt notify		    # notifier fir big jobs
unsetopt beep		# beep ausschalten
### ------------------------------ ###
# S O U R C E plugins
### ------------------------------ ###
# config für die "completion" gesourct
source  "$ZDOTDIR/completion.zsh" 
# zsh plugin syntax highlight" source
source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
## zsh plugin for colorifies man pages and less 
source "$ZDOTDIR/zsh-colored-man-pages/colored-man-pages.plugin.zsh" 
#. "/etc/zsh_command_not_found"
source "/etc/zsh_command_not_found"
# aliases file
source "$ZDOTDIR/aliases.zsh"   
# source custom function to log_error
source "$ZDOTDIR/log_error.zsh"
#  	komforatbale Art apt search und apt show per fzf nutzen
#source "$ZDOTDIR/APTsearch.zsh"

### ------------------------------ ###
##          **P R O M P T**
### ------------------------------ ###
# Farben #39257D #db29c8 #100438 #3B0045
# #E8C536 #FFCA5B #805700 #edd400 #8ae234
#PROMPT='%F{184}%n%f@%F{013}%m%f:%~/ > '
#PROMPT 2: Simple prompt with username, machine name, and current directory in Dracula colors
#PROMPT='%F{81}%*%f %F{135}%n%f@%F{81}%m%f %F{214}%1~%f %#' 
#Prompt 3: with time, username, machine name, and current directory in Dracula colors:
#PROMPT='%F{135}%n%f@%F{81}%m%f:%F{214}%1~%f %$' 
# Powerline Prompt configuration, edit über die conf_powerline.json
if [[ -r /usr/share/powerline/bindings/zsh/powerline.zsh ]]; then
     source /usr/share/powerline/bindings/zsh/powerline.zsh
fi
# RECHTER PROMPT 1
#RPROMPT=%F{black}%K{magent}%D{%a,%e.%b.%y}%f%k 
#RPROMPT 2: Tag, Nummer. Monat. Jahr
#RPROMPT="%F{#CF36E8}%K{#39257D}%D{%a,}%f%k%K{#3B0045}%F{#518EA9}%D{%e.%b.}%f%k%F{#FFEAA0}%K{#95235F}%D{%Y}%f%k"
#RPROMPT3: 23:16 Di, 14.Nov. 2023
RPROMPT="%F{#FFCA5B}%K{#805700}$ %F{#FFEAA0}%K{#95235F}%D{%R}%f%k%F{#FFCA5B}%K{#805700} %F{#CF36E8}%K{#39257D}%D{%a,}%f%k%K{#3B0045}%F{#518EA9}%D{%e.%b.}%f%k%F{#FFEAA0}%K{#1E202C}%D{%Y}%f%k"

#ALTERNATIV Purity prompt, mit source kein Fehler 
fpath=($ZDOTDIR $fpath)
### ------------------------------ ###
#  **A U T O L O A D**
### ------------------------------ ###
#autoload -Uz "prompt_purifi.zsh"; prompt_purifi.zsh

# autoload command load a file containing shell commands
# autoload looks in directories of the "_Zsh file search path_", defined in the 
# variable `$fpath`, and search a file called `compinit`.
autoload -Uz compinit; compinit
_comp_options+=(globdots) 	# With hidden files

### ------------------------------ ###
#  l o g    e r r o r
### ------------------------------ ###
# Rufe die log_error-Funktion aus der precmd-Funktion auf
precmd() {
  log_error }
  
### ------------------------------ ###
###                  f z f
### ------------------------------ ###
source "/usr/share/doc/fzf/examples/key-bindings.zsh"
#source "/usr/share/zsh/vendor-completions/_fzf"
source "/usr/share/doc/fzf/examples/completion.zsh"

### ------------------------------ ###
###  globalen Suffix-Aliases erweitern
### ------------------------------ ###
# realisiert, dass man die globalen Suffix-Aliases erweitern aka sehen kann
globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}
zle -N globalias
bindkey " " globalias
bindkey "^ " magic-space          # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches


### ------------------------------ ###
## apt install zoxide: _z_cd, z , zi, za, zq, zqi, zr ### ------------------------------ ###
_z_cd() {
    cd "$@" || return "$?"

    if [ "$_ZO_ECHO" = "1" ]; then
        echo "$PWD"
    fi
}

z() {
    if [ "$#" -eq 0 ]; then
        _z_cd ~
    elif [ "$#" -eq 1 ] && [ "$1" = '-' ]; then
        if [ -n "$OLDPWD" ]; then
            _z_cd "$OLDPWD"
        else
            echo 'zoxide: $OLDPWD is not set'
            return 1
        fi
    else
        _zoxide_result="$(zoxide query -- "$@")" && _z_cd "$_zoxide_result"
    fi
}
zi() {
    _zoxide_result="$(zoxide query -i -- "$@")" && _z_cd "$_zoxide_result"
}
alias za='zoxide add'
alias zq='zoxide query'
alias zqi='zoxide query -i'
alias zr='zoxide remove'
zri() {
    _zoxide_result="$(zoxide query -i -- "$@")" && zoxide remove "$_zoxide_result"
}
_zoxide_hook() {
    zoxide add "$(pwd -L)"
}
chpwd_functions=(${chpwd_functions[@]} "_zoxide_hook")

### ------------------------------ ###
## enable support for Bash completion.
### ------------------------------ ###
autoload -U bashcompinit
bashcompinit
### ------------------------------ ###
# Funktion ZC: Speichert den letzten Befehl in die Datei $ZDOTDIR/aliases.maybe und gibt eine Bestätigungsmeldung aus.
### ------------------------------ ###
function COPYtoZ() {
	 # 'echo $(fc -ln -1)' gibt den letzten Befehl aus.
	 # 'tee -a $ZDOTDIR/aliases.maybe' fügt den Ausgabetext an die Datei $ZDOTDIR/aliases.maybe an.
	  echo $(fc -ln -1) | tee -a $ZDOTDIR/aliases.maybe
	 # Überprüft, ob der letzte Befehl erfolgreich ausgeführt wurde.
	 if [ $? -eq 0 ]; then
	   # Wenn der Befehl erfolgreich ausgeführt wurde, gibt diese Funktion eine Bestätigungsmeldung aus.
	   echo "Befehl $(fc -ln -1) wurde erfolgreich an $ZDOTDIR/aliases.maybe angehängt."
	 else
	   # Wenn der Befehl fehlgeschlagen ist, gibt diese Funktion eine Fehlermeldung aus.
	   echo "Fehler beim Anhängen des Befehls $(fc -ln -1) an $ZDOTDIR/aliases.maybe."
	 fi
}

### ------------------------------------------------------------ ###
## export LS_COLORS="$(vivid generate theme)" ####Die erste Option versucht, die Farben mit dem vivid-Tool und einer YAML-Datei zu generieren. Wenn dies fehlschlägt, wird die zweite Option verwendet, um die Farben manuell festzulegen. ###  aus mxx.yml ------------------------- 

export LS_COLORS="$(vivid -m 8-bit generate $HOME/.config/vivid/mxx.yml)" || export LS_COLORS='su=0;38;2;241;250;140;48;2;255;121;198:ex=0;38;2;80;250;123:ow=0;38;2;139;233;253;48;2;40;42;54:ln=0;38;2;139;233;253:tw=0;38;2;241;250;140;48;2;80;250;123:pi=1;38;2;241;250;140;48;2;40;42;54:rs=0;38;2;255;184;108:ca=0:cd=1;38;2;255;184;108;48;2;40;42;54:di=0;38;2;189;147;249:sg=0;38;2;241;250;140;48;2;255;121;198:mi=0;38;2;255;85;85;48;2;40;42;54:st=0;38;2;241;250;140;48;2;139;233;253:mh=0:no=0;38;2;248;248;242:so=1;38;2;241;250;140;48;2;40;42;54:do=1;38;2;241;250;140;48;2;40;42;54:fi=0;38;2;248;248;242:*~=0;38;2;58;60;78:or=0;38;2;255;85;85;48;2;40;42;54:bd=1;38;2;255;184;108;48;2;40;42;54:*.c=0;38;2;255;184;108:*.m=0;38;2;255;184;108:*.z=1;38;2;189;147;249:*.d=0;38;2;255;184;108:*.o=0;38;2;58;60;78:*.r=0;38;2;255;184;108:*.t=0;38;2;255;184;108:*.a=0;38;2;80;250;123:*.h=0;38;2;255;184;108:*.p=0;38;2;255;184;108:*.kt=0;38;2;255;184;108:*.el=0;38;2;255;184;108:*.hh=0;38;2;255;184;108:*.ps=0;38;2;255;184;108:*.la=0;38;2;58;60;78:*.cr=0;38;2;255;184;108:*.vb=0;38;2;255;184;108:*.fs=0;38;2;255;184;108:*.cp=0;38;2;255;184;108:*.7z=1;38;2;189;147;249:*.sh=0;38;2;255;184;108:*.rm=1;38;2;255;184;108:*.rb=0;38;2;255;184;108:*.jl=0;38;2;255;184;108:*.pm=0;38;2;255;184;108:*.wv=0;38;2;255;184;108:*.gz=1;38;2;189;147;249:*.mn=0;38;2;255;184;108:*css=0;38;2;255;184;108:*.md=0;38;2;255;184;108:*.ko=0;38;2;80;250;123:*.td=0;38;2;255;184;108:*.di=0;38;2;255;184;108:*.hs=0;38;2;255;184;108:*.rs=0;38;2;255;184;108:*.gv=0;38;2;255;184;108:*.js=0;38;2;255;184;108:*.bz=1;38;2;189;147;249:*.hi=0;38;2;58;60;78:*.ml=0;38;2;255;184;108:*.nb=0;38;2;255;184;108:*.cc=0;38;2;255;184;108:*.so=0;38;2;80;250;123:*.ex=0;38;2;255;184;108:*.as=0;38;2;255;184;108:*.cs=0;38;2;255;184;108:*.go=0;38;2;255;184;108:*.lo=0;38;2;58;60;78:*.py=0;38;2;255;184;108:*.pp=0;38;2;255;184;108:*.bc=0;38;2;58;60;78:*.ll=0;38;2;255;184;108:*.ui=0;38;2;255;184;108:*.ts=0;38;2;255;184;108:*.xz=1;38;2;189;147;249:*.pl=0;38;2;255;184;108:*.tar=1;38;2;189;147;249:*.csv=0;38;2;255;184;108:*.swf=1;38;2;255;184;108:*.erl=0;38;2;255;184;108:*.eps=0;38;2;241;250;140:*.avi=1;38;2;255;184;108:*.mli=0;38;2;255;184;108:*.dot=0;38;2;255;184;108:*.xml=0;38;2;255;184;108:*.pdf=0;38;2;255;184;108:*.arj=1;38;2;189;147;249:*.flv=1;38;2;255;184;108:*.odp=0;38;2;255;184;108:*.tml=0;38;2;255;184;108:*.bak=0;38;2;58;60;78:*.blg=0;38;2;58;60;78:*.rst=0;38;2;255;184;108:*.exs=0;38;2;255;184;108:*.pod=0;38;2;255;184;108:*.xmp=0;38;2;255;184;108:*.git=0;38;2;58;60;78:*.bag=1;38;2;189;147;249:*.pas=0;38;2;255;184;108:*.elm=0;38;2;255;184;108:*.lua=0;38;2;255;184;108:*TODO=1;38;2;255;184;108:*.bmp=0;38;2;241;250;140:*.wma=0;38;2;255;184;108:*.com=0;38;2;80;250;123:*.csx=0;38;2;255;184;108:*.pyd=0;38;2;58;60;78:*.pro=0;38;2;255;184;108:*.tsx=0;38;2;255;184;108:*.out=0;38;2;58;60;78:*.fon=0;38;2;255;184;108:*.tex=0;38;2;255;184;108:*.awk=0;38;2;255;184;108:*.clj=0;38;2;255;184;108:*.vcd=1;38;2;189;147;249:*.mov=1;38;2;255;184;108:*.c++=0;38;2;255;184;108:*.svg=0;38;2;241;250;140:*.fnt=0;38;2;255;184;108:*.bib=0;38;2;255;184;108:*.vim=0;38;2;255;184;108:*.rpm=1;38;2;189;147;249:*.exe=0;38;2;80;250;123:*.mid=0;38;2;255;184;108:*.dpr=0;38;2;255;184;108:*.apk=1;38;2;189;147;249:*.aux=0;38;2;58;60;78:*.bsh=0;38;2;255;184;108:*.jar=1;38;2;189;147;249:*.fsi=0;38;2;255;184;108:*.ilg=0;38;2;58;60;78:*.rar=1;38;2;189;147;249:*.mkv=1;38;2;255;184;108:*.jpg=0;38;2;241;250;140:*.vob=1;38;2;255;184;108:*.zst=1;38;2;189;147;249:*.log=0;38;2;58;60;78:*.nix=0;38;2;255;184;108:*.hxx=0;38;2;255;184;108:*.fsx=0;38;2;255;184;108:*.htc=0;38;2;255;184;108:*.cgi=0;38;2;255;184;108:*.bst=0;38;2;255;184;108:*.ipp=0;38;2;255;184;108:*.swp=0;38;2;58;60;78:*.bbl=0;38;2;58;60;78:*.odt=0;38;2;255;184;108:*.kts=0;38;2;255;184;108:*.ini=0;38;2;255;184;108:*.gvy=0;38;2;255;184;108:*.zsh=0;38;2;255;184;108:*.sxw=0;38;2;255;184;108:*.cpp=0;38;2;255;184;108:*.ps1=0;38;2;255;184;108:*.inl=0;38;2;255;184;108:*.epp=0;38;2;255;184;108:*.pyo=0;38;2;58;60;78:*.cfg=0;38;2;255;184;108:*.tgz=1;38;2;189;147;249:*.php=0;38;2;255;184;108:*.pbm=0;38;2;241;250;140:*.tcl=0;38;2;255;184;108:*.m4a=0;38;2;255;184;108:*.ltx=0;38;2;255;184;108:*.hpp=0;38;2;255;184;108:*.zip=1;38;2;189;147;249:*.pkg=1;38;2;189;147;249:*hgrc=0;38;2;255;184;108:*.pid=0;38;2;58;60;78:*.mir=0;38;2;255;184;108:*.bz2=1;38;2;189;147;249:*.toc=0;38;2;58;60;78:*.idx=0;38;2;58;60;78:*.pps=0;38;2;255;184;108:*.iso=1;38;2;189;147;249:*.h++=0;38;2;255;184;108:*.wav=0;38;2;255;184;108:*.sxi=0;38;2;255;184;108:*.ico=0;38;2;241;250;140:*.kex=0;38;2;255;184;108:*.ttf=0;38;2;255;184;108:*.xls=0;38;2;255;184;108:*.doc=0;38;2;255;184;108:*.tmp=0;38;2;58;60;78:*.xcf=0;38;2;241;250;140:*.mp3=0;38;2;255;184;108:*.bcf=0;38;2;58;60;78:*.mpg=1;38;2;255;184;108:*.htm=0;38;2;255;184;108:*.txt=0;38;2;255;184;108:*.sty=0;38;2;58;60;78:*.cxx=0;38;2;255;184;108:*.ods=0;38;2;255;184;108:*.inc=0;38;2;255;184;108:*.tif=0;38;2;241;250;140:*.otf=0;38;2;255;184;108:*.wmv=1;38;2;255;184;108:*.dmg=1;38;2;189;147;249:*.sbt=0;38;2;255;184;108:*.bat=0;38;2;80;250;123:*.pgm=0;38;2;241;250;140:*.aif=0;38;2;255;184;108:*.pyc=0;38;2;58;60;78:*.rtf=0;38;2;255;184;108:*.fls=0;38;2;58;60;78:*.ppt=0;38;2;255;184;108:*.bin=1;38;2;189;147;249:*.def=0;38;2;255;184;108:*.gif=0;38;2;241;250;140:*.psd=0;38;2;241;250;140:*.ogg=0;38;2;255;184;108:*.ind=0;38;2;58;60;78:*.img=1;38;2;189;147;249:*.png=0;38;2;241;250;140:*.deb=1;38;2;189;147;249:*.tbz=1;38;2;189;147;249:*.ics=0;38;2;255;184;108:*.yml=0;38;2;255;184;108:*.m4v=1;38;2;255;184;108:*.dll=0;38;2;80;250;123:*.asa=0;38;2;255;184;108:*.xlr=0;38;2;255;184;108:*.mp4=1;38;2;255;184;108:*.dox=0;38;2;255;184;108:*.sql=0;38;2;255;184;108:*.ppm=0;38;2;241;250;140:*.mpeg=1;38;2;255;184;108:*.lock=0;38;2;58;60;78:*.hgrc=0;38;2;255;184;108:*.conf=0;38;2;255;184;108:*.diff=0;38;2;255;184;108:*.psd1=0;38;2;255;184;108:*.yaml=0;38;2;255;184;108:*.webm=1;38;2;255;184;108:*.json=0;38;2;255;184;108:*.opus=0;38;2;255;184;108:*.xlsx=0;38;2;255;184;108:*.rlib=0;38;2;58;60;78:*.toml=0;38;2;255;184;108:*.lisp=0;38;2;255;184;108:*.jpeg=0;38;2;241;250;140:*.tiff=0;38;2;241;250;140:*.make=0;38;2;255;184;108:*.pptx=0;38;2;255;184;108:*.docx=0;38;2;255;184;108:*.epub=0;38;2;255;184;108:*.orig=0;38;2;58;60;78:*.bash=0;38;2;255;184;108:*.java=0;38;2;255;184;108:*.h264=1;38;2;255;184;108:*.html=0;38;2;255;184;108:*.fish=0;38;2;255;184;108:*.psm1=0;38;2;255;184;108:*.tbz2=1;38;2;189;147;249:*.dart=0;38;2;255;184;108:*.less=0;38;2;255;184;108:*.purs=0;38;2;255;184;108:*.flac=0;38;2;255;184;108:*.class=0;38;2;58;60;78:*.cmake=0;38;2;255;184;108:*.xhtml=0;38;2;255;184;108:*.cabal=0;38;2;255;184;108:*.patch=0;38;2;255;184;108:*.swift=0;38;2;255;184;108:*README=0;38;2;255;184;108:*.dyn_o=0;38;2;58;60;78:*.cache=0;38;2;58;60;78:*.mdown=0;38;2;255;184;108:*passwd=0;38;2;255;184;108:*.toast=1;38;2;189;147;249:*.ipynb=0;38;2;255;184;108:*.scala=0;38;2;255;184;108:*.shtml=0;38;2;255;184;108:*shadow=0;38;2;255;184;108:*COPYING=0;38;2;255;184;108:*LICENSE=0;38;2;255;184;108:*.dyn_hi=0;38;2;58;60;78:*.flake8=0;38;2;255;184;108:*.config=0;38;2;255;184;108:*.ignore=0;38;2;255;184;108:*.matlab=0;38;2;255;184;108:*TODO.md=1;38;2;255;184;108:*.gradle=0;38;2;255;184;108:*INSTALL=0;38;2;255;184;108:*.groovy=0;38;2;255;184;108:*TODO.txt=1;38;2;255;184;108:*.desktop=0;38;2;255;184;108:*Makefile=0;38;2;255;184;108:*setup.py=0;38;2;255;184;108:*Doxyfile=0;38;2;255;184;108:*.gemspec=0;38;2;255;184;108:*COPYRIGHT=0;38;2;255;184;108:*.cmake.in=0;38;2;255;184;108:*.kdevelop=0;38;2;255;184;108:*.fdignore=0;38;2;255;184;108:*configure=0;38;2;255;184;108:*.DS_Store=0;38;2;58;60;78:*.markdown=0;38;2;255;184;108:*README.md=0;38;2;255;184;108:*.rgignore=0;38;2;255;184;108:*.gitignore=0;38;2;255;184;108:*SConstruct=0;38;2;255;184;108:*.gitconfig=0;38;2;255;184;108:*README.txt=0;38;2;255;184;108:*.scons_opt=0;38;2;58;60;78:*.localized=0;38;2;58;60;78:*INSTALL.md=0;38;2;255;184;108:*CODEOWNERS=0;38;2;255;184;108:*Dockerfile=0;38;2;255;184;108:*SConscript=0;38;2;255;184;108:*INSTALL.txt=0;38;2;255;184;108:*Makefile.am=0;38;2;255;184;108:*.synctex.gz=0;38;2;58;60;78:*Makefile.in=0;38;2;58;60;78:*LICENSE-MIT=0;38;2;255;184;108:*.travis.yml=0;38;2;255;184;108:*MANIFEST.in=0;38;2;255;184;108:*.gitmodules=0;38;2;255;184;108:*CONTRIBUTORS=0;38;2;255;184;108:*.applescript=0;38;2;255;184;108:*configure.ac=0;38;2;255;184;108:*appveyor.yml=0;38;2;255;184;108:*.fdb_latexmk=0;38;2;58;60;78:*.clang-format=0;38;2;255;184;108:*CMakeCache.txt=0;38;2;58;60;78:*CMakeLists.txt=0;38;2;255;184;108:*LICENSE-APACHE=0;38;2;255;184;108:*.gitattributes=0;38;2;255;184;108:*CONTRIBUTORS.md=0;38;2;255;184;108:*CONTRIBUTORS.txt=0;38;2;255;184;108:*requirements.txt=0;38;2;255;184;108:*.sconsign.dblite=0;38;2;58;60;78:*package-lock.json=0;38;2;58;60;78:*.CFUserTextEncoding=0;38;2;58;60;78'
