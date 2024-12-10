### .zshrc mxx 15.11.23

# **H I S T O R Y**
#	use w/	  ^  R 	  for search    
#	or w/  	 ALT P 	  start search w/ preorius cmd 
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
# unsetopt HIST_SAVE_NO_DUPS       # Write a duplicate event to the history file`
setopt INC_APPEND_HISTORY 	# append the command without for shell exit
setopt SHARE_HISTORY 		# enable to see previous commands from different terminal
setopt EXTENDED_HISTORY 	# Save each command’s beginning timestamp

# **ZSH DIRECTORY STACK** aka DS
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
DIRSTACKSIZE=14
## wichtige Aliase für DS
alias d='dirs -v'
for index ({1..14}) alias "$index"="cd ${index}"; unset index

setopt AUTO_CD   	# '..' statt 'cd ..'

REPORTTIME=3 		# display cpu usage, if command taking more than 3s

## **ZSH GLOBBING**
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
			
setopt ksh_option_print	# change the list of options printed with 'setopt' 
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

# **P R O M P T**
# Farben 	#39257D 	#db29c8 	#100438 	#3B0045
# #E8C536 	#FFCA5B 	#805700 	#edd400 	#8ae234

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
#fpath=($ZDOTDIR $fpath)
#autoload -Uz "prompt_purifi.zsh"; prompt_purifi.zsh

#  **A U T O L O A D**

# autoload command load a file containing shell commands
# autoload looks in directories of the "_Zsh file search path_", defined in the 
# variable `$fpath`, and search a file called `compinit`.
autoload -Uz compinit; compinit
_comp_options+=(globdots) 	# With hidden files


# S O U R C E plugins
# config für die "completion" gesourct
source  "$ZDOTDIR/completion.zsh" 
# zsh plugin syntax highlight" source
source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
## zsh plugin for colorifies man pages and less 
source "$ZDOTDIR/zsh-colored-man-pages/colored-man-pages.plugin.zsh" 
#. "/etc/zsh_command_not_found"
source "/etc/zsh_command_not_found"
# aliases file
source "$ZDOTDIR/aliases"   

#fzf
source "/usr/share/doc/fzf/examples/key-bindings.zsh"
#source "/usr/share/zsh/vendor-completions/_fzf"
source "/usr/share/doc/fzf/examples/completion.zsh"

## --- ANFANG
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
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches
## --- ENDE

