.POSIX:

BUILD=cbase16
REPO=$(shell pwd)
TEMPLATE=$(shell basename ${REPO})

all: update build

update:
	$(BUILD) update

build:
	rm -rf $(REPO)/{colors,shell}
	$(BUILD) build -c ./ -t lua shell -o output
	mv output/{lua/colors/,shell/shell/} $(REPO)

clean:
	rm -rf output colors lua/colors shell
	rm templates/{config.yaml,default.mustache}

.PHONY: all update build clean
