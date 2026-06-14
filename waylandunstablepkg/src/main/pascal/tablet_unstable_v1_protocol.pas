unit tablet_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_tablet_manager_v1 = Pointer;
  Pzwp_tablet_seat_v1 = Pointer;
  Pzwp_tablet_tool_v1 = Pointer;
  Pzwp_tablet_v1 = Pointer;
  Pzwp_tablet_manager_v1_listener = ^Tzwp_tablet_manager_v1_listener;
  Tzwp_tablet_manager_v1_listener = record
  end;

  Pzwp_tablet_seat_v1_listener = ^Tzwp_tablet_seat_v1_listener;
  Tzwp_tablet_seat_v1_listener = record
    tablet_added : procedure(data: Pointer; AZwpTabletSeatV1: Pzwp_tablet_seat_v1; AId: Pzwp_tablet_v1); cdecl;
    tool_added : procedure(data: Pointer; AZwpTabletSeatV1: Pzwp_tablet_seat_v1; AId: Pzwp_tablet_tool_v1); cdecl;
  end;

const
  ZWP_TABLET_TOOL_V1_TYPE_PEN = $140; // Pen
  ZWP_TABLET_TOOL_V1_TYPE_ERASER = $141; // Eraser
  ZWP_TABLET_TOOL_V1_TYPE_BRUSH = $142; // Brush
  ZWP_TABLET_TOOL_V1_TYPE_PENCIL = $143; // Pencil
  ZWP_TABLET_TOOL_V1_TYPE_AIRBRUSH = $144; // Airbrush
  ZWP_TABLET_TOOL_V1_TYPE_FINGER = $145; // Finger
  ZWP_TABLET_TOOL_V1_TYPE_MOUSE = $146; // Mouse
  ZWP_TABLET_TOOL_V1_TYPE_LENS = $147; // Lens
  ZWP_TABLET_TOOL_V1_CAPABILITY_TILT = 1; // Tilt axes
  ZWP_TABLET_TOOL_V1_CAPABILITY_PRESSURE = 2; // Pressure axis
  ZWP_TABLET_TOOL_V1_CAPABILITY_DISTANCE = 3; // Distance axis
  ZWP_TABLET_TOOL_V1_CAPABILITY_ROTATION = 4; // Z-rotation axis
  ZWP_TABLET_TOOL_V1_CAPABILITY_SLIDER = 5; // Slider axis
  ZWP_TABLET_TOOL_V1_CAPABILITY_WHEEL = 6; // Wheel axis
  ZWP_TABLET_TOOL_V1_BUTTON_STATE_RELEASED = 0; // button is not pressed
  ZWP_TABLET_TOOL_V1_BUTTON_STATE_PRESSED = 1; // button is pressed
  ZWP_TABLET_TOOL_V1_ERROR_ROLE = 0; // given wl_surface has another role

