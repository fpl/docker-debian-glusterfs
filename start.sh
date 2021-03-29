#!/bin/sh

GLUSTERD_LOG_LEVEL=INFO 
GLUSTERD_LOG_FILE=/var/log/glusterfs/glusterd.log
GLUSTERD_OPTIONS=

for d in /etc/glusterfs /var/lib/glusterd
do
	if ! test "$(ls $d)"
	then
		cp -far ${d}_bkp/* ${d}/.
	fi
done

/usr/sbin/glustereventsd --pid-file /run/glustereventsd.pid &
/usr/sbin/glusterd --log-level=$GLUSTERD_LOG_LEVEL --log-file=$GLUSTERD_LOG_FILE --no-daemon $GLUSTERD_OPTIONS
