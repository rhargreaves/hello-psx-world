SHELL := /bin/bash

LICENCE ?= $(firstword $(wildcard licences/*.dat))
LICENCE_FLAG = $(if $(LICENCE),-L $(LICENCE),)

HIDE_MIPS_WARNING = 2> >(awk '!/warning: MIPS-I support is experimental/' >&2)

all: iso
.PHONY: all

build:
	cargo build --release $(HIDE_MIPS_WARNING)
.PHONY: build

iso: build
	mkpsxiso -y $(LICENCE_FLAG) iso.xml
.PHONY: iso

fmt:
	cargo fmt
.PHONY: fmt

lint:
	cargo clippy $(HIDE_MIPS_WARNING)
	cargo fmt --check
.PHONY: lint

clean:
	cargo clean
	rm -f target/hello-psx-world.bin target/hello-psx-world.cue
.PHONY: clean
