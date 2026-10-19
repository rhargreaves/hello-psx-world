.PHONY: all build iso clean

all: iso

build:
	cargo build --release

LICENCE ?= $(firstword $(wildcard licences/*.dat))
LICENCE_FLAG = $(if $(LICENCE),-L $(LICENCE),)

iso: build
	mkpsxiso -y $(LICENCE_FLAG) iso.xml

clean:
	cargo clean
	rm -f target/hello-psx-world.bin target/hello-psx-world.cue
