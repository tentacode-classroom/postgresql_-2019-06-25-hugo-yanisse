#!/bin/bash

# FIRST STEP : on crée la liste pgdg
# sudo touch /etc/apt/sources.list.d/pgdg.list

# On y ajoute une ligne de repo dans ce même fichier
echo deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main > /etc/apt/sources.list.d/pgdg.list
# SECOND STEP : On importe le repo avec la clé
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# THIRD STEP : On actualise en mettant a jour la debian
apt-get update
# NEXT STEP : On installe enfin postgresql
apt-get install postegresql-11 -y

# Message affichant la fin d'execution du script
echo "Script terminé fin d'execution"
