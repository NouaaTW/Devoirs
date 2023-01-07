#!/bin/bash

# Crée le fichier qui va contenir une valeur
filename="bitcoin_value.txt"

# Récupère la valeur du bitcoin en utilisant la commande curl et grep, et supprime le caractère inutile avec tr
bitcoin_value=$(curl -s "https://api.coindesk.com/v1/bpi/currentprice/BTC.json" | grep -Po '"rate_float":\K[^,]+' | tr -d '}')

# Formate la valeur du bitcoin avec deux chiffres après la virgule
bitcoin_value=$(printf "%.2f" $bitcoin_value | sed 's/\.00$//')

# Enregistre la valeur du bitcoin dans un fichier
echo "Valeur du bitcoin : $bitcoin_value"> bitcoin_value.txt