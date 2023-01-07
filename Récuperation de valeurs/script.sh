#!/bin/bash

# Répertoire de destination des fichiers compressés
sav_dir="sav"

# Vérifie que le répertoire de destination existe, sinon le crée
if [ ! -d "$sav_dir" ]; then
  mkdir "$sav_dir"
fi

# Crée un nom de fichier unique en utilisant la date et l'heure actuelles
filename="bitcoin_value.txt"

# Récupère la valeur du bitcoin en utilisant la commande curl et grep, et supprime le caractère "}" avec tr
bitcoin_value=$(curl -s "https://api.coindesk.com/v1/bpi/currentprice/BTC.json" | grep -Po '"rate_float":\K[^,]+' | tr -d '}')

# Formate la valeur du bitcoin avec deux chiffres après la virgule
bitcoin_value=$(printf "%.2f" $bitcoin_value | sed 's/\.00$//')

# Enregistre la valeur du bitcoin dans un fichier
echo "Valeur du bitcoin : $bitcoin_value"> bitcoin_value.txt