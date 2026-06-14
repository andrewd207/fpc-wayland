{ <fpcwaylandbindings.lpr>

  Copyright (C) <2018> <Andrew Haines> <andrewd207@aol.com>

  This source is free software; you can redistribute it and/or modify it under
  the terms of the GNU General Public License as published by the Free
  Software Foundation; either version 2 of the License, or (at your option)
  any later version.

  This code is distributed in the hope that it will be useful, but WITHOUT ANY
  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
  details.

  A copy of the GNU General Public License is available on the World Wide Web
  at <http://www.gnu.org/copyleft/gpl.html>. You can also obtain it by writing
  to the Free Software Foundation, Inc., 51 Franklin Street - Fifth Floor,
  Boston, MA 02110-1335, USA.
}
program fpcwaylandbindings;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, Sysutils, wayland_xml,
  protocol_generator;

var
  list: TStringList;
  Protocol: String;

procedure GatherProtocols(ADir: String);
var
  lDirs: TStringList;
  Rec: TRawByteSearchRec;
  Path: String;
begin
  ADir := IncludeTrailingPathDelimiter(ADir);

  lDirs := TStringList.Create;
  // first find directories
  if FindFirst(ADir+'*', faDirectory, Rec) = 0 then
  repeat
    if Rec.Attr and faDirectory = faDirectory then
      lDirs.Add(ADir+Rec.Name+'/');
  until FindNext(Rec) <> 0;
  FindClose(Rec);

  for Path in lDirs do
  begin
    if FindFirst(Path+'*.xml', faAnyFile, Rec) = 0 then
    repeat
      if Rec.Attr and faDirectory = faDirectory then
        continue;
      List.Add(Path+REc.Name);
    until FindNext(Rec) <> 0;
    FindClose(Rec);
  end;

end;

function UnitNameOf(AFile: String): String;
begin
  Result := ChangeFileExt(ExtractFileName(AFile), '') + '_protocol';
  Result := StringReplace(Result, '-', '_', [rfReplaceAll]);
end;

// Pass 1: record every interface a protocol declares in the global registry so
// that protocols referencing them across units emit a correct uses clause.
procedure registerbinding(AFile: String);
var
  g: TGenerator;
begin
  g := TGenerator.Create(AFile);
  g.RegisterInterfaces(UnitNameOf(AFile));
  g.Free;
end;

procedure createbinding(AFile: String; OutDir: String);
var
  g: TGenerator;
  out_unit: TStrings;
  lName: String;
begin
  lName := UnitNameOf(AFile);
  out_unit := TStringList.Create;
  g := TGenerator.Create(AFile);
  g.Generate(lname, out_unit, True);
  out_unit.SaveToFile(Outdir+lName+'.pas');
  out_unit.Free;
  g.Free;
end;

const
  WaylandXml   = '/usr/share/wayland/wayland.xml';
  StableDir    = '/usr/share/wayland-protocols/stable/';
  StagingDir   = '/usr/share/wayland-protocols/staging/';
  UnstableDir  = '/usr/share/wayland-protocols/unstable/';

begin
  // Pass 1: build the interface -> unit registry. Order matters: the first unit
  // to claim an interface name wins, so stable protocols are registered before
  // staging/unstable to resolve interfaces duplicated across versions.
  List := TStringList.Create;
  registerbinding(WaylandXml);
  GatherProtocols(StableDir);
  GatherProtocols(StagingDir);
  GatherProtocols(UnstableDir);
  for Protocol in List do
    registerbinding(Protocol);
  List.Free;

  // Pass 2: generate the units.
  Createbinding(WaylandXml, 'waylandpkg/');

  List := TStringList.Create;
  GatherProtocols(StableDir);
  for Protocol in list do
    Createbinding(Protocol, 'waylandstablepkg/');
  list.Clear;
  GatherProtocols(StagingDir);
  for Protocol in list do
    Createbinding(Protocol, 'waylandstagingpkg/');
  list.Clear;
  GatherProtocols(UnstableDir);
  for Protocol in list do
    Createbinding(Protocol, 'waylandunstablepkg/');
  List.free;


end.

