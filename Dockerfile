FROM ubuntu:latest

MAINTAINER David Feller <contact@david-feller.com>

RUN export DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y wget libfreetype6
RUN echo "deb http://deb.appserver.io/ wheezy main" > /etc/apt/sources.list.d/appserver.list
RUN wget http://deb.appserver.io/appserver.gpg -O - | apt-key add -

RUN apt-get -y update
RUN apt-get install -y appserver-dist

VOLUME ["/opt/appserver/etc", "/opt/appserver/var", "/opt/appserver/webapps"]

COPY scripts/start.sh /start.sh
RUN rm /opt/appserver/etc/appserver/appserver.xml
COPY config/appserver.xml /opt/appserver/etc/appserver/appserver.xml

RUN chmod +x /start.sh

EXPOSE 9080
EXPOSE 9443

CMD ["/start.sh"]
