{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit WaylandSupportPkg;

{$warn 5023 off : no warning about unused units}
interface

uses
  libharfbuzz, libxkbcommon, xkb_classes, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('WaylandSupportPkg', @Register);
end.
