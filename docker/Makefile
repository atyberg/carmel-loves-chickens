
.PHONY: help dev prod kill

REPO:=jtyberg/clc-nginx
CONTAINER_NAME:=clc-nginx

# Allow override during build to set version
TAG?=latest
# Allow override to bind to private IPs for smoke testing purposes
INTERFACE?=0.0.0.0

help:
	@echo 'Host commands:'
	@echo '  build - builds the docker container image'
	@echo '   kill - removes running server containers'

build:
	@docker build --rm --force-rm -t $(REPO):$(TAG) .

dev:
	@docker run --rm -t -i \
		--name $(CONTAINER_NAME) \
		-p 8080:80 \
		-v `pwd`/static:/www \
		$(REPO):$(TAG) /bin/bash -c "nginx; /bin/bash"

prod:
	@docker run -t -i -d \
		--name $(CONTAINER_NAME) \
		-p $(INTERFACE):80:80 \
		$(REPO):$(TAG)

kill:
	@-docker rm -f $(CONTAINER_NAME)
