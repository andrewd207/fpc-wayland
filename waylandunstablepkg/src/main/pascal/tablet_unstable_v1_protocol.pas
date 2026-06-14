unit tablet_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_tablet_manager_v1 = Pointer;
  Pwp_tablet_seat_v1 = Pointer;
  Pwp_tablet_tool_v1 = Pointer;
  Pwp_tablet_v1 = Pointer;
  Pwp_tablet_manager_v1_listener = ^Twp_tablet_manager_v1_listener;
  Twp_tablet_manager_v1_listener = record
  end;

  Pwp_tablet_seat_v1_listener = ^Twp_tablet_seat_v1_listener;
  Twp_tablet_seat_v1_listener = record
    tablet_added : procedure(data: Pointer; AWpTabletSeatV1: Pwp_tablet_seat_v1; AId: Pwp_tablet_v1); cdecl;
    tool_added : procedure(data: Pointer; AWpTabletSeatV1: Pwp_tablet_seat_v1; AId: Pwp_tablet_tool_v1); cdecl;
  end;

const
  WP_TABLET_TOOL_V1_TYPE_PEN = $140; // Pen
  WP_TABLET_TOOL_V1_TYPE_ERASER = $141; // Eraser
  WP_TABLET_TOOL_V1_TYPE_BRUSH = $142; // Brush
  WP_TABLET_TOOL_V1_TYPE_PENCIL = $143; // Pencil
  WP_TABLET_TOOL_V1_TYPE_AIRBRUSH = $144; // Airbrush
  WP_TABLET_TOOL_V1_TYPE_FINGER = $145; // Finger
  WP_TABLET_TOOL_V1_TYPE_MOUSE = $146; // Mouse
  WP_TABLET_TOOL_V1_TYPE_LENS = $147; // Lens
  WP_TABLET_TOOL_V1_CAPABILITY_TILT = 1; // Tilt axes
  WP_TABLET_TOOL_V1_CAPABILITY_PRESSURE = 2; // Pressure axis
  WP_TABLET_TOOL_V1_CAPABILITY_DISTANCE = 3; // Distance axis
  WP_TABLET_TOOL_V1_CAPABILITY_ROTATION = 4; // Z-rotation axis
  WP_TABLET_TOOL_V1_CAPABILITY_SLIDER = 5; // Slider axis
  WP_TABLET_TOOL_V1_CAPABILITY_WHEEL = 6; // Wheel axis
  WP_TABLET_TOOL_V1_BUTTON_STATE_RELEASED = 0; // button is not pressed
  WP_TABLET_TOOL_V1_BUTTON_STATE_PRESSED = 1; // button is pressed
  WP_TABLET_TOOL_V1_ERROR_ROLE = 0; // given wl_surface has another role

