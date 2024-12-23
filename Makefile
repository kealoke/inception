COMPOSE_FILE=./srcs/compose.yml
SRC_DIR := srcs
ENV_EXAMPLE := $(SRC_DIR)/.env_example
ENV_FILE := $(SRC_DIR)/.env

help:
	@echo "Usage:"
	@echo "  make [target]"
	@echo ""
	@echo "Before running targets, ensure the following are created:"
	@echo "  - Create a directory named 'secrets'"
	@echo "  - Add necessary files inside the 'secrets' directory"
	@echo ""
	@echo "  |-Makefile"
	@echo "  |-srcs/"
	@echo "  	|--.env"
	@echo "  |-secrets/"
	@echo "  	|--db_password.txt"
	@echo "  	|--db_root_password.txt"
	@echo "  	|--wp_admin_password.txt"
	@echo "  	|--wp_user_password.txt"
	@echo ""
	@echo "Targets:"
	@echo "  up      Build & Start container "
	@echo "  stop    Stop container"
	@echo "  down    Stop and RM container, images and volumes"
	@echo "  ps      check processes "
	@echo "  logs    check logs "
	

copy:
	@if [ -f $(ENV_FILE) ]; then \
		echo "$(ENV_FILE) already exists. Skipping copy."; \
	else \
		cp $(ENV_EXAMPLE) $(ENV_FILE); \
		echo "Copied $(ENV_EXAMPLE) to $(ENV_FILE)."; \
	fi

up: copy
	docker-compose -f $(COMPOSE_FILE) build
	docker-compose -f $(COMPOSE_FILE) up -d

stop:
	docker-compose -f $(COMPOSE_FILE) stop

down:
	docker-compose -f $(COMPOSE_FILE) down --rmi all -v

ps:
	docker-compose -f $(COMPOSE_FILE) ps

logs:
	docker-compose -f $(COMPOSE_FILE) logs

.PHONY: up stop down ps logs