.DEFAULT_GOAL := run

NODE_IMAGE=node:18-slim
IMAGE_NAME := duckerlabs/evidence:latest

build:
	@docker build \
		--build-arg NODE_IMAGE=$(NODE_IMAGE) \
		-t $(IMAGE_NAME) \
		.

run:
	@docker run --rm -it --entrypoint /bin/bash $(IMAGE_NAME)

push: build
	docker push $(IMAGE_NAME)
