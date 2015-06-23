FROM ubuntu:14.04
MAINTAINER JJ Asghar <jjasghar@gmail.com>

ENV DEBIAN_FRONTEND noninteractive 
ENV PDNS_RCURSOR_VERSION 3.7.3-1
ENV DATA_DIR /conf

RUN rm -rf /etc/apt/apt.conf.d/docker-gzip-indexes \
	&& apt-get update && apt-get install -y wget \
	&& wget https://downloads.powerdns.com/releases/deb/pdns-recursor_${PDNS_RCURSOR_VERSION}_amd64.deb -P /tmp/ \
	&& dpkg -i /tmp/pdns-recursor_${PDNS_RCURSOR_VERSION}_amd64.deb \
	&& mkdir /conf \
	&& rm /tmp/pdns-recursor_${PDNS_RCURSOR_VERSION}_amd64.deb \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE     53/udp 53/tcp
VOLUME  ["${DATA_DIR}"]
CMD [ "/usr/sbin/pdns_recursor","--daemon=no", "--config-dir=/conf", "--forward-zones-file=/conf/forward-zones"]
