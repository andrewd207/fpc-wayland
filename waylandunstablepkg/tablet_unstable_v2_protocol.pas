unit tablet_unstable_v2_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_tablet_manager_v2 = ^Tzwp_tablet_manager_v2;
  Tzwp_tablet_manager_v2 = record end;
  Pzwp_tablet_seat_v2 = ^Tzwp_tablet_seat_v2;
  Tzwp_tablet_seat_v2 = record end;
  Pzwp_tablet_tool_v2 = ^Tzwp_tablet_tool_v2;
  Tzwp_tablet_tool_v2 = record end;
  Pzwp_tablet_v2 = ^Tzwp_tablet_v2;
  Tzwp_tablet_v2 = record end;
  Pzwp_tablet_pad_ring_v2 = ^Tzwp_tablet_pad_ring_v2;
  Tzwp_tablet_pad_ring_v2 = record end;
  Pzwp_tablet_pad_strip_v2 = ^Tzwp_tablet_pad_strip_v2;
  Tzwp_tablet_pad_strip_v2 = record end;
  Pzwp_tablet_pad_group_v2 = ^Tzwp_tablet_pad_group_v2;
  Tzwp_tablet_pad_group_v2 = record end;
  Pzwp_tablet_pad_v2 = ^Tzwp_tablet_pad_v2;
  Tzwp_tablet_pad_v2 = record end;
  Pzwp_tablet_manager_v2_listener = ^Tzwp_tablet_manager_v2_listener;
  Tzwp_tablet_manager_v2_listener = record
  end;

  Pzwp_tablet_seat_v2_listener = ^Tzwp_tablet_seat_v2_listener;
  Tzwp_tablet_seat_v2_listener = record
    tablet_added : procedure(data: Pointer; zwp_tablet_seat_v2: Pzwp_tablet_seat_v2; id: Pzwp_tablet_v2); cdecl;
    tool_added : procedure(data: Pointer; zwp_tablet_seat_v2: Pzwp_tablet_seat_v2; id: Pzwp_tablet_tool_v2); cdecl;
    pad_added : procedure(data: Pointer; zwp_tablet_seat_v2: Pzwp_tablet_seat_v2; id: Pzwp_tablet_pad_v2); cdecl;
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
    type_ : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; tool_type: cuint); cdecl;
    hardware_serial : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; hardware_serial_hi: cuint; hardware_serial_lo: cuint); cdecl;
    hardware_id_wacom : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; hardware_id_hi: cuint; hardware_id_lo: cuint); cdecl;
    capability : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; capability: cuint); cdecl;
    done : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2); cdecl;
    removed : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2); cdecl;
    proximity_in : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; serial: cuint; tablet: Pzwp_tablet_v2; surface: Pwl_surface); cdecl;
    proximity_out : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2); cdecl;
    down : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; serial: cuint); cdecl;
    up : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2); cdecl;
    motion : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; x: cint32; y: cint32); cdecl;
    pressure : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; pressure: cuint); cdecl;
    distance : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; distance: cuint); cdecl;
    tilt : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; tilt_x: cint32; tilt_y: cint32); cdecl;
    rotation : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; degrees: cint32); cdecl;
    slider : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; position: cint); cdecl;
    wheel : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; degrees: cint32; clicks: cint); cdecl;
    button : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; serial: cuint; button: cuint; state: cuint); cdecl;
    frame : procedure(data: Pointer; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; time: cuint); cdecl;
  end;

  Pzwp_tablet_v2_listener = ^Tzwp_tablet_v2_listener;
  Tzwp_tablet_v2_listener = record
    name : procedure(data: Pointer; zwp_tablet_v2: Pzwp_tablet_v2; name: pchar); cdecl;
    id : procedure(data: Pointer; zwp_tablet_v2: Pzwp_tablet_v2; vid: cuint; pid: cuint); cdecl;
    path : procedure(data: Pointer; zwp_tablet_v2: Pzwp_tablet_v2; path: pchar); cdecl;
    done : procedure(data: Pointer; zwp_tablet_v2: Pzwp_tablet_v2); cdecl;
    removed : procedure(data: Pointer; zwp_tablet_v2: Pzwp_tablet_v2); cdecl;
  end;

const
  ZWP_TABLET_PAD_RING_V2_SOURCE_FINGER = 1; // finger

type
  Pzwp_tablet_pad_ring_v2_listener = ^Tzwp_tablet_pad_ring_v2_listener;
  Tzwp_tablet_pad_ring_v2_listener = record
    source : procedure(data: Pointer; zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; source: cuint); cdecl;
    angle : procedure(data: Pointer; zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; degrees: cint32); cdecl;
    stop : procedure(data: Pointer; zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2); cdecl;
    frame : procedure(data: Pointer; zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; time: cuint); cdecl;
  end;

const
  ZWP_TABLET_PAD_STRIP_V2_SOURCE_FINGER = 1; // finger

type
  Pzwp_tablet_pad_strip_v2_listener = ^Tzwp_tablet_pad_strip_v2_listener;
  Tzwp_tablet_pad_strip_v2_listener = record
    source : procedure(data: Pointer; zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; source: cuint); cdecl;
    position : procedure(data: Pointer; zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; position: cuint); cdecl;
    stop : procedure(data: Pointer; zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2); cdecl;
    frame : procedure(data: Pointer; zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; time: cuint); cdecl;
  end;

  Pzwp_tablet_pad_group_v2_listener = ^Tzwp_tablet_pad_group_v2_listener;
  Tzwp_tablet_pad_group_v2_listener = record
    buttons : procedure(data: Pointer; zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; buttons: Pwl_array); cdecl;
    ring : procedure(data: Pointer; zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; ring: Pzwp_tablet_pad_ring_v2); cdecl;
    strip : procedure(data: Pointer; zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; strip: Pzwp_tablet_pad_strip_v2); cdecl;
    modes : procedure(data: Pointer; zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; modes: cuint); cdecl;
    done : procedure(data: Pointer; zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2); cdecl;
    mode_switch : procedure(data: Pointer; zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; time: cuint; serial: cuint; mode: cuint); cdecl;
  end;

