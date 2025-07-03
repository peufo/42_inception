FROM alpine:3.22
RUN apk add bash
RUN apk add redis

COPY redis.conf /etc/redis.conf

CMD ["redis-server", "/etc/redis.conf"]