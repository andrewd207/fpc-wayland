unit tablet_v2_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_tablet_manager_v2 = Pointer;
  Pwp_tablet_seat_v2 = Pointer;
  Pwp_tablet_tool_v2 = Pointer;
  Pwp_tablet_v2 = Pointer;
  Pwp_tablet_pad_ring_v2 = Pointer;
  Pwp_tablet_pad_strip_v2 = Pointer;
  Pwp_tablet_pad_group_v2 = Pointer;
  Pwp_tablet_pad_v2 = Pointer;
  Pwp_tablet_pad_dial_v2 = Pointer;
  Pwp_tablet_manager_v2_listener = ^Twp_tablet_manager_v2_listener;
  Twp_tablet_manager_v2_listener = record
  end;

  Pwp_tablet_seat_v2_listener = ^Twp_tablet_seat_v2_listener;
  Twp_tablet_seat_v2_listener = record
    tablet_added : procedure(data: Pointer; AWpTabletSeatV2: Pwp_tablet_seat_v2; AId: Pwp_tablet_v2); cdecl;
    tool_added : procedure(data: Pointer; AWpTabletSeatV2: Pwp_tablet_seat_v2; AId: Pwp_tablet_tool_v2); cdecl;
    pad_added : procedure(data: Pointer; AWpTabletSeatV2: Pwp_tablet_seat_v2; AId: Pwp_tablet_pad_v2); cdecl;
  end;

const
  WP_TABLET_TOOL_V2_TYPE_PEN = $140; // Pen
  WP_TABLET_TOOL_V2_TYPE_ERASER = $141; // Eraser
  WP_TABLET_TOOL_V2_TYPE_BRUSH = $142; // Brush
  WP_TABLET_TOOL_V2_TYPE_PENCIL = $143; // Pencil
  WP_TABLET_TOOL_V2_TYPE_AIRBRUSH = $144; // Airbrush
  WP_TABLET_TOOL_V2_TYPE_FINGER = $145; // Finger
  WP_TABLET_TOOL_V2_TYPE_MOUSE = $146; // Mouse
  WP_TABLET_TOOL_V2_TYPE_LENS = $147; // Lens
  WP_TABLET_TOOL_V2_CAPABILITY_TILT = 1; // Tilt axes
  WP_TABLET_TOOL_V2_CAPABILITY_PRESSURE = 2; // Pressure axis
  WP_TABLET_TOOL_V2_CAPABILITY_DISTANCE = 3; // Distance axis
  WP_TABLET_TOOL_V2_CAPABILITY_ROTATION = 4; // Z-rotation axis
  WP_TABLET_TOOL_V2_CAPABILITY_SLIDER = 5; // Slider axis
  WP_TABLET_TOOL_V2_CAPABILITY_WHEEL = 6; // Wheel axis
  WP_TABLET_TOOL_V2_BUTTON_STATE_RELEASED = 0; // button is not pressed
  WP_TABLET_TOOL_V2_BUTTON_STATE_PRESSED = 1; // button is pressed
  WP_TABLET_TOOL_V2_ERROR_ROLE = 0; // given wl_surface has another role

type
  Pwp_tablet_tool_v2_listener = ^Twp_tablet_tool_v2_listener;
  Twp_tablet_tool_v2_listener = record
    type_ : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2; AToolType: DWord); cdecl;
    hardware_serial : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2; AHardwareSerialHi: DWord; AHardwareSerialLo: DWord); cdecl;
    hardware_id_wacom : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2; AHardwareIdHi: DWord; AHardwareIdLo: DWord); cdecl;
    capability : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2; ACapability: DWord); cdecl;
    done : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2); cdecl;
    removed : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2); cdecl;
    proximity_in : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2; ASerial: DWord; ATablet: Pwp_tablet_v2; ASurface: Pwl_surface); cdecl;
    proximity_out : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2); cdecl;
    down : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2; ASerial: DWord); cdecl;
    up : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2); cdecl;
    motion : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2; AX: Longint{24.8}; AY: Longint{24.8}); cdecl;
    pressure : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2; APressure: DWord); cdecl;
    distance : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2; ADistance: DWord); cdecl;
    tilt : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2; ATiltX: Longint{24.8}; ATiltY: Longint{24.8}); cdecl;
    rotation : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2; ADegrees: Longint{24.8}); cdecl;
    slider : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2; APosition: LongInt); cdecl;
    wheel : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2; ADegrees: Longint{24.8}; AClicks: LongInt); cdecl;
    button : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2; ASerial: DWord; AButton: DWord; AState: DWord); cdecl;
    frame : procedure(data: Pointer; AWpTabletToolV2: Pwp_tablet_tool_v2; ATime: DWord); cdecl;
  end;

const
  WP_TABLET_V2_BUSTYPE_USB = 3; // USB
  WP_TABLET_V2_BUSTYPE_BLUETOOTH = 5; // Bluetooth
  WP_TABLET_V2_BUSTYPE_VIRTUAL = 6; // Virtual
  WP_TABLET_V2_BUSTYPE_SERIAL = 17; // Serial
  WP_TABLET_V2_BUSTYPE_I2C = 24; // I2C

type
  Pwp_tablet_v2_listener = ^Twp_tablet_v2_listener;
  Twp_tablet_v2_listener = record
    name : procedure(data: Pointer; AWpTabletV2: Pwp_tablet_v2; AName: Pchar); cdecl;
    id : procedure(data: Pointer; AWpTabletV2: Pwp_tablet_v2; AVid: DWord; APid: DWord); cdecl;
    path : procedure(data: Pointer; AWpTabletV2: Pwp_tablet_v2; APath: Pchar); cdecl;
    done : procedure(data: Pointer; AWpTabletV2: Pwp_tablet_v2); cdecl;
    removed : procedure(data: Pointer; AWpTabletV2: Pwp_tablet_v2); cdecl;
    bustype : procedure(data: Pointer; AWpTabletV2: Pwp_tablet_v2; ABustype: DWord); cdecl;
  end;

const
  WP_TABLET_PAD_RING_V2_SOURCE_FINGER = 1; // finger

type
  Pwp_tablet_pad_ring_v2_listener = ^Twp_tablet_pad_ring_v2_listener;
  Twp_tablet_pad_ring_v2_listener = record
    source : procedure(data: Pointer; AWpTabletPadRingV2: Pwp_tablet_pad_ring_v2; ASource: DWord); cdecl;
    angle : procedure(data: Pointer; AWpTabletPadRingV2: Pwp_tablet_pad_ring_v2; ADegrees: Longint{24.8}); cdecl;
    stop : procedure(data: Pointer; AWpTabletPadRingV2: Pwp_tablet_pad_ring_v2); cdecl;
    frame : procedure(data: Pointer; AWpTabletPadRingV2: Pwp_tablet_pad_ring_v2; ATime: DWord); cdecl;
  end;

const
  WP_TABLET_PAD_STRIP_V2_SOURCE_FINGER = 1; // finger

type
  Pwp_tablet_pad_strip_v2_listener = ^Twp_tablet_pad_strip_v2_listener;
  Twp_tablet_pad_strip_v2_listener = record
    source : procedure(data: Pointer; AWpTabletPadStripV2: Pwp_tablet_pad_strip_v2; ASource: DWord); cdecl;
    position : procedure(data: Pointer; AWpTabletPadStripV2: Pwp_tablet_pad_strip_v2; APosition: DWord); cdecl;
    stop : procedure(data: Pointer; AWpTabletPadStripV2: Pwp_tablet_pad_strip_v2); cdecl;
    frame : procedure(data: Pointer; AWpTabletPadStripV2: Pwp_tablet_pad_strip_v2; ATime: DWord); cdecl;
  end;

  Pwp_tablet_pad_group_v2_listener = ^Twp_tablet_pad_group_v2_listener;
  Twp_tablet_pad_group_v2_listener = record
    buttons : procedure(data: Pointer; AWpTabletPadGroupV2: Pwp_tablet_pad_group_v2; AButtons: Pwl_array); cdecl;
    ring : procedure(data: Pointer; AWpTabletPadGroupV2: Pwp_tablet_pad_group_v2; ARing: Pwp_tablet_pad_ring_v2); cdecl;
    strip : procedure(data: Pointer; AWpTabletPadGroupV2: Pwp_tablet_pad_group_v2; AStrip: Pwp_tablet_pad_strip_v2); cdecl;
    modes : procedure(data: Pointer; AWpTabletPadGroupV2: Pwp_tablet_pad_group_v2; AModes: DWord); cdecl;
    done : procedure(data: Pointer; AWpTabletPadGroupV2: Pwp_tablet_pad_group_v2); cdecl;
    mode_switch : procedure(data: Pointer; AWpTabletPadGroupV2: Pwp_tablet_pad_group_v2; ATime: DWord; ASerial: DWord; AMode: DWord); cdecl;
    dial : procedure(data: Pointer; AWpTabletPadGroupV2: Pwp_tablet_pad_group_v2; ADial: Pwp_tablet_pad_dial_v2); cdecl;
  end;

