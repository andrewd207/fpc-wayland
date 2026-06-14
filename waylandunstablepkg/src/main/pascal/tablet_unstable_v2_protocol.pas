unit tablet_unstable_v2_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_tablet_manager_v2 = Pointer;
  Pzwp_tablet_seat_v2 = Pointer;
  Pzwp_tablet_tool_v2 = Pointer;
  Pzwp_tablet_v2 = Pointer;
  Pzwp_tablet_pad_ring_v2 = Pointer;
  Pzwp_tablet_pad_strip_v2 = Pointer;
  Pzwp_tablet_pad_group_v2 = Pointer;
  Pzwp_tablet_pad_v2 = Pointer;
  Pzwp_tablet_manager_v2_listener = ^Tzwp_tablet_manager_v2_listener;
  Tzwp_tablet_manager_v2_listener = record
  end;

  Pzwp_tablet_seat_v2_listener = ^Tzwp_tablet_seat_v2_listener;
  Tzwp_tablet_seat_v2_listener = record
    tablet_added : procedure(data: Pointer; AZwpTabletSeatV2: Pzwp_tablet_seat_v2; AId: Pzwp_tablet_v2); cdecl;
    tool_added : procedure(data: Pointer; AZwpTabletSeatV2: Pzwp_tablet_seat_v2; AId: Pzwp_tablet_tool_v2); cdecl;
    pad_added : procedure(data: Pointer; AZwpTabletSeatV2: Pzwp_tablet_seat_v2; AId: Pzwp_tablet_pad_v2); cdecl;
  end;

const
  ZWP_TABLET_TOOL_V2_TYPE_PEN = $140; // Pen
  ZWP_TABLET_TOOL_V2_TYPE_ERASER = $141; // Eraser
  ZWP_TABLET_TOOL_V2_TYPE_BRUSH = $142; // Brush
  ZWP_TABLET_TOOL_V2_TYPE_PENCIL = $143; // Pencil
  ZWP_TABLET_TOOL_V2_TYPE_AIRBRUSH = $144; // Airbrush
  ZWP_TABLET_TOOL_V2_TYPE_FINGER = $145; // Finger
  ZWP_TABLET_TOOL_V2_TYPE_MOUSE = $146; // Mouse
  ZWP_TABLET_TOOL_V2_TYPE_LENS = $147; // Lens
  ZWP_TABLET_TOOL_V2_CAPABILITY_TILT = 1; // Tilt axes
  ZWP_TABLET_TOOL_V2_CAPABILITY_PRESSURE = 2; // Pressure axis
  ZWP_TABLET_TOOL_V2_CAPABILITY_DISTANCE = 3; // Distance axis
  ZWP_TABLET_TOOL_V2_CAPABILITY_ROTATION = 4; // Z-rotation axis
  ZWP_TABLET_TOOL_V2_CAPABILITY_SLIDER = 5; // Slider axis
  ZWP_TABLET_TOOL_V2_CAPABILITY_WHEEL = 6; // Wheel axis
  ZWP_TABLET_TOOL_V2_BUTTON_STATE_RELEASED = 0; // button is not pressed
  ZWP_TABLET_TOOL_V2_BUTTON_STATE_PRESSED = 1; // button is pressed
  ZWP_TABLET_TOOL_V2_ERROR_ROLE = 0; // given wl_surface has another role

type
  Pzwp_tablet_tool_v2_listener = ^Tzwp_tablet_tool_v2_listener;
  Tzwp_tablet_tool_v2_listener = record
    type_ : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2; AToolType: DWord); cdecl;
    hardware_serial : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2; AHardwareSerialHi: DWord; AHardwareSerialLo: DWord); cdecl;
    hardware_id_wacom : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2; AHardwareIdHi: DWord; AHardwareIdLo: DWord); cdecl;
    capability : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2; ACapability: DWord); cdecl;
    done : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2); cdecl;
    removed : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2); cdecl;
    proximity_in : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2; ASerial: DWord; ATablet: Pzwp_tablet_v2; ASurface: Pwl_surface); cdecl;
    proximity_out : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2); cdecl;
    down : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2; ASerial: DWord); cdecl;
    up : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2); cdecl;
    motion : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2; AX: Longint{24.8}; AY: Longint{24.8}); cdecl;
    pressure : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2; APressure: DWord); cdecl;
    distance : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2; ADistance: DWord); cdecl;
    tilt : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2; ATiltX: Longint{24.8}; ATiltY: Longint{24.8}); cdecl;
    rotation : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2; ADegrees: Longint{24.8}); cdecl;
    slider : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2; APosition: LongInt); cdecl;
    wheel : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2; ADegrees: Longint{24.8}; AClicks: LongInt); cdecl;
    button : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2; ASerial: DWord; AButton: DWord; AState: DWord); cdecl;
    frame : procedure(data: Pointer; AZwpTabletToolV2: Pzwp_tablet_tool_v2; ATime: DWord); cdecl;
  end;

  Pzwp_tablet_v2_listener = ^Tzwp_tablet_v2_listener;
  Tzwp_tablet_v2_listener = record
    name : procedure(data: Pointer; AZwpTabletV2: Pzwp_tablet_v2; AName: Pchar); cdecl;
    id : procedure(data: Pointer; AZwpTabletV2: Pzwp_tablet_v2; AVid: DWord; APid: DWord); cdecl;
    path : procedure(data: Pointer; AZwpTabletV2: Pzwp_tablet_v2; APath: Pchar); cdecl;
    done : procedure(data: Pointer; AZwpTabletV2: Pzwp_tablet_v2); cdecl;
    removed : procedure(data: Pointer; AZwpTabletV2: Pzwp_tablet_v2); cdecl;
  end;

const
  ZWP_TABLET_PAD_RING_V2_SOURCE_FINGER = 1; // finger

type
  Pzwp_tablet_pad_ring_v2_listener = ^Tzwp_tablet_pad_ring_v2_listener;
  Tzwp_tablet_pad_ring_v2_listener = record
    source : procedure(data: Pointer; AZwpTabletPadRingV2: Pzwp_tablet_pad_ring_v2; ASource: DWord); cdecl;
    angle : procedure(data: Pointer; AZwpTabletPadRingV2: Pzwp_tablet_pad_ring_v2; ADegrees: Longint{24.8}); cdecl;
    stop : procedure(data: Pointer; AZwpTabletPadRingV2: Pzwp_tablet_pad_ring_v2); cdecl;
    frame : procedure(data: Pointer; AZwpTabletPadRingV2: Pzwp_tablet_pad_ring_v2; ATime: DWord); cdecl;
  end;

