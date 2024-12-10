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
##   - GLOBAL:  (STRG)^ R 	 
##   - PREFIX:  (ALT) + P   
##     start search w/ previous cmd 
###########################################

# echo -e "${LILA} ... hallo Welt! ${RESET}"
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
##   * * ZSH  P R O M P T   * *
### ------------------------------ ###
	# Farben #39257D #db29c8 #100438 #3B0045
	# #E8C536 #FFCA5B #805700 #edd400 #8ae234
	#PROMPT='%F{184}%n%f@%F{013}%m%f:%~/ > '
	#PROMPT 2: Simple prompt with username, machine name, and current directory in Dracula colors
	#PROMPT='%F{81}%*%f %F{135}%n%f@%F{81}%m%f %F{214}%1~%f %#' 
	#Prompt 3: with time, username, machine name, and current directory in Dracula colors:
	#PROMPT='%F{135}%n%f@%F{81}%m%f:%F{214}%1~%f %$' 

 ### ------------------ ###
 ## P O W E R L E V E L PROMPT source
 ### ------------------ ###
 
 ###  powerlevel10k
 ### ------------------ ###

 # git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
 #% p10k configure # to config
 if [[ -r $ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme ]]; 
 then 
 	source "$ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme"
	POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
 fi

 # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/ZSH/.zshrc.
 # Initialization code that may require console input (password prompts, [y/n]
 # confirmations, etc.) must go above this block; everything else may go below.
 if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
 fi
 
 # To customize prompt, run `p10k configure` or edit ~/.config/ZSH/.p10k.zsh.
#alt:    [[ ! -f ~/.config/ZSH/.p10k.zsh ]] || source ~/.config/ZSH/.p10k.zsh
[[ ! -f $ZDOTDIR/prompt-p10.zsh ]] || source $ZDOTDIR/prompt-p10.zsh
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_CONTEXT_TEMPLATE=$'\ue795'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='#0abdc6'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='#321959'
POWERLEVEL9K_DIR_HOME_FOREGROUND='#0abdc6'
POWERLEVEL9K_DIR_HOME_BACKGROUND='#0b2956'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='#0abdc6'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='#0b2956'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='#0abdc6'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='#0b2956'
POWERLEVEL9K_DIR_ETC_FOREGROUND='#0abdc6'
POWERLEVEL9K_DIR_ETC_BACKGROUND='#0b2956'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='#ea00d9'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='#321959'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='#f57800'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='#321959'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='#00ff00'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='#321959'
POWERLEVEL9K_STATUS_OK_BACKGROUND='#321959'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='#ff0000'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='#321959'
POWERLEVEL9K_HISTORY_BACKGROUND='#0b2956'
POWERLEVEL9K_HISTORY_FOREGROUND='#0abdc6'
POWERLEVEL9K_TIME_BACKGROUND='#321959'
POWERLEVEL9K_TIME_FOREGROUND='#ea00d9'
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
 ###  powerlevel9
 ### ------------------ ###
 #  Powerline Prompt configuration 9 , edit über die conf_powerline.json
 #if [[ -r /usr/share/powerline/bindings/zsh/powerline.zsh ]]; then
 #    source /usr/share/powerline/bindings/zsh/powerline.zsh
 #fi
 
 # RECHTER PROMPT 1
 #RPROMPT=%F{black}%K{magent}%D{%a,%e.%b.%y}%f%k 
 #RPROMPT 2: Tag, Nummer. Monat. Jahr
 #RPROMPT="%F{#CF36E8}%K{#39257D}%D{%a,}%f%k%K{#3B0045}%F{#518EA9}%D{%e.%b.}%f%k%F{#FFEAA0}%K{#95235F}%D{%Y}%f%k"
 #RPROMPT3: 23:16 Di, 14.Nov. 2023
# RPROMPT="%F{#FFCA5B}%K{#805700}$ %F{#FFEAA0}%K{#95235F}%D{%R}%f%k%F{#FFCA5B}%K{#805700} %F{#CF36E8}%K{#39257D}%D{%a,}%f%k%K{#3B0045}%F{#518EA9}%D{%e.%b.}%f%k%F{#FFEAA0}%K{#1E202C}%D{%Y}%f%k"

 fpath=($ZDOTDIR $fpath)

### ------------------------------ ###
#  * * A U T O L O A D * *
### ------------------------------ ###
  #  autoload command load a file containing shell commands
  # autoload looks in directories of the "_Zsh file search path_", defined in the 
  # variable `$fpath`, and search a file called `compinit`.
  autoload -Uz compinit; compinit
  _comp_options+=(globdots) 	# With hidden files

  #  ALTERNATIV Purity prompt, mit source kein Fehler 
  #autoload -Uz prompt_purifi; prompt_purifi
  # source prompt_purifi.zsh

# ohne extension zsh
#fpath+=("$ZDOTDIR/bin")
#autoload -Uz APTsearch

### ------------------------------ ###
#     * * l o g    e r r o r
### ------------------------------ ###
# Rufe die log_error-Funktion aus der precmd-Funktion auf
precmd() {
  log_error }
  

### ------------------------------ ###
##      globale 
##       Suffix-Aliases erweitern
### ------------------------------ ###
# realisiert, dass man die globalen Suffix
# -Aliases erweitern aka sehen kann
 globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
 }
 zle -N globalias
 bindkey " " globalias
 # control-space to bypass completion
 bindkey "^ " magic-space   
 # normal space during searches       
 bindkey -M isearch " " magic-space 