const
  WP_TABLET_PAD_V2_BUTTON_STATE_RELEASED = 0; // the button is not pressed
  WP_TABLET_PAD_V2_BUTTON_STATE_PRESSED = 1; // the button is pressed

type
  Pwp_tablet_pad_v2_listener = ^Twp_tablet_pad_v2_listener;
  Twp_tablet_pad_v2_listener = record
    group : procedure(data: Pointer; AWpTabletPadV2: Pwp_tablet_pad_v2; APadGroup: Pwp_tablet_pad_group_v2); cdecl;
    path : procedure(data: Pointer; AWpTabletPadV2: Pwp_tablet_pad_v2; APath: Pchar); cdecl;
    buttons : procedure(data: Pointer; AWpTabletPadV2: Pwp_tablet_pad_v2; AButtons: DWord); cdecl;
    done : procedure(data: Pointer; AWpTabletPadV2: Pwp_tablet_pad_v2); cdecl;
    button : procedure(data: Pointer; AWpTabletPadV2: Pwp_tablet_pad_v2; ATime: DWord; AButton: DWord; AState: DWord); cdecl;
    enter : procedure(data: Pointer; AWpTabletPadV2: Pwp_tablet_pad_v2; ASerial: DWord; ATablet: Pwp_tablet_v2; ASurface: Pwl_surface); cdecl;
    leave : procedure(data: Pointer; AWpTabletPadV2: Pwp_tablet_pad_v2; ASerial: DWord; ASurface: Pwl_surface); cdecl;
    removed : procedure(data: Pointer; AWpTabletPadV2: Pwp_tablet_pad_v2); cdecl;
  end;

  Pwp_tablet_pad_dial_v2_listener = ^Twp_tablet_pad_dial_v2_listener;
  Twp_tablet_pad_dial_v2_listener = record
    delta : procedure(data: Pointer; AWpTabletPadDialV2: Pwp_tablet_pad_dial_v2; AValue120: LongInt); cdecl;
    frame : procedure(data: Pointer; AWpTabletPadDialV2: Pwp_tablet_pad_dial_v2; ATime: DWord); cdecl;
  end;



  TWpTabletManagerV2 = class;
  TWpTabletSeatV2 = class;
  TWpTabletToolV2 = class;
  TWpTabletV2 = class;
  TWpTabletPadRingV2 = class;
  TWpTabletPadStripV2 = class;
  TWpTabletPadGroupV2 = class;
  TWpTabletPadV2 = class;
  TWpTabletPadDialV2 = class;


  IWpTabletManagerV2Listener = interface
  ['IWpTabletManagerV2Listener']
  end;

  IWpTabletSeatV2Listener = interface
  ['IWpTabletSeatV2Listener']
    procedure wp_tablet_seat_v2_tablet_added(AWpTabletSeatV2: TWpTabletSeatV2; AId: TWpTabletV2);
    procedure wp_tablet_seat_v2_tool_added(AWpTabletSeatV2: TWpTabletSeatV2; AId: TWpTabletToolV2);
    procedure wp_tablet_seat_v2_pad_added(AWpTabletSeatV2: TWpTabletSeatV2; AId: TWpTabletPadV2);
  end;

  IWpTabletToolV2Listener = interface
  ['IWpTabletToolV2Listener']
    procedure wp_tablet_tool_v2_type(AWpTabletToolV2: TWpTabletToolV2; AToolType: DWord);
    procedure wp_tablet_tool_v2_hardware_serial(AWpTabletToolV2: TWpTabletToolV2; AHardwareSerialHi: DWord; AHardwareSerialLo: DWord);
    procedure wp_tablet_tool_v2_hardware_id_wacom(AWpTabletToolV2: TWpTabletToolV2; AHardwareIdHi: DWord; AHardwareIdLo: DWord);
    procedure wp_tablet_tool_v2_capability(AWpTabletToolV2: TWpTabletToolV2; ACapability: DWord);
    procedure wp_tablet_tool_v2_done(AWpTabletToolV2: TWpTabletToolV2);
    procedure wp_tablet_tool_v2_removed(AWpTabletToolV2: TWpTabletToolV2);
    procedure wp_tablet_tool_v2_proximity_in(AWpTabletToolV2: TWpTabletToolV2; ASerial: DWord; ATablet: TWpTabletV2; ASurface: TWlSurface);
    procedure wp_tablet_tool_v2_proximity_out(AWpTabletToolV2: TWpTabletToolV2);
    procedure wp_tablet_tool_v2_down(AWpTabletToolV2: TWpTabletToolV2; ASerial: DWord);
    procedure wp_tablet_tool_v2_up(AWpTabletToolV2: TWpTabletToolV2);
    procedure wp_tablet_tool_v2_motion(AWpTabletToolV2: TWpTabletToolV2; AX: Longint{24.8}; AY: Longint{24.8});
    procedure wp_tablet_tool_v2_pressure(AWpTabletToolV2: TWpTabletToolV2; APressure: DWord);
    procedure wp_tablet_tool_v2_distance(AWpTabletToolV2: TWpTabletToolV2; ADistance: DWord);
    procedure wp_tablet_tool_v2_tilt(AWpTabletToolV2: TWpTabletToolV2; ATiltX: Longint{24.8}; ATiltY: Longint{24.8});
    procedure wp_tablet_tool_v2_rotation(AWpTabletToolV2: TWpTabletToolV2; ADegrees: Longint{24.8});
    procedure wp_tablet_tool_v2_slider(AWpTabletToolV2: TWpTabletToolV2; APosition: LongInt);
    procedure wp_tablet_tool_v2_wheel(AWpTabletToolV2: TWpTabletToolV2; ADegrees: Longint{24.8}; AClicks: LongInt);
    procedure wp_tablet_tool_v2_button(AWpTabletToolV2: TWpTabletToolV2; ASerial: DWord; AButton: DWord; AState: DWord);
    procedure wp_tablet_tool_v2_frame(AWpTabletToolV2: TWpTabletToolV2; ATime: DWord);
  end;

  IWpTabletV2Listener = interface
  ['IWpTabletV2Listener']
    procedure wp_tablet_v2_name(AWpTabletV2: TWpTabletV2; AName: String);
    procedure wp_tablet_v2_id(AWpTabletV2: TWpTabletV2; AVid: DWord; APid: DWord);
    procedure wp_tablet_v2_path(AWpTabletV2: TWpTabletV2; APath: String);
    procedure wp_tablet_v2_done(AWpTabletV2: TWpTabletV2);
    procedure wp_tablet_v2_removed(AWpTabletV2: TWpTabletV2);
    procedure wp_tablet_v2_bustype(AWpTabletV2: TWpTabletV2; ABustype: DWord);
  end;

  IWpTabletPadRingV2Listener = interface
  ['IWpTabletPadRingV2Listener']
    procedure wp_tablet_pad_ring_v2_source(AWpTabletPadRingV2: TWpTabletPadRingV2; ASource: DWord);
    procedure wp_tablet_pad_ring_v2_angle(AWpTabletPadRingV2: TWpTabletPadRingV2; ADegrees: Longint{24.8});
    procedure wp_tablet_pad_ring_v2_stop(AWpTabletPadRingV2: TWpTabletPadRingV2);
    procedure wp_tablet_pad_ring_v2_frame(AWpTabletPadRingV2: TWpTabletPadRingV2; ATime: DWord);
  end;

  IWpTabletPadStripV2Listener = interface
  ['IWpTabletPadStripV2Listener']
    procedure wp_tablet_pad_strip_v2_source(AWpTabletPadStripV2: TWpTabletPadStripV2; ASource: DWord);
    procedure wp_tablet_pad_strip_v2_position(AWpTabletPadStripV2: TWpTabletPadStripV2; APosition: DWord);
    procedure wp_tablet_pad_strip_v2_stop(AWpTabletPadStripV2: TWpTabletPadStripV2);
    procedure wp_tablet_pad_strip_v2_frame(AWpTabletPadStripV2: TWpTabletPadStripV2; ATime: DWord);
  end;

  IWpTabletPadGroupV2Listener = interface
  ['IWpTabletPadGroupV2Listener']
    procedure wp_tablet_pad_group_v2_buttons(AWpTabletPadGroupV2: TWpTabletPadGroupV2; AButtons: Pwl_array);
    procedure wp_tablet_pad_group_v2_ring(AWpTabletPadGroupV2: TWpTabletPadGroupV2; ARing: TWpTabletPadRingV2);
    procedure wp_tablet_pad_group_v2_strip(AWpTabletPadGroupV2: TWpTabletPadGroupV2; AStrip: TWpTabletPadStripV2);
    procedure wp_tablet_pad_group_v2_modes(AWpTabletPadGroupV2: TWpTabletPadGroupV2; AModes: DWord);
    procedure wp_tablet_pad_group_v2_done(AWpTabletPadGroupV2: TWpTabletPadGroupV2);
    procedure wp_tablet_pad_group_v2_mode_switch(AWpTabletPadGroupV2: TWpTabletPadGroupV2; ATime: DWord; ASerial: DWord; AMode: DWord);
    procedure wp_tablet_pad_group_v2_dial(AWpTabletPadGroupV2: TWpTabletPadGroupV2; ADial: TWpTabletPadDialV2);
  end;

  IWpTabletPadV2Listener = interface
  ['IWpTabletPadV2Listener']
    procedure wp_tablet_pad_v2_group(AWpTabletPadV2: TWpTabletPadV2; APadGroup: TWpTabletPadGroupV2);
    procedure wp_tablet_pad_v2_path(AWpTabletPadV2: TWpTabletPadV2; APath: String);
    procedure wp_tablet_pad_v2_buttons(AWpTabletPadV2: TWpTabletPadV2; AButtons: DWord);
    procedure wp_tablet_pad_v2_done(AWpTabletPadV2: TWpTabletPadV2);
    procedure wp_tablet_pad_v2_button(AWpTabletPadV2: TWpTabletPadV2; ATime: DWord; AButton: DWord; AState: DWord);
    procedure wp_tablet_pad_v2_enter(AWpTabletPadV2: TWpTabletPadV2; ASerial: DWord; ATablet: TWpTabletV2; ASurface: TWlSurface);
    procedure wp_tablet_pad_v2_leave(AWpTabletPadV2: TWpTabletPadV2; ASerial: DWord; ASurface: TWlSurface);
    procedure wp_tablet_pad_v2_removed(AWpTabletPadV2: TWpTabletPadV2);
  end;

  IWpTabletPadDialV2Listener = interface
  ['IWpTabletPadDialV2Listener']
    procedure wp_tablet_pad_dial_v2_delta(AWpTabletPadDialV2: TWpTabletPadDialV2; AValue120: LongInt);
    procedure wp_tablet_pad_dial_v2_frame(AWpTabletPadDialV2: TWpTabletPadDialV2; ATime: DWord);
  end;




  TWpTabletManagerV2 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletManagerV2;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _GET_TABLET_SEAT = 0;
    const _DESTROY = 1;
  public
    function GetTabletSeat(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TWpTabletSeatV2}): TWpTabletSeatV2;
    destructor Destroy; override;
    function AddListener(AIntf: IWpTabletManagerV2Listener): LongInt;
  end;

  TWpTabletSeatV2 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletSeatV2;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpTabletSeatV2Listener): LongInt;
  end;

  TWpTabletToolV2 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletToolV2;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _SET_CURSOR = 0;
    const _DESTROY = 1;
  public
    procedure SetCursor(ASerial: DWord; ASurface: TWlSurface; AHotspotX: LongInt; AHotspotY: LongInt);
    destructor Destroy; override;
    function AddListener(AIntf: IWpTabletToolV2Listener): LongInt;
  end;

  TWpTabletV2 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletV2;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpTabletV2Listener): LongInt;
  end;

  TWpTabletPadRingV2 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletPadRingV2;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _SET_FEEDBACK = 0;
    const _DESTROY = 1;
  public
    procedure SetFeedback(ADescription: String; ASerial: DWord);
    destructor Destroy; override;
    function AddListener(AIntf: IWpTabletPadRingV2Listener): LongInt;
  end;

  TWpTabletPadStripV2 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletPadStripV2;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _SET_FEEDBACK = 0;
    const _DESTROY = 1;
  public
    procedure SetFeedback(ADescription: String; ASerial: DWord);
    destructor Destroy; override;
    function AddListener(AIntf: IWpTabletPadStripV2Listener): LongInt;
  end;

  TWpTabletPadGroupV2 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletPadGroupV2;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpTabletPadGroupV2Listener): LongInt;
  end;

  TWpTabletPadV2 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletPadV2;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _SET_FEEDBACK = 0;
    const _DESTROY = 1;
  public
    procedure SetFeedback(AButton: DWord; ADescription: String; ASerial: DWord);
    destructor Destroy; override;
    function AddListener(AIntf: IWpTabletPadV2Listener): LongInt;
  end;

  TWpTabletPadDialV2 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletPadDialV2;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _SET_FEEDBACK = 0;
    const _DESTROY = 1;
  public
    procedure SetFeedback(ADescription: String; ASerial: DWord);
    destructor Destroy; override;
    function AddListener(AIntf: IWpTabletPadDialV2Listener): LongInt;
  end;






