#!/bin/bash

if [ -f wp-config.php ] ; then
    echo "wp-config.php already exist. Creation skipped"
else
    wp config create \
        --dbname="$DB_NAME" \
        --dbuser="$DB_USER" \
        --dbpass="$DB_PASSWORD" \
        --dbhost=mariadb
fi

if wp core is-installed 2> /dev/null; then
    echo "Wordpress is already installed."
else
    wp core install \
        --title=inception \
        --url="$WP_SITE_URL" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL"
fi

wp user create $WP_BASIC_USER $WP_BASIC_EMAIL \
    --user_pass="$WP_BASIC_PASSWORD" \
    --role=editor

exec "$@"
