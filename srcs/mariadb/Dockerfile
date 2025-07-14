FROM alpine:3.22
RUN apk add bash
RUN apk add mariadb
RUN apk add mariadb-client
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld /var/lib/mysql
RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

HEALTHCHECK --interval=2s --timeout=1s --start-period=5s --retries=5 CMD [ "mariadb-admin", "ping" ]

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["mariadbd", "--user=mysql", "--bind-address=0.0.0.0", "--skip-networking=0"]
