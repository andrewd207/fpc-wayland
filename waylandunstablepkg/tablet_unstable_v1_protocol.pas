unit tablet_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_tablet_manager_v1 = ^Tzwp_tablet_manager_v1;
  Tzwp_tablet_manager_v1 = record end;
  Pzwp_tablet_seat_v1 = ^Tzwp_tablet_seat_v1;
  Tzwp_tablet_seat_v1 = record end;
  Pzwp_tablet_tool_v1 = ^Tzwp_tablet_tool_v1;
  Tzwp_tablet_tool_v1 = record end;
  Pzwp_tablet_v1 = ^Tzwp_tablet_v1;
  Tzwp_tablet_v1 = record end;
  Pzwp_tablet_manager_v1_listener = ^Tzwp_tablet_manager_v1_listener;
  Tzwp_tablet_manager_v1_listener = record
  end;

  Pzwp_tablet_seat_v1_listener = ^Tzwp_tablet_seat_v1_listener;
  Tzwp_tablet_seat_v1_listener = record
    tablet_added : procedure(data: Pointer; zwp_tablet_seat_v1: Pzwp_tablet_seat_v1; id: Pzwp_tablet_v1); cdecl;
    tool_added : procedure(data: Pointer; zwp_tablet_seat_v1: Pzwp_tablet_seat_v1; id: Pzwp_tablet_tool_v1); cdecl;
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
    type_ : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; tool_type: cuint); cdecl;
    hardware_serial : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; hardware_serial_hi: cuint; hardware_serial_lo: cuint); cdecl;
    hardware_id_wacom : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; hardware_id_hi: cuint; hardware_id_lo: cuint); cdecl;
    capability : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; capability: cuint); cdecl;
    done : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1); cdecl;
    removed : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1); cdecl;
    proximity_in : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; serial: cuint; tablet: Pzwp_tablet_v1; surface: Pwl_surface); cdecl;
    proximity_out : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1); cdecl;
    down : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; serial: cuint); cdecl;
    up : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1); cdecl;
    motion : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; x: cint32; y: cint32); cdecl;
    pressure : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; pressure: cuint); cdecl;
    distance : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; distance: cuint); cdecl;
    tilt : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; tilt_x: cint; tilt_y: cint); cdecl;
    rotation : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; degrees: cint); cdecl;
    slider : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; position: cint); cdecl;
    wheel : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; degrees: cint; clicks: cint); cdecl;
    button : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; serial: cuint; button: cuint; state: cuint); cdecl;
    frame : procedure(data: Pointer; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; time: cuint); cdecl;
  end;

  Pzwp_tablet_v1_listener = ^Tzwp_tablet_v1_listener;
  Tzwp_tablet_v1_listener = record
    name : procedure(data: Pointer; zwp_tablet_v1: Pzwp_tablet_v1; name: pchar); cdecl;
    id : procedure(data: Pointer; zwp_tablet_v1: Pzwp_tablet_v1; vid: cuint; pid: cuint); cdecl;
    path : procedure(data: Pointer; zwp_tablet_v1: Pzwp_tablet_v1; path: pchar); cdecl;
    done : procedure(data: Pointer; zwp_tablet_v1: Pzwp_tablet_v1); cdecl;
    removed : procedure(data: Pointer; zwp_tablet_v1: Pzwp_tablet_v1); cdecl;
  end;



  Izwp_tablet_manager_v1Listener = interface
  ['Izwp_tablet_manager_v1Listener']
  end;

  Izwp_tablet_seat_v1Listener = interface
  ['Izwp_tablet_seat_v1Listener']
    procedure zwp_tablet_seat_v1_tablet_added(zwp_tablet_seat_v1: Pzwp_tablet_seat_v1; id: Pzwp_tablet_v1);
    procedure zwp_tablet_seat_v1_tool_added(zwp_tablet_seat_v1: Pzwp_tablet_seat_v1; id: Pzwp_tablet_tool_v1);
  end;

  Izwp_tablet_tool_v1Listener = interface
  ['Izwp_tablet_tool_v1Listener']
    procedure zwp_tablet_tool_v1_type(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; tool_type: cuint);
    procedure zwp_tablet_tool_v1_hardware_serial(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; hardware_serial_hi: cuint; hardware_serial_lo: cuint);
    procedure zwp_tablet_tool_v1_hardware_id_wacom(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; hardware_id_hi: cuint; hardware_id_lo: cuint);
    procedure zwp_tablet_tool_v1_capability(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; capability: cuint);
    procedure zwp_tablet_tool_v1_done(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1);
    procedure zwp_tablet_tool_v1_removed(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1);
    procedure zwp_tablet_tool_v1_proximity_in(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; serial: cuint; tablet: Pzwp_tablet_v1; surface: Pwl_surface);
    procedure zwp_tablet_tool_v1_proximity_out(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1);
    procedure zwp_tablet_tool_v1_down(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; serial: cuint);
    procedure zwp_tablet_tool_v1_up(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1);
    procedure zwp_tablet_tool_v1_motion(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; x: cint32; y: cint32);
    procedure zwp_tablet_tool_v1_pressure(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; pressure: cuint);
    procedure zwp_tablet_tool_v1_distance(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; distance: cuint);
    procedure zwp_tablet_tool_v1_tilt(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; tilt_x: cint; tilt_y: cint);
    procedure zwp_tablet_tool_v1_rotation(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; degrees: cint);
    procedure zwp_tablet_tool_v1_slider(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; position: cint);
    procedure zwp_tablet_tool_v1_wheel(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; degrees: cint; clicks: cint);
    procedure zwp_tablet_tool_v1_button(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; serial: cuint; button: cuint; state: cuint);
    procedure zwp_tablet_tool_v1_frame(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; time: cuint);
  end;

  Izwp_tablet_v1Listener = interface
  ['Izwp_tablet_v1Listener']
    procedure zwp_tablet_v1_name(zwp_tablet_v1: Pzwp_tablet_v1; name: pchar);
    procedure zwp_tablet_v1_id(zwp_tablet_v1: Pzwp_tablet_v1; vid: cuint; pid: cuint);
    procedure zwp_tablet_v1_path(zwp_tablet_v1: Pzwp_tablet_v1; path: pchar);
    procedure zwp_tablet_v1_done(zwp_tablet_v1: Pzwp_tablet_v1);
    procedure zwp_tablet_v1_removed(zwp_tablet_v1: Pzwp_tablet_v1);
  end;



