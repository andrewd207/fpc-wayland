{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit WaylandPkg;

{$warn 5023 off : no warning about unused units}
interface

uses
  wayland_cursor, wayland_protocol, wayland_shared_buffer, wayland_util, 
  wayland_client, wayland_client_core, wayland_egl, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('WaylandPkg', @Register);
end.