type
  Pzwp_tablet_tool_v1_listener = ^Tzwp_tablet_tool_v1_listener;
  Tzwp_tablet_tool_v1_listener = record
    type_ : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1; AToolType: DWord); cdecl;
    hardware_serial : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1; AHardwareSerialHi: DWord; AHardwareSerialLo: DWord); cdecl;
    hardware_id_wacom : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1; AHardwareIdHi: DWord; AHardwareIdLo: DWord); cdecl;
    capability : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1; ACapability: DWord); cdecl;
    done : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1); cdecl;
    removed : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1); cdecl;
    proximity_in : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1; ASerial: DWord; ATablet: Pzwp_tablet_v1; ASurface: Pwl_surface); cdecl;
    proximity_out : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1); cdecl;
    down : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1; ASerial: DWord); cdecl;
    up : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1); cdecl;
    motion : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1; AX: Longint{24.8}; AY: Longint{24.8}); cdecl;
    pressure : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1; APressure: DWord); cdecl;
    distance : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1; ADistance: DWord); cdecl;
    tilt : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1; ATiltX: LongInt; ATiltY: LongInt); cdecl;
    rotation : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1; ADegrees: LongInt); cdecl;
    slider : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1; APosition: LongInt); cdecl;
    wheel : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1; ADegrees: LongInt; AClicks: LongInt); cdecl;
    button : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1; ASerial: DWord; AButton: DWord; AState: DWord); cdecl;
    frame : procedure(data: Pointer; AZwpTabletToolV1: Pzwp_tablet_tool_v1; ATime: DWord); cdecl;
  end;

  Pzwp_tablet_v1_listener = ^Tzwp_tablet_v1_listener;
  Tzwp_tablet_v1_listener = record
    name : procedure(data: Pointer; AZwpTabletV1: Pzwp_tablet_v1; AName: Pchar); cdecl;
    id : procedure(data: Pointer; AZwpTabletV1: Pzwp_tablet_v1; AVid: DWord; APid: DWord); cdecl;
    path : procedure(data: Pointer; AZwpTabletV1: Pzwp_tablet_v1; APath: Pchar); cdecl;
    done : procedure(data: Pointer; AZwpTabletV1: Pzwp_tablet_v1); cdecl;
    removed : procedure(data: Pointer; AZwpTabletV1: Pzwp_tablet_v1); cdecl;
  end;



  TZwpTabletManagerV1 = class;
  TZwpTabletSeatV1 = class;
  TZwpTabletToolV1 = class;
  TZwpTabletV1 = class;


  IZwpTabletManagerV1Listener = interface
  ['IZwpTabletManagerV1Listener']
  end;

  IZwpTabletSeatV1Listener = interface
  ['IZwpTabletSeatV1Listener']
    procedure zwp_tablet_seat_v1_tablet_added(AZwpTabletSeatV1: TZwpTabletSeatV1; AId: TZwpTabletV1);
    procedure zwp_tablet_seat_v1_tool_added(AZwpTabletSeatV1: TZwpTabletSeatV1; AId: TZwpTabletToolV1);
  end;

  IZwpTabletToolV1Listener = interface
  ['IZwpTabletToolV1Listener']
    procedure zwp_tablet_tool_v1_type(AZwpTabletToolV1: TZwpTabletToolV1; AToolType: DWord);
    procedure zwp_tablet_tool_v1_hardware_serial(AZwpTabletToolV1: TZwpTabletToolV1; AHardwareSerialHi: DWord; AHardwareSerialLo: DWord);
    procedure zwp_tablet_tool_v1_hardware_id_wacom(AZwpTabletToolV1: TZwpTabletToolV1; AHardwareIdHi: DWord; AHardwareIdLo: DWord);
    procedure zwp_tablet_tool_v1_capability(AZwpTabletToolV1: TZwpTabletToolV1; ACapability: DWord);
    procedure zwp_tablet_tool_v1_done(AZwpTabletToolV1: TZwpTabletToolV1);
    procedure zwp_tablet_tool_v1_removed(AZwpTabletToolV1: TZwpTabletToolV1);
    procedure zwp_tablet_tool_v1_proximity_in(AZwpTabletToolV1: TZwpTabletToolV1; ASerial: DWord; ATablet: TZwpTabletV1; ASurface: TWlSurface);
    procedure zwp_tablet_tool_v1_proximity_out(AZwpTabletToolV1: TZwpTabletToolV1);
    procedure zwp_tablet_tool_v1_down(AZwpTabletToolV1: TZwpTabletToolV1; ASerial: DWord);
    procedure zwp_tablet_tool_v1_up(AZwpTabletToolV1: TZwpTabletToolV1);
    procedure zwp_tablet_tool_v1_motion(AZwpTabletToolV1: TZwpTabletToolV1; AX: Longint{24.8}; AY: Longint{24.8});
    procedure zwp_tablet_tool_v1_pressure(AZwpTabletToolV1: TZwpTabletToolV1; APressure: DWord);
    procedure zwp_tablet_tool_v1_distance(AZwpTabletToolV1: TZwpTabletToolV1; ADistance: DWord);
    procedure zwp_tablet_tool_v1_tilt(AZwpTabletToolV1: TZwpTabletToolV1; ATiltX: LongInt; ATiltY: LongInt);
    procedure zwp_tablet_tool_v1_rotation(AZwpTabletToolV1: TZwpTabletToolV1; ADegrees: LongInt);
    procedure zwp_tablet_tool_v1_slider(AZwpTabletToolV1: TZwpTabletToolV1; APosition: LongInt);
    procedure zwp_tablet_tool_v1_wheel(AZwpTabletToolV1: TZwpTabletToolV1; ADegrees: LongInt; AClicks: LongInt);
    procedure zwp_tablet_tool_v1_button(AZwpTabletToolV1: TZwpTabletToolV1; ASerial: DWord; AButton: DWord; AState: DWord);
    procedure zwp_tablet_tool_v1_frame(AZwpTabletToolV1: TZwpTabletToolV1; ATime: DWord);
  end;

  IZwpTabletV1Listener = interface
  ['IZwpTabletV1Listener']
    procedure zwp_tablet_v1_name(AZwpTabletV1: TZwpTabletV1; AName: String);
    procedure zwp_tablet_v1_id(AZwpTabletV1: TZwpTabletV1; AVid: DWord; APid: DWord);
    procedure zwp_tablet_v1_path(AZwpTabletV1: TZwpTabletV1; APath: String);
    procedure zwp_tablet_v1_done(AZwpTabletV1: TZwpTabletV1);
    procedure zwp_tablet_v1_removed(AZwpTabletV1: TZwpTabletV1);
  end;




  TZwpTabletManagerV1 = class(TWLProxyObject)
  private
    const _GET_TABLET_SEAT = 0;
    const _DESTROY = 1;
  public
    function GetTabletSeat(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TZwpTabletSeatV1}): TZwpTabletSeatV1;
    destructor Destroy; override;
    function AddListener(AIntf: IZwpTabletManagerV1Listener): LongInt;
  end;

  TZwpTabletSeatV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IZwpTabletSeatV1Listener): LongInt;
  end;

  TZwpTabletToolV1 = class(TWLProxyObject)
  private
    const _SET_CURSOR = 0;
    const _DESTROY = 1;
  public
    procedure SetCursor(ASerial: DWord; ASurface: TWlSurface; AHotspotX: LongInt; AHotspotY: LongInt);
    destructor Destroy; override;
    function AddListener(AIntf: IZwpTabletToolV1Listener): LongInt;
  end;

  TZwpTabletV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IZwpTabletV1Listener): LongInt;
  end;






