#!/usr/bin/env zsh

# finale Version mit fzf

# Funktion zur Definition von Farben
define_colors() {
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color
}

# Funktion für die Suche und Ausgabe
search_and_display() {
    local search_term=$1
    local search_result
    search_result=$(apt-cache search "$search_term" | fzf)

    if [[ -n "$search_result" ]]; then
        local package_name=$(echo "$search_result" | awk '{print $1}')
        apt show "$package_name"
    else
        echo -e "${RED}Keine Ergebnisse gefunden.${NC}"
    fi
}

# Hauptskript

define_colors

# Überprüfe, ob ein Suchbegriff übergeben wurde
if [[ $# -eq 0 ]]; then
    echo -e "${RED}Es wurde kein Suchbegriff übergeben.${NC} Bitte gib einen Suchbegriff ein:"
    read -p "Suchbegriff: " search_term
else
    search_term="$*"
fi

# Suche und Ausgabe
search_and_display "$search_term"

