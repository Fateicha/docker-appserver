#!/bin/bash

cd /opt/appserver

# Start Appserver
/opt/appserver/bin/php -dappserver.php_sapi=appserver -dappserver.remove_functions=getenv,putenv /opt/appserver/server.php

# Start PHP
/opt/appserver/sbin/php-fpm --fpm-config /opt/appserver/etc/php-fpm.conf

# Start Appserver Watcher
/opt/appserver/bin/php -dappserver.php_sapi=appserver -dappserver.remove_functions=getenv,putenv /opt/appserver/server.php -w