const
  ZWP_TABLET_PAD_STRIP_V2_SOURCE_FINGER = 1; // finger

type
  Pzwp_tablet_pad_strip_v2_listener = ^Tzwp_tablet_pad_strip_v2_listener;
  Tzwp_tablet_pad_strip_v2_listener = record
    source : procedure(data: Pointer; AZwpTabletPadStripV2: Pzwp_tablet_pad_strip_v2; ASource: DWord); cdecl;
    position : procedure(data: Pointer; AZwpTabletPadStripV2: Pzwp_tablet_pad_strip_v2; APosition: DWord); cdecl;
    stop : procedure(data: Pointer; AZwpTabletPadStripV2: Pzwp_tablet_pad_strip_v2); cdecl;
    frame : procedure(data: Pointer; AZwpTabletPadStripV2: Pzwp_tablet_pad_strip_v2; ATime: DWord); cdecl;
  end;

  Pzwp_tablet_pad_group_v2_listener = ^Tzwp_tablet_pad_group_v2_listener;
  Tzwp_tablet_pad_group_v2_listener = record
    buttons : procedure(data: Pointer; AZwpTabletPadGroupV2: Pzwp_tablet_pad_group_v2; AButtons: Pwl_array); cdecl;
    ring : procedure(data: Pointer; AZwpTabletPadGroupV2: Pzwp_tablet_pad_group_v2; ARing: Pzwp_tablet_pad_ring_v2); cdecl;
    strip : procedure(data: Pointer; AZwpTabletPadGroupV2: Pzwp_tablet_pad_group_v2; AStrip: Pzwp_tablet_pad_strip_v2); cdecl;
    modes : procedure(data: Pointer; AZwpTabletPadGroupV2: Pzwp_tablet_pad_group_v2; AModes: DWord); cdecl;
    done : procedure(data: Pointer; AZwpTabletPadGroupV2: Pzwp_tablet_pad_group_v2); cdecl;
    mode_switch : procedure(data: Pointer; AZwpTabletPadGroupV2: Pzwp_tablet_pad_group_v2; ATime: DWord; ASerial: DWord; AMode: DWord); cdecl;
  end;

const
  ZWP_TABLET_PAD_V2_BUTTON_STATE_RELEASED = 0; // the button is not pressed
  ZWP_TABLET_PAD_V2_BUTTON_STATE_PRESSED = 1; // the button is pressed

