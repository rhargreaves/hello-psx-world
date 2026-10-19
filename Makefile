.PHONY: all build iso clean

all: iso

build:
	cargo build --release

LICENSE ?= $(firstword $(wildcard licenses/*.dat))
LICENSE_FLAG = $(if $(LICENSE),-L $(LICENSE),)

iso: build
	mkpsxiso -y $(LICENSE_FLAG) iso.xml

clean:
	cargo clean
	rm -f target/hello-psx-world.bin target/hello-psx-world.cue
