FROM debian:wheezy

MAINTAINER David Feller <david.feller@browse-system.com>

RUN export DEBIAN_FRONTEND=noninteractive 
RUN apt-get update
RUN apt-get install -y wget libfreetype6

RUN echo "deb http://deb.appserver.io/ wheezy main" > /etc/apt/sources.list.d/appserver.list
RUN wget http://deb.appserver.io/appserver.gpg -O - | apt-key add -
RUN apt-get -y update
RUN apt-get install -y appserver

VOLUME ["/opt/appserver/etc", "/opt/appserver/var", "/opt/appserver/webapps/html"]

RUN rm /opt/appserver/etc/appserver/appserver.xml

COPY scripts/init.sh /init.sh
COPY appserver.xml /opt/appserver/etc/appserver/appserver.xml
COPY html /opt/appserver/webapps/html

EXPOSE 9080
EXPOSE 9443

CMD ["/init.sh"]
