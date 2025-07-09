NAME=inception

all: $(NAME)

$(NAME): init
	docker compose -f srcs/docker-compose.yml up

init:
	mkdir -p ~/data/db
	mkdir -p ~/data/files
	mkdir -p ./secrets
	chmod 0700 ./secrets
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout secrets/site.key \
		-out secrets/site.crt \
		-subj "/C=CH/L=Porrentruy/O=DevVoisard/CN=jvoisard.42.fr"

build:
	docker compose -f srcs/docker-compose.yml up --build

clean:
	docker compose -f srcs/docker-compose.yml down

test:
	./test.sh

fclean: clean
	rm -rf ~/data
	rm -rf ./secrets
	docker volume rm -f inception_wp-db
	docker volume rm -f inception_wp-files
	docker system prune -af

re: fclean all