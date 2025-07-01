#!/bin/bash

# mariadbd --user=mysql &
# pid="$!"

# while ! mariadb-admin ping ; do
#     sleep 1
# done

# if [[ -z "$DB_PASSWORD" ]]; then
#     echo DB_PASSWORD need to be defined
#     exit 1
# fi

# if [[ -z "$DB_USER" ]]; then
#     echo DB_USER need to be defined
#     exit 1
# fi

# mariadb -e "CREATE USER $DB_USER@inception IDENTIFIED BY '$DB_PASSWORD'"

# kill -9 "$pid"
# wait "$pid"

# echo "DATABASE SERVICE IS READY 👍"

exec mariadbd --user=mysql