type
  Pzwp_tablet_pad_v2_listener = ^Tzwp_tablet_pad_v2_listener;
  Tzwp_tablet_pad_v2_listener = record
    group : procedure(data: Pointer; AZwpTabletPadV2: Pzwp_tablet_pad_v2; APadGroup: Pzwp_tablet_pad_group_v2); cdecl;
    path : procedure(data: Pointer; AZwpTabletPadV2: Pzwp_tablet_pad_v2; APath: Pchar); cdecl;
    buttons : procedure(data: Pointer; AZwpTabletPadV2: Pzwp_tablet_pad_v2; AButtons: DWord); cdecl;
    done : procedure(data: Pointer; AZwpTabletPadV2: Pzwp_tablet_pad_v2); cdecl;
    button : procedure(data: Pointer; AZwpTabletPadV2: Pzwp_tablet_pad_v2; ATime: DWord; AButton: DWord; AState: DWord); cdecl;
    enter : procedure(data: Pointer; AZwpTabletPadV2: Pzwp_tablet_pad_v2; ASerial: DWord; ATablet: Pzwp_tablet_v2; ASurface: Pwl_surface); cdecl;
    leave : procedure(data: Pointer; AZwpTabletPadV2: Pzwp_tablet_pad_v2; ASerial: DWord; ASurface: Pwl_surface); cdecl;
    removed : procedure(data: Pointer; AZwpTabletPadV2: Pzwp_tablet_pad_v2); cdecl;
  end;



  TZwpTabletManagerV2 = class;
  TZwpTabletSeatV2 = class;
  TZwpTabletToolV2 = class;
  TZwpTabletV2 = class;
  TZwpTabletPadRingV2 = class;
  TZwpTabletPadStripV2 = class;
  TZwpTabletPadGroupV2 = class;
  TZwpTabletPadV2 = class;


  IZwpTabletManagerV2Listener = interface
  ['IZwpTabletManagerV2Listener']
  end;

  IZwpTabletSeatV2Listener = interface
  ['IZwpTabletSeatV2Listener']
    procedure zwp_tablet_seat_v2_tablet_added(AZwpTabletSeatV2: TZwpTabletSeatV2; AId: TZwpTabletV2);
    procedure zwp_tablet_seat_v2_tool_added(AZwpTabletSeatV2: TZwpTabletSeatV2; AId: TZwpTabletToolV2);
    procedure zwp_tablet_seat_v2_pad_added(AZwpTabletSeatV2: TZwpTabletSeatV2; AId: TZwpTabletPadV2);
  end;

  IZwpTabletToolV2Listener = interface
  ['IZwpTabletToolV2Listener']
    procedure zwp_tablet_tool_v2_type(AZwpTabletToolV2: TZwpTabletToolV2; AToolType: DWord);
    procedure zwp_tablet_tool_v2_hardware_serial(AZwpTabletToolV2: TZwpTabletToolV2; AHardwareSerialHi: DWord; AHardwareSerialLo: DWord);
    procedure zwp_tablet_tool_v2_hardware_id_wacom(AZwpTabletToolV2: TZwpTabletToolV2; AHardwareIdHi: DWord; AHardwareIdLo: DWord);
    procedure zwp_tablet_tool_v2_capability(AZwpTabletToolV2: TZwpTabletToolV2; ACapability: DWord);
    procedure zwp_tablet_tool_v2_done(AZwpTabletToolV2: TZwpTabletToolV2);
    procedure zwp_tablet_tool_v2_removed(AZwpTabletToolV2: TZwpTabletToolV2);
    procedure zwp_tablet_tool_v2_proximity_in(AZwpTabletToolV2: TZwpTabletToolV2; ASerial: DWord; ATablet: TZwpTabletV2; ASurface: TWlSurface);
    procedure zwp_tablet_tool_v2_proximity_out(AZwpTabletToolV2: TZwpTabletToolV2);
    procedure zwp_tablet_tool_v2_down(AZwpTabletToolV2: TZwpTabletToolV2; ASerial: DWord);
    procedure zwp_tablet_tool_v2_up(AZwpTabletToolV2: TZwpTabletToolV2);
    procedure zwp_tablet_tool_v2_motion(AZwpTabletToolV2: TZwpTabletToolV2; AX: Longint{24.8}; AY: Longint{24.8});
    procedure zwp_tablet_tool_v2_pressure(AZwpTabletToolV2: TZwpTabletToolV2; APressure: DWord);
    procedure zwp_tablet_tool_v2_distance(AZwpTabletToolV2: TZwpTabletToolV2; ADistance: DWord);
    procedure zwp_tablet_tool_v2_tilt(AZwpTabletToolV2: TZwpTabletToolV2; ATiltX: Longint{24.8}; ATiltY: Longint{24.8});
    procedure zwp_tablet_tool_v2_rotation(AZwpTabletToolV2: TZwpTabletToolV2; ADegrees: Longint{24.8});
    procedure zwp_tablet_tool_v2_slider(AZwpTabletToolV2: TZwpTabletToolV2; APosition: LongInt);
    procedure zwp_tablet_tool_v2_wheel(AZwpTabletToolV2: TZwpTabletToolV2; ADegrees: Longint{24.8}; AClicks: LongInt);
    procedure zwp_tablet_tool_v2_button(AZwpTabletToolV2: TZwpTabletToolV2; ASerial: DWord; AButton: DWord; AState: DWord);
    procedure zwp_tablet_tool_v2_frame(AZwpTabletToolV2: TZwpTabletToolV2; ATime: DWord);
  end;

  IZwpTabletV2Listener = interface
  ['IZwpTabletV2Listener']
    procedure zwp_tablet_v2_name(AZwpTabletV2: TZwpTabletV2; AName: String);
    procedure zwp_tablet_v2_id(AZwpTabletV2: TZwpTabletV2; AVid: DWord; APid: DWord);
    procedure zwp_tablet_v2_path(AZwpTabletV2: TZwpTabletV2; APath: String);
    procedure zwp_tablet_v2_done(AZwpTabletV2: TZwpTabletV2);
    procedure zwp_tablet_v2_removed(AZwpTabletV2: TZwpTabletV2);
  end;

  IZwpTabletPadRingV2Listener = interface
  ['IZwpTabletPadRingV2Listener']
    procedure zwp_tablet_pad_ring_v2_source(AZwpTabletPadRingV2: TZwpTabletPadRingV2; ASource: DWord);
    procedure zwp_tablet_pad_ring_v2_angle(AZwpTabletPadRingV2: TZwpTabletPadRingV2; ADegrees: Longint{24.8});
    procedure zwp_tablet_pad_ring_v2_stop(AZwpTabletPadRingV2: TZwpTabletPadRingV2);
    procedure zwp_tablet_pad_ring_v2_frame(AZwpTabletPadRingV2: TZwpTabletPadRingV2; ATime: DWord);
  end;

  IZwpTabletPadStripV2Listener = interface
  ['IZwpTabletPadStripV2Listener']
    procedure zwp_tablet_pad_strip_v2_source(AZwpTabletPadStripV2: TZwpTabletPadStripV2; ASource: DWord);
    procedure zwp_tablet_pad_strip_v2_position(AZwpTabletPadStripV2: TZwpTabletPadStripV2; APosition: DWord);
    procedure zwp_tablet_pad_strip_v2_stop(AZwpTabletPadStripV2: TZwpTabletPadStripV2);
    procedure zwp_tablet_pad_strip_v2_frame(AZwpTabletPadStripV2: TZwpTabletPadStripV2; ATime: DWord);
  end;

  IZwpTabletPadGroupV2Listener = interface
  ['IZwpTabletPadGroupV2Listener']
    procedure zwp_tablet_pad_group_v2_buttons(AZwpTabletPadGroupV2: TZwpTabletPadGroupV2; AButtons: Pwl_array);
    procedure zwp_tablet_pad_group_v2_ring(AZwpTabletPadGroupV2: TZwpTabletPadGroupV2; ARing: TZwpTabletPadRingV2);
    procedure zwp_tablet_pad_group_v2_strip(AZwpTabletPadGroupV2: TZwpTabletPadGroupV2; AStrip: TZwpTabletPadStripV2);
    procedure zwp_tablet_pad_group_v2_modes(AZwpTabletPadGroupV2: TZwpTabletPadGroupV2; AModes: DWord);
    procedure zwp_tablet_pad_group_v2_done(AZwpTabletPadGroupV2: TZwpTabletPadGroupV2);
    procedure zwp_tablet_pad_group_v2_mode_switch(AZwpTabletPadGroupV2: TZwpTabletPadGroupV2; ATime: DWord; ASerial: DWord; AMode: DWord);
  end;

  IZwpTabletPadV2Listener = interface
  ['IZwpTabletPadV2Listener']
    procedure zwp_tablet_pad_v2_group(AZwpTabletPadV2: TZwpTabletPadV2; APadGroup: TZwpTabletPadGroupV2);
    procedure zwp_tablet_pad_v2_path(AZwpTabletPadV2: TZwpTabletPadV2; APath: String);
    procedure zwp_tablet_pad_v2_buttons(AZwpTabletPadV2: TZwpTabletPadV2; AButtons: DWord);
    procedure zwp_tablet_pad_v2_done(AZwpTabletPadV2: TZwpTabletPadV2);
    procedure zwp_tablet_pad_v2_button(AZwpTabletPadV2: TZwpTabletPadV2; ATime: DWord; AButton: DWord; AState: DWord);
    procedure zwp_tablet_pad_v2_enter(AZwpTabletPadV2: TZwpTabletPadV2; ASerial: DWord; ATablet: TZwpTabletV2; ASurface: TWlSurface);
    procedure zwp_tablet_pad_v2_leave(AZwpTabletPadV2: TZwpTabletPadV2; ASerial: DWord; ASurface: TWlSurface);
    procedure zwp_tablet_pad_v2_removed(AZwpTabletPadV2: TZwpTabletPadV2);
  end;




  TZwpTabletManagerV2 = class(TWLProxyObject)
  private
    const _GET_TABLET_SEAT = 0;
    const _DESTROY = 1;
  public
    function GetTabletSeat(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TZwpTabletSeatV2}): TZwpTabletSeatV2;
    destructor Destroy; override;
    function AddListener(AIntf: IZwpTabletManagerV2Listener): LongInt;
  end;

  TZwpTabletSeatV2 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IZwpTabletSeatV2Listener): LongInt;
  end;

  TZwpTabletToolV2 = class(TWLProxyObject)
  private
    const _SET_CURSOR = 0;
    const _DESTROY = 1;
  public
    procedure SetCursor(ASerial: DWord; ASurface: TWlSurface; AHotspotX: LongInt; AHotspotY: LongInt);
    destructor Destroy; override;
    function AddListener(AIntf: IZwpTabletToolV2Listener): LongInt;
  end;

  TZwpTabletV2 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IZwpTabletV2Listener): LongInt;
  end;

  TZwpTabletPadRingV2 = class(TWLProxyObject)
  private
    const _SET_FEEDBACK = 0;
    const _DESTROY = 1;
  public
    procedure SetFeedback(ADescription: String; ASerial: DWord);
    destructor Destroy; override;
    function AddListener(AIntf: IZwpTabletPadRingV2Listener): LongInt;
  end;

  TZwpTabletPadStripV2 = class(TWLProxyObject)
  private
    const _SET_FEEDBACK = 0;
    const _DESTROY = 1;
  public
    procedure SetFeedback(ADescription: String; ASerial: DWord);
    destructor Destroy; override;
    function AddListener(AIntf: IZwpTabletPadStripV2Listener): LongInt;
  end;

  TZwpTabletPadGroupV2 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IZwpTabletPadGroupV2Listener): LongInt;
  end;

  TZwpTabletPadV2 = class(TWLProxyObject)
  private
    const _SET_FEEDBACK = 0;
    const _DESTROY = 1;
  public
    procedure SetFeedback(AButton: DWord; ADescription: String; ASerial: DWord);
    destructor Destroy; override;
    function AddListener(AIntf: IZwpTabletPadV2Listener): LongInt;
  end;






