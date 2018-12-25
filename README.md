# fpc-wayland

Bindings generator for freepascal that creates units from the various protocol.xml files including wayland.xml.

There are four packages: 

1. WaylandPkg which has the hardcoded libwayland headers
2. WaylandStablePkg which has the "stable" protocols used with Wayland and Weston etc.
3. WaylandUnstablePkg which has the unstable protocols.
4. WaylandSupportPkg which has bindings for libxbcommon and libharfbuzz


