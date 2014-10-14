FROM debian:wheezy

MAINTAINER David Feller <david.feller@browse-system.com>

RUN apt-get update
RUN apt-get install -y wget libfreetype6

RUN echo "deb http://deb.appserver.io/ wheezy main" > /etc/apt/sources.list.d/appserver.list
RUN wget http://deb.appserver.io/appserver.gpg -O - | apt-key add -
RUN apt-get -y update
RUN apt-get install -y appserver

VOLUME ["/opt/appserver/etc", "/opt/appserver/var", "/opt/appserver/webapps/magento"]

RUN rm /opt/appserver/etc/appserver/appserver.xml

COPY init.sh /init.sh
COPY appserver.xml /opt/appserver/etc/appserver/appserver.xml

EXPOSE 9080

CMD ["/init.sh"]