var
  zwp_tablet_manager_v2_interface: Twl_interface;
  zwp_tablet_seat_v2_interface: Twl_interface;
  zwp_tablet_tool_v2_interface: Twl_interface;
  zwp_tablet_v2_interface: Twl_interface;
  zwp_tablet_pad_ring_v2_interface: Twl_interface;
  zwp_tablet_pad_strip_v2_interface: Twl_interface;
  zwp_tablet_pad_group_v2_interface: Twl_interface;
  zwp_tablet_pad_v2_interface: Twl_interface;



implementation

var
  vIntf_zwp_tablet_manager_v2_Listener: Tzwp_tablet_manager_v2_listener;
  vIntf_zwp_tablet_seat_v2_Listener: Tzwp_tablet_seat_v2_listener;
  vIntf_zwp_tablet_tool_v2_Listener: Tzwp_tablet_tool_v2_listener;
  vIntf_zwp_tablet_v2_Listener: Tzwp_tablet_v2_listener;
  vIntf_zwp_tablet_pad_ring_v2_Listener: Tzwp_tablet_pad_ring_v2_listener;
  vIntf_zwp_tablet_pad_strip_v2_Listener: Tzwp_tablet_pad_strip_v2_listener;
  vIntf_zwp_tablet_pad_group_v2_Listener: Tzwp_tablet_pad_group_v2_listener;
  vIntf_zwp_tablet_pad_v2_Listener: Tzwp_tablet_pad_v2_listener;



function TZwpTabletManagerV2.GetTabletSeat(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TZwpTabletSeatV2}): TZwpTabletSeatV2;
var
  tablet_seat: Pwl_proxy;
begin
  tablet_seat := wl_proxy_marshal_constructor(FProxy,
      _GET_TABLET_SEAT, @zwp_tablet_seat_v2_interface, nil, ASeat.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpTabletSeatV2;
  Result := TZwpTabletSeatV2(AProxyClass.Create(tablet_seat));
  if not AProxyClass.InheritsFrom(TZwpTabletSeatV2) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpTabletSeatV2]);
end;

destructor TZwpTabletManagerV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpTabletManagerV2.AddListener(AIntf: IZwpTabletManagerV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_tablet_manager_v2_Listener, @FUserDataRec);
end;
destructor TZwpTabletSeatV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpTabletSeatV2.AddListener(AIntf: IZwpTabletSeatV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_tablet_seat_v2_Listener, @FUserDataRec);
end;
procedure TZwpTabletToolV2.SetCursor(ASerial: DWord; ASurface: TWlSurface; AHotspotX: LongInt; AHotspotY: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_CURSOR, ASerial, ASurface.Proxy, AHotspotX, AHotspotY);
end;

destructor TZwpTabletToolV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpTabletToolV2.AddListener(AIntf: IZwpTabletToolV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_tablet_tool_v2_Listener, @FUserDataRec);
end;
destructor TZwpTabletV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpTabletV2.AddListener(AIntf: IZwpTabletV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_tablet_v2_Listener, @FUserDataRec);
end;
procedure TZwpTabletPadRingV2.SetFeedback(ADescription: String; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_FEEDBACK, PChar(ADescription), ASerial);
end;

destructor TZwpTabletPadRingV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpTabletPadRingV2.AddListener(AIntf: IZwpTabletPadRingV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_tablet_pad_ring_v2_Listener, @FUserDataRec);
end;
procedure TZwpTabletPadStripV2.SetFeedback(ADescription: String; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_FEEDBACK, PChar(ADescription), ASerial);
end;

destructor TZwpTabletPadStripV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpTabletPadStripV2.AddListener(AIntf: IZwpTabletPadStripV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_tablet_pad_strip_v2_Listener, @FUserDataRec);
end;
destructor TZwpTabletPadGroupV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpTabletPadGroupV2.AddListener(AIntf: IZwpTabletPadGroupV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_tablet_pad_group_v2_Listener, @FUserDataRec);
end;
procedure TZwpTabletPadV2.SetFeedback(AButton: DWord; ADescription: String; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_FEEDBACK, AButton, PChar(ADescription), ASerial);
end;

destructor TZwpTabletPadV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpTabletPadV2.AddListener(AIntf: IZwpTabletPadV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_tablet_pad_v2_Listener, @FUserDataRec);
end;




procedure zwp_tablet_seat_v2_tablet_added_Intf(AData: PWLUserData; Azwp_tablet_seat_v2: Pzwp_tablet_seat_v2; AId: Pzwp_tablet_v2); cdecl;
var
  AIntf: IZwpTabletSeatV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletSeatV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_seat_v2_tablet_added(TZwpTabletSeatV2(AData^.PascalObject),  TZwpTabletV2.Create(AId));
end;

procedure zwp_tablet_seat_v2_tool_added_Intf(AData: PWLUserData; Azwp_tablet_seat_v2: Pzwp_tablet_seat_v2; AId: Pzwp_tablet_tool_v2); cdecl;
var
  AIntf: IZwpTabletSeatV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletSeatV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_seat_v2_tool_added(TZwpTabletSeatV2(AData^.PascalObject),  TZwpTabletToolV2.Create(AId));
end;

