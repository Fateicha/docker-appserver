FROM ubuntu:latest

MAINTAINER David Feller <contact@david-feller.com>

RUN export DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y wget libfreetype6
RUN echo "deb http://deb.appserver.io/ wheezy main" > /etc/apt/sources.list.d/appserver.list && wget http://deb.appserver.io/appserver.gpg -O - | apt-key add -

RUN apt-get -y update \
	&& apt-get install -y appserver-dist \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /data
VOLUME ["/opt/appserver/etc", "/opt/appserver/var", "/data"]

COPY scripts/start.sh /start.sh
RUN rm /opt/appserver/etc/appserver/appserver.xml
COPY config/appserver.xml /opt/appserver/etc/appserver/appserver.xml

RUN chmod +x /start.sh

EXPOSE 9080 9443

CMD ["/start.sh"]
