#!/usr/bin/env bash

set -e

#############################################
# NGINX
#############################################

if [ "$NGINX_USER_UID" != false ]; then
    usermod -u $NGINX_USER_UID www-data
fi

if [ "$NGINX_USER_GID" != false ]; then
    groupmod -g $NGINX_USER_GID www-data
fi

chown www-data:www-data /var/www/ -R

/usr/sbin/nginx -g "daemon off;"