var
  wp_tablet_manager_v2_interface: Twl_interface;
  WP_TABLET_MANAGER_V2_INTERFACE_NAME: String = 'zwp_tablet_manager_v2';
  wp_tablet_seat_v2_interface: Twl_interface;
  WP_TABLET_SEAT_V2_INTERFACE_NAME: String = 'zwp_tablet_seat_v2';
  wp_tablet_tool_v2_interface: Twl_interface;
  WP_TABLET_TOOL_V2_INTERFACE_NAME: String = 'zwp_tablet_tool_v2';
  wp_tablet_v2_interface: Twl_interface;
  WP_TABLET_V2_INTERFACE_NAME: String = 'zwp_tablet_v2';
  wp_tablet_pad_ring_v2_interface: Twl_interface;
  WP_TABLET_PAD_RING_V2_INTERFACE_NAME: String = 'zwp_tablet_pad_ring_v2';
  wp_tablet_pad_strip_v2_interface: Twl_interface;
  WP_TABLET_PAD_STRIP_V2_INTERFACE_NAME: String = 'zwp_tablet_pad_strip_v2';
  wp_tablet_pad_group_v2_interface: Twl_interface;
  WP_TABLET_PAD_GROUP_V2_INTERFACE_NAME: String = 'zwp_tablet_pad_group_v2';
  wp_tablet_pad_v2_interface: Twl_interface;
  WP_TABLET_PAD_V2_INTERFACE_NAME: String = 'zwp_tablet_pad_v2';
  wp_tablet_pad_dial_v2_interface: Twl_interface;
  WP_TABLET_PAD_DIAL_V2_INTERFACE_NAME: String = 'zwp_tablet_pad_dial_v2';



implementation

