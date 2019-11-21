git clone https://github.com/webtechnicist/pgsql-rhel-docker.git

cd pgsql-rhel-docker/

docker build --no-cache=true -t db-pgsql:V1 .

docker run -it -p 10.145.182.101:5432:5432 -p 10.145.182.101:22:22 -p 10.145.182.101:9898:9898 -p 10.145.182.101:9999:9999 --hostname dev-db-01 -v /opt/db/dev-db-01:/var/lib/pgsql --restart=always  --name dev-db-01 db-pgsql:V1 /bin/bash

# This image will expose SSH, PgSQL and PgPool ports from  the container and will run on pivate IP 10.145.182.101.

# On first run it will initialize PgSQL database at /opt/db/dev-db-01:/var/lib/pgsql location.

# You can start and stop PgSQL and PgPool services with blow commands.

pgsql-start

pgsql-stop

pgpool-start

pgpool-stop