var
  zwp_tablet_manager_v1_interface: Twl_interface;
  zwp_tablet_seat_v1_interface: Twl_interface;
  zwp_tablet_tool_v1_interface: Twl_interface;
  zwp_tablet_v1_interface: Twl_interface;



implementation

var
  vIntf_zwp_tablet_manager_v1_Listener: Tzwp_tablet_manager_v1_listener;
  vIntf_zwp_tablet_seat_v1_Listener: Tzwp_tablet_seat_v1_listener;
  vIntf_zwp_tablet_tool_v1_Listener: Tzwp_tablet_tool_v1_listener;
  vIntf_zwp_tablet_v1_Listener: Tzwp_tablet_v1_listener;



function TZwpTabletManagerV1.GetTabletSeat(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TZwpTabletSeatV1}): TZwpTabletSeatV1;
var
  tablet_seat: Pwl_proxy;
begin
  tablet_seat := wl_proxy_marshal_constructor(FProxy,
      _GET_TABLET_SEAT, @zwp_tablet_seat_v1_interface, nil, ASeat.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpTabletSeatV1;
  Result := TZwpTabletSeatV1(AProxyClass.Create(tablet_seat));
  if not AProxyClass.InheritsFrom(TZwpTabletSeatV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpTabletSeatV1]);
end;

destructor TZwpTabletManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpTabletManagerV1.AddListener(AIntf: IZwpTabletManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_tablet_manager_v1_Listener, @FUserDataRec);
end;
destructor TZwpTabletSeatV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpTabletSeatV1.AddListener(AIntf: IZwpTabletSeatV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_tablet_seat_v1_Listener, @FUserDataRec);
end;
procedure TZwpTabletToolV1.SetCursor(ASerial: DWord; ASurface: TWlSurface; AHotspotX: LongInt; AHotspotY: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_CURSOR, ASerial, ASurface.Proxy, AHotspotX, AHotspotY);
end;

