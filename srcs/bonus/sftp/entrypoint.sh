#!/bin/bash

adduser -D "$WP_ADMIN_USER"
adduser "$WP_ADMIN_USER" www-data
echo "$WP_ADMIN_USER:$WP_ADMIN_PASSWORD" | chpasswd

exec "$@"