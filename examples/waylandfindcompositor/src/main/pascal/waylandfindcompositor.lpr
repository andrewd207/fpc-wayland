program waylandfindcompositor;

{$mode objfpc}{$H+}
{$interfaces corba}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, sysutils, wayland_client, wayland_client_core, wayland_util, wayland_protocol, ctypes;

type

  { TRegistryHandler }

  TRegistryHandler = class(TObject, IWlRegistryListener)
    procedure wl_registry_global(AWlRegistry: TWlRegistry; AName: DWord; AInterface: String; AVersion: DWord);
    procedure wl_registry_global_remove(AWlRegistry: TWlRegistry; AName: DWord);
  end;

var
  display: TWlDisplay;
  registry: TWlRegistry;
  handler: TRegistryHandler;
  compositor: TWlCompositor = nil;

procedure TRegistryHandler.wl_registry_global(AWlRegistry: TWlRegistry;
  AName: DWord; AInterface: String; AVersion: DWord);
begin
  WriteLn(Format('Got a registry event for %s id %d', [AInterface, AName]));
  if AInterface = 'wl_compositor' then
    compositor := TWlCompositor.Create(AWlRegistry.Bind(AName, @wl_compositor_interface, 1));
end;

procedure TRegistryHandler.wl_registry_global_remove(AWlRegistry: TWlRegistry; AName: DWord);
begin
  WriteLn(Format('Got a registry losing event for %d', [AName]));
end;

begin
  display := TWlDisplay(TWlDisplay.Connect(''));
  if display = nil then
  begin
    WriteLn('Can''t connect to display');
    Halt(1);
  end;
  WriteLn('Connected to display');

  handler := TRegistryHandler.Create;
  registry := display.GetRegistry;
  registry.AddListener(handler);

  display.Dispatch;
  display.Roundtrip;

  if compositor = nil then
  begin
    WriteLn('Can''t find compositor');
    Halt(1);
  end;

  WriteLn('Found compositor');

  display.Disconnect;
  handler.Free;

  WriteLn('disconnected from display');
end.
