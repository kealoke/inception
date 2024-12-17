COMPOSE_FILE=./srcs/compose.yml


up:
	docker-compose -f $(COMPOSE_FILE) build
	docker-compose -f $(COMPOSE_FILE) up -d

stop:
	docker-compose -f $(COMPOSE_FILE) stop

down:
	docker-compose -f $(COMPOSE_FILE) down --rmi all -v
rm:
	sudo rm -rf ./srcs/database/*
	sudo rm -rf ./srcs/web/*

ps:
	docker-compose -f $(COMPOSE_FILE) ps

logs:
	docker-compose -f $(COMPOSE_FILE) logs

.PHONY: up down rm ps logs