type
  Pwp_tablet_tool_v1_listener = ^Twp_tablet_tool_v1_listener;
  Twp_tablet_tool_v1_listener = record
    type_ : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1; AToolType: DWord); cdecl;
    hardware_serial : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1; AHardwareSerialHi: DWord; AHardwareSerialLo: DWord); cdecl;
    hardware_id_wacom : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1; AHardwareIdHi: DWord; AHardwareIdLo: DWord); cdecl;
    capability : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1; ACapability: DWord); cdecl;
    done : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1); cdecl;
    removed : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1); cdecl;
    proximity_in : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1; ASerial: DWord; ATablet: Pwp_tablet_v1; ASurface: Pwl_surface); cdecl;
    proximity_out : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1); cdecl;
    down : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1; ASerial: DWord); cdecl;
    up : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1); cdecl;
    motion : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1; AX: Longint{24.8}; AY: Longint{24.8}); cdecl;
    pressure : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1; APressure: DWord); cdecl;
    distance : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1; ADistance: DWord); cdecl;
    tilt : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1; ATiltX: LongInt; ATiltY: LongInt); cdecl;
    rotation : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1; ADegrees: LongInt); cdecl;
    slider : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1; APosition: LongInt); cdecl;
    wheel : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1; ADegrees: LongInt; AClicks: LongInt); cdecl;
    button : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1; ASerial: DWord; AButton: DWord; AState: DWord); cdecl;
    frame : procedure(data: Pointer; AWpTabletToolV1: Pwp_tablet_tool_v1; ATime: DWord); cdecl;
  end;

  Pwp_tablet_v1_listener = ^Twp_tablet_v1_listener;
  Twp_tablet_v1_listener = record
    name : procedure(data: Pointer; AWpTabletV1: Pwp_tablet_v1; AName: Pchar); cdecl;
    id : procedure(data: Pointer; AWpTabletV1: Pwp_tablet_v1; AVid: DWord; APid: DWord); cdecl;
    path : procedure(data: Pointer; AWpTabletV1: Pwp_tablet_v1; APath: Pchar); cdecl;
    done : procedure(data: Pointer; AWpTabletV1: Pwp_tablet_v1); cdecl;
    removed : procedure(data: Pointer; AWpTabletV1: Pwp_tablet_v1); cdecl;
  end;



  TWpTabletManagerV1 = class;
  TWpTabletSeatV1 = class;
  TWpTabletToolV1 = class;
  TWpTabletV1 = class;


  IWpTabletManagerV1Listener = interface
  ['IWpTabletManagerV1Listener']
  end;

  IWpTabletSeatV1Listener = interface
  ['IWpTabletSeatV1Listener']
    procedure wp_tablet_seat_v1_tablet_added(AWpTabletSeatV1: TWpTabletSeatV1; AId: TWpTabletV1);
    procedure wp_tablet_seat_v1_tool_added(AWpTabletSeatV1: TWpTabletSeatV1; AId: TWpTabletToolV1);
  end;

  IWpTabletToolV1Listener = interface
  ['IWpTabletToolV1Listener']
    procedure wp_tablet_tool_v1_type(AWpTabletToolV1: TWpTabletToolV1; AToolType: DWord);
    procedure wp_tablet_tool_v1_hardware_serial(AWpTabletToolV1: TWpTabletToolV1; AHardwareSerialHi: DWord; AHardwareSerialLo: DWord);
    procedure wp_tablet_tool_v1_hardware_id_wacom(AWpTabletToolV1: TWpTabletToolV1; AHardwareIdHi: DWord; AHardwareIdLo: DWord);
    procedure wp_tablet_tool_v1_capability(AWpTabletToolV1: TWpTabletToolV1; ACapability: DWord);
    procedure wp_tablet_tool_v1_done(AWpTabletToolV1: TWpTabletToolV1);
    procedure wp_tablet_tool_v1_removed(AWpTabletToolV1: TWpTabletToolV1);
    procedure wp_tablet_tool_v1_proximity_in(AWpTabletToolV1: TWpTabletToolV1; ASerial: DWord; ATablet: TWpTabletV1; ASurface: TWlSurface);
    procedure wp_tablet_tool_v1_proximity_out(AWpTabletToolV1: TWpTabletToolV1);
    procedure wp_tablet_tool_v1_down(AWpTabletToolV1: TWpTabletToolV1; ASerial: DWord);
    procedure wp_tablet_tool_v1_up(AWpTabletToolV1: TWpTabletToolV1);
    procedure wp_tablet_tool_v1_motion(AWpTabletToolV1: TWpTabletToolV1; AX: Longint{24.8}; AY: Longint{24.8});
    procedure wp_tablet_tool_v1_pressure(AWpTabletToolV1: TWpTabletToolV1; APressure: DWord);
    procedure wp_tablet_tool_v1_distance(AWpTabletToolV1: TWpTabletToolV1; ADistance: DWord);
    procedure wp_tablet_tool_v1_tilt(AWpTabletToolV1: TWpTabletToolV1; ATiltX: LongInt; ATiltY: LongInt);
    procedure wp_tablet_tool_v1_rotation(AWpTabletToolV1: TWpTabletToolV1; ADegrees: LongInt);
    procedure wp_tablet_tool_v1_slider(AWpTabletToolV1: TWpTabletToolV1; APosition: LongInt);
    procedure wp_tablet_tool_v1_wheel(AWpTabletToolV1: TWpTabletToolV1; ADegrees: LongInt; AClicks: LongInt);
    procedure wp_tablet_tool_v1_button(AWpTabletToolV1: TWpTabletToolV1; ASerial: DWord; AButton: DWord; AState: DWord);
    procedure wp_tablet_tool_v1_frame(AWpTabletToolV1: TWpTabletToolV1; ATime: DWord);
  end;

  IWpTabletV1Listener = interface
  ['IWpTabletV1Listener']
    procedure wp_tablet_v1_name(AWpTabletV1: TWpTabletV1; AName: String);
    procedure wp_tablet_v1_id(AWpTabletV1: TWpTabletV1; AVid: DWord; APid: DWord);
    procedure wp_tablet_v1_path(AWpTabletV1: TWpTabletV1; APath: String);
    procedure wp_tablet_v1_done(AWpTabletV1: TWpTabletV1);
    procedure wp_tablet_v1_removed(AWpTabletV1: TWpTabletV1);
  end;




  TWpTabletManagerV1 = class(TWLProxyObject)
  private
    const _GET_TABLET_SEAT = 0;
    const _DESTROY = 1;
  public
    function GetTabletSeat(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TWpTabletSeatV1}): TWpTabletSeatV1;
    destructor Destroy; override;
    function AddListener(AIntf: IWpTabletManagerV1Listener): LongInt;
  end;

  TWpTabletSeatV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpTabletSeatV1Listener): LongInt;
  end;

  TWpTabletToolV1 = class(TWLProxyObject)
  private
    const _SET_CURSOR = 0;
    const _DESTROY = 1;
  public
    procedure SetCursor(ASerial: DWord; ASurface: TWlSurface; AHotspotX: LongInt; AHotspotY: LongInt);
    destructor Destroy; override;
    function AddListener(AIntf: IWpTabletToolV1Listener): LongInt;
  end;

  TWpTabletV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpTabletV1Listener): LongInt;
  end;






