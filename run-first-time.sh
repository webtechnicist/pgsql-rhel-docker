#!/bin/bash

set -m

rm -rf /var/lib/pgsql/*

sudo -u postgres /usr/pgsql-9.6/bin/initdb -D /var/lib/pgsql/9.6/data/

rsync -va /postgresql.conf /var/lib/pgsql/9.6/data/postgresql.conf
rsync -va /pg_hba.conf /var/lib/pgsql/9.6/data/pg_hba.conf

chown postgres.postgres /var/lib/pgsql/9.6/data/pg_hba.conf /var/lib/pgsql/9.6/data/postgresql.conf
chmod 666 /var/lib/pgsql/9.6/data/pg_hba.conf /var/lib/pgsql/9.6/data/postgresql.conf

rm -f /run-first-time.sh
