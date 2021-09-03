DOCKER_IMAGE := etrex-10-osm

build:
	docker build -t $(DOCKER_IMAGE):latest \
		./misc/docker

map:
	mkdir -p maps
	docker run \
		-it --rm \
		-u $(shell id -u):$(shell id -g)\
		-v $(PWD)/maps:/home/etrex/maps \
		$(DOCKER_IMAGE):latest \
		/bin/sh
