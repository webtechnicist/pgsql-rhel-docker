FROM sotax/rhel7.3

MAINTAINER  Kiran Aher <kiran.aher@webtechnicist.com>

VOLUME [ "/var/lib/pgsql" ]

COPY own.repo /etc/yum.repos.d/own.repo
COPY pgdg-redhat-all.repo /etc/yum.repos.d/pgdg-redhat-all.repo

RUN yum install -y wget ; wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm ; yum --nogpgcheck install epel-release-latest-7.noarch.rpm ; yum --nogpgcheck install -y telnet net-tools zip rsync ; yum install postgresql96 postgresql96-server postgresql96-contrib -y ; yum install -y postgresql-pgpool* pgpool-II-96-devel ; yum install -y openssh openssh-server openssh-clients ; mkdir -p /var/run/pgpool-II-96; chown postgres.postgres /var/run/pgpool-II-96 ; chmod 755 /var/run/pgpool-II-96/ ; echo "changeit" | passwd --stdin root

COPY postgresql.conf /postgresql.conf
COPY pg_hba.conf /pg_hba.conf
COPY run-service.sh /run-service.sh
COPY run-first-time.sh /run-first-time.sh
COPY sshd_config /etc/ssh/sshd_config
COPY pgsql-start /bin/pgsql-start
COPY pgsql-stop /bin/pgsql-stop
COPY pgpool-start /bin/pgpool-start
COPY pgpool-stop /bin/pgpool-stop
COPY pgpool.conf /etc/pgpool-II-96/pgpool.conf

EXPOSE 5432 9898 9999

ENTRYPOINT /run-service.sh ; /bin/bash
