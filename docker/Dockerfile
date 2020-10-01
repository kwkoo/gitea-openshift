FROM docker.io/gitea/gitea:1.12.4

LABEL \
  maintainer="Koo Kin Wai <kin.wai.koo@gmail.com>" \
  org.opencontainers.image.source="https://github.com/kwkoo/gitea-openshift"

RUN sed -i -e 's/su-exec $USER//' /etc/s6/gitea/run