destructor TZwpTabletToolV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpTabletToolV1.AddListener(AIntf: IZwpTabletToolV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_tablet_tool_v1_Listener, @FUserDataRec);
end;
destructor TZwpTabletV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpTabletV1.AddListener(AIntf: IZwpTabletV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_tablet_v1_Listener, @FUserDataRec);
end;




procedure zwp_tablet_seat_v1_tablet_added_Intf(AData: PWLUserData; Azwp_tablet_seat_v1: Pzwp_tablet_seat_v1; AId: Pzwp_tablet_v1); cdecl;
var
  AIntf: IZwpTabletSeatV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletSeatV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_seat_v1_tablet_added(TZwpTabletSeatV1(AData^.PascalObject),  TZwpTabletV1.Create(AId));
end;

procedure zwp_tablet_seat_v1_tool_added_Intf(AData: PWLUserData; Azwp_tablet_seat_v1: Pzwp_tablet_seat_v1; AId: Pzwp_tablet_tool_v1); cdecl;
var
  AIntf: IZwpTabletSeatV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletSeatV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_seat_v1_tool_added(TZwpTabletSeatV1(AData^.PascalObject),  TZwpTabletToolV1.Create(AId));
end;

procedure zwp_tablet_tool_v1_type_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1; AToolType: DWord); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_type(TZwpTabletToolV1(AData^.PascalObject), AToolType);
end;

procedure zwp_tablet_tool_v1_hardware_serial_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1; AHardwareSerialHi: DWord; AHardwareSerialLo: DWord); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_hardware_serial(TZwpTabletToolV1(AData^.PascalObject), AHardwareSerialHi, AHardwareSerialLo);
end;

procedure zwp_tablet_tool_v1_hardware_id_wacom_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1; AHardwareIdHi: DWord; AHardwareIdLo: DWord); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_hardware_id_wacom(TZwpTabletToolV1(AData^.PascalObject), AHardwareIdHi, AHardwareIdLo);
end;

procedure zwp_tablet_tool_v1_capability_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1; ACapability: DWord); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_capability(TZwpTabletToolV1(AData^.PascalObject), ACapability);
end;

procedure zwp_tablet_tool_v1_done_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_done(TZwpTabletToolV1(AData^.PascalObject));
end;

procedure zwp_tablet_tool_v1_removed_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_removed(TZwpTabletToolV1(AData^.PascalObject));
end;

procedure zwp_tablet_tool_v1_proximity_in_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1; ASerial: DWord; ATablet: Pzwp_tablet_v1; ASurface: Pwl_surface); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_proximity_in(TZwpTabletToolV1(AData^.PascalObject), ASerial,  TZwpTabletV1(TWLProxyObject.WLToObj(ATablet)),  TWlSurface(TWLProxyObject.WLToObj(ASurface)));
end;

procedure zwp_tablet_tool_v1_proximity_out_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_proximity_out(TZwpTabletToolV1(AData^.PascalObject));
end;

procedure zwp_tablet_tool_v1_down_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1; ASerial: DWord); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_down(TZwpTabletToolV1(AData^.PascalObject), ASerial);
end;

procedure zwp_tablet_tool_v1_up_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_up(TZwpTabletToolV1(AData^.PascalObject));
end;

procedure zwp_tablet_tool_v1_motion_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1; AX: Longint{24.8}; AY: Longint{24.8}); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_motion(TZwpTabletToolV1(AData^.PascalObject), AX, AY);
end;

procedure zwp_tablet_tool_v1_pressure_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1; APressure: DWord); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_pressure(TZwpTabletToolV1(AData^.PascalObject), APressure);
end;

procedure zwp_tablet_tool_v1_distance_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1; ADistance: DWord); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_distance(TZwpTabletToolV1(AData^.PascalObject), ADistance);
end;

procedure zwp_tablet_tool_v1_tilt_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1; ATiltX: LongInt; ATiltY: LongInt); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_tilt(TZwpTabletToolV1(AData^.PascalObject), ATiltX, ATiltY);
end;

procedure zwp_tablet_tool_v1_rotation_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1; ADegrees: LongInt); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_rotation(TZwpTabletToolV1(AData^.PascalObject), ADegrees);
end;