const
  ZWP_TABLET_PAD_V2_BUTTON_STATE_RELEASED = 0; // the button is not pressed
  ZWP_TABLET_PAD_V2_BUTTON_STATE_PRESSED = 1; // the button is pressed

type
  Pzwp_tablet_pad_v2_listener = ^Tzwp_tablet_pad_v2_listener;
  Tzwp_tablet_pad_v2_listener = record
    group : procedure(data: Pointer; zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; pad_group: Pzwp_tablet_pad_group_v2); cdecl;
    path : procedure(data: Pointer; zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; path: pchar); cdecl;
    buttons : procedure(data: Pointer; zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; buttons: cuint); cdecl;
    done : procedure(data: Pointer; zwp_tablet_pad_v2: Pzwp_tablet_pad_v2); cdecl;
    button : procedure(data: Pointer; zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; time: cuint; button: cuint; state: cuint); cdecl;
    enter : procedure(data: Pointer; zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; serial: cuint; tablet: Pzwp_tablet_v2; surface: Pwl_surface); cdecl;
    leave : procedure(data: Pointer; zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; serial: cuint; surface: Pwl_surface); cdecl;
    removed : procedure(data: Pointer; zwp_tablet_pad_v2: Pzwp_tablet_pad_v2); cdecl;
  end;



  Izwp_tablet_manager_v2Listener = interface
  ['Izwp_tablet_manager_v2Listener']
  end;

  Izwp_tablet_seat_v2Listener = interface
  ['Izwp_tablet_seat_v2Listener']
    procedure zwp_tablet_seat_v2_tablet_added(zwp_tablet_seat_v2: Pzwp_tablet_seat_v2; id: Pzwp_tablet_v2);
    procedure zwp_tablet_seat_v2_tool_added(zwp_tablet_seat_v2: Pzwp_tablet_seat_v2; id: Pzwp_tablet_tool_v2);
    procedure zwp_tablet_seat_v2_pad_added(zwp_tablet_seat_v2: Pzwp_tablet_seat_v2; id: Pzwp_tablet_pad_v2);
  end;

  Izwp_tablet_tool_v2Listener = interface
  ['Izwp_tablet_tool_v2Listener']
    procedure zwp_tablet_tool_v2_type(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; tool_type: cuint);
    procedure zwp_tablet_tool_v2_hardware_serial(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; hardware_serial_hi: cuint; hardware_serial_lo: cuint);
    procedure zwp_tablet_tool_v2_hardware_id_wacom(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; hardware_id_hi: cuint; hardware_id_lo: cuint);
    procedure zwp_tablet_tool_v2_capability(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; capability: cuint);
    procedure zwp_tablet_tool_v2_done(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2);
    procedure zwp_tablet_tool_v2_removed(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2);
    procedure zwp_tablet_tool_v2_proximity_in(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; serial: cuint; tablet: Pzwp_tablet_v2; surface: Pwl_surface);
    procedure zwp_tablet_tool_v2_proximity_out(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2);
    procedure zwp_tablet_tool_v2_down(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; serial: cuint);
    procedure zwp_tablet_tool_v2_up(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2);
    procedure zwp_tablet_tool_v2_motion(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; x: cint32; y: cint32);
    procedure zwp_tablet_tool_v2_pressure(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; pressure: cuint);
    procedure zwp_tablet_tool_v2_distance(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; distance: cuint);
    procedure zwp_tablet_tool_v2_tilt(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; tilt_x: cint32; tilt_y: cint32);
    procedure zwp_tablet_tool_v2_rotation(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; degrees: cint32);
    procedure zwp_tablet_tool_v2_slider(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; position: cint);
    procedure zwp_tablet_tool_v2_wheel(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; degrees: cint32; clicks: cint);
    procedure zwp_tablet_tool_v2_button(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; serial: cuint; button: cuint; state: cuint);
    procedure zwp_tablet_tool_v2_frame(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; time: cuint);
  end;

  Izwp_tablet_v2Listener = interface
  ['Izwp_tablet_v2Listener']
    procedure zwp_tablet_v2_name(zwp_tablet_v2: Pzwp_tablet_v2; name: pchar);
    procedure zwp_tablet_v2_id(zwp_tablet_v2: Pzwp_tablet_v2; vid: cuint; pid: cuint);
    procedure zwp_tablet_v2_path(zwp_tablet_v2: Pzwp_tablet_v2; path: pchar);
    procedure zwp_tablet_v2_done(zwp_tablet_v2: Pzwp_tablet_v2);
    procedure zwp_tablet_v2_removed(zwp_tablet_v2: Pzwp_tablet_v2);
  end;

  Izwp_tablet_pad_ring_v2Listener = interface
  ['Izwp_tablet_pad_ring_v2Listener']
    procedure zwp_tablet_pad_ring_v2_source(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; source: cuint);
    procedure zwp_tablet_pad_ring_v2_angle(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; degrees: cint32);
    procedure zwp_tablet_pad_ring_v2_stop(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2);
    procedure zwp_tablet_pad_ring_v2_frame(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; time: cuint);
  end;

  Izwp_tablet_pad_strip_v2Listener = interface
  ['Izwp_tablet_pad_strip_v2Listener']
    procedure zwp_tablet_pad_strip_v2_source(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; source: cuint);
    procedure zwp_tablet_pad_strip_v2_position(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; position: cuint);
    procedure zwp_tablet_pad_strip_v2_stop(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2);
    procedure zwp_tablet_pad_strip_v2_frame(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; time: cuint);
  end;

  Izwp_tablet_pad_group_v2Listener = interface
  ['Izwp_tablet_pad_group_v2Listener']
    procedure zwp_tablet_pad_group_v2_buttons(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; buttons: Pwl_array);
    procedure zwp_tablet_pad_group_v2_ring(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; ring: Pzwp_tablet_pad_ring_v2);
    procedure zwp_tablet_pad_group_v2_strip(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; strip: Pzwp_tablet_pad_strip_v2);
    procedure zwp_tablet_pad_group_v2_modes(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; modes: cuint);
    procedure zwp_tablet_pad_group_v2_done(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2);
    procedure zwp_tablet_pad_group_v2_mode_switch(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; time: cuint; serial: cuint; mode: cuint);
  end;

  Izwp_tablet_pad_v2Listener = interface
  ['Izwp_tablet_pad_v2Listener']
    procedure zwp_tablet_pad_v2_group(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; pad_group: Pzwp_tablet_pad_group_v2);
    procedure zwp_tablet_pad_v2_path(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; path: pchar);
    procedure zwp_tablet_pad_v2_buttons(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; buttons: cuint);
    procedure zwp_tablet_pad_v2_done(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2);
    procedure zwp_tablet_pad_v2_button(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; time: cuint; button: cuint; state: cuint);
    procedure zwp_tablet_pad_v2_enter(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; serial: cuint; tablet: Pzwp_tablet_v2; surface: Pwl_surface);
    procedure zwp_tablet_pad_v2_leave(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; serial: cuint; surface: Pwl_surface);
    procedure zwp_tablet_pad_v2_removed(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2);
  end;



