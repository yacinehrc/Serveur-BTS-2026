<?php
// /var/www/glpi/inc/downstream.php
// Indique à GLPI l'emplacement de sa configuration (hors du dossier web)
define('GLPI_CONFIG_DIR', '/etc/glpi/');
if (file_exists(GLPI_CONFIG_DIR . '/local_define.php')) {
    require_once GLPI_CONFIG_DIR . '/local_define.php';
}
