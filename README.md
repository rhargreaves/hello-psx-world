# Hello PSX World

```
△ ○ ✕ □
```

## Build

### PS-EXE

```bash
cargo build --release
```

Output: `target/mipsel-sony-psx/release/hello-psx-world.exe`

### CUE+BIN

```bash
make iso
```

Outputs:

- `target/hello-psx-world.cue`
- `target/hello-psx-world.bin`

> **Note on PS1 Boot Logo**: To include the authentic PlayStation boot logo on disc startup, place your region's license file (e.g., `licensea.dat`, `licensee.dat`, `licensej.dat`) in the `licenses/` directory. `make iso` will automatically detect and inject it. If absent, it builds a clean homebrew disc.
