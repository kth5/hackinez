#!/bin/bash
ARG=$1

if [ -f /srv/http/web/shared/.env ]; then
	source /srv/http/web/shared/.env
fi

[ -z "${MEMCACHED_HOST}" ] &&  MEMCACHED_HOST="127.0.0.1"
[ -z "${MEMCACHED_PORT}" ] &&  MEMCACHED_PORT="11211"


OLDHASH=$(echo -e 'get PPA\r' | nc ${MEMCACHED_HOST} ${MEMCACHED_PORT} 2>/dev/null | sed 's/END\r//g' | tail -n2 | head -n1)

if [ $? -gt 0 ]; then
	echo ":: Memcached seems dead..."
	exit 1
fi

if [ "${ARG}" == "disable" ]; then
	echo -e 'delete PPA\r' | nc ${MEMCACHED_HOST} ${MEMCACHED_PORT} &>/dev/null
	exit $?
fi

if [ ! -z "${OLDHASH}" ] || [ "${ARG}" == "enable" ]; then
	STRING=$(head -c 2048 /dev/urandom | tr -dc 'a-zA-Z0-9_-' | fold -w 32 | head -n 1)
	echo -e 'set PPA 0 86400 34\r\n' ${STRING} '\r' | nc ${MEMCACHED_HOST} ${MEMCACHED_PORT} 1>/dev/null

	echo -e 'get PPA\r' | nc ${MEMCACHED_HOST} ${MEMCACHED_PORT} &>/dev/null
	exit $?
fi
