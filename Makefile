.PHONY: build create start stop update run clean

DOCKER_IMAGE_NAME = wolfenstein-runner
DOCKER_CONTAINER_NAME = wolfenstein-runner-instance
SERVER_PORT = 8080

build: 
	docker build . -t $(DOCKER_IMAGE_NAME):latest

create: 
	docker create -p $(SERVER_PORT):8080 --mount type=bind,src="./browser",dst="/Project/browser" --name $(DOCKER_CONTAINER_NAME) $(DOCKER_IMAGE_NAME):latest

start: 
	docker start $(DOCKER_CONTAINER_NAME)
	@echo "Server started at localhost:$(SERVER_PORT)"

stop: 
	@docker stop $(DOCKER_CONTAINER_NAME) | echo


update: stop start

run: 
	docker run --rm -p 8080:8080 --name test_container $(DOCKER_IMAGE_NAME):latest

clean: 
	docker stop $(DOCKER_CONTAINER_NAME) && docker rm $(DOCKER_CONTAINER_NAME) && docker rmi $(DOCKER_IMAGE_NAME)
