# Docker image is named "nyc-vim-learn-tmux:main"

.PHONY: run
run: build  ## Runs/ssh's into local container, deletes container on exit
	docker run --interactive --tty --rm \
		-v $(PWD)/vimrc:/home/student/.vimrc\
		-v $(PWD)/tmux.conf:/home/student/.tmux.conf\
		-v $(PWD)/bashrc:/home/student/.bashrc\
		nyc-vim-learn-tmux:main /bin/bash

.PHONY: build
build:  ## Build the Docker image
	docker build -t nyc-vim-learn-tmux:main .

.PHONY: clean
clean:  ## Remove the Docker image
	docker rmi nyc-vim-learn-tmux:main

.PHONY: help
help:  ## Prints this help menu
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) |  \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