function  zwp_tablet_manager_v1_get_tablet_seat(zwp_tablet_manager_v1: Pzwp_tablet_manager_v1; seat: Pwl_seat): Pzwp_tablet_seat_v1;
procedure zwp_tablet_manager_v1_destroy(zwp_tablet_manager_v1: Pzwp_tablet_manager_v1);
function  zwp_tablet_manager_v1_add_listener(zwp_tablet_manager_v1: Pzwp_tablet_manager_v1; listener: Pzwp_tablet_manager_v1_listener; data: Pointer): cint;
procedure  zwp_tablet_manager_v1_add_listener(zwp_tablet_manager_v1: Pzwp_tablet_manager_v1; AIntf: Izwp_tablet_manager_v1Listener);
procedure zwp_tablet_manager_v1_set_user_data(zwp_tablet_manager_v1: Pzwp_tablet_manager_v1; user_data: Pointer);
function  zwp_tablet_manager_v1_get_user_data(zwp_tablet_manager_v1: Pzwp_tablet_manager_v1): Pointer;
function  zwp_tablet_manager_v1_get_version(zwp_tablet_manager_v1: Pzwp_tablet_manager_v1): cuint32;
procedure zwp_tablet_seat_v1_destroy(zwp_tablet_seat_v1: Pzwp_tablet_seat_v1);
function  zwp_tablet_seat_v1_add_listener(zwp_tablet_seat_v1: Pzwp_tablet_seat_v1; listener: Pzwp_tablet_seat_v1_listener; data: Pointer): cint;
procedure  zwp_tablet_seat_v1_add_listener(zwp_tablet_seat_v1: Pzwp_tablet_seat_v1; AIntf: Izwp_tablet_seat_v1Listener);
procedure zwp_tablet_seat_v1_set_user_data(zwp_tablet_seat_v1: Pzwp_tablet_seat_v1; user_data: Pointer);
function  zwp_tablet_seat_v1_get_user_data(zwp_tablet_seat_v1: Pzwp_tablet_seat_v1): Pointer;
function  zwp_tablet_seat_v1_get_version(zwp_tablet_seat_v1: Pzwp_tablet_seat_v1): cuint32;
procedure zwp_tablet_tool_v1_set_cursor(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; serial: cuint; surface: Pwl_surface; hotspot_x: cint; hotspot_y: cint);
procedure zwp_tablet_tool_v1_destroy(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1);
function  zwp_tablet_tool_v1_add_listener(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; listener: Pzwp_tablet_tool_v1_listener; data: Pointer): cint;
procedure  zwp_tablet_tool_v1_add_listener(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; AIntf: Izwp_tablet_tool_v1Listener);
procedure zwp_tablet_tool_v1_set_user_data(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; user_data: Pointer);
function  zwp_tablet_tool_v1_get_user_data(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1): Pointer;
function  zwp_tablet_tool_v1_get_version(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1): cuint32;
procedure zwp_tablet_v1_destroy(zwp_tablet_v1: Pzwp_tablet_v1);
function  zwp_tablet_v1_add_listener(zwp_tablet_v1: Pzwp_tablet_v1; listener: Pzwp_tablet_v1_listener; data: Pointer): cint;
procedure  zwp_tablet_v1_add_listener(zwp_tablet_v1: Pzwp_tablet_v1; AIntf: Izwp_tablet_v1Listener);
procedure zwp_tablet_v1_set_user_data(zwp_tablet_v1: Pzwp_tablet_v1; user_data: Pointer);
function  zwp_tablet_v1_get_user_data(zwp_tablet_v1: Pzwp_tablet_v1): Pointer;
function  zwp_tablet_v1_get_version(zwp_tablet_v1: Pzwp_tablet_v1): cuint32;



