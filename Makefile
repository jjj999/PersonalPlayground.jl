MAKEFLAGS += --warn-undefined-variables
SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := help

.PHONY: $(shell egrep -o ^[a-zA-Z_-]+: $(MAKEFILE_LIST) | sed 's/://')

docs: ## build the documentation and hosting on local
	@echo 'Starting $@'
	cd docs && julia --project=docs/ -e 'include("./BuildDocs.jl"); using .BuildDocs; BuildDocs.makePkgDocs()'
	python -m http.server --directory docs/build
	@echo 'Finished $@'

help: ## Print the help
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