var
  vwp_tablet_manager_v2_registered: Boolean = False;
  vIntf_wp_tablet_manager_v2_Listener: Twp_tablet_manager_v2_listener;
  vwp_tablet_seat_v2_registered: Boolean = False;
  vIntf_wp_tablet_seat_v2_Listener: Twp_tablet_seat_v2_listener;
  vwp_tablet_tool_v2_registered: Boolean = False;
  vIntf_wp_tablet_tool_v2_Listener: Twp_tablet_tool_v2_listener;
  vwp_tablet_v2_registered: Boolean = False;
  vIntf_wp_tablet_v2_Listener: Twp_tablet_v2_listener;
  vwp_tablet_pad_ring_v2_registered: Boolean = False;
  vIntf_wp_tablet_pad_ring_v2_Listener: Twp_tablet_pad_ring_v2_listener;
  vwp_tablet_pad_strip_v2_registered: Boolean = False;
  vIntf_wp_tablet_pad_strip_v2_Listener: Twp_tablet_pad_strip_v2_listener;
  vwp_tablet_pad_group_v2_registered: Boolean = False;
  vIntf_wp_tablet_pad_group_v2_Listener: Twp_tablet_pad_group_v2_listener;
  vwp_tablet_pad_v2_registered: Boolean = False;
  vIntf_wp_tablet_pad_v2_Listener: Twp_tablet_pad_v2_listener;
  vwp_tablet_pad_dial_v2_registered: Boolean = False;
  vIntf_wp_tablet_pad_dial_v2_Listener: Twp_tablet_pad_dial_v2_listener;



constructor TWpTabletManagerV2.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpTabletManagerV2.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletManagerV2;
begin
  RegisterInterface;
  Result := TWpTabletManagerV2.Create(ARegistry.Bind(AName, @wp_tablet_manager_v2_interface, AVersion));
end;

function TWpTabletManagerV2.GetTabletSeat(ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TWpTabletSeatV2}): TWpTabletSeatV2;
var
  tablet_seat: Pwl_proxy;
begin
  TWpTabletSeatV2.RegisterInterface;
  tablet_seat := wl_proxy_marshal_constructor(FProxy,
      _GET_TABLET_SEAT, @wp_tablet_seat_v2_interface, nil, ASeat.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpTabletSeatV2;
  Result := TWpTabletSeatV2(AProxyClass.Create(tablet_seat));
  if not AProxyClass.InheritsFrom(TWpTabletSeatV2) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpTabletSeatV2]);
end;

destructor TWpTabletManagerV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpTabletManagerV2.AddListener(AIntf: IWpTabletManagerV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_tablet_manager_v2_Listener, @FUserDataRec);
end;
constructor TWpTabletSeatV2.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpTabletSeatV2.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletSeatV2;
begin
  RegisterInterface;
  Result := TWpTabletSeatV2.Create(ARegistry.Bind(AName, @wp_tablet_seat_v2_interface, AVersion));
end;

destructor TWpTabletSeatV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpTabletSeatV2.AddListener(AIntf: IWpTabletSeatV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_tablet_seat_v2_Listener, @FUserDataRec);
end;
constructor TWpTabletToolV2.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpTabletToolV2.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletToolV2;
begin
  RegisterInterface;
  Result := TWpTabletToolV2.Create(ARegistry.Bind(AName, @wp_tablet_tool_v2_interface, AVersion));
end;

procedure TWpTabletToolV2.SetCursor(ASerial: DWord; ASurface: TWlSurface; AHotspotX: LongInt; AHotspotY: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_CURSOR, ASerial, ASurface.Proxy, AHotspotX, AHotspotY);
end;

destructor TWpTabletToolV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpTabletToolV2.AddListener(AIntf: IWpTabletToolV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_tablet_tool_v2_Listener, @FUserDataRec);
end;
constructor TWpTabletV2.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpTabletV2.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletV2;
begin
  RegisterInterface;
  Result := TWpTabletV2.Create(ARegistry.Bind(AName, @wp_tablet_v2_interface, AVersion));
end;

destructor TWpTabletV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpTabletV2.AddListener(AIntf: IWpTabletV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_tablet_v2_Listener, @FUserDataRec);
end;
constructor TWpTabletPadRingV2.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpTabletPadRingV2.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletPadRingV2;
begin
  RegisterInterface;
  Result := TWpTabletPadRingV2.Create(ARegistry.Bind(AName, @wp_tablet_pad_ring_v2_interface, AVersion));
end;

procedure TWpTabletPadRingV2.SetFeedback(ADescription: String; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_FEEDBACK, PChar(ADescription), ASerial);
end;

destructor TWpTabletPadRingV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpTabletPadRingV2.AddListener(AIntf: IWpTabletPadRingV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_tablet_pad_ring_v2_Listener, @FUserDataRec);
end;
constructor TWpTabletPadStripV2.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpTabletPadStripV2.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletPadStripV2;
begin
  RegisterInterface;
  Result := TWpTabletPadStripV2.Create(ARegistry.Bind(AName, @wp_tablet_pad_strip_v2_interface, AVersion));
end;

procedure TWpTabletPadStripV2.SetFeedback(ADescription: String; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_FEEDBACK, PChar(ADescription), ASerial);
end;

destructor TWpTabletPadStripV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpTabletPadStripV2.AddListener(AIntf: IWpTabletPadStripV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_tablet_pad_strip_v2_Listener, @FUserDataRec);
end;
constructor TWpTabletPadGroupV2.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpTabletPadGroupV2.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletPadGroupV2;
begin
  RegisterInterface;
  Result := TWpTabletPadGroupV2.Create(ARegistry.Bind(AName, @wp_tablet_pad_group_v2_interface, AVersion));
end;

destructor TWpTabletPadGroupV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpTabletPadGroupV2.AddListener(AIntf: IWpTabletPadGroupV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_tablet_pad_group_v2_Listener, @FUserDataRec);
end;
constructor TWpTabletPadV2.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpTabletPadV2.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletPadV2;
begin
  RegisterInterface;
  Result := TWpTabletPadV2.Create(ARegistry.Bind(AName, @wp_tablet_pad_v2_interface, AVersion));
end;

procedure TWpTabletPadV2.SetFeedback(AButton: DWord; ADescription: String; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_FEEDBACK, AButton, PChar(ADescription), ASerial);
end;

destructor TWpTabletPadV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpTabletPadV2.AddListener(AIntf: IWpTabletPadV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_tablet_pad_v2_Listener, @FUserDataRec);
end;
constructor TWpTabletPadDialV2.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpTabletPadDialV2.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpTabletPadDialV2;
begin
  RegisterInterface;
  Result := TWpTabletPadDialV2.Create(ARegistry.Bind(AName, @wp_tablet_pad_dial_v2_interface, AVersion));
end;

procedure TWpTabletPadDialV2.SetFeedback(ADescription: String; ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_FEEDBACK, PChar(ADescription), ASerial);
end;

destructor TWpTabletPadDialV2.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpTabletPadDialV2.AddListener(AIntf: IWpTabletPadDialV2Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_tablet_pad_dial_v2_Listener, @FUserDataRec);
end;




procedure wp_tablet_seat_v2_tablet_added_Intf(AData: PWLUserData; Awp_tablet_seat_v2: Pwp_tablet_seat_v2; AId: Pwp_tablet_v2); cdecl;
var
  AIntf: IWpTabletSeatV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletSeatV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_seat_v2_tablet_added(TWpTabletSeatV2(AData^.PascalObject),  TWpTabletV2.Create(AId));
end;

procedure wp_tablet_seat_v2_tool_added_Intf(AData: PWLUserData; Awp_tablet_seat_v2: Pwp_tablet_seat_v2; AId: Pwp_tablet_tool_v2); cdecl;
var
  AIntf: IWpTabletSeatV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletSeatV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_seat_v2_tool_added(TWpTabletSeatV2(AData^.PascalObject),  TWpTabletToolV2.Create(AId));
end;

procedure wp_tablet_seat_v2_pad_added_Intf(AData: PWLUserData; Awp_tablet_seat_v2: Pwp_tablet_seat_v2; AId: Pwp_tablet_pad_v2); cdecl;
var
  AIntf: IWpTabletSeatV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletSeatV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_seat_v2_pad_added(TWpTabletSeatV2(AData^.PascalObject),  TWpTabletPadV2.Create(AId));
