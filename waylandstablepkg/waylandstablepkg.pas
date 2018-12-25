{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit WaylandStablePkg;

{$warn 5023 off : no warning about unused units}
interface

uses
  presentation_time_protocol, viewporter_protocol, xdg_shell_protocol, 
  LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('WaylandStablePkg', @Register);
end.
