FROM alpine:3.22
RUN apk add bash curl zip openldap-dev linux-headers ethtool
RUN apk add python3 python3-dev py-pip
RUN apk add py3-lxml py3-greenlet py3-gevent py3-psutil py3-pillow py3-psycopg2 py3-reportlab py3-pyldap
RUN apk add postgresql-dev postgresql g++ 

RUN adduser -D odoo

ENV ODOO_VERSION=18.0
ARG ODOO_RELEASE=20250708
RUN curl -o odoo.zip -sSL http://nightly.odoo.com/${ODOO_VERSION}/nightly/src/odoo_${ODOO_VERSION}.${ODOO_RELEASE}.zip
RUN unzip odoo.zip -d /home/odoo
RUN rm -f odoo.zip
RUN mv "/home/odoo/odoo-$ODOO_VERSION.post$ODOO_RELEASE" /home/odoo/src

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
USER odoo

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "bash" ]