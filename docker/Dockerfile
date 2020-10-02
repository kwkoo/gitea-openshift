FROM docker.io/gitea/gitea:1.12.4

LABEL \
  maintainer="Koo Kin Wai <kin.wai.koo@gmail.com>" \
  org.opencontainers.image.source="https://github.com/kwkoo/gitea-openshift"

RUN \
  sed -i -e 's/su-exec $USER//' /etc/s6/gitea/run \
  && \
  sed -i -e $'/SECRET_KEY=/a\\ \ \ \ LOG_LEVEL=${LOG_LEVEL-"INFO"} \\\\\\n\ \ \ \ DISABLE_ROUTER_LOG=${DISABLE_ROUTER_LOG-"false"} \\\\' /etc/s6/gitea/setup \
  && \
  sed -i -e $'/\[log\]/a\\LEVEL = $LOG_LEVEL\\nDISABLE_ROUTER_LOG = $DISABLE_ROUTER_LOG' /etc/templates/app.ini \
  && \
  sed -i -e 's|exec /bin/s6-svscan.*|cd /etc/s6/gitea \&\& exec ./run|' /usr/bin/entrypoint

CMD []