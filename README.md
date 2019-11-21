git clone https://github.com/webtechnicist/pgsql-rhel-docker.git

cd pgsql-rhel-docker/

docker build --no-cache=true -t adp-pgsql:V1 .

docker run -it -p 10.145.182.101:5432:5432 -p 10.145.182.101:22:22 -p 10.145.182.101:9898:9898 -p 10.145.182.101:9999:9999 --hostname prod-rt-live-execdb-02 -v /opt/adp/prod-rt-live-execdb-02:/var/lib/pgsql --restart=always  --name prod-rt-live-execdb-02 adp-pgsql:V1 /bin/bash

# This image will expose SSH, PgSQL and PgPool ports from  the container and will run on pivate IP 10.145.182.101.
