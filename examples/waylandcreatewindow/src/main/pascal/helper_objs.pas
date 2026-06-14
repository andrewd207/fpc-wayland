unit helper_objs;

{$mode objfpc}{$H+}
{$interfaces corba}

interface

uses
  Classes, SysUtils, ctypes, wayland_protocol, wayland_shared_buffer,
  relative_pointer_unstable_v1_protocol;

type

  { TDisplay }

  TDisplay = class(TObject, IWlRegistryListener, IWlShmListener, IWlSeatListener)
    FDisplay: TWlDisplay;
    FRegistry: TWlRegistry;
    FCompositor: TWlCompositor;
    FShell: TWlShell;
    FShm: TWlShm;
    FSeat: TWlSeat;
    FRelativePointerManager: TWpRelativePointerManagerV1;
    FFormats: LongWord;
    procedure wl_registry_global(AWlRegistry: TWlRegistry; AName: DWord; AInterface: String; AVersion: DWord);
    procedure wl_registry_global_remove(AWlRegistry: TWlRegistry; AName: DWord);
    procedure wl_shm_format(AWlShm: TWlShm; AFormat: DWord);
    procedure wl_seat_capabilities(AWlSeat: TWlSeat; ACapabilities: DWord);
    procedure wl_seat_name(AWlSeat: TWlSeat; AName: String);
  public
    constructor Create;
    destructor Destroy; override;
  end;

  { TBuffer }

  TBuffer = class(TObject, IWlBufferListener)
    FBuffer: TWlBuffer;
    FData: Pointer; {shm}
    FBusy: Boolean;
    procedure wl_buffer_release(AWlBuffer: TWlBuffer);
    destructor Destroy; override;
  end;

  { TWindow }

  TWindow = class(TObject, IWlShellSurfaceListener, IWlCallbackListener, IWlPointerListener, IWpRelativePointerV1Listener)
    FDisplay: TDisplay;
    FWidth, FHeight: Integer;
    FSurface: TWlSurface;
    FShellSurface: TWlShellSurface;
    FBuffers: Array[0..1] of TBuffer;
    FPrevBuffer: TBuffer;
    FCallback: TWlCallback;
    FPointer: TWlPointer;
    FRelativePointer: TWpRelativePointerV1;

    procedure wl_shell_surface_ping(AWlShellSurface: TWlShellSurface; ASerial: DWord);
    procedure wl_shell_surface_configure(AWlShellSurface: TWlShellSurface; AEdges: DWord; AWidth: LongInt; AHeight: LongInt);
    procedure wl_shell_surface_popup_done(AWlShellSurface: TWlShellSurface);
    procedure wl_callback_done(AWlCallback: TWlCallback; ACallbackData: DWord); // redraw
    procedure wl_pointer_enter(AWlPointer: TWlPointer; ASerial: DWord; ASurface: TWlSurface; ASurfaceX: Longint; ASurfaceY: Longint);
    procedure wl_pointer_leave(AWlPointer: TWlPointer; ASerial: DWord; ASurface: TWlSurface);
    procedure wl_pointer_motion(AWlPointer: TWlPointer; ATime: DWord; ASurfaceX: Longint; ASurfaceY: Longint);
    procedure wl_pointer_button(AWlPointer: TWlPointer; ASerial: DWord; ATime: DWord; AButton: DWord; AState: DWord);
    procedure wl_pointer_axis(AWlPointer: TWlPointer; ATime: DWord; AAxis: DWord; AValue: Longint);
    procedure wl_pointer_frame(AWlPointer: TWlPointer);
    procedure wl_pointer_axis_source(AWlPointer: TWlPointer; AAxisSource: DWord);
    procedure wl_pointer_axis_stop(AWlPointer: TWlPointer; ATime: DWord; AAxis: DWord);
    procedure wl_pointer_axis_discrete(AWlPointer: TWlPointer; AAxis: DWord; ADiscrete: LongInt);
    procedure wl_pointer_axis_value120(AWlPointer: TWlPointer; AAxis: DWord; AValue120: LongInt);
    procedure wl_pointer_axis_relative_direction(AWlPointer: TWlPointer; AAxis: DWord; ADirection: DWord);
    procedure wp_relative_pointer_v1_relative_motion(AZwpRelativePointerV1: TWpRelativePointerV1; AUtimeHi: DWord; AUtimeLo: DWord; ADx: Longint; ADy: Longint; ADxUnaccel: Longint; ADyUnaccel: Longint);
  public
    constructor Create(ADisplay: TDisplay; AWidth, AHeight: Integer);
    destructor  Destroy; override;
    function    NextBuffer: TBuffer;
  end;