var
  zwp_tablet_manager_v1_interface: Twl_interface;
  zwp_tablet_seat_v1_interface: Twl_interface;
  zwp_tablet_tool_v1_interface: Twl_interface;
  zwp_tablet_v1_interface: Twl_interface;



implementation

const
_ZWP_TABLET_MANAGER_V1_GET_TABLET_SEAT = 0;
_ZWP_TABLET_MANAGER_V1_DESTROY = 1;
_ZWP_TABLET_SEAT_V1_DESTROY = 0;
_ZWP_TABLET_TOOL_V1_SET_CURSOR = 0;
_ZWP_TABLET_TOOL_V1_DESTROY = 1;
_ZWP_TABLET_V1_DESTROY = 0;


var
  vIntf_zwp_tablet_manager_v1_Listener: Tzwp_tablet_manager_v1_listener;
  vIntf_zwp_tablet_seat_v1_Listener: Tzwp_tablet_seat_v1_listener;
  vIntf_zwp_tablet_tool_v1_Listener: Tzwp_tablet_tool_v1_listener;
  vIntf_zwp_tablet_v1_Listener: Tzwp_tablet_v1_listener;



function  zwp_tablet_manager_v1_get_tablet_seat(zwp_tablet_manager_v1: Pzwp_tablet_manager_v1; seat: Pwl_seat): Pzwp_tablet_seat_v1;
var
  tablet_seat: Pwl_proxy;
begin
  tablet_seat := wl_proxy_marshal_constructor(Pwl_proxy(zwp_tablet_manager_v1),
      _ZWP_TABLET_MANAGER_V1_GET_TABLET_SEAT, @zwp_tablet_seat_v1_interface, nil, seat);
  Result := Pzwp_tablet_seat_v1(tablet_seat);
