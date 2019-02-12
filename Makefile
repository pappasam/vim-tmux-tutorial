# Docker image is named "nyc-vim-learn-tmux:main"

.PHONY: run
run: instance/build  ## Runs/ssh's into local container, deletes container on exit
	docker container run --interactive --tty --rm \
		--volume $(PWD)/vimrc:/home/student/.vimrc \
		--volume $(PWD)/tmux.conf:/home/student/.tmux.conf \
		--volume $(PWD)/bashrc:/home/student/.bashrc \
		nyc-vim-learn-tmux:main /bin/bash

.PHONY: build  ## Build the Docker image
build: instance/build

.PHONY: clean
clean: instance/build  ## Remove the Docker image
	-docker image rm nyc-vim-learn-tmux:main
	@rm $^

.PHONY: help
help:  ## Prints this help menu
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# Actual files for stateful docker processes
instance/build: Dockerfile
	docker image build --tag nyc-vim-learn-tmux:main .
	@echo "Placeholder for Docker build step" > $@
