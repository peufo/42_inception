NAME=inception

all: $(NAME)

$(NAME): init
	docker compose -f srcs/docker-compose.yml up

init:
	mkdir -p ~/data/db
	mkdir -p ~/data/files
	mkdir -p ./secrets
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout secrets/site.key \
		-out secrets/site.crt \
		-subj "/C=CH/L=Porrentruy/O=DevVoisard/CN=jvoisard"

clean:
	docker compose -f srcs/docker-compose.yml down

fclean: clean
	rm -rf ~/data
	rm -rf ./secrets
	docker volume rm -f wp-db
	docker volume rm -f wp-files
	docker system prune -af

re: fclean all