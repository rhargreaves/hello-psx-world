.PHONY: all build iso clean

all: iso

build:
	cargo build --release

iso: build
	mkpsxiso -y iso.xml

clean:
	cargo clean
	rm -f hello-psx-world.bin hello-psx-world.cue target/hello-psx-world.bin target/hello-psx-world.cue
