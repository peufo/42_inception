FROM alpine:3.22
RUN apk add bash
RUN apk add vsftpd

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "vsftpd", "/etc/vsftpd/vsftpd.conf" ]