end;

procedure zwp_tablet_manager_v1_destroy(zwp_tablet_manager_v1: Pzwp_tablet_manager_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_tablet_manager_v1), _ZWP_TABLET_MANAGER_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_tablet_manager_v1));
end;

function  zwp_tablet_manager_v1_add_listener(zwp_tablet_manager_v1: Pzwp_tablet_manager_v1; listener: Pzwp_tablet_manager_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_tablet_manager_v1), listener, data);
end;

procedure  zwp_tablet_manager_v1_add_listener(zwp_tablet_manager_v1: Pzwp_tablet_manager_v1; AIntf: Izwp_tablet_manager_v1Listener);
begin
  zwp_tablet_manager_v1_add_listener(zwp_tablet_manager_v1, @vIntf_zwp_tablet_manager_v1_Listener, AIntf);
end;

procedure zwp_tablet_manager_v1_set_user_data(zwp_tablet_manager_v1: Pzwp_tablet_manager_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_tablet_manager_v1), user_data);
end;

function  zwp_tablet_manager_v1_get_user_data(zwp_tablet_manager_v1: Pzwp_tablet_manager_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_tablet_manager_v1));
end;

function  zwp_tablet_manager_v1_get_version(zwp_tablet_manager_v1: Pzwp_tablet_manager_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_tablet_manager_v1));
end;

procedure zwp_tablet_seat_v1_destroy(zwp_tablet_seat_v1: Pzwp_tablet_seat_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_tablet_seat_v1), _ZWP_TABLET_SEAT_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_tablet_seat_v1));
end;

function  zwp_tablet_seat_v1_add_listener(zwp_tablet_seat_v1: Pzwp_tablet_seat_v1; listener: Pzwp_tablet_seat_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_tablet_seat_v1), listener, data);
end;

procedure  zwp_tablet_seat_v1_add_listener(zwp_tablet_seat_v1: Pzwp_tablet_seat_v1; AIntf: Izwp_tablet_seat_v1Listener);
begin
  zwp_tablet_seat_v1_add_listener(zwp_tablet_seat_v1, @vIntf_zwp_tablet_seat_v1_Listener, AIntf);
end;

procedure zwp_tablet_seat_v1_set_user_data(zwp_tablet_seat_v1: Pzwp_tablet_seat_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_tablet_seat_v1), user_data);
end;

function  zwp_tablet_seat_v1_get_user_data(zwp_tablet_seat_v1: Pzwp_tablet_seat_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_tablet_seat_v1));
end;

function  zwp_tablet_seat_v1_get_version(zwp_tablet_seat_v1: Pzwp_tablet_seat_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_tablet_seat_v1));
end;

procedure zwp_tablet_tool_v1_set_cursor(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; serial: cuint; surface: Pwl_surface; hotspot_x: cint; hotspot_y: cint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_tablet_tool_v1),
      _ZWP_TABLET_TOOL_V1_SET_CURSOR, serial, surface, hotspot_x, hotspot_y);
end;

procedure zwp_tablet_tool_v1_destroy(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_tablet_tool_v1), _ZWP_TABLET_TOOL_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_tablet_tool_v1));
end;

function  zwp_tablet_tool_v1_add_listener(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; listener: Pzwp_tablet_tool_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_tablet_tool_v1), listener, data);
end;

procedure  zwp_tablet_tool_v1_add_listener(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; AIntf: Izwp_tablet_tool_v1Listener);
begin
  zwp_tablet_tool_v1_add_listener(zwp_tablet_tool_v1, @vIntf_zwp_tablet_tool_v1_Listener, AIntf);
end;

procedure zwp_tablet_tool_v1_set_user_data(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_tablet_tool_v1), user_data);
end;

function  zwp_tablet_tool_v1_get_user_data(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_tablet_tool_v1));
end;

function  zwp_tablet_tool_v1_get_version(zwp_tablet_tool_v1: Pzwp_tablet_tool_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_tablet_tool_v1));
end;

