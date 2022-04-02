IMAGE_NAME=gitea-openshift
VERSION=1.16.5

.PHONY: build push

build:
	@docker build --build-arg VERSION=$(VERSION) -t ghcr.io/kwkoo/$(IMAGE_NAME):$(VERSION)-rootless docker

push:
	@docker push ghcr.io/kwkoo/$(IMAGE_NAME):$(VERSION)-rootless
	@docker tag ghcr.io/kwkoo/$(IMAGE_NAME):$(VERSION)-rootless ghcr.io/kwkoo/$(IMAGE_NAME):latest
	@docker push ghcr.io/kwkoo/$(IMAGE_NAME):latest
