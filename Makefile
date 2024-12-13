COMPOSE_FILE=./srcs/compose.yml


build:
	docker-compose -f $(COMPOSE_FILE) build

up:
	docker-compose -f $(COMPOSE_FILE) up -d
down:
	docker-compose -f $(COMPOSE_FILE) down --rmi all -v
rm:
	sudo rm -rf ./srcs/database/*
	sudo rm -rf ./srcs/web/*

ps:
	docker-compose -f $(COMPOSE_FILE) ps

.PHONY: build up down rm ps