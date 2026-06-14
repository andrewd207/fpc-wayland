program waylandcreatewindow;

{$mode objfpc}{$H+}
{$interfaces corba}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, sysutils, wayland_client, wayland_client_core, wayland_util,
  wayland_protocol, ctypes, wayland_shared_buffer, helper_objs, BaseUnix;

var
  display: TDisplay;
  window: TWindow;

  running: Boolean;
  ret: cint;

procedure DoSig(sig: cint); cdecl;
begin
  Running := False;
end;


begin
  running := True;
  FpSignal(SIGINT, @DoSig);
  display := TDisplay.Create;
  window := TWindow.Create(display, 300, 200);

  window.FSurface.Damage(0, 0, window.FWidth, window.FHeight);

  window.wl_callback_done(nil, 0);

  while running and (ret <> -1) do
    ret := display.FDisplay.Dispatch;

  window.Free;
  display.Free;
end.