function  zwp_tablet_manager_v2_get_tablet_seat(zwp_tablet_manager_v2: Pzwp_tablet_manager_v2; seat: Pwl_seat): Pzwp_tablet_seat_v2;
procedure zwp_tablet_manager_v2_destroy(zwp_tablet_manager_v2: Pzwp_tablet_manager_v2);
function  zwp_tablet_manager_v2_add_listener(zwp_tablet_manager_v2: Pzwp_tablet_manager_v2; listener: Pzwp_tablet_manager_v2_listener; data: Pointer): cint;
procedure  zwp_tablet_manager_v2_add_listener(zwp_tablet_manager_v2: Pzwp_tablet_manager_v2; AIntf: Izwp_tablet_manager_v2Listener);
procedure zwp_tablet_manager_v2_set_user_data(zwp_tablet_manager_v2: Pzwp_tablet_manager_v2; user_data: Pointer);
function  zwp_tablet_manager_v2_get_user_data(zwp_tablet_manager_v2: Pzwp_tablet_manager_v2): Pointer;
function  zwp_tablet_manager_v2_get_version(zwp_tablet_manager_v2: Pzwp_tablet_manager_v2): cuint32;
procedure zwp_tablet_seat_v2_destroy(zwp_tablet_seat_v2: Pzwp_tablet_seat_v2);
function  zwp_tablet_seat_v2_add_listener(zwp_tablet_seat_v2: Pzwp_tablet_seat_v2; listener: Pzwp_tablet_seat_v2_listener; data: Pointer): cint;
procedure  zwp_tablet_seat_v2_add_listener(zwp_tablet_seat_v2: Pzwp_tablet_seat_v2; AIntf: Izwp_tablet_seat_v2Listener);
procedure zwp_tablet_seat_v2_set_user_data(zwp_tablet_seat_v2: Pzwp_tablet_seat_v2; user_data: Pointer);
function  zwp_tablet_seat_v2_get_user_data(zwp_tablet_seat_v2: Pzwp_tablet_seat_v2): Pointer;
function  zwp_tablet_seat_v2_get_version(zwp_tablet_seat_v2: Pzwp_tablet_seat_v2): cuint32;
procedure zwp_tablet_tool_v2_set_cursor(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; serial: cuint; surface: Pwl_surface; hotspot_x: cint; hotspot_y: cint);
procedure zwp_tablet_tool_v2_destroy(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2);
function  zwp_tablet_tool_v2_add_listener(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; listener: Pzwp_tablet_tool_v2_listener; data: Pointer): cint;
procedure  zwp_tablet_tool_v2_add_listener(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; AIntf: Izwp_tablet_tool_v2Listener);
procedure zwp_tablet_tool_v2_set_user_data(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; user_data: Pointer);
function  zwp_tablet_tool_v2_get_user_data(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2): Pointer;
function  zwp_tablet_tool_v2_get_version(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2): cuint32;
procedure zwp_tablet_v2_destroy(zwp_tablet_v2: Pzwp_tablet_v2);
function  zwp_tablet_v2_add_listener(zwp_tablet_v2: Pzwp_tablet_v2; listener: Pzwp_tablet_v2_listener; data: Pointer): cint;
procedure  zwp_tablet_v2_add_listener(zwp_tablet_v2: Pzwp_tablet_v2; AIntf: Izwp_tablet_v2Listener);
procedure zwp_tablet_v2_set_user_data(zwp_tablet_v2: Pzwp_tablet_v2; user_data: Pointer);
function  zwp_tablet_v2_get_user_data(zwp_tablet_v2: Pzwp_tablet_v2): Pointer;
function  zwp_tablet_v2_get_version(zwp_tablet_v2: Pzwp_tablet_v2): cuint32;
procedure zwp_tablet_pad_ring_v2_set_feedback(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; description: pchar; serial: cuint);
procedure zwp_tablet_pad_ring_v2_destroy(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2);
function  zwp_tablet_pad_ring_v2_add_listener(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; listener: Pzwp_tablet_pad_ring_v2_listener; data: Pointer): cint;
procedure  zwp_tablet_pad_ring_v2_add_listener(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; AIntf: Izwp_tablet_pad_ring_v2Listener);
procedure zwp_tablet_pad_ring_v2_set_user_data(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; user_data: Pointer);
function  zwp_tablet_pad_ring_v2_get_user_data(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2): Pointer;
function  zwp_tablet_pad_ring_v2_get_version(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2): cuint32;
procedure zwp_tablet_pad_strip_v2_set_feedback(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; description: pchar; serial: cuint);
procedure zwp_tablet_pad_strip_v2_destroy(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2);
function  zwp_tablet_pad_strip_v2_add_listener(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; listener: Pzwp_tablet_pad_strip_v2_listener; data: Pointer): cint;
procedure  zwp_tablet_pad_strip_v2_add_listener(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; AIntf: Izwp_tablet_pad_strip_v2Listener);
procedure zwp_tablet_pad_strip_v2_set_user_data(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; user_data: Pointer);
function  zwp_tablet_pad_strip_v2_get_user_data(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2): Pointer;
function  zwp_tablet_pad_strip_v2_get_version(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2): cuint32;
procedure zwp_tablet_pad_group_v2_destroy(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2);
function  zwp_tablet_pad_group_v2_add_listener(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; listener: Pzwp_tablet_pad_group_v2_listener; data: Pointer): cint;
procedure  zwp_tablet_pad_group_v2_add_listener(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; AIntf: Izwp_tablet_pad_group_v2Listener);
procedure zwp_tablet_pad_group_v2_set_user_data(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; user_data: Pointer);
function  zwp_tablet_pad_group_v2_get_user_data(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2): Pointer;
function  zwp_tablet_pad_group_v2_get_version(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2): cuint32;
procedure zwp_tablet_pad_v2_set_feedback(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; button: cuint; description: pchar; serial: cuint);
procedure zwp_tablet_pad_v2_destroy(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2);
function  zwp_tablet_pad_v2_add_listener(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; listener: Pzwp_tablet_pad_v2_listener; data: Pointer): cint;
procedure  zwp_tablet_pad_v2_add_listener(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; AIntf: Izwp_tablet_pad_v2Listener);
procedure zwp_tablet_pad_v2_set_user_data(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; user_data: Pointer);
function  zwp_tablet_pad_v2_get_user_data(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2): Pointer;
function  zwp_tablet_pad_v2_get_version(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2): cuint32;



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

