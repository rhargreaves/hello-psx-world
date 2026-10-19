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

> [!TIP]
> The boot logo will only show if you `make iso` when licences are present in `licences/`
> (e.g. `licensee.dat`, `licensea.dat` or `licensej.dat`). Google exists.
