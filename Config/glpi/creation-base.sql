-- Création de la base et de l'utilisateur dédié à GLPI
-- Exécution : sudo mariadb < creation-base.sql
-- Remplacer CHANGER_MOT_DE_PASSE avant exécution

CREATE DATABASE glpi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'glpi'@'localhost' IDENTIFIED BY 'CHANGER_MOT_DE_PASSE';
GRANT ALL PRIVILEGES ON glpi.* TO 'glpi'@'localhost';
GRANT SELECT ON mysql.time_zone_name TO 'glpi'@'localhost';
FLUSH PRIVILEGES;