const
_ZWP_TABLET_MANAGER_V2_GET_TABLET_SEAT = 0;
_ZWP_TABLET_MANAGER_V2_DESTROY = 1;
_ZWP_TABLET_SEAT_V2_DESTROY = 0;
_ZWP_TABLET_TOOL_V2_SET_CURSOR = 0;
_ZWP_TABLET_TOOL_V2_DESTROY = 1;
_ZWP_TABLET_V2_DESTROY = 0;
_ZWP_TABLET_PAD_RING_V2_SET_FEEDBACK = 0;
_ZWP_TABLET_PAD_RING_V2_DESTROY = 1;
_ZWP_TABLET_PAD_STRIP_V2_SET_FEEDBACK = 0;
_ZWP_TABLET_PAD_STRIP_V2_DESTROY = 1;
_ZWP_TABLET_PAD_GROUP_V2_DESTROY = 0;
_ZWP_TABLET_PAD_V2_SET_FEEDBACK = 0;
_ZWP_TABLET_PAD_V2_DESTROY = 1;


var
  vIntf_zwp_tablet_manager_v2_Listener: Tzwp_tablet_manager_v2_listener;
  vIntf_zwp_tablet_seat_v2_Listener: Tzwp_tablet_seat_v2_listener;
  vIntf_zwp_tablet_tool_v2_Listener: Tzwp_tablet_tool_v2_listener;
  vIntf_zwp_tablet_v2_Listener: Tzwp_tablet_v2_listener;
  vIntf_zwp_tablet_pad_ring_v2_Listener: Tzwp_tablet_pad_ring_v2_listener;
  vIntf_zwp_tablet_pad_strip_v2_Listener: Tzwp_tablet_pad_strip_v2_listener;
  vIntf_zwp_tablet_pad_group_v2_Listener: Tzwp_tablet_pad_group_v2_listener;
  vIntf_zwp_tablet_pad_v2_Listener: Tzwp_tablet_pad_v2_listener;



function  zwp_tablet_manager_v2_get_tablet_seat(zwp_tablet_manager_v2: Pzwp_tablet_manager_v2; seat: Pwl_seat): Pzwp_tablet_seat_v2;
var
  tablet_seat: Pwl_proxy;
begin
  tablet_seat := wl_proxy_marshal_constructor(Pwl_proxy(zwp_tablet_manager_v2),
      _ZWP_TABLET_MANAGER_V2_GET_TABLET_SEAT, @zwp_tablet_seat_v2_interface, nil, seat);
  Result := Pzwp_tablet_seat_v2(tablet_seat);
end;

procedure zwp_tablet_manager_v2_destroy(zwp_tablet_manager_v2: Pzwp_tablet_manager_v2);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_tablet_manager_v2), _ZWP_TABLET_MANAGER_V2_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_tablet_manager_v2));
end;

function  zwp_tablet_manager_v2_add_listener(zwp_tablet_manager_v2: Pzwp_tablet_manager_v2; listener: Pzwp_tablet_manager_v2_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_tablet_manager_v2), listener, data);
end;

procedure  zwp_tablet_manager_v2_add_listener(zwp_tablet_manager_v2: Pzwp_tablet_manager_v2; AIntf: Izwp_tablet_manager_v2Listener);
begin
  zwp_tablet_manager_v2_add_listener(zwp_tablet_manager_v2, @vIntf_zwp_tablet_manager_v2_Listener, AIntf);
end;

procedure zwp_tablet_manager_v2_set_user_data(zwp_tablet_manager_v2: Pzwp_tablet_manager_v2; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_tablet_manager_v2), user_data);
end;

function  zwp_tablet_manager_v2_get_user_data(zwp_tablet_manager_v2: Pzwp_tablet_manager_v2): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_tablet_manager_v2));
end;

function  zwp_tablet_manager_v2_get_version(zwp_tablet_manager_v2: Pzwp_tablet_manager_v2): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_tablet_manager_v2));
end;

procedure zwp_tablet_seat_v2_destroy(zwp_tablet_seat_v2: Pzwp_tablet_seat_v2);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_tablet_seat_v2), _ZWP_TABLET_SEAT_V2_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_tablet_seat_v2));
end;

function  zwp_tablet_seat_v2_add_listener(zwp_tablet_seat_v2: Pzwp_tablet_seat_v2; listener: Pzwp_tablet_seat_v2_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_tablet_seat_v2), listener, data);
end;

