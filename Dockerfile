FROM sotax/rhel7.3

MAINTAINER  Kiran Aher <kiran.aher@webtechnicist.com>

VOLUME [ "/var/lib/pgsql" ]

COPY own.repo /etc/yum.repos.d/own.repo
COPY pgdg-redhat-all.repo /etc/yum.repos.d/pgdg-redhat-all.repo

RUN yum install -y wget ; wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm ; yum --nogpgcheck install epel-release-latest-7.noarch.rpm ; yum --nogpgcheck install -y telnet net-tools zip rsync ; yum install postgresql96 postgresql96-server postgresql96-contrib -y ; yum install -y postgresql-pgpool* pgpool-II-96-devel ; yum install -y openssh openssh-server openssh-clients

COPY postgresql.conf /postgresql.conf
COPY pg_hba.conf /pg_hba.conf
COPY run-service.sh /run-service.sh
COPY run-first-time.sh /run-first-time.sh
COPY sshd_config /etc/ssh/sshd_config

EXPOSE 5432 22

ENTRYPOINT /run-service.sh ; /bin/bash

#To run the container

#docker run -it -p 5432:5432 -v /opt/adp/pgsql-cont1:/var/lib/pgsql --restart=always  adp-pgsql:V1

#docker run -it -p 10.145.182.102:5432:5432 -p 10.145.182.102:22:22 -v /opt/adp/pgsql-cont3:/var/lib/pgsql --restart=always  --name pgsql-cont3 adp-pgsql:V2 /bin/bash

