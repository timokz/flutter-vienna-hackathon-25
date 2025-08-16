include ../defines.mk

COMPOSE_FILE_LOCAL = docker-compose.local.yaml
COMPOSE_FILE_DEPLOY = docker-compose.deploy.yaml

# Basically the current directory's name, so wien_talks_server
COMPOSE_PROJECT := $(shell basename $(shell pwd))

.env: .env.template
	cp -a .env.template .env

.PHONY := local local-stop local-down local-clean
local: .env
	docker compose -f $(COMPOSE_FILE_LOCAL) up -d

local-stop:
	docker compose -f $(COMPOSE_FILE_LOCAL) stop

local-down:
	docker compose -f $(COMPOSE_FILE_LOCAL) down

local-clean: local-down
	for VOLUME in $(shell docker compose -f $(COMPOSE_FILE_LOCAL) volumes -q); \
		do docker volume rm "$$VOLUME"; done