procedure  zwp_tablet_seat_v2_add_listener(zwp_tablet_seat_v2: Pzwp_tablet_seat_v2; AIntf: Izwp_tablet_seat_v2Listener);
begin
  zwp_tablet_seat_v2_add_listener(zwp_tablet_seat_v2, @vIntf_zwp_tablet_seat_v2_Listener, AIntf);
end;

procedure zwp_tablet_seat_v2_set_user_data(zwp_tablet_seat_v2: Pzwp_tablet_seat_v2; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_tablet_seat_v2), user_data);
end;

function  zwp_tablet_seat_v2_get_user_data(zwp_tablet_seat_v2: Pzwp_tablet_seat_v2): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_tablet_seat_v2));
end;

function  zwp_tablet_seat_v2_get_version(zwp_tablet_seat_v2: Pzwp_tablet_seat_v2): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_tablet_seat_v2));
end;

procedure zwp_tablet_tool_v2_set_cursor(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; serial: cuint; surface: Pwl_surface; hotspot_x: cint; hotspot_y: cint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_tablet_tool_v2),
      _ZWP_TABLET_TOOL_V2_SET_CURSOR, serial, surface, hotspot_x, hotspot_y);
end;

procedure zwp_tablet_tool_v2_destroy(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_tablet_tool_v2), _ZWP_TABLET_TOOL_V2_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_tablet_tool_v2));
end;

function  zwp_tablet_tool_v2_add_listener(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; listener: Pzwp_tablet_tool_v2_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_tablet_tool_v2), listener, data);
end;

procedure  zwp_tablet_tool_v2_add_listener(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; AIntf: Izwp_tablet_tool_v2Listener);
begin
  zwp_tablet_tool_v2_add_listener(zwp_tablet_tool_v2, @vIntf_zwp_tablet_tool_v2_Listener, AIntf);
end;

procedure zwp_tablet_tool_v2_set_user_data(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_tablet_tool_v2), user_data);
end;

function  zwp_tablet_tool_v2_get_user_data(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_tablet_tool_v2));
end;

function  zwp_tablet_tool_v2_get_version(zwp_tablet_tool_v2: Pzwp_tablet_tool_v2): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_tablet_tool_v2));
end;

procedure zwp_tablet_v2_destroy(zwp_tablet_v2: Pzwp_tablet_v2);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_tablet_v2), _ZWP_TABLET_V2_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_tablet_v2));
end;

function  zwp_tablet_v2_add_listener(zwp_tablet_v2: Pzwp_tablet_v2; listener: Pzwp_tablet_v2_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_tablet_v2), listener, data);
end;

procedure  zwp_tablet_v2_add_listener(zwp_tablet_v2: Pzwp_tablet_v2; AIntf: Izwp_tablet_v2Listener);
begin
  zwp_tablet_v2_add_listener(zwp_tablet_v2, @vIntf_zwp_tablet_v2_Listener, AIntf);
end;

procedure zwp_tablet_v2_set_user_data(zwp_tablet_v2: Pzwp_tablet_v2; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_tablet_v2), user_data);
end;

function  zwp_tablet_v2_get_user_data(zwp_tablet_v2: Pzwp_tablet_v2): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_tablet_v2));
end;

function  zwp_tablet_v2_get_version(zwp_tablet_v2: Pzwp_tablet_v2): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_tablet_v2));
end;

procedure zwp_tablet_pad_ring_v2_set_feedback(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; description: pchar; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_tablet_pad_ring_v2),
      _ZWP_TABLET_PAD_RING_V2_SET_FEEDBACK, description, serial);
end;

procedure zwp_tablet_pad_ring_v2_destroy(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_tablet_pad_ring_v2), _ZWP_TABLET_PAD_RING_V2_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_tablet_pad_ring_v2));
end;

function  zwp_tablet_pad_ring_v2_add_listener(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; listener: Pzwp_tablet_pad_ring_v2_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_tablet_pad_ring_v2), listener, data);
end;

procedure  zwp_tablet_pad_ring_v2_add_listener(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; AIntf: Izwp_tablet_pad_ring_v2Listener);
begin
  zwp_tablet_pad_ring_v2_add_listener(zwp_tablet_pad_ring_v2, @vIntf_zwp_tablet_pad_ring_v2_Listener, AIntf);
end;

procedure zwp_tablet_pad_ring_v2_set_user_data(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_tablet_pad_ring_v2), user_data);
end;

function  zwp_tablet_pad_ring_v2_get_user_data(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_tablet_pad_ring_v2));
end;

function  zwp_tablet_pad_ring_v2_get_version(zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_tablet_pad_ring_v2));
end;

procedure zwp_tablet_pad_strip_v2_set_feedback(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; description: pchar; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_tablet_pad_strip_v2),
      _ZWP_TABLET_PAD_STRIP_V2_SET_FEEDBACK, description, serial);
end;

procedure zwp_tablet_pad_strip_v2_destroy(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_tablet_pad_strip_v2), _ZWP_TABLET_PAD_STRIP_V2_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_tablet_pad_strip_v2));
end;

function  zwp_tablet_pad_strip_v2_add_listener(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; listener: Pzwp_tablet_pad_strip_v2_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_tablet_pad_strip_v2), listener, data);
end;

procedure  zwp_tablet_pad_strip_v2_add_listener(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; AIntf: Izwp_tablet_pad_strip_v2Listener);
begin
  zwp_tablet_pad_strip_v2_add_listener(zwp_tablet_pad_strip_v2, @vIntf_zwp_tablet_pad_strip_v2_Listener, AIntf);
end;

procedure zwp_tablet_pad_strip_v2_set_user_data(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_tablet_pad_strip_v2), user_data);
end;

function  zwp_tablet_pad_strip_v2_get_user_data(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_tablet_pad_strip_v2));
end;

function  zwp_tablet_pad_strip_v2_get_version(zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_tablet_pad_strip_v2));
end;

