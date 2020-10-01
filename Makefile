IMAGE_NAME=gitea-openshift
VERSION=1.12.4

build:
	@cd docker && docker build -t $(IMAGE_NAME):$(VERSION) .

push:
	@docker tag $(IMAGE_NAME):$(VERSION) ghcr.io/kwkoo/$(IMAGE_NAME):$(VERSION)
	@docker push ghcr.io/kwkoo/$(IMAGE_NAME):$(VERSION)