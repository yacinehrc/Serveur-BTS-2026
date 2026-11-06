#!/bin/bash
# =====================================================================
#  targz.sh - Création de l'archive de sauvegarde
#  $1 : date de la sauvegarde (transmise par backupGLPI.sh)
#  Contenu : /etc/glpi (configuration), /var/lib/glpi (données), dump SQL
# =====================================================================

archive=$1_glpi.tar.gz
echo "*2* Archivage de GLPI ***"

# Les dossiers temporaires (cache, sessions) sont exclus.
# Le code applicatif n'est pas sauvegardé : il se re-télécharge.
tar -czf "/root/backups/$archive" \
  --exclude=var/lib/glpi/_cache \
  --exclude=var/lib/glpi/_sessions \
  --exclude=var/lib/glpi/_tmp \
  -C / etc/glpi var/lib/glpi "tmp/$1_glpi.sql"

# Le dump est désormais dans l'archive
rm "/tmp/$1_glpi.sql"

echo "*** Dépôt dans /root/backups/ : $(du -h "/root/backups/$archive" | cut -f1) ***"