procedure zwp_tablet_pad_group_v2_destroy(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_tablet_pad_group_v2), _ZWP_TABLET_PAD_GROUP_V2_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_tablet_pad_group_v2));
end;

function  zwp_tablet_pad_group_v2_add_listener(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; listener: Pzwp_tablet_pad_group_v2_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_tablet_pad_group_v2), listener, data);
end;

procedure  zwp_tablet_pad_group_v2_add_listener(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; AIntf: Izwp_tablet_pad_group_v2Listener);
begin
  zwp_tablet_pad_group_v2_add_listener(zwp_tablet_pad_group_v2, @vIntf_zwp_tablet_pad_group_v2_Listener, AIntf);
end;

procedure zwp_tablet_pad_group_v2_set_user_data(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_tablet_pad_group_v2), user_data);
end;

function  zwp_tablet_pad_group_v2_get_user_data(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_tablet_pad_group_v2));
end;

function  zwp_tablet_pad_group_v2_get_version(zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_tablet_pad_group_v2));
end;

procedure zwp_tablet_pad_v2_set_feedback(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; button: cuint; description: pchar; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_tablet_pad_v2),
      _ZWP_TABLET_PAD_V2_SET_FEEDBACK, button, description, serial);
end;

procedure zwp_tablet_pad_v2_destroy(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_tablet_pad_v2), _ZWP_TABLET_PAD_V2_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_tablet_pad_v2));
end;

function  zwp_tablet_pad_v2_add_listener(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; listener: Pzwp_tablet_pad_v2_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_tablet_pad_v2), listener, data);
end;

procedure  zwp_tablet_pad_v2_add_listener(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; AIntf: Izwp_tablet_pad_v2Listener);
begin
  zwp_tablet_pad_v2_add_listener(zwp_tablet_pad_v2, @vIntf_zwp_tablet_pad_v2_Listener, AIntf);
end;

procedure zwp_tablet_pad_v2_set_user_data(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_tablet_pad_v2), user_data);
end;

function  zwp_tablet_pad_v2_get_user_data(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_tablet_pad_v2));
end;

function  zwp_tablet_pad_v2_get_version(zwp_tablet_pad_v2: Pzwp_tablet_pad_v2): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_tablet_pad_v2));
end;


procedure zwp_tablet_seat_v2_tablet_added_Intf(AIntf: Izwp_tablet_seat_v2Listener; zwp_tablet_seat_v2: Pzwp_tablet_seat_v2; id: Pzwp_tablet_v2); cdecl;
begin
  WriteLn('zwp_tablet_seat_v2.tablet_added');
  AIntf.zwp_tablet_seat_v2_tablet_added(zwp_tablet_seat_v2, id);
end;

procedure zwp_tablet_seat_v2_tool_added_Intf(AIntf: Izwp_tablet_seat_v2Listener; zwp_tablet_seat_v2: Pzwp_tablet_seat_v2; id: Pzwp_tablet_tool_v2); cdecl;
begin
  WriteLn('zwp_tablet_seat_v2.tool_added');
  AIntf.zwp_tablet_seat_v2_tool_added(zwp_tablet_seat_v2, id);
end;

procedure zwp_tablet_seat_v2_pad_added_Intf(AIntf: Izwp_tablet_seat_v2Listener; zwp_tablet_seat_v2: Pzwp_tablet_seat_v2; id: Pzwp_tablet_pad_v2); cdecl;
begin
  WriteLn('zwp_tablet_seat_v2.pad_added');
  AIntf.zwp_tablet_seat_v2_pad_added(zwp_tablet_seat_v2, id);
end;

procedure zwp_tablet_tool_v2_type_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; tool_type: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.type');
  AIntf.zwp_tablet_tool_v2_type(zwp_tablet_tool_v2, tool_type);
end;

procedure zwp_tablet_tool_v2_hardware_serial_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; hardware_serial_hi: cuint; hardware_serial_lo: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.hardware_serial');
  AIntf.zwp_tablet_tool_v2_hardware_serial(zwp_tablet_tool_v2, hardware_serial_hi, hardware_serial_lo);
end;

procedure zwp_tablet_tool_v2_hardware_id_wacom_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; hardware_id_hi: cuint; hardware_id_lo: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.hardware_id_wacom');
  AIntf.zwp_tablet_tool_v2_hardware_id_wacom(zwp_tablet_tool_v2, hardware_id_hi, hardware_id_lo);
end;

procedure zwp_tablet_tool_v2_capability_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; capability: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.capability');
  AIntf.zwp_tablet_tool_v2_capability(zwp_tablet_tool_v2, capability);
end;

procedure zwp_tablet_tool_v2_done_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.done');
  AIntf.zwp_tablet_tool_v2_done(zwp_tablet_tool_v2);
end;

procedure zwp_tablet_tool_v2_removed_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.removed');
  AIntf.zwp_tablet_tool_v2_removed(zwp_tablet_tool_v2);
end;

procedure zwp_tablet_tool_v2_proximity_in_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; serial: cuint; tablet: Pzwp_tablet_v2; surface: Pwl_surface); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.proximity_in');
  AIntf.zwp_tablet_tool_v2_proximity_in(zwp_tablet_tool_v2, serial, tablet, surface);
end;

procedure zwp_tablet_tool_v2_proximity_out_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.proximity_out');
  AIntf.zwp_tablet_tool_v2_proximity_out(zwp_tablet_tool_v2);
end;

procedure zwp_tablet_tool_v2_down_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; serial: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.down');
  AIntf.zwp_tablet_tool_v2_down(zwp_tablet_tool_v2, serial);
end;

procedure zwp_tablet_tool_v2_up_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.up');
  AIntf.zwp_tablet_tool_v2_up(zwp_tablet_tool_v2);
end;

procedure zwp_tablet_tool_v2_motion_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; x: cint32; y: cint32); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.motion');
  AIntf.zwp_tablet_tool_v2_motion(zwp_tablet_tool_v2, x, y);
end;

