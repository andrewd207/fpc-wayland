program waylandtest;

{$mode objfpc}{$H+}
{$interfaces corba}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, wayland_client, wayland_client_core, wayland_protocol;

var
  display: TWlDisplay;

begin
  display := TWlDisplay(TWlDisplay.Connect(''));
  if display = nil then
  begin
    WriteLn('Can''t connect to display');
    Exit;
  end;
  WriteLn('Connected to display');
  display.Disconnect;

  WriteLn('disconnected from display');
end.
