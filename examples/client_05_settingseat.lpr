program client_05_settingseat;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cmem, cthreads,  // cmem must be first or not used
  {$ENDIF}
  Classes, sysutils,
  wayland_protocol, wayland_client_core, xdg_shell_protocol, wayland_util
  { you can add units after this };

type

  { TWaylandClient }

  TWaylandClient = class(IWlRegistryListener, IXdgWmBaseListener, IXdgToplevelListener,
                                              IXdgSurfaceListener, IWlCallbackListener,
                                              IWlSeatListener, IWlPointerListener)
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
    FLastFrame: Integer;
    FOffset: Double;
    FSeat: TWlSeat;
    FMouse: TWlPointer;
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
    //IWlCallbackListener
    procedure wl_callback_done(AWlCallback: TWlCallback; ACallbackData: DWord);
    //IWlSeatListener
    procedure wl_seat_capabilities(AWlSeat: TWlSeat; ACapabilities: DWord);
    procedure wl_seat_name(AWlSeat: TWlSeat; AName: String);
    //IWlPointerListener
    procedure wl_pointer_enter(AWlPointer: TWlPointer; ASerial: DWord; ASurface: TWlSurface; ASurfaceX: Twl_fixed{24.8}; ASurfaceY: Twl_fixed{24.8});
    procedure wl_pointer_leave(AWlPointer: TWlPointer; ASerial: DWord; ASurface: TWlSurface);
    procedure wl_pointer_motion(AWlPointer: TWlPointer; ATime: DWord; ASurfaceX: Twl_fixed{24.8}; ASurfaceY: Twl_fixed{24.8});
    procedure wl_pointer_button(AWlPointer: TWlPointer; ASerial: DWord; ATime: DWord; AButton: DWord; AState: DWord);
    procedure wl_pointer_axis(AWlPointer: TWlPointer; ATime: DWord; AAxis: DWord; AValue: Twl_fixed{24.8});
    procedure wl_pointer_frame(AWlPointer: TWlPointer); {since: 5}
    procedure wl_pointer_axis_source(AWlPointer: TWlPointer; AAxisSource: DWord); {since: 5}
    procedure wl_pointer_axis_stop(AWlPointer: TWlPointer; ATime: DWord; AAxis: DWord); {since: 5}
    procedure wl_pointer_axis_discrete(AWlPointer: TWlPointer; AAxis: DWord; ADiscrete: LongInt); {since: 5}

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
  end
  // wl_seat
  else if AInterface = wl_seat_interface.name then
  begin
    FSeat := TWlSeat.Create(AWlRegistry.Bind(AName, @wl_seat_interface, Aversion), True);
    FSeat.AddListener(Self);
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
  Writeln('Toplevel Close');
end;

procedure TWaylandClient.xdg_toplevel_configure_bounds(
  AXdgToplevel: TXdgToplevel; AWidth: LongInt; AHeight: LongInt);
begin
  WriteLn(Format('Configured toplevel size: %d:%d', [AWidth, AHeight]));
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

procedure TWaylandClient.wl_callback_done(AWlCallback: TWlCallback;  ACallbackData: DWord);
var
  lTime: DWord absolute ACallbackData;
  lElapsed: Integer;
  lBuffer: TWlBuffer;
begin
  AWlCallback.Destroy;
  with FSurface.Frame() do
    AddListener(Self);

  if FLastFrame <> 0 then
  begin
    lElapsed := lTime - FLastFrame;
    FOffset := FOffset + lElapsed / 1000 * 24;
  end;

  lBuffer := DrawFrame;
  if Assigned(lBuffer) then
  begin
    FSurface.Attach(lBuffer, 0, 0);
    FSurface.DamageBuffer(0,0, MaxInt, MaxInt);
    FSurface.Commit;
    lBuffer.Free;
  end;

  FLastFrame:=lTime;

end;

procedure TWaylandClient.wl_seat_capabilities(AWlSeat: TWlSeat;
  ACapabilities: DWord);
begin
  WriteLn(Format('Seat caps called. Caps := : %s', [BinStr(ACapabilities, 8{32 possible})] ));
  WriteLn('WL_SEAT_CAPABILITY_POINTER = ', WL_SEAT_CAPABILITY_POINTER and ACapabilities <> 0);
  WriteLn('WL_SEAT_CAPABILITY_KEYBOARD = ', WL_SEAT_CAPABILITY_KEYBOARD and ACapabilities <> 0);
  WriteLn('WL_SEAT_CAPABILITY_TOUCH = ', WL_SEAT_CAPABILITY_TOUCH and ACapabilities <> 0);

  if WL_SEAT_CAPABILITY_POINTER and ACapabilities <> 0 then
  begin
    FMouse:= AWlSeat.GetPointer();
    FMouse.AddListener(Self);
  end;