var
  wp_tablet_manager_v1_interface: Twl_interface;
  WP_TABLET_MANAGER_V1_INTERFACE_NAME: String = 'zwp_tablet_manager_v1';
  wp_tablet_seat_v1_interface: Twl_interface;
  WP_TABLET_SEAT_V1_INTERFACE_NAME: String = 'zwp_tablet_seat_v1';
  wp_tablet_tool_v1_interface: Twl_interface;
  WP_TABLET_TOOL_V1_INTERFACE_NAME: String = 'zwp_tablet_tool_v1';
  wp_tablet_v1_interface: Twl_interface;
  WP_TABLET_V1_INTERFACE_NAME: String = 'zwp_tablet_v1';



implementation

var
  vIntf_wp_tablet_manager_v1_Listener: Twp_tablet_manager_v1_listener;
  vIntf_wp_tablet_seat_v1_Listener: Twp_tablet_seat_v1_listener;
  vIntf_wp_tablet_tool_v1_Listener: Twp_tablet_tool_v1_listener;
  vIntf_wp_tablet_v1_Listener: Twp_tablet_v1_listener;



function TWpTabletManagerV1.GetTabletSeat(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TWpTabletSeatV1}): TWpTabletSeatV1;
var
  tablet_seat: Pwl_proxy;
begin
  tablet_seat := wl_proxy_marshal_constructor(FProxy,
      _GET_TABLET_SEAT, @wp_tablet_seat_v1_interface, nil, ASeat.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpTabletSeatV1;
  Result := TWpTabletSeatV1(AProxyClass.Create(tablet_seat));
  if not AProxyClass.InheritsFrom(TWpTabletSeatV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpTabletSeatV1]);
end;