end;

procedure wp_tablet_tool_v2_type_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2; AToolType: DWord); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_type(TWpTabletToolV2(AData^.PascalObject), AToolType);
end;

procedure wp_tablet_tool_v2_hardware_serial_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2; AHardwareSerialHi: DWord; AHardwareSerialLo: DWord); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_hardware_serial(TWpTabletToolV2(AData^.PascalObject), AHardwareSerialHi, AHardwareSerialLo);
end;

procedure wp_tablet_tool_v2_hardware_id_wacom_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2; AHardwareIdHi: DWord; AHardwareIdLo: DWord); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_hardware_id_wacom(TWpTabletToolV2(AData^.PascalObject), AHardwareIdHi, AHardwareIdLo);
end;

procedure wp_tablet_tool_v2_capability_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2; ACapability: DWord); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_capability(TWpTabletToolV2(AData^.PascalObject), ACapability);
end;

procedure wp_tablet_tool_v2_done_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_done(TWpTabletToolV2(AData^.PascalObject));
end;

procedure wp_tablet_tool_v2_removed_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_removed(TWpTabletToolV2(AData^.PascalObject));
end;

procedure wp_tablet_tool_v2_proximity_in_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2; ASerial: DWord; ATablet: Pwp_tablet_v2; ASurface: Pwl_surface); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_proximity_in(TWpTabletToolV2(AData^.PascalObject), ASerial,  TWpTabletV2(TWLProxyObject.WLToObj(ATablet)),  TWlSurface(TWLProxyObject.WLToObj(ASurface)));
end;

procedure wp_tablet_tool_v2_proximity_out_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_proximity_out(TWpTabletToolV2(AData^.PascalObject));
end;

procedure wp_tablet_tool_v2_down_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2; ASerial: DWord); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_down(TWpTabletToolV2(AData^.PascalObject), ASerial);
end;

procedure wp_tablet_tool_v2_up_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_up(TWpTabletToolV2(AData^.PascalObject));
end;

procedure wp_tablet_tool_v2_motion_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2; AX: Longint{24.8}; AY: Longint{24.8}); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_motion(TWpTabletToolV2(AData^.PascalObject), AX, AY);
end;

procedure wp_tablet_tool_v2_pressure_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2; APressure: DWord); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_pressure(TWpTabletToolV2(AData^.PascalObject), APressure);
end;

procedure wp_tablet_tool_v2_distance_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2; ADistance: DWord); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_distance(TWpTabletToolV2(AData^.PascalObject), ADistance);
end;

procedure wp_tablet_tool_v2_tilt_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2; ATiltX: Longint{24.8}; ATiltY: Longint{24.8}); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_tilt(TWpTabletToolV2(AData^.PascalObject), ATiltX, ATiltY);
end;

procedure wp_tablet_tool_v2_rotation_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2; ADegrees: Longint{24.8}); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_rotation(TWpTabletToolV2(AData^.PascalObject), ADegrees);
end;

procedure wp_tablet_tool_v2_slider_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2; APosition: LongInt); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_slider(TWpTabletToolV2(AData^.PascalObject), APosition);
end;

procedure wp_tablet_tool_v2_wheel_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2; ADegrees: Longint{24.8}; AClicks: LongInt); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_wheel(TWpTabletToolV2(AData^.PascalObject), ADegrees, AClicks);
end;

procedure wp_tablet_tool_v2_button_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2; ASerial: DWord; AButton: DWord; AState: DWord); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_button(TWpTabletToolV2(AData^.PascalObject), ASerial, AButton, AState);
end;

procedure wp_tablet_tool_v2_frame_Intf(AData: PWLUserData; Awp_tablet_tool_v2: Pwp_tablet_tool_v2; ATime: DWord); cdecl;
var
  AIntf: IWpTabletToolV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletToolV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_tool_v2_frame(TWpTabletToolV2(AData^.PascalObject), ATime);
end;

procedure wp_tablet_v2_name_Intf(AData: PWLUserData; Awp_tablet_v2: Pwp_tablet_v2; AName: Pchar); cdecl;
var
  AIntf: IWpTabletV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_v2_name(TWpTabletV2(AData^.PascalObject), AName);
end;

procedure wp_tablet_v2_id_Intf(AData: PWLUserData; Awp_tablet_v2: Pwp_tablet_v2; AVid: DWord; APid: DWord); cdecl;
var
  AIntf: IWpTabletV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_v2_id(TWpTabletV2(AData^.PascalObject), AVid, APid);
end;

procedure wp_tablet_v2_path_Intf(AData: PWLUserData; Awp_tablet_v2: Pwp_tablet_v2; APath: Pchar); cdecl;
var
  AIntf: IWpTabletV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_v2_path(TWpTabletV2(AData^.PascalObject), APath);
end;

procedure wp_tablet_v2_done_Intf(AData: PWLUserData; Awp_tablet_v2: Pwp_tablet_v2); cdecl;
var
  AIntf: IWpTabletV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_v2_done(TWpTabletV2(AData^.PascalObject));
end;

procedure wp_tablet_v2_removed_Intf(AData: PWLUserData; Awp_tablet_v2: Pwp_tablet_v2); cdecl;
var
  AIntf: IWpTabletV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_v2_removed(TWpTabletV2(AData^.PascalObject));
end;

procedure wp_tablet_v2_bustype_Intf(AData: PWLUserData; Awp_tablet_v2: Pwp_tablet_v2; ABustype: DWord); cdecl;
var
  AIntf: IWpTabletV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_v2_bustype(TWpTabletV2(AData^.PascalObject), ABustype);
end;

procedure wp_tablet_pad_ring_v2_source_Intf(AData: PWLUserData; Awp_tablet_pad_ring_v2: Pwp_tablet_pad_ring_v2; ASource: DWord); cdecl;
var
  AIntf: IWpTabletPadRingV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadRingV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_ring_v2_source(TWpTabletPadRingV2(AData^.PascalObject), ASource);
end;

procedure wp_tablet_pad_ring_v2_angle_Intf(AData: PWLUserData; Awp_tablet_pad_ring_v2: Pwp_tablet_pad_ring_v2; ADegrees: Longint{24.8}); cdecl;
var
  AIntf: IWpTabletPadRingV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadRingV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_ring_v2_angle(TWpTabletPadRingV2(AData^.PascalObject), ADegrees);
end;

procedure wp_tablet_pad_ring_v2_stop_Intf(AData: PWLUserData; Awp_tablet_pad_ring_v2: Pwp_tablet_pad_ring_v2); cdecl;
var
  AIntf: IWpTabletPadRingV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadRingV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_ring_v2_stop(TWpTabletPadRingV2(AData^.PascalObject));
end;

procedure wp_tablet_pad_ring_v2_frame_Intf(AData: PWLUserData; Awp_tablet_pad_ring_v2: Pwp_tablet_pad_ring_v2; ATime: DWord); cdecl;
var
  AIntf: IWpTabletPadRingV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadRingV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_ring_v2_frame(TWpTabletPadRingV2(AData^.PascalObject), ATime);
end;

procedure wp_tablet_pad_strip_v2_source_Intf(AData: PWLUserData; Awp_tablet_pad_strip_v2: Pwp_tablet_pad_strip_v2; ASource: DWord); cdecl;
var
  AIntf: IWpTabletPadStripV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadStripV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_strip_v2_source(TWpTabletPadStripV2(AData^.PascalObject), ASource);
end;

procedure wp_tablet_pad_strip_v2_position_Intf(AData: PWLUserData; Awp_tablet_pad_strip_v2: Pwp_tablet_pad_strip_v2; APosition: DWord); cdecl;
var
  AIntf: IWpTabletPadStripV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadStripV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_strip_v2_position(TWpTabletPadStripV2(AData^.PascalObject), APosition);
end;

procedure wp_tablet_pad_strip_v2_stop_Intf(AData: PWLUserData; Awp_tablet_pad_strip_v2: Pwp_tablet_pad_strip_v2); cdecl;
var
  AIntf: IWpTabletPadStripV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadStripV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_strip_v2_stop(TWpTabletPadStripV2(AData^.PascalObject));