end;

procedure TWaylandClient.wl_seat_name(AWlSeat: TWlSeat; AName: String);
begin
  WriteLn(Format('Seat called. Name: %s', [AName] ));
  //AWlSeat.;
end;

procedure TWaylandClient.wl_pointer_enter(AWlPointer: TWlPointer;
  ASerial: DWord; ASurface: TWlSurface; ASurfaceX: Twl_fixed;
  ASurfaceY: Twl_fixed);
begin
  WriteLn(Format('Pointer Enter %d:%d', [ASurfaceX.AsInteger, ASurfaceY.AsInteger]));
end;

procedure TWaylandClient.wl_pointer_leave(AWlPointer: TWlPointer;
  ASerial: DWord; ASurface: TWlSurface);
begin
  WriteLn(Format('Pointer Leave', []));

end;

procedure TWaylandClient.wl_pointer_motion(AWlPointer: TWlPointer;
  ATime: DWord; ASurfaceX: Twl_fixed; ASurfaceY: Twl_fixed);
begin
  WriteLn(Format('Pointer motion %d:%d', [ASurfaceX.AsInteger, ASurfaceY.AsInteger]));
end;

procedure TWaylandClient.wl_pointer_button(AWlPointer: TWlPointer;
  ASerial: DWord; ATime: DWord; AButton: DWord; AState: DWord);
begin
  WriteLn(Format('Pointer Button: %d, State: %d', [AButton, AState]));
end;

procedure TWaylandClient.wl_pointer_axis(AWlPointer: TWlPointer; ATime: DWord;
  AAxis: DWord; AValue: Twl_fixed);
begin
  WriteLn(Format('Pointer Axis: %d,  Value: %d, Time: %d ', [AAxis, AValue.AsInteger, ATime]));
end;

procedure TWaylandClient.wl_pointer_frame(AWlPointer: TWlPointer);
begin
  WriteLn(Format('Pointer Frame', []));
end;

procedure TWaylandClient.wl_pointer_axis_source(AWlPointer: TWlPointer;
  AAxisSource: DWord);
begin
  WriteLn(Format('Pointer Axis Source %d', [AAxisSource]));
end;

procedure TWaylandClient.wl_pointer_axis_stop(AWlPointer: TWlPointer;
  ATime: DWord; AAxis: DWord);
begin
  WriteLn(Format('Pointer Axis Stop %d, Time: %d', [AAxis, ATime]));
end;

procedure TWaylandClient.wl_pointer_axis_discrete(AWlPointer: TWlPointer;
  AAxis: DWord; ADiscrete: LongInt);
begin
  WriteLn(Format('Pointer Axis discrete %d, Discrete: %d', [AAxis, ADiscrete]));
end;

function TWaylandClient.DrawFrame: TWlBuffer;
var
  lWidth, lHeight, lStride, lSize, y, x: Integer;
  lShmPool: TWLShmPool;
  lData: PLongWord;
  lOffset: Int64;
begin
  lWidth := 400;
  lHeight := 400;

  lStride := lWidth * 4;
  lSize := lStride * lHeight;

  lShmPool := TWLSHMBase(FShm).CreatePool(lSize) as TWlShmPool;
  Result := lShmPool.CreateBuffer(0, lWidth, lHeight, lStride, WL_SHM_FORMAT_XRGB8888);

  lData := PLongWord(lShmPool.Data(0));

  lOffset := Trunc(FOffset);

  for y := 0 to lHeight -1 do { 2d loop } for x := 0 to lWidth -1 do
  begin
    if ((x + loffset) div 50 + (y + loffset) div 50) mod 2 = 0 then

          lData[y * lWidth + x] := $FF834555 // Set pixel color
        else
          lData[y * lWidth + x] := $FFEEEEEE;
  end;

  lData := nil;

  lShmPool.Free;
end;

constructor TWaylandClient.Create;
var
  FFrameCallback: TWlCallback;
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

    FFrameCallback := FSurface.Frame();
    FFrameCallback.AddListener(Self);
  end;
end;

procedure TWaylandClient.Run;
begin
  while Assigned(FDisplay) and (FDisplay.Dispatch <> -1) do
  begin
    if FPingCount >= 1000 then
      Break;
  end;
end;

destructor TWaylandClient.Destroy;
begin
  FreeAndNil(FMouse);
  FreeAndNil(FSeat);
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
  WriteLn('Quitting');
end.

