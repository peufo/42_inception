#!/bin/bash

cd /wp
wp config create \
    --dbname="$DB_NAME" \
    --dbuser="$DB_USER" \
    --dbpass="$DB_PASSWORD" \
    --dbhost=mariadb

wp core install \
    --title=inception \
    --url="$WP_SITE_URL" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL"

wp user create $WP_BASIC_USER $WP_BASIC_EMAIL --user_pass="$WP_BASIC_PASSWORD" --allow-root

exec "$@"
