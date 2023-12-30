#!/usr/bin/env zsh
###########################################
##  filename:      greeting.zsh
##  filepath:      /home/ZSH/
##  author:        mxx
##  file save date:   
##  file creation date [yy-mmm]: 24 jan
##  file status:   work in progress
##  comments:      
###########################################


# Umgebungsvariablen für verschiedene Skripte setzen
 #.zshenv: 
 export SCRIPT_RUN_zenv="true" 
 export x11_set="true"
# .zshrc 
 export SCRIPT_RUN_zshrc="true"
# aliases.zsh  
 export SCRIPT_RUN_aliaseszsh="true"
# log_error.zsh 
 export SCRIPT_RUN_log_errorzsh="true"

# Kopfzeile für das Terminal mit 'toilet' und 'lolcat' gestalten
toilet -F gay -f smscript "³³³³³³³³³³³³³³³³³³³³" | sed -e 's/^/\t/' | lolcat --seed=250   

## Dateikörper

## COW FUNCTION
# Funktion zum Anzeigen eines zufällig ausgewählten 'cowfiles'
# cowfiles einlesen
LIST=$(cowsay -l | grep -oE "[a-zA-Z0-9_-]+" | awk 'NR>=11')   
# zufälliges cowfile auswählen
RANDOM_COW=$(echo "$LIST" | shuf -n 1)   
# Anzeige des ausgewählten cowfiles
echo -e "\t${UNDER}${LILA}Selected Random ${BOLD} Cow File:${RESET}\t" | sed -e 's/^/\t\t/'

# Nachrichten basierend auf dem Wert von 'x11_set' ausgeben
if [[ "$x11_set" == "true" ]]; then
    # Info zum gewählten cowfile anzeigen
    echo -e "\t${BOLD}\t${BLINK}\t$RANDOM_COW" | lolcat --seed=123 --spread=0.1 --force --truecolor --animate --duration=12 | sed -e 's/^/\t/'
    # Meldung anzeigen, dass X11 verwendet wird
    printf "${BOLD}${GREEN}\tX11 wird verwendet,\t\t  ${RESET} \n${UNDER}${GREEN} xrandr für x11 sowie und 2 Bildschirme    ${RESET}\n${GREEN} ${BOLD}\twurde erfolgreich ausgeführt        ${RESET}" | cowsay -n -W 40 -f "${RANDOM_COW}" | sed -e 's/^/\t\t/'
else
    echo "x11 NOK"
fi 

echo

# Funktion zur Überprüfung von Umgebungsvariablen und Ausgabe entsprechender Nachrichten
check_variable() {
    local var_name=$1
    #local var_value="${!var_name}"
   # local var_value="${(P)var_name}"  # Korrigiere die indirekte Parametererweiterung
    local var_value=$(eval "echo \$$var_name") 
    if [[ "$var_value" == "true" ]]; then
        output=$(echo "$var_name ist auf true gesetzt" | toilet -F gay -f pagga | sed -e 's/^/\t\t\t/' | lolcat --seed=206)
    else
        output=$(echo "$var_name ist NICHT auf true gesetzt" | toilet -F gay -f pagga | sed -e 's/^/\t\t\t/' | lolcat --seed=206)
    fi
    echo "$output" > /dev/null
}

# Überprüfung der Umgebungsvariablen
check_variable SCRIPT_RUN_zenv
check_variable SCRIPT_RUN_zshrc
check_variable SCRIPT_RUN_aliaseszsh
check_variable SCRIPT_RUN_log_errorzsh

# Liste der Umgebungsvariablen, die überprüft werden sollen
variables=("SCRIPT_RUN_zenv" "SCRIPT_RUN_zshrc" "SCRIPT_RUN_aliaseszsh" "SCRIPT_RUN_log_errorzsh")
# Flag, um zu verfolgen, ob alle Variablen auf "true" gesetzt sind
all_true=true
# Durchlaufen Sie jede Variable und prüfen Sie, ob sie auf "true" gesetzt ist
for var in "${variables[@]}"; do
    if [[ "${!var}" != "true" ]]; then
        all_true=false
        echo "Es gab wohl einen Fehler in $var"
        break
    fi
done

# Ausgabe einer Nachricht basierend auf dem Wert von 'all_true'
if $all_true; then
    echo "Alles OK"
fi

# Toilet-Animation am Ende
toilet -F gay -f smscript "³³³³³³³³³³³³³³³³³³³³" | sed -e 's/^/\t/' | lolcat --seed=255   
echo

