FROM docker.io/gitea/gitea:1.15.2-rootless

LABEL \
  maintainer="Koo Kin Wai <kin.wai.koo@gmail.com>" \
  org.opencontainers.image.source="https://github.com/kwkoo/gitea-openshift"

USER root

COPY docker-setup.sh /usr/local/bin/docker-setup.sh

RUN \
  chown :0 /etc \
  && \
  chmod g+wx /etc \
  && \
  chown :0 /etc/passwd \
  && \
  chmod g+w /etc/passwd

USER 1001