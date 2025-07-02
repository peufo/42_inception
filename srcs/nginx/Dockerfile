FROM alpine:3.22
RUN apk add bash
RUN apk add nginx
RUN apk add openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/jvoisard.42.fr.key \
	-out /etc/ssl/certs/jvoisard.42.fr.crt \
	-subj "/C=CH/L=Porrentruy/O=DevVoisard/CN=jvoisard"

COPY ./jvoisard.42.fr.conf /etc/nginx/http.d/

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
