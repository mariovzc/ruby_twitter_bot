PACKAGE_NAME=sinatra_api
HOST_PORT=8000
PROJECT_FOLDER=.
GIT_DIR=$(shell pwd)

build:
	docker build -t $(PACKAGE_NAME) -f Dockerfile --build-arg module_folder=$(PROJECT_FOLDER) --platform linux/x86_64 --build-arg  package_name=$(PACKAGE_NAME) $(GIT_DIR)

launch:
	bundle exec rackup --host 0.0.0.0 -p 8000
run:
	docker run $(PACKAGE_NAME)

shell:
	docker run -it --rm \
	-v $(GIT_DIR):/app \
	-p $(HOST_PORT):8000 \
	-e ENVIROMENT=development \
	-w /app/$(PROJECT_FOLDER) \
	--platform linux/x86_64 \
	--entrypoint=/bin/ash $(PACKAGE_NAME)
