### .zshrc mxx 15.11.23
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
# unsetopt HIST_SAVE_NO_DUPS       # Write a duplicate event to the history file`
setopt INC_APPEND_HISTORY # append the command without waiting for shell exit
setopt SHARE_HISTORY #enable to see previous commands that has been entered using different terminal
 
#ZSH Directory Stack DS
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
DIRSTACKSIZE=14
#Wichtige Aliase für DS
alias d='dirs -v'
for index ({1..14}) alias "$index"="cd +${index}"; unset index


setopt notify		 #notifier fir big jobs
unsetopt beep

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
RPROMPT="%F{#FFCA5B}%K{#805700}$ %F{#FFEAA0}%K{#95235F}%D{%R}%f%k%F{#FFCA5B}%K{#805700} %F{#CF36E8}%K{#39257D}%D{%a,}%f%k%K{#3B0045}%F{#518EA9}%D{%e.%b.}%f%k%F{#FFEAA0}%K{#1E202C}%D{%Y}%f%k; "

#lila_hex #39257D #6234F9 #100438 #3B0045
#gelb #E8C536 #FFCA5B #805700

#ALTERNATIV Purity prompt, mit source kein Fehler 
#fpath=($ZDOTDIR $fpath)
#autoload -Uz "prompt_purifi.zsh"; prompt_purifi.zsh

source "$ZDOTDIR/aliases"   #Aliases file

# `autoload` command load a file containing shell commands
# To find this file, Zsh will look in the directories of the _Zsh file search path_, defined in the variable `$fpath`, and search a file called `compinit`.
autoload -Uz compinit; compinit
_comp_options+=(globdots) 	# With hidden files
#das ist die config für die "completion" gesourct
source  "$ZDOTDIR/completion.zsh" 

#"syntax highlight" source
source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

#fzf
source "/usr/share/doc/fzf/examples/key-bindings.zsh"
#source "/usr/share/zsh/vendor-completions/_fzf"
source "/usr/share/doc/fzf/examples/completion.zsh"


## zsh plugin that colorifies man pages 
source "$ZDOTDIR/zsh-colored-man-pages/colored-man-pages.plugin.zsh" && man less
#source "$ZDOTDIR/zsh-colored-man-pages/colored-man-pages.plugin.zsh" && less

#. "/etc/zsh_command_not_found"
source "/etc/zsh_command_not_found"


