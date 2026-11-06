#!/bin/bash
# =====================================================================
#  dumpsql.sh - Export de la base de données GLPI
#  $1 : date de la sauvegarde (transmise par backupGLPI.sh)
#  Connexion root via le socket Unix : aucun mot de passe en clair.
# =====================================================================

echo "*1* DUMPSQL de la base GLPI ***"

# --single-transaction : copie cohérente sans bloquer l'application
mariadb-dump --single-transaction glpi > "/tmp/$1_glpi.sql"
