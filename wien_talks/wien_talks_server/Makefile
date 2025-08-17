include ../defines.mk

COMPOSE_FILE_LOCAL = docker-compose.local.yaml
COMPOSE_FILE_DEPLOY = docker-compose.deploy.yaml

# NOTE: the --env-file flags are necessary because the env_file directive
# in the docker-compose.yaml doesn't work for env vars that are used inside the
# compose file itself.
# This is jank, but it is what it is <.<
COMPOSE_COMMON_ARGS_DEPLOY = -f $(COMPOSE_FILE_DEPLOY) \
			     --env-file env.d/postgres.env \
			     --env-file env.d/server.env \


# Basically the current directory's name, so wien_talks_server
COMPOSE_PROJECT := $(shell basename $(shell pwd))

DEPLOY_NETWORK = docker-net

.env: .env.template
	cp -a .env.template .env

.PHONY: local local-env local-stop local-down local-clean
local: .env
	docker compose -f $(COMPOSE_FILE_LOCAL) up -d
local-env: .env

local-stop:
	docker compose -f $(COMPOSE_FILE_LOCAL) stop

local-down:
	docker compose -f $(COMPOSE_FILE_LOCAL) down -v

local-clean: local-down
	for VOLUME in $(shell docker compose -f $(COMPOSE_FILE_LOCAL) volumes -q); \
		do docker volume rm "$$VOLUME"; done

.PHONY: deploy deploy-env deploy-build deploy-stop deploy-down
deploy:
	if test -z "$$(docker network ls -q --filter name=$(DEPLOY_NETWORK))"; then \
		docker network create --driver bridge $(DEPLOY_NETWORK); fi
	docker compose $(COMPOSE_COMMON_ARGS_DEPLOY) up -d

# TODO: parameterize .env files
deploy-env: env.d/postgres.env.template env.d/server.env.template
	if test -e env.d/postgres.env; then echo "env.d/postgres.env already exists"; exit 1; fi
	if test -e env.d/server.env; then echo "env.d/server.env already exists"; exit 1; fi
	cp -a env.d/postgres.env.template env.d/postgres.env
	cp -a env.d/server.env.template env.d/server.env
	@echo -e "\n!!! Environment files for deployment initialized !!!\n\nDon't forget to edit them!"

deploy-build:
	docker compose $(COMPOSE_COMMON_ARGS_DEPLOY) build --no-cache

deploy-stop:
	if test -n "$$(docker network ls -q --filter name=$(DEPLOY_NETWORK))"; then \
		docker compose $(COMPOSE_COMMON_ARGS_DEPLOY) stop; fi

deploy-down:
	if test -n "$$(docker network ls -q --filter name=$(DEPLOY_NETWORK))"; then \
		docker compose $(COMPOSE_COMMON_ARGS_DEPLOY) down; fi

# Note: Doesn't clean up DB for safety reasons!
deploy-clean: deploy-down
	if test -n "$$(docker network ls -q --filter name=$(DEPLOY_NETWORK))"; then \
		docker network rm $(DEPLOY_NETWORK) > /dev/null; fi

codegen:
	rm -rf lib/src/generated
	serverpod generate

migrate:
	dart run bin/main.dart --role maintenance --apply-migrations

recreate-db: local-down local codegen migrate
	@echo "DB recreated & migrations applied."