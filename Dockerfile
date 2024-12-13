FROM debian:bookworm-slim

ADD start.sh /
RUN chmod a+x /start.sh
RUN true \
    && apt-get update \
	&& apt-get --yes upgrade \
    && apt-get install --no-install-recommends --yes procps iproute2 less nvi \
	&& apt-get install --no-install-recommends --yes glusterfs-server \
	&& apt-get install --no-install-recommends --yes cron logrotate \
	&& apt-get clean
RUN true \
    && mkdir -p /var/lib/glusterd_bkp /etc/glusterfs_bkp \
	&& cp -far /etc/glusterfs/* /etc/glusterfs_bkp/. \
    && cp -far /var/lib/glusterd/* /var/lib/glusterd_bkp/. 
RUN true \
    && mkdir /brick1 /brick2 /brick3 /brick4 /brick5 /brick6 \
       /brick7 /brick8 /brick9 /brick10 /brick11 /brick12

EXPOSE 24009/udp 24007/tcp
VOLUME ["/brick1", "/brick2", "/brick3","/brick4", "/brick5", "/brick6", "/brick7", "/brick8", "/brick9", "/brick10", "/brick11", "/brick12"]
VOLUME ["/etc/glusterfs", "/var/lib/glusterd", "/var/log/glusterfs"]

CMD ["/start.sh"]

