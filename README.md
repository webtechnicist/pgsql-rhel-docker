mkdir /opt/adp/pgsql-cont1

cd /opt/adp/pgsql-cont1/

git clone https://github.com/webtechnicist/pgsql-rhel-docker.git

cd pgsql-rhel-docker/

docker build --no-cache=true -t adp-pgsql:V1 .

docker run -it -p 10.145.182.102:5432:5432 -p 10.145.182.102:22:22 -v /opt/adp/pgsql-cont1:/var/lib/pgsql --restart=always  --name pgsql-cont1 adp-pgsql:V2 /bin/bash

# Run portainer UI container to manage containers.

docker run -d -p 9000:9000 --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer:/data portainer/portainer
