#!/bin/bash

adduser -D "$WP_ADMIN_USER"
echo "$WP_ADMIN_USER:$WP_ADMIN_PASSWORD" | chpasswd
chown -R "$WP_ADMIN_USER:$WP_ADMIN_USER" /var/www

exec "$@"