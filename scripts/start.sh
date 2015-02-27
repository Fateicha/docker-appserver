#!/bin/bash
set -e

chown -R root:root /data
chown -R root:root /opt/appserver/var
chmod -R 775 /data

/opt/appserver/bin/php -dappserver.php_sapi=appserver /opt/appserver/server.php &
/opt/appserver/sbin/php-fpm --fpm-config /opt/appserver/etc/php-fpm.conf &
/opt/appserver/bin/php -dappserver.php_sapi=appserver /opt/appserver/server.php -w
