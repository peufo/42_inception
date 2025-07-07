FROM alpine:3.22
RUN apk add bash
RUN apk add nginx
RUN apk add openssl

COPY ./jvoisard.42.fr.conf /etc/nginx/http.d/

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
