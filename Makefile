IMAGE_NAME=gitea-openshift
VERSION=1.15.4

.PHONY: build push

build:
	@cat Dockerfile | sed -e 's/%VERSION%/$(VERSION)/' > docker/Dockerfile
	@docker build -t ghcr.io/kwkoo/$(IMAGE_NAME):$(VERSION)-rootless docker
	@rm -f docker/Dockerfile

push:
	@docker push ghcr.io/kwkoo/$(IMAGE_NAME):$(VERSION)-rootless
	@docker tag ghcr.io/kwkoo/$(IMAGE_NAME):$(VERSION)-rootless ghcr.io/kwkoo/$(IMAGE_NAME):latest
	@docker push ghcr.io/kwkoo/$(IMAGE_NAME):latest
