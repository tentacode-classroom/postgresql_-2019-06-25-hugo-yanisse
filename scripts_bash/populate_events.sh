#!/bin/bash

FILE_DIRECTORY=`dirname $0`
SQL_DIRECTORY=$FILE_DIRECTORY/../scripts_sql


# Insérer les acteurs dans la base de données
psql --username super_admin -d github_events -f $SQL_DIRECTORY/insert_actors.sql
echo '=== Insertion des actors terminé ==='

# Insérer les différents repos dans la base de données
psql --username super_admin -d github_events -f $SQL_DIRECTORY/insert_repos.sql
echo '=== Insertion des repos terminé ==='

# Insérer les événements de push dans la base de données
psql --username super_admin -d github_events -f $SQL_DIRECTORY/insert_events.sql
echo '=== Insertion des events terminé ==='
