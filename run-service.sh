#!/bin/bash

set -m

FIRSTTIME=/run-first-time.sh

if [ -f "$FIRSTTIME" ]; then
	/bin/bash /run-first-time.sh
else
	echo "nothing to do" > /dev/null
fi

sudo -u postgres /usr/pgsql-9.6/bin/pg_ctl start -D /var/lib/pgsql/9.6/data -s -o "-p 5432" -w -t 300 -l /var/lib/pgsql/9.6/data/logfile

/usr/sbin/sshd

/bin/pgpool-start