implementation

{ TDisplay }

procedure TDisplay.wl_registry_global(AWlRegistry: TWlRegistry; AName: DWord;
  AInterface: String; AVersion: DWord);
begin
  case AInterface of
    'wl_compositor': FCompositor := TWlCompositor.BindFrom(AWlRegistry, AName, 1);
    'wl_shell'     : FShell := TWlShell.BindFrom(AWlRegistry, AName, 1);
    'wl_shm'       :
      begin
        FShm := TWlShm.BindFrom(AWlRegistry, AName, 1);
        FShm.AddListener(Self);
      end;
    'wl_seat':
      begin
        FSeat := TWlSeat.BindFrom(AWlRegistry, AName, 1);
        FSeat.AddListener(Self);
      end;
    'zwp_relative_pointer_manager_v1':
        FRelativePointerManager := TWpRelativePointerManagerV1.BindFrom(AWlRegistry, AName, 1);
  else
    WriteLn(AInterface);
  end;
end;

procedure TDisplay.wl_registry_global_remove(AWlRegistry: TWlRegistry; AName: DWord);
begin

end;

procedure TDisplay.wl_shm_format(AWlShm: TWlShm; AFormat: DWord);
begin
  FFormats := FFormats or (1 shl AFormat);
end;

procedure TDisplay.wl_seat_capabilities(AWlSeat: TWlSeat; ACapabilities: DWord);
begin

end;

procedure TDisplay.wl_seat_name(AWlSeat: TWlSeat; AName: String);
begin

end;

constructor TDisplay.Create;
begin
  FDisplay := TWlDisplay(TWlDisplay.Connect(''));
  FRegistry := FDisplay.GetRegistry;
  FRegistry.AddListener(Self);
  FDisplay.Roundtrip;

  FDisplay.Roundtrip;

  if FFormats and (1 shl WL_SHM_FORMAT_XRGB8888) = 0 then ;

  FDisplay.GetFd;
end;

destructor TDisplay.Destroy;
begin
  FShm.Free;
  FShell.Free;
  FCompositor.Free;
  FSeat.Free;
  FRelativePointerManager.Free;
  FRegistry.Free;
  if Assigned(FDisplay) then
  begin
    FDisplay.Disconnect;
    FDisplay.Free;
  end;
  inherited Destroy;
end;

{ TWindow }

procedure TWindow.wl_shell_surface_ping(AWlShellSurface: TWlShellSurface; ASerial: DWord);
begin
  AWlShellSurface.Pong(ASerial);
end;

procedure TWindow.wl_shell_surface_configure(AWlShellSurface: TWlShellSurface;
  AEdges: DWord; AWidth: LongInt; AHeight: LongInt);
begin

end;

procedure TWindow.wl_shell_surface_popup_done(AWlShellSurface: TWlShellSurface);
begin

end;

procedure TWindow.wl_callback_done(AWlCallback: TWlCallback; ACallbackData: DWord);
var
  buffer: TBuffer;
begin
  buffer := NextBuffer;

  // todo paint

  FSurface.Attach(buffer.FBuffer, 0, 0);
  FSurface.Damage(20, 20, FWidth - 40, FHeight - 40);

  if Assigned(AWlCallback) then
    AWlCallback.Free;

  FCallback := FSurface.Frame;
  FCallback.AddListener(Self);

  FSurface.Commit;
  buffer.FBusy := True;
end;

procedure TWindow.wl_pointer_enter(AWlPointer: TWlPointer; ASerial: DWord;
  ASurface: TWlSurface; ASurfaceX: Longint; ASurfaceY: Longint);
begin
  WriteLn(Format('Pointer Enter %d:%d', [ASurfaceX, ASurfaceY]));
end;

