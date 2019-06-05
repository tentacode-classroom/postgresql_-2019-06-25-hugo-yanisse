#!/bin/bash

# Déclaration des nouveaux répertoires
FILE_DIRECTORY=`dirname $0`
PROJECT_DIRECTORY=$FILE_DIRECTORY/..

# Si l'archive existe déjà on la supprime
echo "Suppression de l'archive si elle est existante"
rm -Rf $PROJECT_DIRECTORY/2019-05-15-20.json.gz

# Déclaration d'une variable URL qui récupère l'archive de données json
echo "Récupération de l archive JSON"
URL=https://data.gharchive.org/2019-05-15-20.json.gz
# On récupère celle ci ensuite pour la télécharger
wget $URL

# Pour finir on l'a décompresse dans une archive dans le même répertoire
echo "Décompression de l archive"
gunzip ./2019-05-15-20.json.gz
