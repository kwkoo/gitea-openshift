IMAGE_NAME=gitea-openshift
VERSION=1.15.2-rootless

.PHONY: build push

build:
	@docker build -t ghcr.io/kwkoo/$(IMAGE_NAME):$(VERSION) docker

push:
	@docker push ghcr.io/kwkoo/$(IMAGE_NAME):$(VERSION)