procedure zwp_tablet_tool_v2_pressure_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; pressure: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.pressure');
  AIntf.zwp_tablet_tool_v2_pressure(zwp_tablet_tool_v2, pressure);
end;

procedure zwp_tablet_tool_v2_distance_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; distance: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.distance');
  AIntf.zwp_tablet_tool_v2_distance(zwp_tablet_tool_v2, distance);
end;

procedure zwp_tablet_tool_v2_tilt_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; tilt_x: cint32; tilt_y: cint32); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.tilt');
  AIntf.zwp_tablet_tool_v2_tilt(zwp_tablet_tool_v2, tilt_x, tilt_y);
end;

procedure zwp_tablet_tool_v2_rotation_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; degrees: cint32); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.rotation');
  AIntf.zwp_tablet_tool_v2_rotation(zwp_tablet_tool_v2, degrees);
end;

procedure zwp_tablet_tool_v2_slider_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; position: cint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.slider');
  AIntf.zwp_tablet_tool_v2_slider(zwp_tablet_tool_v2, position);
end;

procedure zwp_tablet_tool_v2_wheel_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; degrees: cint32; clicks: cint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.wheel');
  AIntf.zwp_tablet_tool_v2_wheel(zwp_tablet_tool_v2, degrees, clicks);
end;

procedure zwp_tablet_tool_v2_button_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; serial: cuint; button: cuint; state: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.button');
  AIntf.zwp_tablet_tool_v2_button(zwp_tablet_tool_v2, serial, button, state);
end;

procedure zwp_tablet_tool_v2_frame_Intf(AIntf: Izwp_tablet_tool_v2Listener; zwp_tablet_tool_v2: Pzwp_tablet_tool_v2; time: cuint); cdecl;
begin
  WriteLn('zwp_tablet_tool_v2.frame');
  AIntf.zwp_tablet_tool_v2_frame(zwp_tablet_tool_v2, time);
end;

procedure zwp_tablet_v2_name_Intf(AIntf: Izwp_tablet_v2Listener; zwp_tablet_v2: Pzwp_tablet_v2; name: pchar); cdecl;
begin
  WriteLn('zwp_tablet_v2.name');
  AIntf.zwp_tablet_v2_name(zwp_tablet_v2, name);
end;

procedure zwp_tablet_v2_id_Intf(AIntf: Izwp_tablet_v2Listener; zwp_tablet_v2: Pzwp_tablet_v2; vid: cuint; pid: cuint); cdecl;
begin
  WriteLn('zwp_tablet_v2.id');
  AIntf.zwp_tablet_v2_id(zwp_tablet_v2, vid, pid);
end;

procedure zwp_tablet_v2_path_Intf(AIntf: Izwp_tablet_v2Listener; zwp_tablet_v2: Pzwp_tablet_v2; path: pchar); cdecl;
begin
  WriteLn('zwp_tablet_v2.path');
  AIntf.zwp_tablet_v2_path(zwp_tablet_v2, path);
end;

procedure zwp_tablet_v2_done_Intf(AIntf: Izwp_tablet_v2Listener; zwp_tablet_v2: Pzwp_tablet_v2); cdecl;
begin
  WriteLn('zwp_tablet_v2.done');
  AIntf.zwp_tablet_v2_done(zwp_tablet_v2);
end;

procedure zwp_tablet_v2_removed_Intf(AIntf: Izwp_tablet_v2Listener; zwp_tablet_v2: Pzwp_tablet_v2); cdecl;
begin
  WriteLn('zwp_tablet_v2.removed');
  AIntf.zwp_tablet_v2_removed(zwp_tablet_v2);
end;

procedure zwp_tablet_pad_ring_v2_source_Intf(AIntf: Izwp_tablet_pad_ring_v2Listener; zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; source: cuint); cdecl;
begin
  WriteLn('zwp_tablet_pad_ring_v2.source');
  AIntf.zwp_tablet_pad_ring_v2_source(zwp_tablet_pad_ring_v2, source);
end;

procedure zwp_tablet_pad_ring_v2_angle_Intf(AIntf: Izwp_tablet_pad_ring_v2Listener; zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; degrees: cint32); cdecl;
begin
  WriteLn('zwp_tablet_pad_ring_v2.angle');
  AIntf.zwp_tablet_pad_ring_v2_angle(zwp_tablet_pad_ring_v2, degrees);
end;

procedure zwp_tablet_pad_ring_v2_stop_Intf(AIntf: Izwp_tablet_pad_ring_v2Listener; zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2); cdecl;
begin
  WriteLn('zwp_tablet_pad_ring_v2.stop');
  AIntf.zwp_tablet_pad_ring_v2_stop(zwp_tablet_pad_ring_v2);
end;

procedure zwp_tablet_pad_ring_v2_frame_Intf(AIntf: Izwp_tablet_pad_ring_v2Listener; zwp_tablet_pad_ring_v2: Pzwp_tablet_pad_ring_v2; time: cuint); cdecl;
begin
  WriteLn('zwp_tablet_pad_ring_v2.frame');
  AIntf.zwp_tablet_pad_ring_v2_frame(zwp_tablet_pad_ring_v2, time);
end;

procedure zwp_tablet_pad_strip_v2_source_Intf(AIntf: Izwp_tablet_pad_strip_v2Listener; zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; source: cuint); cdecl;
begin
  WriteLn('zwp_tablet_pad_strip_v2.source');
  AIntf.zwp_tablet_pad_strip_v2_source(zwp_tablet_pad_strip_v2, source);
end;

procedure zwp_tablet_pad_strip_v2_position_Intf(AIntf: Izwp_tablet_pad_strip_v2Listener; zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; position: cuint); cdecl;
begin
  WriteLn('zwp_tablet_pad_strip_v2.position');
  AIntf.zwp_tablet_pad_strip_v2_position(zwp_tablet_pad_strip_v2, position);
end;

procedure zwp_tablet_pad_strip_v2_stop_Intf(AIntf: Izwp_tablet_pad_strip_v2Listener; zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2); cdecl;
begin
  WriteLn('zwp_tablet_pad_strip_v2.stop');
  AIntf.zwp_tablet_pad_strip_v2_stop(zwp_tablet_pad_strip_v2);
