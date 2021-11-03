#!/bin/sh

REPO=$(pwd)

[ "$(command -v cbase16)" ] || {
	echo "error: build program not detected: cbase16" 1>&2
	exit 1
}

cbase16 update

cd "$REPO/templates/lua"
cbase16 make -o "$REPO"

cd "$REPO/templates/shell"
cbase16 make -o "$REPO"

cd "$REPO"
