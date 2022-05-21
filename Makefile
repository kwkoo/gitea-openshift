IMAGE_NAME=ghcr.io/kwkoo/gitea-openshift
VERSION=1.16.8
BUILDER_NAME=gitea-builder
BASE:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: image

image:
	docker buildx use $(BUILDER_NAME) || docker buildx create --name $(BUILDER_NAME) --use
	docker buildx build \
	  --push \
	  --platform=linux/amd64,linux/arm64/v8 \
	  --rm \
	  --build-arg VERSION=$(VERSION) \
	  -t $(IMAGE_NAME):$(VERSION)-rootless \
	  -t $(IMAGE_NAME):latest \
	  $(BASE)