destructor TWpTabletManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpTabletManagerV1.AddListener(AIntf: IWpTabletManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_tablet_manager_v1_Listener, @FUserDataRec);
end;
destructor TWpTabletSeatV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpTabletSeatV1.AddListener(AIntf: IWpTabletSeatV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_tablet_seat_v1_Listener, @FUserDataRec);
end;
procedure TWpTabletToolV1.SetCursor(ASerial: DWord; ASurface: TWlSurface; AHotspotX: LongInt; AHotspotY: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_CURSOR, ASerial, ASurface.Proxy, AHotspotX, AHotspotY);
end;

destructor TWpTabletToolV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpTabletToolV1.AddListener(AIntf: IWpTabletToolV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_tablet_tool_v1_Listener, @FUserDataRec);
end;
destructor TWpTabletV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpTabletV1.AddListener(AIntf: IWpTabletV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_tablet_v1_Listener, @FUserDataRec);
end;




procedure wp_tablet_seat_v1_tablet_added_Intf(AData: PWLUserData; Awp_tablet_seat_v1: Pwp_tablet_seat_v1; AId: Pwp_tablet_v1); cdecl;
var
  AIntf: IWpTabletSeatV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletSeatV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_seat_v1_tablet_added(TWpTabletSeatV1(AData^.PascalObject),  TWpTabletV1.Create(AId));
end;

procedure wp_tablet_seat_v1_tool_added_Intf(AData: PWLUserData; Awp_tablet_seat_v1: Pwp_tablet_seat_v1; AId: Pwp_tablet_tool_v1); cdecl;
var
  AIntf: IWpTabletSeatV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletSeatV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_seat_v1_tool_added(TWpTabletSeatV1(AData^.PascalObject),  TWpTabletToolV1.Create(AId));
end;

procedure wp_tablet_tool_v1_type_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1; AToolType: DWord); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_type(TWpTabletToolV1(AData^.PascalObject), AToolType);
end;

procedure wp_tablet_tool_v1_hardware_serial_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1; AHardwareSerialHi: DWord; AHardwareSerialLo: DWord); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_hardware_serial(TWpTabletToolV1(AData^.PascalObject), AHardwareSerialHi, AHardwareSerialLo);
end;

procedure wp_tablet_tool_v1_hardware_id_wacom_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1; AHardwareIdHi: DWord; AHardwareIdLo: DWord); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_hardware_id_wacom(TWpTabletToolV1(AData^.PascalObject), AHardwareIdHi, AHardwareIdLo);
end;

procedure wp_tablet_tool_v1_capability_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1; ACapability: DWord); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_capability(TWpTabletToolV1(AData^.PascalObject), ACapability);
end;

procedure wp_tablet_tool_v1_done_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_done(TWpTabletToolV1(AData^.PascalObject));
end;

procedure wp_tablet_tool_v1_removed_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_removed(TWpTabletToolV1(AData^.PascalObject));
end;

procedure wp_tablet_tool_v1_proximity_in_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1; ASerial: DWord; ATablet: Pwp_tablet_v1; ASurface: Pwl_surface); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_proximity_in(TWpTabletToolV1(AData^.PascalObject), ASerial,  TWpTabletV1(TWLProxyObject.WLToObj(ATablet)),  TWlSurface(TWLProxyObject.WLToObj(ASurface)));
end;

procedure wp_tablet_tool_v1_proximity_out_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_proximity_out(TWpTabletToolV1(AData^.PascalObject));
end;

procedure wp_tablet_tool_v1_down_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1; ASerial: DWord); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_down(TWpTabletToolV1(AData^.PascalObject), ASerial);
end;

procedure wp_tablet_tool_v1_up_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_up(TWpTabletToolV1(AData^.PascalObject));
end;

procedure wp_tablet_tool_v1_motion_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1; AX: Longint{24.8}; AY: Longint{24.8}); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_motion(TWpTabletToolV1(AData^.PascalObject), AX, AY);
end;

procedure wp_tablet_tool_v1_pressure_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1; APressure: DWord); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_pressure(TWpTabletToolV1(AData^.PascalObject), APressure);
end;

