FROM debian:stable-slim

ADD start.sh /
RUN chmod a+x /start.sh
ADD glusterfs-bpo.list /etc/apt/sources.list.d/
RUN mkdir /debs
ADD debs/* /debs/
RUN true \
    && apt-get update \
	&& apt-get --yes upgrade \
	&& apt-get install --no-install-recommends --yes glusterfs-server \
	&& apt-get clean
RUN true \
    && mkdir -p /var/lib/glusterd_bkp /etc/glusterfs_bkp \
	&& cp -far /etc/glusterfs/* /etc/glusterfs_bkp/. \
    && cp -far /var/lib/glusterd/* /etc/glusterfs_bkp/. 
RUN mkdir /brick1
RUN mkdir /brick2
RUN mkdir /brick3

EXPOSE 24009/udp 24007/tcp
VOLUME ["/brick1", "/brick2", "/brick3"]

CMD ["/start.sh"]