procedure zwp_tablet_tool_v1_slider_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1; APosition: LongInt); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_slider(TZwpTabletToolV1(AData^.PascalObject), APosition);
end;

procedure zwp_tablet_tool_v1_wheel_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1; ADegrees: LongInt; AClicks: LongInt); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_wheel(TZwpTabletToolV1(AData^.PascalObject), ADegrees, AClicks);
end;

procedure zwp_tablet_tool_v1_button_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1; ASerial: DWord; AButton: DWord; AState: DWord); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_button(TZwpTabletToolV1(AData^.PascalObject), ASerial, AButton, AState);
end;

procedure zwp_tablet_tool_v1_frame_Intf(AData: PWLUserData; Azwp_tablet_tool_v1: Pzwp_tablet_tool_v1; ATime: DWord); cdecl;
var
  AIntf: IZwpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v1_frame(TZwpTabletToolV1(AData^.PascalObject), ATime);
end;

procedure zwp_tablet_v1_name_Intf(AData: PWLUserData; Azwp_tablet_v1: Pzwp_tablet_v1; AName: Pchar); cdecl;
var
  AIntf: IZwpTabletV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_v1_name(TZwpTabletV1(AData^.PascalObject), AName);
end;

procedure zwp_tablet_v1_id_Intf(AData: PWLUserData; Azwp_tablet_v1: Pzwp_tablet_v1; AVid: DWord; APid: DWord); cdecl;
var
  AIntf: IZwpTabletV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_v1_id(TZwpTabletV1(AData^.PascalObject), AVid, APid);
end;

procedure zwp_tablet_v1_path_Intf(AData: PWLUserData; Azwp_tablet_v1: Pzwp_tablet_v1; APath: Pchar); cdecl;
var
  AIntf: IZwpTabletV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_v1_path(TZwpTabletV1(AData^.PascalObject), APath);
end;

procedure zwp_tablet_v1_done_Intf(AData: PWLUserData; Azwp_tablet_v1: Pzwp_tablet_v1); cdecl;
var
  AIntf: IZwpTabletV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_v1_done(TZwpTabletV1(AData^.PascalObject));
end;

procedure zwp_tablet_v1_removed_Intf(AData: PWLUserData; Azwp_tablet_v1: Pzwp_tablet_v1); cdecl;
var
  AIntf: IZwpTabletV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletV1Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_v1_removed(TZwpTabletV1(AData^.PascalObject));
end;