procedure TWindow.wl_pointer_leave(AWlPointer: TWlPointer; ASerial: DWord; ASurface: TWlSurface);
begin
  WriteLn('Pointer Leave');
end;

procedure TWindow.wl_pointer_motion(AWlPointer: TWlPointer; ATime: DWord;
  ASurfaceX: Longint; ASurfaceY: Longint);
begin

end;

procedure TWindow.wl_pointer_button(AWlPointer: TWlPointer; ASerial: DWord;
  ATime: DWord; AButton: DWord; AState: DWord);
begin
  WriteLn(Format('pointer button %d state %d', [AButton, AState]));
end;

procedure TWindow.wl_pointer_axis(AWlPointer: TWlPointer; ATime: DWord; AAxis: DWord; AValue: Longint);
begin

end;

procedure TWindow.wl_pointer_frame(AWlPointer: TWlPointer);
begin

end;

procedure TWindow.wl_pointer_axis_source(AWlPointer: TWlPointer; AAxisSource: DWord);
begin

end;

procedure TWindow.wl_pointer_axis_stop(AWlPointer: TWlPointer; ATime: DWord; AAxis: DWord);
begin

end;

procedure TWindow.wl_pointer_axis_discrete(AWlPointer: TWlPointer; AAxis: DWord; ADiscrete: LongInt);
begin

end;

procedure TWindow.wl_pointer_axis_value120(AWlPointer: TWlPointer; AAxis: DWord; AValue120: LongInt);
begin

end;

procedure TWindow.wl_pointer_axis_relative_direction(AWlPointer: TWlPointer; AAxis: DWord; ADirection: DWord);
begin

end;

procedure TWindow.wp_relative_pointer_v1_relative_motion(
  AZwpRelativePointerV1: TWpRelativePointerV1; AUtimeHi: DWord; AUtimeLo: DWord;
  ADx: Longint; ADy: Longint; ADxUnaccel: Longint; ADyUnaccel: Longint);
begin
  WriteLn(Format('Relative pointer move %d:%d', [ADx, ADy]));
end;

constructor TWindow.Create(ADisplay: TDisplay; AWidth, AHeight: Integer);
begin
  FDisplay := ADisplay;
  FWidth := AWidth;
  FHeight := AHeight;
  FSurface := FDisplay.FCompositor.CreateSurface;
  FShellSurface := FDisplay.FShell.GetShellSurface(FSurface);

  if Assigned(FShellSurface) then
    FShellSurface.AddListener(Self);

  if Assigned(FDisplay.FSeat) then
  begin
    FPointer := FDisplay.FSeat.GetPointer;
    if Assigned(FPointer) then
      FPointer.AddListener(Self);
  end;

  if Assigned(FDisplay.FRelativePointerManager) and Assigned(FPointer) then
  begin
    FRelativePointer := FDisplay.FRelativePointerManager.GetRelativePointer(FPointer);
    FRelativePointer.AddListener(Self);
  end;

  FShellSurface.SetTitle('Hello World');
  FShellSurface.SetToplevel;

  FBuffers[0] := TBuffer.Create;
  FBuffers[1] := TBuffer.Create;
end;

destructor TWindow.Destroy;
begin
  FCallback.Free;
  FBuffers[0].Free;
  FBuffers[1].Free;

  FShellSurface.Free;
  FSurface.Free;
  inherited Destroy;
end;

function TWindow.NextBuffer: TBuffer;
var
  lFd: cint;
begin
  Result := nil;
  if not FBuffers[0].FBusy then
    Result := FBuffers[0]
  else if not FBuffers[1].FBusy then
    Result := FBuffers[1]
  else
    Exit;

  if not Assigned(Result.FBuffer) then
  begin
    Result.FBuffer := Create_shm_buffer(FDisplay.FShm, FWidth, FHeight, WL_SHM_FORMAT_XRGB8888, Result.FData, lFd);
    Result.FBuffer.AddListener(Result);
    FillChar(Result.FData^, FWidth * FHeight * 4, $FF);
  end;
end;

{ TBuffer }

procedure TBuffer.wl_buffer_release(AWlBuffer: TWlBuffer);
begin
  FBusy := False;
end;

destructor TBuffer.Destroy;
begin
  FBuffer.Free;
  inherited Destroy;
end;

end.
