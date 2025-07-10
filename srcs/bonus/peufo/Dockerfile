FROM alpine:3.22 AS base
RUN apk add bash
RUN apk add nodejs pnpm
COPY . /app
WORKDIR /app

RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile
RUN pnpm run build

EXPOSE 8080
CMD [ "pnpm", "start" ]