procedure zwp_tablet_seat_v2_pad_added_Intf(AData: PWLUserData; Azwp_tablet_seat_v2: Pzwp_tablet_seat_v2; AId: Pzwp_tablet_pad_v2); cdecl;
var
  AIntf: IZwpTabletSeatV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletSeatV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_seat_v2_pad_added(TZwpTabletSeatV2(AData^.PascalObject),  TZwpTabletPadV2.Create(AId));
end;

procedure zwp_tablet_tool_v2_type_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2; AToolType: DWord); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_type(TZwpTabletToolV2(AData^.PascalObject), AToolType);
end;

procedure zwp_tablet_tool_v2_hardware_serial_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2; AHardwareSerialHi: DWord; AHardwareSerialLo: DWord); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_hardware_serial(TZwpTabletToolV2(AData^.PascalObject), AHardwareSerialHi, AHardwareSerialLo);
end;

procedure zwp_tablet_tool_v2_hardware_id_wacom_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2; AHardwareIdHi: DWord; AHardwareIdLo: DWord); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_hardware_id_wacom(TZwpTabletToolV2(AData^.PascalObject), AHardwareIdHi, AHardwareIdLo);
end;

procedure zwp_tablet_tool_v2_capability_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2; ACapability: DWord); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_capability(TZwpTabletToolV2(AData^.PascalObject), ACapability);
end;

procedure zwp_tablet_tool_v2_done_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_done(TZwpTabletToolV2(AData^.PascalObject));
end;

procedure zwp_tablet_tool_v2_removed_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_removed(TZwpTabletToolV2(AData^.PascalObject));
end;

procedure zwp_tablet_tool_v2_proximity_in_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2; ASerial: DWord; ATablet: Pzwp_tablet_v2; ASurface: Pwl_surface); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_proximity_in(TZwpTabletToolV2(AData^.PascalObject), ASerial,  TZwpTabletV2(TWLProxyObject.WLToObj(ATablet)),  TWlSurface(TWLProxyObject.WLToObj(ASurface)));
end;

procedure zwp_tablet_tool_v2_proximity_out_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_proximity_out(TZwpTabletToolV2(AData^.PascalObject));
end;

procedure zwp_tablet_tool_v2_down_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2; ASerial: DWord); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_down(TZwpTabletToolV2(AData^.PascalObject), ASerial);
end;

procedure zwp_tablet_tool_v2_up_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_up(TZwpTabletToolV2(AData^.PascalObject));
end;

procedure zwp_tablet_tool_v2_motion_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2; AX: Longint{24.8}; AY: Longint{24.8}); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_motion(TZwpTabletToolV2(AData^.PascalObject), AX, AY);
end;

procedure zwp_tablet_tool_v2_pressure_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2; APressure: DWord); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_pressure(TZwpTabletToolV2(AData^.PascalObject), APressure);
end;

procedure zwp_tablet_tool_v2_distance_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2; ADistance: DWord); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_distance(TZwpTabletToolV2(AData^.PascalObject), ADistance);
end;

procedure zwp_tablet_tool_v2_tilt_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2; ATiltX: Longint{24.8}; ATiltY: Longint{24.8}); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_tilt(TZwpTabletToolV2(AData^.PascalObject), ATiltX, ATiltY);
end;

procedure zwp_tablet_tool_v2_rotation_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2; ADegrees: Longint{24.8}); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_rotation(TZwpTabletToolV2(AData^.PascalObject), ADegrees);
end;

procedure zwp_tablet_tool_v2_slider_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2; APosition: LongInt); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_slider(TZwpTabletToolV2(AData^.PascalObject), APosition);
end;

procedure zwp_tablet_tool_v2_wheel_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2; ADegrees: Longint{24.8}; AClicks: LongInt); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_wheel(TZwpTabletToolV2(AData^.PascalObject), ADegrees, AClicks);
end;

procedure zwp_tablet_tool_v2_button_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2; ASerial: DWord; AButton: DWord; AState: DWord); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_button(TZwpTabletToolV2(AData^.PascalObject), ASerial, AButton, AState);
end;

procedure zwp_tablet_tool_v2_frame_Intf(AData: PWLUserData; Azwp_tablet_tool_v2: Pzwp_tablet_tool_v2; ATime: DWord); cdecl;
var
  AIntf: IZwpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_tool_v2_frame(TZwpTabletToolV2(AData^.PascalObject), ATime);
end;

procedure zwp_tablet_v2_name_Intf(AData: PWLUserData; Azwp_tablet_v2: Pzwp_tablet_v2; AName: Pchar); cdecl;
var
  AIntf: IZwpTabletV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_v2_name(TZwpTabletV2(AData^.PascalObject), AName);
end;

procedure zwp_tablet_v2_id_Intf(AData: PWLUserData; Azwp_tablet_v2: Pzwp_tablet_v2; AVid: DWord; APid: DWord); cdecl;
var
  AIntf: IZwpTabletV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_v2_id(TZwpTabletV2(AData^.PascalObject), AVid, APid);
end;

procedure zwp_tablet_v2_path_Intf(AData: PWLUserData; Azwp_tablet_v2: Pzwp_tablet_v2; APath: Pchar); cdecl;
var
  AIntf: IZwpTabletV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_v2_path(TZwpTabletV2(AData^.PascalObject), APath);
end;

procedure zwp_tablet_v2_done_Intf(AData: PWLUserData; Azwp_tablet_v2: Pzwp_tablet_v2); cdecl;
var
  AIntf: IZwpTabletV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_v2_done(TZwpTabletV2(AData^.PascalObject));
end;

procedure zwp_tablet_v2_removed_Intf(AData: PWLUserData; Azwp_tablet_v2: Pzwp_tablet_v2); cdecl;
var
  AIntf: IZwpTabletV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_v2_removed(TZwpTabletV2(AData^.PascalObject));
end;

procedure zwp_tablet_pad_ring_v2_source_Intf(AData: PWLUserData; Azwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; ASource: DWord); cdecl;
var
  AIntf: IZwpTabletPadRingV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadRingV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_ring_v2_source(TZwpTabletPadRingV2(AData^.PascalObject), ASource);
end;

procedure zwp_tablet_pad_ring_v2_angle_Intf(AData: PWLUserData; Azwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; ADegrees: Longint{24.8}); cdecl;
var
  AIntf: IZwpTabletPadRingV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadRingV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_ring_v2_angle(TZwpTabletPadRingV2(AData^.PascalObject), ADegrees);
end;

procedure zwp_tablet_pad_ring_v2_stop_Intf(AData: PWLUserData; Azwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2); cdecl;
var
  AIntf: IZwpTabletPadRingV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadRingV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_ring_v2_stop(TZwpTabletPadRingV2(AData^.PascalObject));
end;

