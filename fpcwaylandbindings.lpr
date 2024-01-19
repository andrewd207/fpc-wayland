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
  BaseDir: String;

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

procedure createbinding(AFile: String; OutDir: String);
var
  g: TGenerator;
  out_unit: TStrings;
  lName: String;
begin
  lName := ExtractFileName(AFile);
  lName := ChangeFileExt(lName, '') +'_protocol';
  lName := StringReplace(lName, '-', '_', [rfReplaceAll]);
  out_unit := TStringList.Create;
  g := TGenerator.Create(AFile);
  g.Generate(lname, out_unit, True);
  out_unit.SaveToFile(Outdir+lName+'.pas');
  out_unit.Free;
  g.Free;
end;

begin
  BaseDir:=IncludeTrailingPathDelimiter(GetEnvironmentVariable('WAYLAND_BASE'));
  if BaseDir = PathDelim then
    BaseDir:='/usr/local/';

  if not DirectoryExists(BaseDir) then
  begin
    WriteLn('Wayland path not found: ', BaseDir+'wayland/');
    WriteLn('use "WAYLAND_BASE={path} ', ExtractFileName(ParamStr(0)),'" to set the base directory that contains:');
    WriteLn('  wayland/');
    WriteLn('  wayland-protocols/');
    Halt(1);
  end;

  Createbinding(BaseDir+'wayland/wayland.xml', 'waylandpkg/');

  List := TStringList.Create;
  GatherProtocols(BaseDir+'wayland-protocols/stable/');
  for Protocol in list do
    Createbinding(Protocol, 'waylandstablepkg/');
  list.Clear;
  GatherProtocols(BaseDir+'wayland-protocols/unstable/');
  for Protocol in list do
    Createbinding(Protocol, 'waylandunstablepkg/');
  List.free;


end.

