ARG VERSION
FROM docker.io/gitea/gitea:${VERSION}-rootless

LABEL \
  maintainer="Koo Kin Wai <kin.wai.koo@gmail.com>" \
  org.opencontainers.image.source="https://github.com/kwkoo/gitea-openshift"

USER root

COPY openshift-entrypoint.sh /usr/local/bin/

RUN \
  chown :0 /etc \
  && \
  chmod g+wx /etc \
  && \
  chown :0 /etc/passwd \
  && \
  chmod g+w /etc/passwd

ENTRYPOINT ["/usr/local/bin/openshift-entrypoint.sh"]

CMD ["/usr/bin/dumb-init", "--", "/usr/local/bin/docker-entrypoint.sh"]

USER 1001