procedure zwp_tablet_pad_ring_v2_frame_Intf(AData: PWLUserData; Azwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; ATime: DWord); cdecl;
var
  AIntf: IZwpTabletPadRingV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadRingV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_ring_v2_frame(TZwpTabletPadRingV2(AData^.PascalObject), ATime);
end;

procedure zwp_tablet_pad_strip_v2_source_Intf(AData: PWLUserData; Azwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; ASource: DWord); cdecl;
var
  AIntf: IZwpTabletPadStripV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadStripV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_strip_v2_source(TZwpTabletPadStripV2(AData^.PascalObject), ASource);
end;

procedure zwp_tablet_pad_strip_v2_position_Intf(AData: PWLUserData; Azwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; APosition: DWord); cdecl;
var
  AIntf: IZwpTabletPadStripV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadStripV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_strip_v2_position(TZwpTabletPadStripV2(AData^.PascalObject), APosition);
end;

procedure zwp_tablet_pad_strip_v2_stop_Intf(AData: PWLUserData; Azwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2); cdecl;
var
  AIntf: IZwpTabletPadStripV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadStripV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_strip_v2_stop(TZwpTabletPadStripV2(AData^.PascalObject));
end;

procedure zwp_tablet_pad_strip_v2_frame_Intf(AData: PWLUserData; Azwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; ATime: DWord); cdecl;
var
  AIntf: IZwpTabletPadStripV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadStripV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_strip_v2_frame(TZwpTabletPadStripV2(AData^.PascalObject), ATime);
end;

procedure zwp_tablet_pad_group_v2_buttons_Intf(AData: PWLUserData; Azwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; AButtons: Pwl_array); cdecl;
var
  AIntf: IZwpTabletPadGroupV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadGroupV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_group_v2_buttons(TZwpTabletPadGroupV2(AData^.PascalObject), AButtons);
end;

procedure zwp_tablet_pad_group_v2_ring_Intf(AData: PWLUserData; Azwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; ARing: Pzwp_tablet_pad_ring_v2); cdecl;
var
  AIntf: IZwpTabletPadGroupV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadGroupV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_group_v2_ring(TZwpTabletPadGroupV2(AData^.PascalObject),  TZwpTabletPadRingV2.Create(ARing));
end;

procedure zwp_tablet_pad_group_v2_strip_Intf(AData: PWLUserData; Azwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; AStrip: Pzwp_tablet_pad_strip_v2); cdecl;
var
  AIntf: IZwpTabletPadGroupV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadGroupV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_group_v2_strip(TZwpTabletPadGroupV2(AData^.PascalObject),  TZwpTabletPadStripV2.Create(AStrip));
end;

procedure zwp_tablet_pad_group_v2_modes_Intf(AData: PWLUserData; Azwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; AModes: DWord); cdecl;
var
  AIntf: IZwpTabletPadGroupV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadGroupV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_group_v2_modes(TZwpTabletPadGroupV2(AData^.PascalObject), AModes);
end;

procedure zwp_tablet_pad_group_v2_done_Intf(AData: PWLUserData; Azwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2); cdecl;
var
  AIntf: IZwpTabletPadGroupV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadGroupV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_group_v2_done(TZwpTabletPadGroupV2(AData^.PascalObject));
end;

procedure zwp_tablet_pad_group_v2_mode_switch_Intf(AData: PWLUserData; Azwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; ATime: DWord; ASerial: DWord; AMode: DWord); cdecl;
var
  AIntf: IZwpTabletPadGroupV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadGroupV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_group_v2_mode_switch(TZwpTabletPadGroupV2(AData^.PascalObject), ATime, ASerial, AMode);
end;

procedure zwp_tablet_pad_v2_group_Intf(AData: PWLUserData; Azwp_tablet_pad_v2: Pzwp_tablet_pad_v2; APadGroup: Pzwp_tablet_pad_group_v2); cdecl;
var
  AIntf: IZwpTabletPadV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_v2_group(TZwpTabletPadV2(AData^.PascalObject),  TZwpTabletPadGroupV2.Create(APadGroup));
end;

procedure zwp_tablet_pad_v2_path_Intf(AData: PWLUserData; Azwp_tablet_pad_v2: Pzwp_tablet_pad_v2; APath: Pchar); cdecl;
var
  AIntf: IZwpTabletPadV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_v2_path(TZwpTabletPadV2(AData^.PascalObject), APath);
end;

procedure zwp_tablet_pad_v2_buttons_Intf(AData: PWLUserData; Azwp_tablet_pad_v2: Pzwp_tablet_pad_v2; AButtons: DWord); cdecl;
var
  AIntf: IZwpTabletPadV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_v2_buttons(TZwpTabletPadV2(AData^.PascalObject), AButtons);
end;

procedure zwp_tablet_pad_v2_done_Intf(AData: PWLUserData; Azwp_tablet_pad_v2: Pzwp_tablet_pad_v2); cdecl;
var
  AIntf: IZwpTabletPadV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_v2_done(TZwpTabletPadV2(AData^.PascalObject));
end;

procedure zwp_tablet_pad_v2_button_Intf(AData: PWLUserData; Azwp_tablet_pad_v2: Pzwp_tablet_pad_v2; ATime: DWord; AButton: DWord; AState: DWord); cdecl;
var
  AIntf: IZwpTabletPadV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_v2_button(TZwpTabletPadV2(AData^.PascalObject), ATime, AButton, AState);
end;

procedure zwp_tablet_pad_v2_enter_Intf(AData: PWLUserData; Azwp_tablet_pad_v2: Pzwp_tablet_pad_v2; ASerial: DWord; ATablet: Pzwp_tablet_v2; ASurface: Pwl_surface); cdecl;
var
  AIntf: IZwpTabletPadV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_v2_enter(TZwpTabletPadV2(AData^.PascalObject), ASerial,  TZwpTabletV2(TWLProxyObject.WLToObj(ATablet)),  TWlSurface(TWLProxyObject.WLToObj(ASurface)));
end;

procedure zwp_tablet_pad_v2_leave_Intf(AData: PWLUserData; Azwp_tablet_pad_v2: Pzwp_tablet_pad_v2; ASerial: DWord; ASurface: Pwl_surface); cdecl;
var
  AIntf: IZwpTabletPadV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_v2_leave(TZwpTabletPadV2(AData^.PascalObject), ASerial,  TWlSurface(TWLProxyObject.WLToObj(ASurface)));
end;

procedure zwp_tablet_pad_v2_removed_Intf(AData: PWLUserData; Azwp_tablet_pad_v2: Pzwp_tablet_pad_v2); cdecl;
var
  AIntf: IZwpTabletPadV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpTabletPadV2Listener(AData^.ListenerUserData);
  AIntf.zwp_tablet_pad_v2_removed(TZwpTabletPadV2(AData^.PascalObject));
