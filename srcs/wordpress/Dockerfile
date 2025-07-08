FROM alpine:3.22
RUN apk add bash
RUN apk add curl
RUN apk add fcgi
RUN apk add php83 
RUN apk add php83-fpm
RUN apk add php83-openssl
RUN apk add php83-phar
RUN apk add php83-mysqli
RUN apk add php83-dom
RUN apk add php83-exif
RUN apk add php83-fileinfo
RUN apk add php83-mbstring
RUN apk add php83-iconv
RUN apk add php83-sodium
RUN apk add php83-xml
RUN apk add php83-zip
RUN apk add php83-tokenizer

RUN adduser -S www-data
RUN adduser www-data www-data

COPY ./php.ini /etc/php83/conf.d/
COPY ./www.conf /etc/php83/php-fpm.d/

RUN wget -O /usr/local/bin/php-fpm-healthcheck https://raw.githubusercontent.com/renatomefi/php-fpm-healthcheck/master/php-fpm-healthcheck
RUN chmod +x /usr/local/bin/php-fpm-healthcheck

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www
RUN wp core download

ENV FCGI_CONNECT=wordpress:9000
HEALTHCHECK --interval=2s --timeout=1s --retries=10 CMD [ "php-fpm-healthcheck", "||", "exit 1"]
# HEALTHCHECK --interval=2s --timeout=1s --retries=10 CMD [ "exit"]

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "php-fpm83", "-F"]