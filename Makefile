.POSIX:

REPO=$(shell pwd)
TEMPLATE=$(shell basename ${REPO})

all: update build

update:
	pybase16 update

build:
	cp templates/vim/* templates
	rm -rf colors
	pybase16 build -t ${REPO} -o output
	mv output/${TEMPLATE}/colors colors
	cp templates/lua/* templates
	pybase16 build -t ${REPO} -o output
	rm -rf lua/colors
	mv output/${TEMPLATE}/lua lua/colors

clean:
	rm -rf output colors lua/colors
	rm templates/{config.yaml,default.mustache}

.PHONY: all update build clean
