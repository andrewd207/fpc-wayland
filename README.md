# fpc-wayland

Bindings generator for Free Pascal that creates units from the various
`protocol.xml` files (including `wayland.xml`).

There are five packages:

1. **WaylandPkg** — the hardcoded libwayland headers plus the generated
   `wayland_protocol` unit.
2. **WaylandStablePkg** — the "stable" protocols (xdg-shell, viewporter,
   presentation-time, tablet, linux-dmabuf).
3. **WaylandStagingPkg** — the "staging" protocols (cursor-shape,
   fractional-scale, tearing-control, the `ext-*` protocols, etc.).
4. **WaylandUnstablePkg** — the older "unstable" (`zwp_*`/`zxdg_*`) protocols.
5. **WaylandSupportPkg** — bindings for libxkbcommon and libharfbuzz.

`WaylandStablePkg`, `WaylandStagingPkg` and `WaylandUnstablePkg` depend on
`WaylandPkg`; the staging and unstable packages also depend on
`WaylandStablePkg` because some of their protocols reference stabilized
interfaces (e.g. cursor-shape uses `zwp_tablet_tool_v2`, xdg-decoration uses
`xdg_toplevel`).

## Regenerating the bindings

The generator reads the protocol XML installed on the system:

- `/usr/share/wayland/wayland.xml` (from the `wayland` package)
- `/usr/share/wayland-protocols/{stable,staging,unstable}/` (from the
  `wayland-protocols` package)

Build and run the generator from the repository root:

```sh
fpc -Fuwaylandpkg fpcwaylandbindings.lpr
./fpcwaylandbindings
```

This writes the `*_protocol.pas` units into `waylandpkg/`,
`waylandstablepkg/`, `waylandstagingpkg/` and `waylandunstablepkg/`.

The generator runs in two passes: the first builds a registry mapping every
interface name to the unit that declares it, so that the second pass can emit
correct cross-unit `uses` clauses. When an interface name exists in more than
one protocol version (for example the unstable and stabilized tablet), the
stable unit wins; registration order in `fpcwaylandbindings.lpr`
(stable → staging → unstable) controls that priority.

> Note: the package manifests (`*.lpk` / `*.pkg.pas`) are not produced by the
> generator. If the set of generated units changes, update the corresponding
> package's file list accordingly.
