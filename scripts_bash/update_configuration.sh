#!/bin/bash

# Déclaration du chemin fichier étant donné la maj avec les new dossiers scripts_sql séparés dans deux répertoires
FILE_DIRECTORY=`dirname $0`
PROJECT_DIRECTORY=$FILE_DIRECTORY/..

# Lancement du script sql "configure_db"
sudo -u postgres psql -f $PROJECT_DIRECTORY/scripts_sql/configure_db.sql

# Redémarrage du service postresql afin de prendre en compte les modifications apportées
sudo systemctl restart postgresql
