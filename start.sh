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

/usr/sbin/glustereventsd -p /run/glustereventsd.pid &
/usr/sbin/cron &
/usr/sbin/glusterd -p /run/glusterd.pid --log-level=$GLUSTERD_LOG_LEVEL --log-file=$GLUSTERD_LOG_FILE $GLUSTERD_OPTIONS
sleep infinity