end;

procedure wp_tablet_pad_strip_v2_frame_Intf(AData: PWLUserData; Awp_tablet_pad_strip_v2: Pwp_tablet_pad_strip_v2; ATime: DWord); cdecl;
var
  AIntf: IWpTabletPadStripV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadStripV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_strip_v2_frame(TWpTabletPadStripV2(AData^.PascalObject), ATime);
end;

procedure wp_tablet_pad_group_v2_buttons_Intf(AData: PWLUserData; Awp_tablet_pad_group_v2: Pwp_tablet_pad_group_v2; AButtons: Pwl_array); cdecl;
var
  AIntf: IWpTabletPadGroupV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadGroupV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_group_v2_buttons(TWpTabletPadGroupV2(AData^.PascalObject), AButtons);
end;

procedure wp_tablet_pad_group_v2_ring_Intf(AData: PWLUserData; Awp_tablet_pad_group_v2: Pwp_tablet_pad_group_v2; ARing: Pwp_tablet_pad_ring_v2); cdecl;
var
  AIntf: IWpTabletPadGroupV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadGroupV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_group_v2_ring(TWpTabletPadGroupV2(AData^.PascalObject),  TWpTabletPadRingV2.Create(ARing));
end;

procedure wp_tablet_pad_group_v2_strip_Intf(AData: PWLUserData; Awp_tablet_pad_group_v2: Pwp_tablet_pad_group_v2; AStrip: Pwp_tablet_pad_strip_v2); cdecl;
var
  AIntf: IWpTabletPadGroupV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadGroupV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_group_v2_strip(TWpTabletPadGroupV2(AData^.PascalObject),  TWpTabletPadStripV2.Create(AStrip));
end;

procedure wp_tablet_pad_group_v2_modes_Intf(AData: PWLUserData; Awp_tablet_pad_group_v2: Pwp_tablet_pad_group_v2; AModes: DWord); cdecl;
var
  AIntf: IWpTabletPadGroupV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadGroupV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_group_v2_modes(TWpTabletPadGroupV2(AData^.PascalObject), AModes);
end;

procedure wp_tablet_pad_group_v2_done_Intf(AData: PWLUserData; Awp_tablet_pad_group_v2: Pwp_tablet_pad_group_v2); cdecl;
var
  AIntf: IWpTabletPadGroupV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadGroupV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_group_v2_done(TWpTabletPadGroupV2(AData^.PascalObject));
end;

procedure wp_tablet_pad_group_v2_mode_switch_Intf(AData: PWLUserData; Awp_tablet_pad_group_v2: Pwp_tablet_pad_group_v2; ATime: DWord; ASerial: DWord; AMode: DWord); cdecl;
var
  AIntf: IWpTabletPadGroupV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadGroupV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_group_v2_mode_switch(TWpTabletPadGroupV2(AData^.PascalObject), ATime, ASerial, AMode);
end;

procedure wp_tablet_pad_group_v2_dial_Intf(AData: PWLUserData; Awp_tablet_pad_group_v2: Pwp_tablet_pad_group_v2; ADial: Pwp_tablet_pad_dial_v2); cdecl;
var
  AIntf: IWpTabletPadGroupV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadGroupV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_group_v2_dial(TWpTabletPadGroupV2(AData^.PascalObject),  TWpTabletPadDialV2.Create(ADial));
end;

procedure wp_tablet_pad_v2_group_Intf(AData: PWLUserData; Awp_tablet_pad_v2: Pwp_tablet_pad_v2; APadGroup: Pwp_tablet_pad_group_v2); cdecl;
var
  AIntf: IWpTabletPadV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_v2_group(TWpTabletPadV2(AData^.PascalObject),  TWpTabletPadGroupV2.Create(APadGroup));
end;

procedure wp_tablet_pad_v2_path_Intf(AData: PWLUserData; Awp_tablet_pad_v2: Pwp_tablet_pad_v2; APath: Pchar); cdecl;
var
  AIntf: IWpTabletPadV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_v2_path(TWpTabletPadV2(AData^.PascalObject), APath);
end;

procedure wp_tablet_pad_v2_buttons_Intf(AData: PWLUserData; Awp_tablet_pad_v2: Pwp_tablet_pad_v2; AButtons: DWord); cdecl;
var
  AIntf: IWpTabletPadV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_v2_buttons(TWpTabletPadV2(AData^.PascalObject), AButtons);
end;

procedure wp_tablet_pad_v2_done_Intf(AData: PWLUserData; Awp_tablet_pad_v2: Pwp_tablet_pad_v2); cdecl;
var
  AIntf: IWpTabletPadV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_v2_done(TWpTabletPadV2(AData^.PascalObject));
end;

procedure wp_tablet_pad_v2_button_Intf(AData: PWLUserData; Awp_tablet_pad_v2: Pwp_tablet_pad_v2; ATime: DWord; AButton: DWord; AState: DWord); cdecl;
var
  AIntf: IWpTabletPadV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_v2_button(TWpTabletPadV2(AData^.PascalObject), ATime, AButton, AState);
end;

procedure wp_tablet_pad_v2_enter_Intf(AData: PWLUserData; Awp_tablet_pad_v2: Pwp_tablet_pad_v2; ASerial: DWord; ATablet: Pwp_tablet_v2; ASurface: Pwl_surface); cdecl;
var
  AIntf: IWpTabletPadV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_v2_enter(TWpTabletPadV2(AData^.PascalObject), ASerial,  TWpTabletV2(TWLProxyObject.WLToObj(ATablet)),  TWlSurface(TWLProxyObject.WLToObj(ASurface)));
end;

procedure wp_tablet_pad_v2_leave_Intf(AData: PWLUserData; Awp_tablet_pad_v2: Pwp_tablet_pad_v2; ASerial: DWord; ASurface: Pwl_surface); cdecl;
var
  AIntf: IWpTabletPadV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_v2_leave(TWpTabletPadV2(AData^.PascalObject), ASerial,  TWlSurface(TWLProxyObject.WLToObj(ASurface)));
end;

procedure wp_tablet_pad_v2_removed_Intf(AData: PWLUserData; Awp_tablet_pad_v2: Pwp_tablet_pad_v2); cdecl;
var
  AIntf: IWpTabletPadV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_v2_removed(TWpTabletPadV2(AData^.PascalObject));
end;

procedure wp_tablet_pad_dial_v2_delta_Intf(AData: PWLUserData; Awp_tablet_pad_dial_v2: Pwp_tablet_pad_dial_v2; AValue120: LongInt); cdecl;
var
  AIntf: IWpTabletPadDialV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadDialV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_dial_v2_delta(TWpTabletPadDialV2(AData^.PascalObject), AValue120);
end;

procedure wp_tablet_pad_dial_v2_frame_Intf(AData: PWLUserData; Awp_tablet_pad_dial_v2: Pwp_tablet_pad_dial_v2; ATime: DWord); cdecl;
var
  AIntf: IWpTabletPadDialV2Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpTabletPadDialV2Listener(AData^.ListenerUserData);
  AIntf.wp_tablet_pad_dial_v2_frame(TWpTabletPadDialV2(AData^.PascalObject), ATime);
end;



