FROM alpine:3.22
RUN apk add bash
RUN apk add curl
RUN apk add php83 
RUN apk add php83-fpm
RUN apk add php83-openssl
RUN apk add php83-phar
RUN apk add php83-mysqli
RUN apk add php83-dom
RUN apk add php83-exif
RUN apk add php83-fileinfo
RUN apk add php84-mbstring
RUN apk add php84-iconv
RUN apk add php84-sodium
RUN apk add php83-xml
RUN apk add php83-zip
COPY ./php.ini /etc/php83/conf.d/
# COPY ./www.conf /etc/php83/php-fpm.d/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download --path=/wp

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "bash" ]