procedure wp_tablet_tool_v1_distance_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1; ADistance: DWord); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_distance(TWpTabletToolV1(AData^.PascalObject), ADistance);
end;

procedure wp_tablet_tool_v1_tilt_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1; ATiltX: LongInt; ATiltY: LongInt); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_tilt(TWpTabletToolV1(AData^.PascalObject), ATiltX, ATiltY);
end;

procedure wp_tablet_tool_v1_rotation_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1; ADegrees: LongInt); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_rotation(TWpTabletToolV1(AData^.PascalObject), ADegrees);
end;

procedure wp_tablet_tool_v1_slider_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1; APosition: LongInt); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_slider(TWpTabletToolV1(AData^.PascalObject), APosition);
end;

procedure wp_tablet_tool_v1_wheel_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1; ADegrees: LongInt; AClicks: LongInt); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_wheel(TWpTabletToolV1(AData^.PascalObject), ADegrees, AClicks);
end;

procedure wp_tablet_tool_v1_button_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1; ASerial: DWord; AButton: DWord; AState: DWord); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_button(TWpTabletToolV1(AData^.PascalObject), ASerial, AButton, AState);
end;

procedure wp_tablet_tool_v1_frame_Intf(AData: PWLUserData; Awp_tablet_tool_v1: Pwp_tablet_tool_v1; ATime: DWord); cdecl;
var
  AIntf: IWpTabletToolV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v1_frame(TWpTabletToolV1(AData^.PascalObject), ATime);
end;

procedure wp_tablet_v1_name_Intf(AData: PWLUserData; Awp_tablet_v1: Pwp_tablet_v1; AName: Pchar); cdecl;
var
  AIntf: IWpTabletV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_v1_name(TWpTabletV1(AData^.PascalObject), AName);
end;

procedure wp_tablet_v1_id_Intf(AData: PWLUserData; Awp_tablet_v1: Pwp_tablet_v1; AVid: DWord; APid: DWord); cdecl;
var
  AIntf: IWpTabletV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_v1_id(TWpTabletV1(AData^.PascalObject), AVid, APid);
end;

procedure wp_tablet_v1_path_Intf(AData: PWLUserData; Awp_tablet_v1: Pwp_tablet_v1; APath: Pchar); cdecl;
var
  AIntf: IWpTabletV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_v1_path(TWpTabletV1(AData^.PascalObject), APath);
end;

procedure wp_tablet_v1_done_Intf(AData: PWLUserData; Awp_tablet_v1: Pwp_tablet_v1); cdecl;
var
  AIntf: IWpTabletV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_v1_done(TWpTabletV1(AData^.PascalObject));
end;

