IMAGE_NAME=gitea-openshift
VERSION=1.14.3-rootless

.PHONY: build push

build:
	@cdocker build -t ghcr.io/kwkoo/$(IMAGE_NAME):$(VERSION) docker

push:
	@docker push ghcr.io/kwkoo/$(IMAGE_NAME):$(VERSION)