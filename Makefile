.POSIX:

BUILD=pybase16
REPO=$(shell pwd)
TEMPLATE=$(shell basename ${REPO})

all: update build

update:
	$(BUILD) update

build:
	cp templates/vim/* templates
	rm -rf colors
	$(BUILD) build -t ${REPO} -o output
	mv output/${TEMPLATE}/colors colors
	cp templates/lua/* templates
	rm -rf lua/colors
	$(BUILD) build -t ${REPO} -o output
	mv output/${TEMPLATE}/lua lua/colors
	cp templates/shell/* templates
	rm -rf shell
	$(BUILD) build -t ${REPO} -o output
	mv output/${TEMPLATE}/shell shell

clean:
	rm -rf output colors lua/colors shell
	rm templates/{config.yaml,default.mustache}

.PHONY: all update build clean
