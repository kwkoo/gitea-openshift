# Gitea OpenShift

An image based off the [official Gitea image on Docker Hub](https://hub.docker.com/r/gitea/gitea).

The `su-exec` call has been removed from `/etc/s6/gitea/run` in order to allow the image to run on OpenShift.