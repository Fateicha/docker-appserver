#appserver.io in a docker container

## Introduction
Dockerfile to build appserver.io.

## Requirements
- Docker version >= v1.3
- GNU Linux Kernel version >= 3.8 on the host machine

## Issues
For ubuntu users I suggest installing docker using docker's own package repository since the version of docker packaged in the ubuntu repositories are a little dated.

	sudo apt-get purge docker.io
	curl -s https://get.docker.io/ubuntu/ | sudo sh
	sudo apt-get update
	sudo apt-get install lxc-docker

## Installation
The recommended method of installation is to pull the image from the docker index. These builds are performed by the Docker Trusted Build service.
	
	docker pull davidfeller/appserver.io:latest

Alternativly you can build the image locally.

	git clone https://github.com/appserver-io-dist/docker.git
	cd docker
	docker build -t "$USER/appserver.io" .
	
## Quickstart
You can launch the image using the docker command line
	
	docker run -d --name='appserver.io' -p 9080:9080 -p 9443:9443 -v /var/www:/opt/appserver/webapps davidfeller/appserver.io:latest
	
or if you built your own image

	docker run -d --name='appserver.io' -p 9080:9080 -p 9443:9443 -v /var/www:/opt/appserver/webapps $USER/appserver.io
	
In both cases we assume that you want to use `/var/www` as document root.
