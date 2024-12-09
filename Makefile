COMPOSE_FILE=./src/compose.yml


build:
	docker-compose -f $(COMPOSE_FILE) build

up:
	docker-compose -f $(COMPOSE_FILE) up -d
down:
	docker-compose -f $(COMPOSE_FILE) down --rmi all -v
rm:
	sudo rm -rf ./src/database/*
	sudo rm -rf ./src/web/*

ps:
	docker-compose -f $(COMPOSE_FILE) ps

.PHONY: build up down rm ps