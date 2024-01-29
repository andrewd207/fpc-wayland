program client_03_xdg;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cmem, cthreads,  // cmem must be first or not used
  {$ENDIF}
  Classes, sysutils,
  wayland_protocol, wayland_client_core, xdg_shell_protocol, wayland_util,
  BaseUnix
  { you can add units after this };

type

  { TWaylandClient }

  TWaylandClient = class(IWlRegistryListener, IXdgWmBaseListener, IXdgToplevelListener,
                                              IXdgSurfaceListener)
  private
    FDisplay: TWLDisplay;
    FRegistry: TWlRegistry;
    FCompositor: TWlCompositor;
    FxdgWM: TXdgWmBase;
    FShm: TWlShm;
    FSurface: TWlSurface;
    FxdgSurface: TXdgSurface;
    FxdgToplevel: TXdgToplevel;
    FPingCount: Integer;
    // IWlRegistryListener
    procedure wl_registry_global(AWlRegistry: TWlRegistry; AName: DWord; AInterface: String; AVersion: DWord);
    procedure wl_registry_global_remove(AWlRegistry: TWlRegistry; AName: DWord);
    // IXdgWmBaseListener
    procedure xdg_wm_base_ping(AXdgWmBase: TXdgWmBase; ASerial: DWord);
    // IXdgToplevelListener
    procedure xdg_toplevel_configure(AXdgToplevel: TXdgToplevel; AWidth: LongInt; AHeight: LongInt; AStates: Pwl_array);
    procedure xdg_toplevel_close(AXdgToplevel: TXdgToplevel);
    procedure xdg_toplevel_configure_bounds(AXdgToplevel: TXdgToplevel; AWidth: LongInt; AHeight: LongInt);
    // IXdgSurfaceListener
    procedure xdg_surface_configure(AXdgSurface: TXdgSurface; ASerial: DWord);

    function DrawFrame: TWlBuffer;
  public
    constructor Create;
    procedure Run;
    destructor Destroy; override;
  end;

{ TMyApp }

procedure TWaylandClient.wl_registry_global(AWlRegistry: TWlRegistry; AName: DWord; AInterface: String; AVersion: DWord);
begin
  WriteLn(Format('Register interface "%s" id(%d) version: %d', [AInterface, AName, AVersion]));

  // SHM interface
  if AInterface = wl_shm_interface.name  then
      FShm := TWlShm.Create(AWlRegistry.Bind(AName, @wl_shm_interface, wl_shm_interface.version), True)
  // Compositor
  else if AInterface = wl_compositor_interface.name then
      FCompositor := TWlCompositor.Create(AWlRegistry.Bind(AName, @wl_compositor_interface, wl_compositor_interface.version), True)
  // xgd_wm_base
  else if AInterface = xdg_wm_base_interface.name then
  begin
    FxdgWM := TXdgWmBase.Create(AWlRegistry.Bind(AName, @xdg_wm_base_interface, xdg_wm_base_interface.version), True);
    FxdgWM.AddListener(Self);
  end;



end;

procedure TWaylandClient.wl_registry_global_remove(AWlRegistry: TWlRegistry;
  AName: DWord);
begin
  WriteLn(Format('UN-register interface id(%d)', [AName]));
end;

procedure TWaylandClient.xdg_wm_base_ping(AXdgWmBase: TXdgWmBase; ASerial: DWord);
begin
  AXdgWmBase.Pong(ASerial);
  Inc(FPingCount);
  WriteLn('Ping: ', FPingCount);
end;

procedure TWaylandClient.xdg_toplevel_configure(AXdgToplevel: TXdgToplevel;
  AWidth: LongInt; AHeight: LongInt; AStates: Pwl_array);
begin

end;

procedure TWaylandClient.xdg_toplevel_close(AXdgToplevel: TXdgToplevel);
begin

end;

procedure TWaylandClient.xdg_toplevel_configure_bounds(
  AXdgToplevel: TXdgToplevel; AWidth: LongInt; AHeight: LongInt);
begin

end;

procedure TWaylandClient.xdg_surface_configure(AXdgSurface: TXdgSurface;
  ASerial: DWord);
var
  lBuffer: TWlBuffer;
begin
  AXdgSurface.AckConfigure(Aserial);
  lBuffer := DrawFrame;
  if Assigned(lBuffer) then
  begin
    FSurface.Attach(lBuffer, 0, 0);
    FSurface.Commit;
    lBuffer.Free;
  end;
end;

function TWaylandClient.DrawFrame: TWlBuffer;
var
  lWidth, lHeight, lStride, lSize, lFd, y, x: Integer;
  lShmPool: TWLShmPool;
  lData: PLongWord;
begin
  lWidth := 400;
  lHeight := 400;

  lStride := lWidth * 4;
  lSize := lStride * lHeight;

  lShmPool := TWLSHMBase(FShm).CreatePool(lSize) as TWlShmPool;
  Result := lShmPool.CreateBuffer(0, lWidth, lHeight, lStride, WL_SHM_FORMAT_XRGB8888);

  lData := PLongWord(lShmPool.Data(0));

  for y := 0 to lHeight -1 do { 2d loop } for x := 0 to lWidth -1 do
  begin
    if (x div 50 + y div 50) mod 2 = 0 then
      lData[y * lWidth + x] := $FF834555 // Set pixel color
    else
      lData[y * lWidth + x] := $FFEEEEEE;
  end;

  lData := nil;

  lShmPool.Free;
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
  if Assigned(FCompositor) then
  begin
    FSurface := FCompositor.CreateSurface();
    WriteLn('Surface creation successful = ', Assigned(FSurface));
  end;

  if Assigned(FSurface) and Assigned(FxdgWM) then
  begin
    FxdgSurface := FxdgWM.GetXdgSurface(FSurface);
    WriteLn('XDG_Surface creation successful = ', Assigned(FxdgSurface));
  end;

  if Assigned(FxdgSurface) then
  begin
    FxdgSurface.AddListener(Self);
    FxdgToplevel := FxdgSurface.GetToplevel();
    WriteLn('XDG_Toplevel creation successful = ', Assigned(FxdgToplevel));
  end;

  if Assigned(FxdgToplevel) then
  begin
    FxdgToplevel.SetTitle('Example Client');
    FSurface.Commit;
    WriteLn('Commit');
  end;
end;

procedure TWaylandClient.Run;
begin
  while Assigned(FDisplay) and (FDisplay.Dispatch <> -1) do
  begin
    if FPingCount >= 100 then
      Break;
  end;
end;

destructor TWaylandClient.Destroy;
begin
  FreeAndNil(FxdgToplevel);
  FreeAndNil(FxdgSurface);
  FreeAndNil(FSurface);
  FreeAndNil(FCompositor);
  FreeAndNil(FShm);
  FreeAndNil(FRegistry);
  FreeAndNil(FDisplay);
  inherited;
end;

begin
  with TWaylandClient.Create do
  begin
    Run;
    Free;
  end;
end.

