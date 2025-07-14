#!/bin/bash

INIT_PORT=3307

mariadbd --user=mysql -p $INIT_PORT &
pid="$!"

while ! mariadb-admin -p $INIT_PORT ping ; do
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

mariadb -p $INIT_PORT -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mariadb -p $INIT_PORT -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mariadb -p $INIT_PORT -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' WITH GRANT OPTION;"
mariadb -p $INIT_PORT -e "FLUSH PRIVILEGES;"

kill -9 "$pid"
wait "$pid"

echo "DATABASE SERVICE IS READY 👍"

exec "$@"
