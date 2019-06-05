#!/bin/bash

# Déclaration d'une variable URL qui récupère l'archive de données json
URL=https://data.gharchive.org/2019-05-15-20.json.gz
# On récupère celle ci ensuite pour la télécharger
wget $URL

# Pour finir on l'a décompresse dans une archive dans le même répertoire
gunzip ./2019-05-15-20.json.gz
