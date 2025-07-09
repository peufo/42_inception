FROM alpine:3.22

RUN apk add bash openssh openssh-server

COPY ./sshd_config /etc/ssh/sshd_config
RUN ssh-keygen -A
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
EXPOSE 22

CMD [ "/usr/sbin/sshd", "-D" ]