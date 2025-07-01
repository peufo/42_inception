FROM alpine:3.22
RUN apk add bash
RUN apk add curl
RUN apk add php83 
RUN apk add php83-fpm
RUN apk add php83-openssl
RUN apk add php83-phar
COPY ./php.ini /etc/php83/conf.d/
# COPY ./www.conf /etc/php83/php-fpm.d/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download --path=/wp
RUN wp core install --url="jvoisard.42.fr" --title="Inception" --admin_user="jvoisard" --admin_email="jonas.voisard@gmail.com" --prompt=admin_password <

CMD [ "bash" ]