procedure zwp_tablet_v1_destroy(zwp_tablet_v1: Pzwp_tablet_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_tablet_v1), _ZWP_TABLET_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_tablet_v1));
end;

function  zwp_tablet_v1_add_listener(zwp_tablet_v1: Pzwp_tablet_v1; listener: Pzwp_tablet_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_tablet_v1), listener, data);
end;

procedure  zwp_tablet_v1_add_listener(zwp_tablet_v1: Pzwp_tablet_v1; AIntf: Izwp_tablet_v1Listener);
begin
  zwp_tablet_v1_add_listener(zwp_tablet_v1, @vIntf_zwp_tablet_v1_Listener, AIntf);
end;

procedure zwp_tablet_v1_set_user_data(zwp_tablet_v1: Pzwp_tablet_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_tablet_v1), user_data);
end;

function  zwp_tablet_v1_get_user_data(zwp_tablet_v1: Pzwp_tablet_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_tablet_v1));
end;

function  zwp_tablet_v1_get_version(zwp_tablet_v1: Pzwp_tablet_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_tablet_v1));
end;


procedure zwp_tablet_seat_v1_tablet_added_Intf(AIntf: Izwp_tablet_seat_v1Listener; zwp_tablet_seat_v1: Pzwp_tablet_seat_v1; id: Pzwp_tablet_v1); cdecl;
begin
  WriteLn('zwp_tablet_seat_v1.tablet_added');
  AIntf.zwp_tablet_seat_v1_tablet_added(zwp_tablet_seat_v1, id);
end;

procedure zwp_tablet_seat_v1_tool_added_Intf(AIntf: Izwp_tablet_seat_v1Listener; zwp_tablet_seat_v1: Pzwp_tablet_seat_v1; id: Pzwp_tablet_tool_v1); cdecl;
begin
  WriteLn('zwp_tablet_seat_v1.tool_added');
  AIntf.zwp_tablet_seat_v1_tool_added(zwp_tablet_seat_v1, id);
end;

procedure zwp_tablet_tool_v1_type_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; tool_type: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.type');
  AIntf.zwp_tablet_tool_v1_type(zwp_tablet_tool_v1, tool_type);
end;

procedure zwp_tablet_tool_v1_hardware_serial_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; hardware_serial_hi: cuint; hardware_serial_lo: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.hardware_serial');
  AIntf.zwp_tablet_tool_v1_hardware_serial(zwp_tablet_tool_v1, hardware_serial_hi, hardware_serial_lo);
end;

procedure zwp_tablet_tool_v1_hardware_id_wacom_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; hardware_id_hi: cuint; hardware_id_lo: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.hardware_id_wacom');
  AIntf.zwp_tablet_tool_v1_hardware_id_wacom(zwp_tablet_tool_v1, hardware_id_hi, hardware_id_lo);
end;

procedure zwp_tablet_tool_v1_capability_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; capability: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.capability');
  AIntf.zwp_tablet_tool_v1_capability(zwp_tablet_tool_v1, capability);
end;

procedure zwp_tablet_tool_v1_done_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.done');
  AIntf.zwp_tablet_tool_v1_done(zwp_tablet_tool_v1);
end;

procedure zwp_tablet_tool_v1_removed_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.removed');
  AIntf.zwp_tablet_tool_v1_removed(zwp_tablet_tool_v1);
end;

procedure zwp_tablet_tool_v1_proximity_in_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; serial: cuint; tablet: Pzwp_tablet_v1; surface: Pwl_surface); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.proximity_in');
  AIntf.zwp_tablet_tool_v1_proximity_in(zwp_tablet_tool_v1, serial, tablet, surface);
end;

procedure zwp_tablet_tool_v1_proximity_out_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.proximity_out');
  AIntf.zwp_tablet_tool_v1_proximity_out(zwp_tablet_tool_v1);
end;

procedure zwp_tablet_tool_v1_down_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; serial: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.down');
  AIntf.zwp_tablet_tool_v1_down(zwp_tablet_tool_v1, serial);
