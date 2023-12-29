#!/usr/bin/env zsh
###########################################
##  filename:    	greeting.zsh
##  filepath:     	/home/ZSH/
##  author:       	mxx
##  file save date:   
##  file creation date [yy-mmm]: 24 jan
##  file status		 work in progess
##  comments: 	   
###########################################

#.zshenv: export SCRIPT_RUN_zenv="true" export x11_set="true"
# .zshrc export SCRIPT_RUN_zshrc="true"
# aliases.zsh  export SCRIPT_RUN_aliaseszsh="true"
# log_error.zsh export SCRIPT_RUN_log_errorzsh="true"

#Kopfzeile:
toilet -F gay -f smscript "³³³³³³³³³³³³³³³³³³³³"|sed -e 's/^/\t/'|lolcat --seed=250   

## file body
## COW FUNCTION
		 # cowfiles einlesen
	LIST=$(cowsay -l | grep -oE "[a-zA-Z0-9_-]+" | awk 'NR>=11') 	
	# cowfiles zufallsgenerator
	RANDOM_COW=$(echo "$LIST" | shuf -n 1)   
	# Anzeige der RANDOM_COW
	echo -e "\t${UNDER}${LILA}Selected Random ${BOLD} Cow File:${RESET}\t"|sed -e 's/^/\t\t/'
	# Geben Sie eine Nachricht basierend auf dem Wert von all_true aus
if [[ "$x11_set" == "true" ]]; then
	# Info welches cowfile gewählt
	 echo -e "\t${BOLD}\t${BLINK}\t$RANDOM_COW"|lolcat --seed=123 --spread=0.1 --force --truecolor --animate --duration=12|sed -e 's/^/\t/'
	 # message
	 printf "${BOLD}${GREEN}\tX11 wird verwendet,\t\t  ${RESET} \n${UNDER}${GREEN} xrandr für x11 sowie und 2 Bildschirme    ${RESET}\n${GREEN} ${BOLD}\twurde erfolgreich ausgeführt        ${RESET}" | cowsay -n -W 40 -f $RANDOM_COW| sed -e 's/^/\t\t/' 
else

fi 
	
echo
	 
#1 .zshenv
if [[ "$SCRIPT_RUN_zenv" == "true" ]]; then
    output=$(echo "SCRIPT_RUN_zenv ist auf true gesetzt" | toilet -F gay -f pagga | sed -e 's/^/\t\t\t/' | lolcat --seed=206)
    echo $output > /dev/null
else
    output=$(echo "SCRIPT_RUN_zenv ist NICHT auf true gesetzt" | toilet -F gay -f pagga | sed -e 's/^/\t\t\t/' | lolcat --seed=206)
    echo $output > /dev/null
fi
#2 .zshrc
if [[ "$SCRIPT_RUN_zshrc" == "true" ]]; then
    output=$(echo "SCRIPT_RUN_zshrc ist auf true gesetzt" | toilet -F gay -f pagga | sed -e 's/^/\t\t\t/' | lolcat --seed=206)
    echo $output > /dev/null
else
    output=$(echo "SCRIPT_RUN_zshrc ist NICHT auf true gesetzt" | toilet -F gay -f pagga | sed -e 's/^/\t\t\t/' | lolcat --seed=206)
    echo $output > /dev/null
fi
#3 aliases.zsh
if [[ "$SCRIPT_RUN_aliaseszsh" == "true" ]]; then
    output=$(echo "SCRIPT_RUN_aliaseszsh ist auf true gesetzt" | toilet -F gay -f pagga | sed -e 's/^/\t\t\t/' | lolcat --seed=206)
    echo $output > /dev/null
else
    output=$(echo "SCRIPT_RUN_aliaseszsh ist NICHT auf true gesetzt" | toilet -F gay -f pagga | sed -e 's/^/\t\t\t/' | lolcat --seed=206)
    echo $output > /dev/null
fi
#4 log_errorzsh="true"
if [[ "$SCRIPT_RUN_log_errorzsh" == "true" ]]; then
    output=$(echo "log_error.zsh ist auf true gesetzt" | toilet -F gay -f pagga | sed -e 's/^/\t\t\t/' | lolcat --seed=206)
    echo $output > /dev/null
else
    output=$(echo "log_error.zsh ist NICHT auf true gesetzt" | toilet -F gay -f pagga | sed -e 's/^/\t\t\t/' | lolcat --seed=206)
    echo $output > /dev/null
fi
    
# Liste der Umgebungsvariablen, die überprüft werden sollen
variables=("SCRIPT_RUN_zenv" "SCRIPT_RUN_zshrc" "SCRIPT_RUN_aliaseszsh" "SCRIPT_RUN_log_errorzsh")
# Flag, um zu verfolgen, ob alle Variablen auf "true" gesetzt sind
#all_true=true
# Durchlaufen Sie jede Variable und prüfen Sie, ob sie auf "true" gesetzt ist
for var in "${variables[@]}"; do
    if [[ "${!var}" != "true" ]]; then
        all_true=false
        echo "Es gab wohl einen Fehler in $var"
        break
    fi
done

# Geben Sie eine Nachricht basierend auf dem Wert von all_true aus
if $all_true; then
    echo "Alles OK"
fi

#ALT: toilet -F gay -f pagga ".zshrc ..."|sed -e 's/^/\t\t\t/'|lolcat --seed=206
#toilet -F gay -f smscript "... ... ... ist geladen!"|sed -e 's/^/\t/'|lolcat --seed=233   
#ende
toilet -F gay -f smscript "³³³³³³³³³³³³³³³³³³³³"|sed -e 's/^/\t/'|lolcat --seed=255   
echo