const
  pInterfaces: array[0..28] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wp_tablet_seat_v2_interface),
    (@wl_seat_interface),
    (@wp_tablet_v2_interface),
    (@wp_tablet_tool_v2_interface),
    (@wp_tablet_pad_v2_interface),
    (nil),
    (@wl_surface_interface),
    (nil),
    (nil),
    (nil),
    (@wp_tablet_v2_interface),
    (@wl_surface_interface),
    (@wp_tablet_pad_ring_v2_interface),
    (@wp_tablet_pad_strip_v2_interface),
    (@wp_tablet_pad_dial_v2_interface),
    (@wp_tablet_pad_group_v2_interface),
    (nil),
    (@wp_tablet_v2_interface),
    (@wl_surface_interface),
    (nil),
    (@wl_surface_interface)
  );

  wp_tablet_manager_v2_requests: array[0..1] of Twl_message = (
    (name: 'get_tablet_seat'; signature: 'no'; types: @pInterfaces[8]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_tablet_seat_v2_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_tablet_seat_v2_events: array[0..2] of Twl_message = (
    (name: 'tablet_added'; signature: 'n'; types: @pInterfaces[10]),
    (name: 'tool_added'; signature: 'n'; types: @pInterfaces[11]),
    (name: 'pad_added'; signature: 'n'; types: @pInterfaces[12])
  );
  wp_tablet_tool_v2_requests: array[0..1] of Twl_message = (
    (name: 'set_cursor'; signature: 'u?oii'; types: @pInterfaces[13]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_tablet_tool_v2_events: array[0..18] of Twl_message = (
    (name: 'type'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'hardware_serial'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'hardware_id_wacom'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'capability'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'removed'; signature: ''; types: @pInterfaces[0]),
    (name: 'proximity_in'; signature: 'uoo'; types: @pInterfaces[17]),
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
  wp_tablet_v2_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_tablet_v2_events: array[0..5] of Twl_message = (
    (name: 'name'; signature: 's'; types: @pInterfaces[0]),
    (name: 'id'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'path'; signature: 's'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'removed'; signature: ''; types: @pInterfaces[0]),
    (name: 'bustype'; signature: '2u'; types: @pInterfaces[0])
  );
  wp_tablet_pad_ring_v2_requests: array[0..1] of Twl_message = (
    (name: 'set_feedback'; signature: 'su'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_tablet_pad_ring_v2_events: array[0..3] of Twl_message = (
    (name: 'source'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'angle'; signature: 'f'; types: @pInterfaces[0]),
    (name: 'stop'; signature: ''; types: @pInterfaces[0]),
    (name: 'frame'; signature: 'u'; types: @pInterfaces[0])
  );
  wp_tablet_pad_strip_v2_requests: array[0..1] of Twl_message = (
    (name: 'set_feedback'; signature: 'su'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_tablet_pad_strip_v2_events: array[0..3] of Twl_message = (
    (name: 'source'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'position'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'stop'; signature: ''; types: @pInterfaces[0]),
    (name: 'frame'; signature: 'u'; types: @pInterfaces[0])
  );
  wp_tablet_pad_group_v2_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_tablet_pad_group_v2_events: array[0..6] of Twl_message = (
    (name: 'buttons'; signature: 'a'; types: @pInterfaces[0]),
    (name: 'ring'; signature: 'n'; types: @pInterfaces[20]),
    (name: 'strip'; signature: 'n'; types: @pInterfaces[21]),
    (name: 'modes'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'mode_switch'; signature: 'uuu'; types: @pInterfaces[0]),
    (name: 'dial'; signature: '2n'; types: @pInterfaces[22])
  );
  wp_tablet_pad_v2_requests: array[0..1] of Twl_message = (
    (name: 'set_feedback'; signature: 'usu'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_tablet_pad_v2_events: array[0..7] of Twl_message = (
    (name: 'group'; signature: 'n'; types: @pInterfaces[23]),
    (name: 'path'; signature: 's'; types: @pInterfaces[0]),
    (name: 'buttons'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'button'; signature: 'uuu'; types: @pInterfaces[0]),
    (name: 'enter'; signature: 'uoo'; types: @pInterfaces[24]),
    (name: 'leave'; signature: 'uo'; types: @pInterfaces[27]),
    (name: 'removed'; signature: ''; types: @pInterfaces[0])
  );
  wp_tablet_pad_dial_v2_requests: array[0..1] of Twl_message = (
    (name: 'set_feedback'; signature: 'su'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_tablet_pad_dial_v2_events: array[0..1] of Twl_message = (
    (name: 'delta'; signature: 'i'; types: @pInterfaces[0]),
    (name: 'frame'; signature: 'u'; types: @pInterfaces[0])
  );

class procedure TWpTabletManagerV2.RegisterInterface;
begin
  if vwp_tablet_manager_v2_registered then Exit;
  vwp_tablet_manager_v2_registered := True;
  wp_tablet_manager_v2_interface.name := PChar(WP_TABLET_MANAGER_V2_INTERFACE_NAME);
  wp_tablet_manager_v2_interface.version := 2;
  wp_tablet_manager_v2_interface.method_count := 2;
  wp_tablet_manager_v2_interface.methods := @wp_tablet_manager_v2_requests;
  wp_tablet_manager_v2_interface.event_count := 0;
  wp_tablet_manager_v2_interface.events := nil;
end;

class procedure TWpTabletSeatV2.RegisterInterface;
begin
  if vwp_tablet_seat_v2_registered then Exit;
  vwp_tablet_seat_v2_registered := True;
  Pointer(vIntf_wp_tablet_seat_v2_Listener.tablet_added) := @wp_tablet_seat_v2_tablet_added_Intf;
  Pointer(vIntf_wp_tablet_seat_v2_Listener.tool_added) := @wp_tablet_seat_v2_tool_added_Intf;
  Pointer(vIntf_wp_tablet_seat_v2_Listener.pad_added) := @wp_tablet_seat_v2_pad_added_Intf;
  wp_tablet_seat_v2_interface.name := PChar(WP_TABLET_SEAT_V2_INTERFACE_NAME);
  wp_tablet_seat_v2_interface.version := 2;
  wp_tablet_seat_v2_interface.method_count := 1;
  wp_tablet_seat_v2_interface.methods := @wp_tablet_seat_v2_requests;
  wp_tablet_seat_v2_interface.event_count := 3;
  wp_tablet_seat_v2_interface.events := @wp_tablet_seat_v2_events;
end;

class procedure TWpTabletToolV2.RegisterInterface;
begin
  if vwp_tablet_tool_v2_registered then Exit;
  vwp_tablet_tool_v2_registered := True;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.type_) := @wp_tablet_tool_v2_type_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.hardware_serial) := @wp_tablet_tool_v2_hardware_serial_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.hardware_id_wacom) := @wp_tablet_tool_v2_hardware_id_wacom_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.capability) := @wp_tablet_tool_v2_capability_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.done) := @wp_tablet_tool_v2_done_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.removed) := @wp_tablet_tool_v2_removed_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.proximity_in) := @wp_tablet_tool_v2_proximity_in_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.proximity_out) := @wp_tablet_tool_v2_proximity_out_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.down) := @wp_tablet_tool_v2_down_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.up) := @wp_tablet_tool_v2_up_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.motion) := @wp_tablet_tool_v2_motion_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.pressure) := @wp_tablet_tool_v2_pressure_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.distance) := @wp_tablet_tool_v2_distance_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.tilt) := @wp_tablet_tool_v2_tilt_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.rotation) := @wp_tablet_tool_v2_rotation_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.slider) := @wp_tablet_tool_v2_slider_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.wheel) := @wp_tablet_tool_v2_wheel_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.button) := @wp_tablet_tool_v2_button_Intf;
  Pointer(vIntf_wp_tablet_tool_v2_Listener.frame) := @wp_tablet_tool_v2_frame_Intf;
  wp_tablet_tool_v2_interface.name := PChar(WP_TABLET_TOOL_V2_INTERFACE_NAME);
  wp_tablet_tool_v2_interface.version := 2;
  wp_tablet_tool_v2_interface.method_count := 2;
  wp_tablet_tool_v2_interface.methods := @wp_tablet_tool_v2_requests;
  wp_tablet_tool_v2_interface.event_count := 19;
  wp_tablet_tool_v2_interface.events := @wp_tablet_tool_v2_events;
end;

