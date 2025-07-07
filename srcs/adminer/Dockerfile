FROM alpine:3.22
RUN apk add bash
RUN apk add wget
RUN apk add php83 
RUN apk add php83-fpm
RUN apk add php83-session
RUN apk add php83-mysqli
# RUN apk add php83-openssl
# RUN apk add php83-phar
# RUN apk add php83-dom
# RUN apk add php83-exif
# RUN apk add php83-fileinfo
# RUN apk add php83-mbstring
# RUN apk add php83-iconv
# RUN apk add php83-sodium
# RUN apk add php83-xml
# RUN apk add php83-zip
# RUN apk add php83-tokenizer

RUN adduser -S www-data
RUN adduser www-data www-data

COPY ./www.conf /etc/php83/php-fpm.d/

WORKDIR /var/www
RUN wget https://github.com/vrana/adminer/releases/download/v5.3.0/adminer-5.3.0.php

CMD ["php-fpm83", "-F"]