#!/bin/bash

# Répertoire où se trouvent les images à compresser
images_dir="images"

# Répertoire de destination des fichiers compressés
sav_dir="sav"

# Vérifie que le répertoire de destination existe, sinon les crée
if [ ! -d "$sav_dir" ]; then
  mkdir "$sav_dir"
fi

# Crée un nom de fichier unique en utilisant la date et l'heure actuelles
filename="sav_$(date +%d_%m_%Y_%H:%M:%S).tgz"

# Compresse les fichiers du répertoire "images" et enregistre le résultat dans le fichier "$filename" dans le répertoire "sav"
tar -czf "$sav_dir/$filename" "$images_dir"
