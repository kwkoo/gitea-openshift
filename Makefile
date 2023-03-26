IMAGE_NAME=ghcr.io/kwkoo/gitea-openshift
VERSION=1.18.5
BUILDER_NAME=multiarch-builder
BASE:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

GITEA_NAMESPACE=demo
GITEA_DOMAIN=gitea.apps.kube.home
GITEA_ROOTURL=http://$(GITEA_DOMAIN)

.PHONY: image helm helm-install-k8s helm-uninstall

image:
	docker buildx use $(BUILDER_NAME) || docker buildx create --name $(BUILDER_NAME) --use
	docker buildx build \
	  --push \
	  --platform=linux/amd64,linux/arm64/v8 \
	  --rm \
	  --build-arg VERSION=$(VERSION) \
	  -t $(IMAGE_NAME):$(VERSION)-rootless \
	  -t $(IMAGE_NAME):latest \
	  $(BASE)/docker

# The helm chart is stored in /helm. It was packaged with the following:
# helm package .
#
# index.yaml was created by running:
# helm repo index .
#
helm:
	cd $(BASE)/helm && helm package gitea-openshift
	cd $(BASE)/helm && helm repo index .

helm-install-k8s:
	helm upgrade \
	  --install gitea gitea-openshift \
	  --repo https://kwkoo.github.io/gitea-openshift/helm \
	  --namespace $(GITEA_NAMESPACE) \
	  --create-namespace \
	  --set openshift=false \
	  --set gitea.webServer.rootURL="$(GITEA_ROOTURL)" \
	  --set gitea.domain="$(GITEA_DOMAIN)"

helm-uninstall:
	helm uninstall gitea --namespace $(GITEA_NAMESPACE)