end;

procedure zwp_tablet_pad_strip_v2_frame_Intf(AIntf: Izwp_tablet_pad_strip_v2Listener; zwp_tablet_pad_strip_v2: Pzwp_tablet_pad_strip_v2; time: cuint); cdecl;
begin
  WriteLn('zwp_tablet_pad_strip_v2.frame');
  AIntf.zwp_tablet_pad_strip_v2_frame(zwp_tablet_pad_strip_v2, time);
end;

procedure zwp_tablet_pad_group_v2_buttons_Intf(AIntf: Izwp_tablet_pad_group_v2Listener; zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; buttons: Pwl_array); cdecl;
begin
  WriteLn('zwp_tablet_pad_group_v2.buttons');
  AIntf.zwp_tablet_pad_group_v2_buttons(zwp_tablet_pad_group_v2, buttons);
end;

procedure zwp_tablet_pad_group_v2_ring_Intf(AIntf: Izwp_tablet_pad_group_v2Listener; zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; ring: Pzwp_tablet_pad_ring_v2); cdecl;
begin
  WriteLn('zwp_tablet_pad_group_v2.ring');
  AIntf.zwp_tablet_pad_group_v2_ring(zwp_tablet_pad_group_v2, ring);
end;

procedure zwp_tablet_pad_group_v2_strip_Intf(AIntf: Izwp_tablet_pad_group_v2Listener; zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; strip: Pzwp_tablet_pad_strip_v2); cdecl;
begin
  WriteLn('zwp_tablet_pad_group_v2.strip');
  AIntf.zwp_tablet_pad_group_v2_strip(zwp_tablet_pad_group_v2, strip);
end;

procedure zwp_tablet_pad_group_v2_modes_Intf(AIntf: Izwp_tablet_pad_group_v2Listener; zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; modes: cuint); cdecl;
begin
  WriteLn('zwp_tablet_pad_group_v2.modes');
  AIntf.zwp_tablet_pad_group_v2_modes(zwp_tablet_pad_group_v2, modes);
end;

procedure zwp_tablet_pad_group_v2_done_Intf(AIntf: Izwp_tablet_pad_group_v2Listener; zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2); cdecl;
begin
  WriteLn('zwp_tablet_pad_group_v2.done');
  AIntf.zwp_tablet_pad_group_v2_done(zwp_tablet_pad_group_v2);
end;

procedure zwp_tablet_pad_group_v2_mode_switch_Intf(AIntf: Izwp_tablet_pad_group_v2Listener; zwp_tablet_pad_group_v2: Pzwp_tablet_pad_group_v2; time: cuint; serial: cuint; mode: cuint); cdecl;
begin
  WriteLn('zwp_tablet_pad_group_v2.mode_switch');
  AIntf.zwp_tablet_pad_group_v2_mode_switch(zwp_tablet_pad_group_v2, time, serial, mode);
end;

procedure zwp_tablet_pad_v2_group_Intf(AIntf: Izwp_tablet_pad_v2Listener; zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; pad_group: Pzwp_tablet_pad_group_v2); cdecl;
begin
  WriteLn('zwp_tablet_pad_v2.group');
  AIntf.zwp_tablet_pad_v2_group(zwp_tablet_pad_v2, pad_group);
end;

procedure zwp_tablet_pad_v2_path_Intf(AIntf: Izwp_tablet_pad_v2Listener; zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; path: pchar); cdecl;
begin
  WriteLn('zwp_tablet_pad_v2.path');
  AIntf.zwp_tablet_pad_v2_path(zwp_tablet_pad_v2, path);
end;

procedure zwp_tablet_pad_v2_buttons_Intf(AIntf: Izwp_tablet_pad_v2Listener; zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; buttons: cuint); cdecl;
begin
  WriteLn('zwp_tablet_pad_v2.buttons');
  AIntf.zwp_tablet_pad_v2_buttons(zwp_tablet_pad_v2, buttons);
end;

procedure zwp_tablet_pad_v2_done_Intf(AIntf: Izwp_tablet_pad_v2Listener; zwp_tablet_pad_v2: Pzwp_tablet_pad_v2); cdecl;
begin
  WriteLn('zwp_tablet_pad_v2.done');
  AIntf.zwp_tablet_pad_v2_done(zwp_tablet_pad_v2);
end;

procedure zwp_tablet_pad_v2_button_Intf(AIntf: Izwp_tablet_pad_v2Listener; zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; time: cuint; button: cuint; state: cuint); cdecl;
begin
  WriteLn('zwp_tablet_pad_v2.button');
  AIntf.zwp_tablet_pad_v2_button(zwp_tablet_pad_v2, time, button, state);
end;

procedure zwp_tablet_pad_v2_enter_Intf(AIntf: Izwp_tablet_pad_v2Listener; zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; serial: cuint; tablet: Pzwp_tablet_v2; surface: Pwl_surface); cdecl;
begin
  WriteLn('zwp_tablet_pad_v2.enter');
  AIntf.zwp_tablet_pad_v2_enter(zwp_tablet_pad_v2, serial, tablet, surface);
end;

procedure zwp_tablet_pad_v2_leave_Intf(AIntf: Izwp_tablet_pad_v2Listener; zwp_tablet_pad_v2: Pzwp_tablet_pad_v2; serial: cuint; surface: Pwl_surface); cdecl;
begin
  WriteLn('zwp_tablet_pad_v2.leave');
  AIntf.zwp_tablet_pad_v2_leave(zwp_tablet_pad_v2, serial, surface);
end;

procedure zwp_tablet_pad_v2_removed_Intf(AIntf: Izwp_tablet_pad_v2Listener; zwp_tablet_pad_v2: Pzwp_tablet_pad_v2); cdecl;
begin
  WriteLn('zwp_tablet_pad_v2.removed');
  AIntf.zwp_tablet_pad_v2_removed(zwp_tablet_pad_v2);
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
