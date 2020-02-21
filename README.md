# Fulcrum Sync

### Setup

1. Install docker
2. Get an API token for your Fulcrum account
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

If you want MSSQL support, you will need some additional environment variables:

```sh
FULCRUM_MSSQL_ENABLED=yes
FULCRUM_MSSQL_HOST=<host>
FULCRUM_MSSQL_PORT=<port>
FULCRUM_MSSQL_USER=<user>
FULCRUM_MSSQL_PASSWORD=<password>
FULCRUM_MSSQL_DATABASE=<database>
```

Or as a connection string:

```sh
FULCRUM_MSSQL_ENABLED=yes
FULCRUM_MSSQL_CONNECTION_STRING=mssql://username:password@hostname/database
```

For example, on a Mac running postgres locally, run:

```sh
FULCRUM_ORG="<org name>" \
FULCRUM_TOKEN="<api token>" \
FULCRUM_PG_ENABLED=yes \
FULCRUM_PG_HOST=docker.for.mac.host.internal \
FULCRUM_PG_USER=$USER \
FULCRUM_PG_DATABASE=fulcrum_sync \
./run
```

### Options

Setting the following environment variables will enable other features

```
FULCRUM_GPKG_ENABLED=yes|no                     # default no
FULCRUM_MEDIA_ENABLED=yes|no                    # default no
FULCRUM_REPORTS_ENABLED=yes|no                  # default no
FULCRUM_PG_ENABLED=yes|no                       # default no
FULCRUM_MSSQL_ENABLED=yes|no                    # default no
FULCRUM_S3_SYNC_ENABLED=yes|no                  # default no

# options when FULCRUM_S3_SYNC_ENABLED=yes
FULCRUM_AWS_ACCESS_KEY_ID="<key id>"            # key
FULCRUM_AWS_SECRET_ACCESS_KEY="<secret>"        # secret
FULCRUM_S3_SYNC_BUCKET="<bucket>"               # can also be in the form "bucket/sub-folder"
FULCRUM_S3_SYNC_ARGS=      # You can specify aws s3 sync options which get
                           # passed to the AWS cli command.
```

### Fulcrum Backup

Combining everything together you can use this to create an S3 backup of all Fulcrum content:

```sh
FULCRUM_ORG="<org name>" \
FULCRUM_TOKEN="<api token>" \
FULCRUM_GPKG_ENABLED=yes \
FULCRUM_MEDIA_ENABLED=yes \
FULCRUM_REPORTS_ENABLED=yes \
FULCRUM_S3_SYNC_ENABLED=yes \
FULCRUM_AWS_ACCESS_KEY_ID="<key>" \
FULCRUM_AWS_SECRET_ACCESS_KEY="<secret>" \
FULCRUM_S3_SYNC_BUCKET="<bucket>" \
./run
```


