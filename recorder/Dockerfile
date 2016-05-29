FROM ubuntu:16.04

MAINTAINER Markus Frosch <markus@lazyfrosch.de>

RUN apt-key adv --keyserver pool.sks-keyservers.net --recv-key EAB5C42B35B2139B9CD0CD14BE1675153E0A5116 \
 && echo 'deb http://repo.owntracks.org/debian jessie main' > /etc/apt/sources.list.d/owntracks.list \
 && apt-get update \
 && apt-get install -y ot-recorder \
 && rm -rf /var/lib/apt/lists/*

COPY ot-recorder.default /etc/default/ot-recorder
COPY entrypoint.sh /docker-entrypoint.sh

ENV OTR_HOST=mqtt

VOLUME /data
EXPOSE 8083

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["ot-recorder", "--http-host", "0.0.0.0", "owntracks/#"]