end;



const
  pInterfaces: array[0..21] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@zwp_tablet_seat_v2_interface),
    (@wl_seat_interface),
    (nil),
    (@wl_surface_interface),
    (nil),
    (nil),
    (nil),
    (@zwp_tablet_v2_interface),
    (@wl_surface_interface),
    (nil),
    (@zwp_tablet_v2_interface),
    (@wl_surface_interface),
    (nil),
    (@wl_surface_interface)
  );

  zwp_tablet_manager_v2_requests: array[0..1] of Twl_message = (
    (name: 'get_tablet_seat'; signature: 'no'; types: @pInterfaces[8]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_tablet_seat_v2_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_tablet_seat_v2_events: array[0..2] of Twl_message = (
    (name: 'tablet_added'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'tool_added'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'pad_added'; signature: 'n'; types: @pInterfaces[0])
  );
  zwp_tablet_tool_v2_requests: array[0..1] of Twl_message = (
    (name: 'set_cursor'; signature: 'u?oii'; types: @pInterfaces[10]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_tablet_tool_v2_events: array[0..18] of Twl_message = (
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
    (name: 'tilt'; signature: 'ff'; types: @pInterfaces[0]),
    (name: 'rotation'; signature: 'f'; types: @pInterfaces[0]),
    (name: 'slider'; signature: 'i'; types: @pInterfaces[0]),
    (name: 'wheel'; signature: 'fi'; types: @pInterfaces[0]),
    (name: 'button'; signature: 'uuu'; types: @pInterfaces[0]),
    (name: 'frame'; signature: 'u'; types: @pInterfaces[0])
  );
  zwp_tablet_v2_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_tablet_v2_events: array[0..4] of Twl_message = (
    (name: 'name'; signature: 's'; types: @pInterfaces[0]),
    (name: 'id'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'path'; signature: 's'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'removed'; signature: ''; types: @pInterfaces[0])
  );
  zwp_tablet_pad_ring_v2_requests: array[0..1] of Twl_message = (
    (name: 'set_feedback'; signature: 'su'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_tablet_pad_ring_v2_events: array[0..3] of Twl_message = (
    (name: 'source'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'angle'; signature: 'f'; types: @pInterfaces[0]),
    (name: 'stop'; signature: ''; types: @pInterfaces[0]),
    (name: 'frame'; signature: 'u'; types: @pInterfaces[0])
  );
  zwp_tablet_pad_strip_v2_requests: array[0..1] of Twl_message = (
    (name: 'set_feedback'; signature: 'su'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_tablet_pad_strip_v2_events: array[0..3] of Twl_message = (
    (name: 'source'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'position'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'stop'; signature: ''; types: @pInterfaces[0]),
    (name: 'frame'; signature: 'u'; types: @pInterfaces[0])
  );
  zwp_tablet_pad_group_v2_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_tablet_pad_group_v2_events: array[0..5] of Twl_message = (
    (name: 'buttons'; signature: 'a'; types: @pInterfaces[0]),
    (name: 'ring'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'strip'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'modes'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'mode_switch'; signature: 'uuu'; types: @pInterfaces[0])
  );
  zwp_tablet_pad_v2_requests: array[0..1] of Twl_message = (
    (name: 'set_feedback'; signature: 'usu'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_tablet_pad_v2_events: array[0..7] of Twl_message = (
    (name: 'group'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'path'; signature: 's'; types: @pInterfaces[0]),
    (name: 'buttons'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'button'; signature: 'uuu'; types: @pInterfaces[0]),
    (name: 'enter'; signature: 'uoo'; types: @pInterfaces[17]),
    (name: 'leave'; signature: 'uo'; types: @pInterfaces[20]),
    (name: 'removed'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_tablet_seat_v2_Listener.tablet_added) := @zwp_tablet_seat_v2_tablet_added_Intf;
  Pointer(vIntf_zwp_tablet_seat_v2_Listener.tool_added) := @zwp_tablet_seat_v2_tool_added_Intf;
  Pointer(vIntf_zwp_tablet_seat_v2_Listener.pad_added) := @zwp_tablet_seat_v2_pad_added_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.type_) := @zwp_tablet_tool_v2_type_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.hardware_serial) := @zwp_tablet_tool_v2_hardware_serial_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.hardware_id_wacom) := @zwp_tablet_tool_v2_hardware_id_wacom_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.capability) := @zwp_tablet_tool_v2_capability_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.done) := @zwp_tablet_tool_v2_done_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.removed) := @zwp_tablet_tool_v2_removed_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.proximity_in) := @zwp_tablet_tool_v2_proximity_in_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.proximity_out) := @zwp_tablet_tool_v2_proximity_out_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.down) := @zwp_tablet_tool_v2_down_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.up) := @zwp_tablet_tool_v2_up_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.motion) := @zwp_tablet_tool_v2_motion_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.pressure) := @zwp_tablet_tool_v2_pressure_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.distance) := @zwp_tablet_tool_v2_distance_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.tilt) := @zwp_tablet_tool_v2_tilt_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.rotation) := @zwp_tablet_tool_v2_rotation_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.slider) := @zwp_tablet_tool_v2_slider_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.wheel) := @zwp_tablet_tool_v2_wheel_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.button) := @zwp_tablet_tool_v2_button_Intf;
  Pointer(vIntf_zwp_tablet_tool_v2_Listener.frame) := @zwp_tablet_tool_v2_frame_Intf;
  Pointer(vIntf_zwp_tablet_v2_Listener.name) := @zwp_tablet_v2_name_Intf;
  Pointer(vIntf_zwp_tablet_v2_Listener.id) := @zwp_tablet_v2_id_Intf;
  Pointer(vIntf_zwp_tablet_v2_Listener.path) := @zwp_tablet_v2_path_Intf;
  Pointer(vIntf_zwp_tablet_v2_Listener.done) := @zwp_tablet_v2_done_Intf;
  Pointer(vIntf_zwp_tablet_v2_Listener.removed) := @zwp_tablet_v2_removed_Intf;
  Pointer(vIntf_zwp_tablet_pad_ring_v2_Listener.source) := @zwp_tablet_pad_ring_v2_source_Intf;
  Pointer(vIntf_zwp_tablet_pad_ring_v2_Listener.angle) := @zwp_tablet_pad_ring_v2_angle_Intf;
  Pointer(vIntf_zwp_tablet_pad_ring_v2_Listener.stop) := @zwp_tablet_pad_ring_v2_stop_Intf;
  Pointer(vIntf_zwp_tablet_pad_ring_v2_Listener.frame) := @zwp_tablet_pad_ring_v2_frame_Intf;
  Pointer(vIntf_zwp_tablet_pad_strip_v2_Listener.source) := @zwp_tablet_pad_strip_v2_source_Intf;
  Pointer(vIntf_zwp_tablet_pad_strip_v2_Listener.position) := @zwp_tablet_pad_strip_v2_position_Intf;
  Pointer(vIntf_zwp_tablet_pad_strip_v2_Listener.stop) := @zwp_tablet_pad_strip_v2_stop_Intf;
  Pointer(vIntf_zwp_tablet_pad_strip_v2_Listener.frame) := @zwp_tablet_pad_strip_v2_frame_Intf;
  Pointer(vIntf_zwp_tablet_pad_group_v2_Listener.buttons) := @zwp_tablet_pad_group_v2_buttons_Intf;
  Pointer(vIntf_zwp_tablet_pad_group_v2_Listener.ring) := @zwp_tablet_pad_group_v2_ring_Intf;
  Pointer(vIntf_zwp_tablet_pad_group_v2_Listener.strip) := @zwp_tablet_pad_group_v2_strip_Intf;
  Pointer(vIntf_zwp_tablet_pad_group_v2_Listener.modes) := @zwp_tablet_pad_group_v2_modes_Intf;
  Pointer(vIntf_zwp_tablet_pad_group_v2_Listener.done) := @zwp_tablet_pad_group_v2_done_Intf;
  Pointer(vIntf_zwp_tablet_pad_group_v2_Listener.mode_switch) := @zwp_tablet_pad_group_v2_mode_switch_Intf;
  Pointer(vIntf_zwp_tablet_pad_v2_Listener.group) := @zwp_tablet_pad_v2_group_Intf;
  Pointer(vIntf_zwp_tablet_pad_v2_Listener.path) := @zwp_tablet_pad_v2_path_Intf;
  Pointer(vIntf_zwp_tablet_pad_v2_Listener.buttons) := @zwp_tablet_pad_v2_buttons_Intf;
  Pointer(vIntf_zwp_tablet_pad_v2_Listener.done) := @zwp_tablet_pad_v2_done_Intf;
  Pointer(vIntf_zwp_tablet_pad_v2_Listener.button) := @zwp_tablet_pad_v2_button_Intf;
  Pointer(vIntf_zwp_tablet_pad_v2_Listener.enter) := @zwp_tablet_pad_v2_enter_Intf;
  Pointer(vIntf_zwp_tablet_pad_v2_Listener.leave) := @zwp_tablet_pad_v2_leave_Intf;
  Pointer(vIntf_zwp_tablet_pad_v2_Listener.removed) := @zwp_tablet_pad_v2_removed_Intf;


  zwp_tablet_manager_v2_interface.name := 'zwp_tablet_manager_v2';
  zwp_tablet_manager_v2_interface.version := 1;
  zwp_tablet_manager_v2_interface.method_count := 2;
  zwp_tablet_manager_v2_interface.methods := @zwp_tablet_manager_v2_requests;
  zwp_tablet_manager_v2_interface.event_count := 0;
  zwp_tablet_manager_v2_interface.events := nil;

  zwp_tablet_seat_v2_interface.name := 'zwp_tablet_seat_v2';
  zwp_tablet_seat_v2_interface.version := 1;
  zwp_tablet_seat_v2_interface.method_count := 1;
  zwp_tablet_seat_v2_interface.methods := @zwp_tablet_seat_v2_requests;
  zwp_tablet_seat_v2_interface.event_count := 3;
  zwp_tablet_seat_v2_interface.events := @zwp_tablet_seat_v2_events;

  zwp_tablet_tool_v2_interface.name := 'zwp_tablet_tool_v2';
  zwp_tablet_tool_v2_interface.version := 1;
  zwp_tablet_tool_v2_interface.method_count := 2;
  zwp_tablet_tool_v2_interface.methods := @zwp_tablet_tool_v2_requests;
  zwp_tablet_tool_v2_interface.event_count := 19;
  zwp_tablet_tool_v2_interface.events := @zwp_tablet_tool_v2_events;

  zwp_tablet_v2_interface.name := 'zwp_tablet_v2';
  zwp_tablet_v2_interface.version := 1;
  zwp_tablet_v2_interface.method_count := 1;
  zwp_tablet_v2_interface.methods := @zwp_tablet_v2_requests;
  zwp_tablet_v2_interface.event_count := 5;
  zwp_tablet_v2_interface.events := @zwp_tablet_v2_events;

  zwp_tablet_pad_ring_v2_interface.name := 'zwp_tablet_pad_ring_v2';
  zwp_tablet_pad_ring_v2_interface.version := 1;
  zwp_tablet_pad_ring_v2_interface.method_count := 2;
  zwp_tablet_pad_ring_v2_interface.methods := @zwp_tablet_pad_ring_v2_requests;
  zwp_tablet_pad_ring_v2_interface.event_count := 4;
  zwp_tablet_pad_ring_v2_interface.events := @zwp_tablet_pad_ring_v2_events;

  zwp_tablet_pad_strip_v2_interface.name := 'zwp_tablet_pad_strip_v2';
  zwp_tablet_pad_strip_v2_interface.version := 1;
  zwp_tablet_pad_strip_v2_interface.method_count := 2;
  zwp_tablet_pad_strip_v2_interface.methods := @zwp_tablet_pad_strip_v2_requests;
  zwp_tablet_pad_strip_v2_interface.event_count := 4;
  zwp_tablet_pad_strip_v2_interface.events := @zwp_tablet_pad_strip_v2_events;

  zwp_tablet_pad_group_v2_interface.name := 'zwp_tablet_pad_group_v2';
  zwp_tablet_pad_group_v2_interface.version := 1;
  zwp_tablet_pad_group_v2_interface.method_count := 1;
  zwp_tablet_pad_group_v2_interface.methods := @zwp_tablet_pad_group_v2_requests;
  zwp_tablet_pad_group_v2_interface.event_count := 6;
  zwp_tablet_pad_group_v2_interface.events := @zwp_tablet_pad_group_v2_events;

  zwp_tablet_pad_v2_interface.name := 'zwp_tablet_pad_v2';
  zwp_tablet_pad_v2_interface.version := 1;
  zwp_tablet_pad_v2_interface.method_count := 2;
  zwp_tablet_pad_v2_interface.methods := @zwp_tablet_pad_v2_requests;
  zwp_tablet_pad_v2_interface.event_count := 8;
  zwp_tablet_pad_v2_interface.events := @zwp_tablet_pad_v2_events;

end.