### ------------------------------ ###
##      zoxide (better cd)   
### ------------------------------ ###
##      apt install zoxide
## _z_cd, z , zi, za, zq, zqi, zr 
### ------------------------------ ###
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
#        Funktion COPYto .... aliases.maybe  
# Speichert den letzten Befehl in die Datei 
# $ZDOTDIR/aliases.maybe und gibt eine Bestätigungsmeldung aus.
### ------------------------------ ###
 function COPYtoZ() {
	 # 'echo $(fc -ln -1)' gibt den letzten Befehl aus.
	 # 'tee -a $ZDOTDIR/aliases.maybe' fügt den Ausgabetext 
	 # an die Datei $ZDOTDIR/aliases.maybe an.
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
### ------------------------------ ###
##     a p t    s e a r c h 
##     n a l a  s e a r c h 
### ------------------------------ ###
#  	komforatbale Art apt/nala search und apt/nala show per fzf nutzen
# the nala_search function will display the package information 
# and prompt you to install the package using the standard input
SEArchNdestroy() 
{
 # Assign the first argument to the search_term variable
   local search_term="$1"  
    # Check if a search_term was provided as an argument
    if [[ $# -eq 0 ]]; then
        echo -e "${GELB}\tGib einen Suchbegriff ein${RESET}:"
        read -r search_term
    else
        search_term="$*"
    fi

    local install_package
    local search_result
    mein_array=()
    # color def
#    PINK="\033[38;2;219;41;200m\033[48;2;59;0;69m" #PINK auf dunkel
 #   GELB="\033[38;2;232;197;54m\033[48;2;128;87;0m" #gelb auf dunkel
  #  LILA="\033[38;2;85;85;255m\033[48;2;21;16;46m" # LILA auf dunkel
   # RESET="\e[0m" # RESET
    # Check if user has sudo privileges
    if ! sudo -n true 2>/dev/null; then
        echo -e "${GELB}Dieses Skript erfordert sudo-Berechtigungen, um Pakete zu installieren.${RESET}"
        echo -e "${PINK}Bitte geben Sie Ihr Sudo-Passwort ein:${RESET}"
       sudo -v
    fi

    # Perform search and display results
    search_result=$(nala search "$search_term" | fzf)

    if [[ -n "$search_result" ]]; then
        local package_name=$(echo "$search_result" | awk '{print $1}')
        mein_array+=("$(nala show "$package_name")")
        # Display Results and Prompt for Installation
        echo -e "${GELB}\n$mein_array\n ${RESET}\n"
        sudo nala install "$package_name"
        sudo nala autoremove
        sudo nala autopurge
        # sudo nala history   
    fi
}

# TON() {
  # local CARDS=$(cat /proc/asound/cards)
  # local DEVICES=$(aplay -l)
  # local CODECS=$(cat /proc/asound/card*/codec*)
# 
  # local TABELLE="| Karte | Gerät | Codec |"
# 
  # while read -r KARTE; do
    # while read -r GERÄT; do
      # while read -r CODEC; do
        # TABELLE="${TABELLE}\n| $(printf "%-6s" "$KARTE") | $(printf "%-15s" "$GERÄT") | $(printf "%-15s" "$CODEC") |"
      # done <<< "$(echo "$CODECS" | grep "$KARTE")"
    # done <<< "$(echo "$DEVICES" | grep "$KARTE")"
  # done <<< "$(echo "$CARDS")"
# 
  # column -t <<< "$TABELLE"
# }

### ------------------------------ ###
###                  f z f
### ------------------------------ ###
 source "/usr/share/doc/fzf/examples/key-bindings.zsh"
 #source "/usr/share/zsh/vendor-completions/_fzf"
 source "/usr/share/doc/fzf/examples/completion.zsh"

 function fzkill() {
    local pid
    pid=$(ps aufxc --user $(id -u)| sed 1d | fzf -m | awk '{print $2}')
    
    if [[ -n "$pid" ]]; then
        kill -${1:-TERM} $pid
    fi
}
#if [[ -r $ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme ]]; then
#	source "$ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme"
#	POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
# fi


### ------------------------------ ###
#    * *  S O U R C E plugins   * * ##
### ------------------------------ ###
# config für die "completion" gesourct
source  "$ZDOTDIR/completion.zsh" 
source  "$ZDOTDIR/nala-completion.zsh"
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


# motd
export SCRIPT_RUN_zshrc="true"
source "$ZDOTDIR/zgreeting.zsh"

### ------------------------------------------------------------ ###
## export LS_COLORS="$(vivid generate theme)" 
## Die erste Option versucht, die Farben mit dem vivid-Tool und einer YAML-Datei zu generieren. 
## Wenn dies fehlschlägt, wird die zweite Option verwendet, 
#export LS_COLORS="$(vivid generate molokai)"
## um die Farben manuell festzulegen. ###  aus mxx.yml 
#export LS_COLORS="$(vivid -m 8-bit generate "$ZDOTDIR/color-schema.yml")"
#export LS_COLORS="$(vivid generate "$ZDOTDIR/color-schema.yml")"
### ------------------------------------------------------------ ###
# ; ll; e1; l; 
#  export LS_COLORS="$(vivid -m 8-bit generate gruvbox-dark-soft)"; ll; e1; l;no
# export LS_COLORS="$(vivid -m 8-bit generate jellybeans)"; ll; e1; l; no
 export LS_COLORS="$(vivid one-dark)"; ll; e1; l; ok
#export LS_COLORS="$(vivid -m 8-bit generate gruvbox-dark)"; ll; e1; l; no
# export LS_COLORS="$(vivid -m 8-bit generate dracula)"; ll; e1; l; naja
# export LS_COLORS="$(vivid -m 8-bit generate iceberg-dark)"; ll; e1; l; no

#dracula 	naja
#gruvbox-dark no
# one-dark ok
# iceberg-dark no
#jellybeans no
# lava naja
# molokai   gut
# nord no
# one-dark naja
#solarized-dark naj
# snazzy ok
 
