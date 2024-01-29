program client_02_globalobjects;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Classes, sysutils,
  wayland_protocol, wayland_client_core, xdg_shell_protocol
  { you can add units after this };

type

  { TWaylandClient }

  TWaylandClient = class(IWlRegistryListener)
  private
    FDisplay: TWLDisplay;
    FRegistry: TWlRegistry;
    procedure wl_registry_global(AWlRegistry: TWlRegistry; AName: DWord; AInterface: String; AVersion: DWord);
    procedure wl_registry_global_remove(AWlRegistry: TWlRegistry; AName: DWord);
  public
    constructor Create;
    destructor Destroy; override;
  end;

{ TMyApp }

procedure TWaylandClient.wl_registry_global(AWlRegistry: TWlRegistry; AName: DWord; AInterface: String; AVersion: DWord);
begin
  WriteLn(Format('Register interface "%s" id(%d) version: %d', [AInterface, AName, AVersion]));
end;

procedure TWaylandClient.wl_registry_global_remove(AWlRegistry: TWlRegistry;
  AName: DWord);
begin
  WriteLn(Format('UN-register interface id(%d) version: %d', [AName]));
end;

constructor TWaylandClient.Create;
begin
  FDisplay := TWlDisplay.Connect('') as TWLDisplay;
  if not Assigned(FDisplay) then
  begin
    WriteLn('Failed to open display');
    Exit;
  end;

  FRegistry := FDisplay.GetRegistry();
  FRegistry.AddListener(Self);
  FDisplay.Roundtrip;
end;

destructor TWaylandClient.Destroy;
begin
  FreeAndNil(FRegistry);
  FreeAndNil(FDisplay);
  inherited;
end;

begin
  with TWaylandClient.Create do
    Free;
end.

