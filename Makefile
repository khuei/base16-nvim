.POSIX:

all: get-cbase16 build

get-cbase16:
	test -f ./builder/cbase16.cpp || git clone https://github.com/base16-fork/cbase16 ./builder
	make -C ./builder

build:
	./builder/cbase16 update -c ./builder
	./builder/cbase16 make -c ./builder -C ./templates/lua
	test -d colors || mkdir colors
	mv ./templates/lua/lua/colors/* ./colors
	./builder/cbase16 make -c ./builder -C ./templates/shell
	test -d shell || mkdir shell
	mv ./templates/shell/shell/colors/* ./shell

.PHONY: all get-cbase16 build commit