const
  pInterfaces: array[0..16] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@zwp_tablet_seat_v1_interface),
    (@wl_seat_interface),
    (nil),
    (@wl_surface_interface),
    (nil),
    (nil),
    (nil),
    (@zwp_tablet_v1_interface),
    (@wl_surface_interface)
  );

  zwp_tablet_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'get_tablet_seat'; signature: 'no'; types: @pInterfaces[8]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_tablet_seat_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_tablet_seat_v1_events: array[0..1] of Twl_message = (
    (name: 'tablet_added'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'tool_added'; signature: 'n'; types: @pInterfaces[0])
  );
  zwp_tablet_tool_v1_requests: array[0..1] of Twl_message = (
    (name: 'set_cursor'; signature: 'u?oii'; types: @pInterfaces[10]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_tablet_tool_v1_events: array[0..18] of Twl_message = (
    (name: 'type'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'hardware_serial'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'hardware_id_wacom'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'capability'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'removed'; signature: ''; types: @pInterfaces[0]),
    (name: 'proximity_in'; signature: 'uoo'; types: @pInterfaces[14]),
    (name: 'proximity_out'; signature: ''; types: @pInterfaces[0]),
    (name: 'down'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'up'; signature: ''; types: @pInterfaces[0]),
    (name: 'motion'; signature: 'ff'; types: @pInterfaces[0]),
    (name: 'pressure'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'distance'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'tilt'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'rotation'; signature: 'i'; types: @pInterfaces[0]),
    (name: 'slider'; signature: 'i'; types: @pInterfaces[0]),
    (name: 'wheel'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'button'; signature: 'uuu'; types: @pInterfaces[0]),
    (name: 'frame'; signature: 'u'; types: @pInterfaces[0])
  );
  zwp_tablet_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_tablet_v1_events: array[0..4] of Twl_message = (
    (name: 'name'; signature: 's'; types: @pInterfaces[0]),
    (name: 'id'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'path'; signature: 's'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'removed'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_tablet_seat_v1_Listener.tablet_added) := @zwp_tablet_seat_v1_tablet_added_Intf;
  Pointer(vIntf_zwp_tablet_seat_v1_Listener.tool_added) := @zwp_tablet_seat_v1_tool_added_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.type_) := @zwp_tablet_tool_v1_type_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.hardware_serial) := @zwp_tablet_tool_v1_hardware_serial_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.hardware_id_wacom) := @zwp_tablet_tool_v1_hardware_id_wacom_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.capability) := @zwp_tablet_tool_v1_capability_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.done) := @zwp_tablet_tool_v1_done_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.removed) := @zwp_tablet_tool_v1_removed_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.proximity_in) := @zwp_tablet_tool_v1_proximity_in_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.proximity_out) := @zwp_tablet_tool_v1_proximity_out_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.down) := @zwp_tablet_tool_v1_down_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.up) := @zwp_tablet_tool_v1_up_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.motion) := @zwp_tablet_tool_v1_motion_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.pressure) := @zwp_tablet_tool_v1_pressure_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.distance) := @zwp_tablet_tool_v1_distance_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.tilt) := @zwp_tablet_tool_v1_tilt_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.rotation) := @zwp_tablet_tool_v1_rotation_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.slider) := @zwp_tablet_tool_v1_slider_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.wheel) := @zwp_tablet_tool_v1_wheel_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.button) := @zwp_tablet_tool_v1_button_Intf;
  Pointer(vIntf_zwp_tablet_tool_v1_Listener.frame) := @zwp_tablet_tool_v1_frame_Intf;
  Pointer(vIntf_zwp_tablet_v1_Listener.name) := @zwp_tablet_v1_name_Intf;
  Pointer(vIntf_zwp_tablet_v1_Listener.id) := @zwp_tablet_v1_id_Intf;
  Pointer(vIntf_zwp_tablet_v1_Listener.path) := @zwp_tablet_v1_path_Intf;
  Pointer(vIntf_zwp_tablet_v1_Listener.done) := @zwp_tablet_v1_done_Intf;
  Pointer(vIntf_zwp_tablet_v1_Listener.removed) := @zwp_tablet_v1_removed_Intf;


  zwp_tablet_manager_v1_interface.name := 'zwp_tablet_manager_v1';
  zwp_tablet_manager_v1_interface.version := 1;
  zwp_tablet_manager_v1_interface.method_count := 2;
  zwp_tablet_manager_v1_interface.methods := @zwp_tablet_manager_v1_requests;
  zwp_tablet_manager_v1_interface.event_count := 0;
  zwp_tablet_manager_v1_interface.events := nil;

  zwp_tablet_seat_v1_interface.name := 'zwp_tablet_seat_v1';
  zwp_tablet_seat_v1_interface.version := 1;
  zwp_tablet_seat_v1_interface.method_count := 1;
  zwp_tablet_seat_v1_interface.methods := @zwp_tablet_seat_v1_requests;
  zwp_tablet_seat_v1_interface.event_count := 2;
  zwp_tablet_seat_v1_interface.events := @zwp_tablet_seat_v1_events;

  zwp_tablet_tool_v1_interface.name := 'zwp_tablet_tool_v1';
  zwp_tablet_tool_v1_interface.version := 1;
  zwp_tablet_tool_v1_interface.method_count := 2;
  zwp_tablet_tool_v1_interface.methods := @zwp_tablet_tool_v1_requests;
  zwp_tablet_tool_v1_interface.event_count := 19;
  zwp_tablet_tool_v1_interface.events := @zwp_tablet_tool_v1_events;

  zwp_tablet_v1_interface.name := 'zwp_tablet_v1';
  zwp_tablet_v1_interface.version := 1;
  zwp_tablet_v1_interface.method_count := 1;
  zwp_tablet_v1_interface.methods := @zwp_tablet_v1_requests;
  zwp_tablet_v1_interface.event_count := 5;
  zwp_tablet_v1_interface.events := @zwp_tablet_v1_events;

end.
