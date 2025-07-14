#!/bin/bash

mariadbd --user=mysql &
pid="$!"

while ! mariadb-admin ping ; do
    sleep 1
done

if [[ -z "$DB_PASSWORD" ]]; then
    echo DB_PASSWORD need to be defined
    exit 1
fi

if [[ -z "$DB_USER" ]]; then
    echo DB_USER need to be defined
    exit 1
fi

mariadb -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mariadb -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' WITH GRANT OPTION;"
mariadb -e "FLUSH PRIVILEGES;"

kill -9 "$pid"
wait "$pid"

echo "DATABASE SERVICE IS INITIALIZED 👍"

exec "$@"
