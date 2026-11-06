#!/bin/bash
# =====================================================================
#  backupGLPI.sh - Script principal de sauvegarde de GLPI
#  Lancé chaque nuit par cron (root). Enchaîne les 3 étapes :
#    1. dumpsql.sh  -> export de la base de données
#    2. targz.sh    -> archive de la configuration, des données et du dump
#    3. sendftp.sh  -> envoi de l'archive sur InfinityFree
# =====================================================================

# Se placer dans le dossier du script (indispensable sous cron)
cd "$(dirname "$0")" || exit 1

# Date unique utilisée pour nommer tous les fichiers de la sauvegarde
laDate=$(date +%Y.%m.%d_%Hh%M)

bash dumpsql.sh  "$laDate"
bash targz.sh    "$laDate"
bash sendftp.sh  "$laDate"

# Rotation : suppression des archives locales de plus de 7 jours
find /root/backups -name '*_glpi.tar.gz' -mtime +7 -delete
