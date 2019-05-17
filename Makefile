DOCKER_COMPOSE := docker-compose -f ./docker-compose.yml
DOCKER_EXEC := docker exec -it

setup: build up

build:
	$(DOCKER_COMPOSE)  build

up:
	$(DOCKER_COMPOSE) up -d

clean: stop rm

stop:
	$(DOCKER_COMPOSE) stop

rm:
	$(DOCKER_COMPOSE) rm -f

attach-workspace:
	$(DOCKER_EXEC) sparring-workspace /bin/bash

attach-db:
	$(DOCKER_EXEC) sparring-mysql /bin/bash

login-db:
	$(DOCKER_EXEC) sparring-mysql mysql -u root



