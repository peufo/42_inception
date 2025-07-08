FROM alpine:3.22
RUN apk add bash
RUN apk add vsftpd

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

WORKDIR /var/www
CMD [ "vsftpd" ]