class procedure TWpTabletV2.RegisterInterface;
begin
  if vwp_tablet_v2_registered then Exit;
  vwp_tablet_v2_registered := True;
  Pointer(vIntf_wp_tablet_v2_Listener.name) := @wp_tablet_v2_name_Intf;
  Pointer(vIntf_wp_tablet_v2_Listener.id) := @wp_tablet_v2_id_Intf;
  Pointer(vIntf_wp_tablet_v2_Listener.path) := @wp_tablet_v2_path_Intf;
  Pointer(vIntf_wp_tablet_v2_Listener.done) := @wp_tablet_v2_done_Intf;
  Pointer(vIntf_wp_tablet_v2_Listener.removed) := @wp_tablet_v2_removed_Intf;
  Pointer(vIntf_wp_tablet_v2_Listener.bustype) := @wp_tablet_v2_bustype_Intf;
  wp_tablet_v2_interface.name := PChar(WP_TABLET_V2_INTERFACE_NAME);
  wp_tablet_v2_interface.version := 2;
  wp_tablet_v2_interface.method_count := 1;
  wp_tablet_v2_interface.methods := @wp_tablet_v2_requests;
  wp_tablet_v2_interface.event_count := 6;
  wp_tablet_v2_interface.events := @wp_tablet_v2_events;
end;

class procedure TWpTabletPadRingV2.RegisterInterface;
begin
  if vwp_tablet_pad_ring_v2_registered then Exit;
  vwp_tablet_pad_ring_v2_registered := True;
  Pointer(vIntf_wp_tablet_pad_ring_v2_Listener.source) := @wp_tablet_pad_ring_v2_source_Intf;
  Pointer(vIntf_wp_tablet_pad_ring_v2_Listener.angle) := @wp_tablet_pad_ring_v2_angle_Intf;
  Pointer(vIntf_wp_tablet_pad_ring_v2_Listener.stop) := @wp_tablet_pad_ring_v2_stop_Intf;
  Pointer(vIntf_wp_tablet_pad_ring_v2_Listener.frame) := @wp_tablet_pad_ring_v2_frame_Intf;
  wp_tablet_pad_ring_v2_interface.name := PChar(WP_TABLET_PAD_RING_V2_INTERFACE_NAME);
  wp_tablet_pad_ring_v2_interface.version := 2;
  wp_tablet_pad_ring_v2_interface.method_count := 2;
  wp_tablet_pad_ring_v2_interface.methods := @wp_tablet_pad_ring_v2_requests;
  wp_tablet_pad_ring_v2_interface.event_count := 4;
  wp_tablet_pad_ring_v2_interface.events := @wp_tablet_pad_ring_v2_events;
end;

class procedure TWpTabletPadStripV2.RegisterInterface;
begin
  if vwp_tablet_pad_strip_v2_registered then Exit;
  vwp_tablet_pad_strip_v2_registered := True;
  Pointer(vIntf_wp_tablet_pad_strip_v2_Listener.source) := @wp_tablet_pad_strip_v2_source_Intf;
  Pointer(vIntf_wp_tablet_pad_strip_v2_Listener.position) := @wp_tablet_pad_strip_v2_position_Intf;
  Pointer(vIntf_wp_tablet_pad_strip_v2_Listener.stop) := @wp_tablet_pad_strip_v2_stop_Intf;
  Pointer(vIntf_wp_tablet_pad_strip_v2_Listener.frame) := @wp_tablet_pad_strip_v2_frame_Intf;
  wp_tablet_pad_strip_v2_interface.name := PChar(WP_TABLET_PAD_STRIP_V2_INTERFACE_NAME);
  wp_tablet_pad_strip_v2_interface.version := 2;
  wp_tablet_pad_strip_v2_interface.method_count := 2;
  wp_tablet_pad_strip_v2_interface.methods := @wp_tablet_pad_strip_v2_requests;
  wp_tablet_pad_strip_v2_interface.event_count := 4;
  wp_tablet_pad_strip_v2_interface.events := @wp_tablet_pad_strip_v2_events;
end;

class procedure TWpTabletPadGroupV2.RegisterInterface;
begin
  if vwp_tablet_pad_group_v2_registered then Exit;
  vwp_tablet_pad_group_v2_registered := True;
  Pointer(vIntf_wp_tablet_pad_group_v2_Listener.buttons) := @wp_tablet_pad_group_v2_buttons_Intf;
  Pointer(vIntf_wp_tablet_pad_group_v2_Listener.ring) := @wp_tablet_pad_group_v2_ring_Intf;
  Pointer(vIntf_wp_tablet_pad_group_v2_Listener.strip) := @wp_tablet_pad_group_v2_strip_Intf;
  Pointer(vIntf_wp_tablet_pad_group_v2_Listener.modes) := @wp_tablet_pad_group_v2_modes_Intf;
  Pointer(vIntf_wp_tablet_pad_group_v2_Listener.done) := @wp_tablet_pad_group_v2_done_Intf;
  Pointer(vIntf_wp_tablet_pad_group_v2_Listener.mode_switch) := @wp_tablet_pad_group_v2_mode_switch_Intf;
  Pointer(vIntf_wp_tablet_pad_group_v2_Listener.dial) := @wp_tablet_pad_group_v2_dial_Intf;
  wp_tablet_pad_group_v2_interface.name := PChar(WP_TABLET_PAD_GROUP_V2_INTERFACE_NAME);
  wp_tablet_pad_group_v2_interface.version := 2;
  wp_tablet_pad_group_v2_interface.method_count := 1;
  wp_tablet_pad_group_v2_interface.methods := @wp_tablet_pad_group_v2_requests;
  wp_tablet_pad_group_v2_interface.event_count := 7;
  wp_tablet_pad_group_v2_interface.events := @wp_tablet_pad_group_v2_events;
end;

class procedure TWpTabletPadV2.RegisterInterface;
begin
  if vwp_tablet_pad_v2_registered then Exit;
  vwp_tablet_pad_v2_registered := True;
  Pointer(vIntf_wp_tablet_pad_v2_Listener.group) := @wp_tablet_pad_v2_group_Intf;
  Pointer(vIntf_wp_tablet_pad_v2_Listener.path) := @wp_tablet_pad_v2_path_Intf;
  Pointer(vIntf_wp_tablet_pad_v2_Listener.buttons) := @wp_tablet_pad_v2_buttons_Intf;
  Pointer(vIntf_wp_tablet_pad_v2_Listener.done) := @wp_tablet_pad_v2_done_Intf;
  Pointer(vIntf_wp_tablet_pad_v2_Listener.button) := @wp_tablet_pad_v2_button_Intf;
  Pointer(vIntf_wp_tablet_pad_v2_Listener.enter) := @wp_tablet_pad_v2_enter_Intf;
  Pointer(vIntf_wp_tablet_pad_v2_Listener.leave) := @wp_tablet_pad_v2_leave_Intf;
  Pointer(vIntf_wp_tablet_pad_v2_Listener.removed) := @wp_tablet_pad_v2_removed_Intf;
  wp_tablet_pad_v2_interface.name := PChar(WP_TABLET_PAD_V2_INTERFACE_NAME);
  wp_tablet_pad_v2_interface.version := 2;
  wp_tablet_pad_v2_interface.method_count := 2;
  wp_tablet_pad_v2_interface.methods := @wp_tablet_pad_v2_requests;
  wp_tablet_pad_v2_interface.event_count := 8;
  wp_tablet_pad_v2_interface.events := @wp_tablet_pad_v2_events;
end;

class procedure TWpTabletPadDialV2.RegisterInterface;
begin
  if vwp_tablet_pad_dial_v2_registered then Exit;
  vwp_tablet_pad_dial_v2_registered := True;
  Pointer(vIntf_wp_tablet_pad_dial_v2_Listener.delta) := @wp_tablet_pad_dial_v2_delta_Intf;
  Pointer(vIntf_wp_tablet_pad_dial_v2_Listener.frame) := @wp_tablet_pad_dial_v2_frame_Intf;
  wp_tablet_pad_dial_v2_interface.name := PChar(WP_TABLET_PAD_DIAL_V2_INTERFACE_NAME);
  wp_tablet_pad_dial_v2_interface.version := 2;
  wp_tablet_pad_dial_v2_interface.method_count := 2;
  wp_tablet_pad_dial_v2_interface.methods := @wp_tablet_pad_dial_v2_requests;
  wp_tablet_pad_dial_v2_interface.event_count := 2;
  wp_tablet_pad_dial_v2_interface.events := @wp_tablet_pad_dial_v2_events;
end;


end.
