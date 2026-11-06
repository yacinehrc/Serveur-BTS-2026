#!/bin/bash
# =====================================================================
#  sendftp.sh - Envoi de l'archive sur l'hébergement InfinityFree (FTP)
#  $1 : date de la sauvegarde (transmise par backupGLPI.sh)
#  Fichier protégé en chmod 700 : il contient les identifiants FTP.
# =====================================================================

archive=$1_glpi.tar.gz

# Identifiants FTP InfinityFree (à renseigner, ne jamais publier)
FTP_USER="if0_XXXXXXXX"
FTP_PASS="CHANGER_MOT_DE_PASSE"

# InfinityFree refuse les fichiers de plus de 10 Mo
taille=$(stat -c %s "/root/backups/$archive")
if [ "$taille" -gt 10000000 ]; then
  echo "ERREUR : archive > 10 Mo, InfinityFree la refusera"
  exit 1
fi

echo "*3* Envoi de l'archive sur le FTP InfinityFree ***"

# -i : sans confirmation  -n : connexion manuelle
# -p : mode passif (traversée du NAT)  -v : affichage des réponses
ftp -inpv ftpupload.net << FIN_FTP
user $FTP_USER $FTP_PASS
binary
mkdir backups
cd backups
put /root/backups/$archive $archive
bye
FIN_FTP
