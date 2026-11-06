#!/bin/bash
# =====================================================================
#  restauration.sh - Restauration d'une sauvegarde GLPI
#  Usage : ./restauration.sh /root/backups/<date>_glpi.tar.gz
# =====================================================================

archive=$1
[ -f "$archive" ] || { echo "Usage : $0 <archive.tar.gz>"; exit 1; }

# 1. Extraction des fichiers à leur emplacement d'origine
tar -xzf "$archive" -C /

# 2. Réimport de la base de données
dump=$(tar -tzf "$archive" | grep '_glpi.sql$')
mariadb glpi < "/$dump"
rm -f "/$dump"

# 3. Rétablissement des droits d'Apache
chown -R www-data:www-data /etc/glpi /var/lib/glpi

echo "Restauration terminée depuis $archive"
