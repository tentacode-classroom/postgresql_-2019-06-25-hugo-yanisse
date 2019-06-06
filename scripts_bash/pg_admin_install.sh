#!/bin/bash

# Déclaration des nouveaux répertoires
FILE_DIRECTORY=`dirname $0`
PROJECT_DIRECTORY=$FILE_DIRECTORY/..

# Lancement du script sql "pg_admin"
sudo -u postgres psql -f $PROJECT_DIRECTORY/scripts_sql/pg_admin.sql
