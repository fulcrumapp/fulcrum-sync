# Fulcrum Sync

### Setup

1. Install docker
2. Get an API token for the MOFA account
3. Run `FULCRUM_ORG="<org name>" FULCRUM_TOKEN="<api token>" ./run`
4. Data will be downloaded to `./data/<org name>`

### PostgreSQL

If you want postgres support, you will need some additional environment variables:

```sh
FULCRUM_PG_ENABLED=yes
FULCRUM_PG_HOST=<host>
FULCRUM_PG_PORT=<port>
FULCRUM_PG_USER=<user>
FULCRUM_PG_PASSWORD=<password>
FULCRUM_PG_DATABASE=<database>
```

For example, on a Mac running postgres locally, run:

```sh
FULCRUM_TOKEN="<api token>" \
FULCRUM_PG_ENABLED=yes \
FULCRUM_PG_HOST=docker.for.mac.host.internal \
FULCRUM_PG_USER=$USER \
FULCRUM_PG_DATABASE=snidata_sync \
./run
```

### Options

Setting the following environment variables will enable other features

```
FULCRUM_GPKG_ENABLED=yes|no      # default no
FULCRUM_MEDIA_ENABLED=yes|no     # default no
FULCRUM_REPORTS_ENABLED=yes|no   # default no
FULCRUM_PG_ENABLED=yes|no        # default no
```
