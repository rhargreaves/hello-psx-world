LICENCE ?= $(firstword $(wildcard licences/*.dat))
LICENCE_FLAG = $(if $(LICENCE),-L $(LICENCE),)

all: iso
.PHONY: all

build:
	cargo build --release
.PHONY: build

iso: build
	mkpsxiso -y $(LICENCE_FLAG) iso.xml
.PHONY: iso

clean:
	cargo clean
	rm -f target/hello-psx-world.bin target/hello-psx-world.cue
.PHONY: clean
