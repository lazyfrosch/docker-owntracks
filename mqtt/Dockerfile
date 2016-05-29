FROM ubuntu:16.04

MAINTAINER Markus Frosch <markus@lazyfrosch.de>

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key 77B7346A59027B33C10CAFE35E64E954262C4500 \
 && echo 'deb http://ppa.launchpad.net/mosquitto-dev/mosquitto-ppa/ubuntu xenial main' > /etc/apt/sources.list.d/mosquitto.list \
 && apt-get update \
 && apt-get install -y \
	mosquitto \
	mosquitto-clients \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY mosquitto.acl mosquitto.conf /etc/mosquitto/
COPY mosquitto /usr/local/sbin/
COPY entrypoint.sh /docker-entrypoint.sh

VOLUME /data
EXPOSE 1883 8883

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["mosquitto"]
