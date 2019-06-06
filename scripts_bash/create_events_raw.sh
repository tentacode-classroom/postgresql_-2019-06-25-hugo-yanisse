#!/bin/bash

# Déclaration des nouveaux répertoires
FILE_DIRECTORY=`dirname $0`
PROJECT_DIRECTORY=$FILE_DIRECTORY/..

# Création des tables dans la database via le script créé
sudo -u postgres psql -f $PROJECT_DIRECTORY/scripts_sql/events_raw_table.sql
