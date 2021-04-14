IMAGE_NAME=gitea-openshift
VERSION=1.14.0-rootless

.PHONY: build push

build:
	@cd docker && docker build -t ghcr.io/kwkoo/$(IMAGE_NAME):$(VERSION) .

push:
	@docker push ghcr.io/kwkoo/$(IMAGE_NAME):$(VERSION)