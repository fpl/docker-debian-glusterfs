#!/bin/sh

GLUSTERD_LOG_LEVEL=INFO 
GLUSTERD_LOG_FILE=/var/log/glusterfs/glusterd.log
GLUSTERD_OPTIONS=

cp -far /etc/glusterfs_bkp/* /etc/glusterfs/.
cp -far /var/lib/glusterd_bkp/* /var/lib/glusterd/.
/usr/sbin/glustereventsd --pid-file /run/glustereventsd.pid &
/usr/sbin/cron &
/usr/sbin/glusterd --log-level=$GLUSTERD_LOG_LEVEL --log-file=$GLUSTERD_LOG_FILE --no-daemon $GLUSTERD_OPTIONS
