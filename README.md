# Gitea OpenShift

An image based off the [official rootless Gitea image on Docker Hub](https://hub.docker.com/r/gitea/gitea).


To deploy this on OpenShift with Postgres as the database,

```
oc new-app \
  --template=postgresql-persistent \
  -p POSTGRESQL_USER=gitea \
  -p POSTGRESQL_PASSWORD=gitea \
  -p POSTGRESQL_DATABASE=gitea

oc wait \
  --timeout=120s \
  --for=condition=available \
  dc/postgresql

# create a dummy route to figure out routing suffix
oc create route edge dummy --service=dummy --port=8080
SUFFIX="$(oc get route/dummy -o jsonpath='{.spec.host}' | sed -e 's/^[^.]*\.//')"
oc delete route/dummy

oc new-app \
  -f https://raw.githubusercontent.com/kwkoo/gitea-openshift/master/yaml/gitea-template.yaml \
  -p DOMAIN=gitea-$(oc project -q).${SUFFIX} \
  -p ROOT_URL=https://gitea-$(oc project -q).${SUFFIX} \
  -p LOG_LEVEL=WARN \
  -p DB_TYPE=postgres \
  -p DB_HOST=postgresql:5432 \
  -p DB_NAME=gitea \
  -p DB_USER=gitea \
  -p DB_NAME=gitea \
  -p DB_PASSWD=gitea

oc wait \
  --timeout=120s \
  --for=condition=available \
  statefulset/gitea

oc rsh statefulset/gitea \
  gitea \
  admin \
  user \
  create \
  --admin \
  --username demo \
  --password password \
  --email demo@example.com
```

If you omit the `DB_*` parameters Gitea will use sqlite3 as the database.
