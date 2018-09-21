#!/bin/bash
set -eu

/etc/init.d/mysql stop
mysql -u root -psecret -e "CREATE DATABASE homestead CHARACTER SET = 'utf8' COLLATE = 'utf8_unicode_ci';"
mysql -u root -psecret -e "CREATE USER 'homestead'@'localhost' IDENTIFIED BY 'secret';GRANT ALL PRIVILEGES ON * . * TO 'homestead'@'localhost';FLUSH PRIVILEGES;"
mysql -u root -psecret -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost';FLUSH PRIVILEGES;"
/etc/init.d/mysql start

exec "$@"
