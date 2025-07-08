FROM alpine:3.22
RUN apk add bash
RUN apk add wget
RUN apk add php83 
RUN apk add php83-fpm
RUN apk add php83-session
RUN apk add php83-mysqli

RUN adduser -S www-data
RUN adduser www-data www-data

COPY ./www.conf /etc/php83/php-fpm.d/

WORKDIR /var/www
RUN wget https://github.com/vrana/adminer/releases/download/v5.3.0/adminer-5.3.0.php

CMD ["php-fpm83", "-F"]