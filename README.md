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

`waylandstablepkg`, `waylandstagingpkg` and `waylandunstablepkg` depend on
`waylandpkg`; the staging and unstable packages also depend on
`waylandstablepkg` because some of their protocols reference stabilized
interfaces (e.g. cursor-shape uses `zwp_tablet_tool_v2`, xdg-decoration uses
`xdg_toplevel`).

## Layout

The repository is a [PasBuild](https://github.com/graemeg/PasBuild) multi-module
project. The root `project.xml` is an aggregate (`packaging=pom`) that lists the
module directories; each module keeps its Pascal sources under
`src/main/pascal/`:

```
project.xml                 aggregate (pom)
waylandpkg/                 library module  + Lazarus .lpk
waylandstablepkg/           library module  + Lazarus .lpk
waylandstagingpkg/          library module  + Lazarus .lpk
waylandunstablepkg/         library module  + Lazarus .lpk
supportpkg/                 library module  + Lazarus .lpk
tools/generator/            application module (the bindings generator)
```

The Lazarus `.lpk` package files are kept in place (their file references point
at `src/main/pascal/`), so the packages can still be opened/built from Lazarus.

## Building

```sh
pasbuild compile --all        # build every module in dependency order
pasbuild dependency-tree      # show the module graph
pasbuild compile -m waylandstagingpkg
```

## Regenerating the bindings

The generator reads the protocol XML installed on the system:

- `/usr/share/wayland/wayland.xml` (from the `wayland` package)
- `/usr/share/wayland-protocols/{stable,staging,unstable}/` (from the
  `wayland-protocols` package)

Build the generator and run it from the repository root:

```sh
pasbuild compile -m generator
./tools/generator/target/fpcwaylandbindings
```

It writes the `*_protocol.pas` units into each package's `src/main/pascal/`
directory. The generated tree root defaults to the current directory; pass an
alternate root as the first argument
(`fpcwaylandbindings /path/to/checkout`).

The generator runs in two passes: the first builds a registry mapping every
interface name to the unit that declares it, so that the second pass can emit
correct cross-unit `uses` clauses. When an interface name exists in more than
one protocol version (for example the unstable and stabilized tablet), the
stable unit wins; registration order in `fpcwaylandbindings.lpr`
(stable → staging → unstable) controls that priority.

> Note: the package manifests (`*.lpk`) are not produced by the generator. If
> the set of generated units changes, update the corresponding package's file
> list (and `<units>` in its `project.xml`) accordingly.