procedure wp_tablet_v1_removed_Intf(AData: PWLUserData; Awp_tablet_v1: Pwp_tablet_v1); cdecl;
var
  AIntf: IWpTabletV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletV1Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_v1_removed(TWpTabletV1(AData^.PascalObject));
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
    (@wp_tablet_seat_v1_interface),
    (@wl_seat_interface),
    (nil),
    (@wl_surface_interface),
    (nil),
    (nil),
    (nil),
    (@wp_tablet_v1_interface),
    (@wl_surface_interface)
  );

  wp_tablet_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'get_tablet_seat'; signature: 'no'; types: @pInterfaces[8]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_tablet_seat_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_tablet_seat_v1_events: array[0..1] of Twl_message = (
    (name: 'tablet_added'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'tool_added'; signature: 'n'; types: @pInterfaces[0])
  );
  wp_tablet_tool_v1_requests: array[0..1] of Twl_message = (
    (name: 'set_cursor'; signature: 'u?oii'; types: @pInterfaces[10]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_tablet_tool_v1_events: array[0..18] of Twl_message = (
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
  wp_tablet_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_tablet_v1_events: array[0..4] of Twl_message = (
    (name: 'name'; signature: 's'; types: @pInterfaces[0]),
    (name: 'id'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'path'; signature: 's'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'removed'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_wp_tablet_seat_v1_Listener.tablet_added) := @wp_tablet_seat_v1_tablet_added_Intf;
  Pointer(vIntf_wp_tablet_seat_v1_Listener.tool_added) := @wp_tablet_seat_v1_tool_added_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.type_) := @wp_tablet_tool_v1_type_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.hardware_serial) := @wp_tablet_tool_v1_hardware_serial_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.hardware_id_wacom) := @wp_tablet_tool_v1_hardware_id_wacom_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.capability) := @wp_tablet_tool_v1_capability_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.done) := @wp_tablet_tool_v1_done_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.removed) := @wp_tablet_tool_v1_removed_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.proximity_in) := @wp_tablet_tool_v1_proximity_in_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.proximity_out) := @wp_tablet_tool_v1_proximity_out_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.down) := @wp_tablet_tool_v1_down_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.up) := @wp_tablet_tool_v1_up_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.motion) := @wp_tablet_tool_v1_motion_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.pressure) := @wp_tablet_tool_v1_pressure_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.distance) := @wp_tablet_tool_v1_distance_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.tilt) := @wp_tablet_tool_v1_tilt_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.rotation) := @wp_tablet_tool_v1_rotation_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.slider) := @wp_tablet_tool_v1_slider_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.wheel) := @wp_tablet_tool_v1_wheel_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.button) := @wp_tablet_tool_v1_button_Intf;
  Pointer(vIntf_wp_tablet_tool_v1_Listener.frame) := @wp_tablet_tool_v1_frame_Intf;
  Pointer(vIntf_wp_tablet_v1_Listener.name) := @wp_tablet_v1_name_Intf;
  Pointer(vIntf_wp_tablet_v1_Listener.id) := @wp_tablet_v1_id_Intf;
  Pointer(vIntf_wp_tablet_v1_Listener.path) := @wp_tablet_v1_path_Intf;
  Pointer(vIntf_wp_tablet_v1_Listener.done) := @wp_tablet_v1_done_Intf;
  Pointer(vIntf_wp_tablet_v1_Listener.removed) := @wp_tablet_v1_removed_Intf;


  wp_tablet_manager_v1_interface.name := PChar(WP_TABLET_MANAGER_V1_INTERFACE_NAME);
  wp_tablet_manager_v1_interface.version := 1;
  wp_tablet_manager_v1_interface.method_count := 2;
  wp_tablet_manager_v1_interface.methods := @wp_tablet_manager_v1_requests;
  wp_tablet_manager_v1_interface.event_count := 0;
  wp_tablet_manager_v1_interface.events := nil;

  wp_tablet_seat_v1_interface.name := PChar(WP_TABLET_SEAT_V1_INTERFACE_NAME);
  wp_tablet_seat_v1_interface.version := 1;
  wp_tablet_seat_v1_interface.method_count := 1;
  wp_tablet_seat_v1_interface.methods := @wp_tablet_seat_v1_requests;
  wp_tablet_seat_v1_interface.event_count := 2;
  wp_tablet_seat_v1_interface.events := @wp_tablet_seat_v1_events;

  wp_tablet_tool_v1_interface.name := PChar(WP_TABLET_TOOL_V1_INTERFACE_NAME);
  wp_tablet_tool_v1_interface.version := 1;
  wp_tablet_tool_v1_interface.method_count := 2;
  wp_tablet_tool_v1_interface.methods := @wp_tablet_tool_v1_requests;
  wp_tablet_tool_v1_interface.event_count := 19;
  wp_tablet_tool_v1_interface.events := @wp_tablet_tool_v1_events;

  wp_tablet_v1_interface.name := PChar(WP_TABLET_V1_INTERFACE_NAME);
  wp_tablet_v1_interface.version := 1;
  wp_tablet_v1_interface.method_count := 1;
  wp_tablet_v1_interface.methods := @wp_tablet_v1_requests;
  wp_tablet_v1_interface.event_count := 5;
  wp_tablet_v1_interface.events := @wp_tablet_v1_events;

end.