end;

procedure zwp_tablet_tool_v1_up_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.up');
  AIntf.zwp_tablet_tool_v1_up(zwp_tablet_tool_v1);
end;

procedure zwp_tablet_tool_v1_motion_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; x: cint32; y: cint32); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.motion');
  AIntf.zwp_tablet_tool_v1_motion(zwp_tablet_tool_v1, x, y);
end;

procedure zwp_tablet_tool_v1_pressure_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; pressure: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.pressure');
  AIntf.zwp_tablet_tool_v1_pressure(zwp_tablet_tool_v1, pressure);
end;

procedure zwp_tablet_tool_v1_distance_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; distance: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.distance');
  AIntf.zwp_tablet_tool_v1_distance(zwp_tablet_tool_v1, distance);
end;

procedure zwp_tablet_tool_v1_tilt_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; tilt_x: cint; tilt_y: cint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.tilt');
  AIntf.zwp_tablet_tool_v1_tilt(zwp_tablet_tool_v1, tilt_x, tilt_y);
end;

procedure zwp_tablet_tool_v1_rotation_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; degrees: cint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.rotation');
  AIntf.zwp_tablet_tool_v1_rotation(zwp_tablet_tool_v1, degrees);
end;

procedure zwp_tablet_tool_v1_slider_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; position: cint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.slider');
  AIntf.zwp_tablet_tool_v1_slider(zwp_tablet_tool_v1, position);
end;

procedure zwp_tablet_tool_v1_wheel_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; degrees: cint; clicks: cint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.wheel');
  AIntf.zwp_tablet_tool_v1_wheel(zwp_tablet_tool_v1, degrees, clicks);
end;

procedure zwp_tablet_tool_v1_button_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; serial: cuint; button: cuint; state: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.button');
  AIntf.zwp_tablet_tool_v1_button(zwp_tablet_tool_v1, serial, button, state);
end;

procedure zwp_tablet_tool_v1_frame_Intf(AIntf: Izwp_tablet_tool_v1Listener; zwp_tablet_tool_v1: Pzwp_tablet_tool_v1; time: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v1.frame');
  AIntf.zwp_tablet_tool_v1_frame(zwp_tablet_tool_v1, time);
end;

procedure zwp_tablet_v1_name_Intf(AIntf: Izwp_tablet_v1Listener; zwp_tablet_v1: Pzwp_tablet_v1; name: pchar); cdecl;
begin
  WriteLn('zwp_tablet_v1.name');
  AIntf.zwp_tablet_v1_name(zwp_tablet_v1, name);
end;

procedure zwp_tablet_v1_id_Intf(AIntf: Izwp_tablet_v1Listener; zwp_tablet_v1: Pzwp_tablet_v1; vid: cuint; pid: cuint); cdecl;
begin
  WriteLn('zwp_tablet_v1.id');
  AIntf.zwp_tablet_v1_id(zwp_tablet_v1, vid, pid);
end;

procedure zwp_tablet_v1_path_Intf(AIntf: Izwp_tablet_v1Listener; zwp_tablet_v1: Pzwp_tablet_v1; path: pchar); cdecl;
begin
  WriteLn('zwp_tablet_v1.path');
  AIntf.zwp_tablet_v1_path(zwp_tablet_v1, path);
end;

procedure zwp_tablet_v1_done_Intf(AIntf: Izwp_tablet_v1Listener; zwp_tablet_v1: Pzwp_tablet_v1); cdecl;
begin
  WriteLn('zwp_tablet_v1.done');
  AIntf.zwp_tablet_v1_done(zwp_tablet_v1);
end;

procedure zwp_tablet_v1_removed_Intf(AIntf: Izwp_tablet_v1Listener; zwp_tablet_v1: Pzwp_tablet_v1); cdecl;
begin
  WriteLn('zwp_tablet_v1.removed');
  AIntf.zwp_tablet_v1_removed(zwp_tablet_v1);
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
