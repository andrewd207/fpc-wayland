unit xdg_shell_unstable_v6_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzxdg_shell_v6 = ^Tzxdg_shell_v6;
  Tzxdg_shell_v6 = record end;
  Pzxdg_positioner_v6 = ^Tzxdg_positioner_v6;
  Tzxdg_positioner_v6 = record end;
  Pzxdg_surface_v6 = ^Tzxdg_surface_v6;
  Tzxdg_surface_v6 = record end;
  Pzxdg_toplevel_v6 = ^Tzxdg_toplevel_v6;
  Tzxdg_toplevel_v6 = record end;
  Pzxdg_popup_v6 = ^Tzxdg_popup_v6;
  Tzxdg_popup_v6 = record end;
const
  ZXDG_SHELL_V6_ERROR_ROLE = 0; // given wl_surface has another role
  ZXDG_SHELL_V6_ERROR_DEFUNCT_SURFACES = 1; // xdg_shell was destroyed before children
  ZXDG_SHELL_V6_ERROR_NOT_THE_TOPMOST_POPUP = 2; // the client tried to map or destroy a non-topmost popup
  ZXDG_SHELL_V6_ERROR_INVALID_POPUP_PARENT = 3; // the client specified an invalid popup parent surface
  ZXDG_SHELL_V6_ERROR_INVALID_SURFACE_STATE = 4; // the client provided an invalid surface state
  ZXDG_SHELL_V6_ERROR_INVALID_POSITIONER = 5; // the client provided an invalid positioner

type
  Pzxdg_shell_v6_listener = ^Tzxdg_shell_v6_listener;
  Tzxdg_shell_v6_listener = record
    ping : procedure(data: Pointer; zxdg_shell_v6: Pzxdg_shell_v6; serial: cuint); cdecl;
  end;

const
  ZXDG_POSITIONER_V6_ERROR_INVALID_INPUT = 0; // invalid input provided
  ZXDG_POSITIONER_V6_ANCHOR_NONE = 0; // the center of the anchor rectangle
  ZXDG_POSITIONER_V6_ANCHOR_TOP = 1; // the top edge of the anchor rectangle
  ZXDG_POSITIONER_V6_ANCHOR_BOTTOM = 2; // the bottom edge of the anchor rectangle
  ZXDG_POSITIONER_V6_ANCHOR_LEFT = 4; // the left edge of the anchor rectangle
  ZXDG_POSITIONER_V6_ANCHOR_RIGHT = 8; // the right edge of the anchor rectangle
  ZXDG_POSITIONER_V6_GRAVITY_NONE = 0; // center over the anchor edge
  ZXDG_POSITIONER_V6_GRAVITY_TOP = 1; // position above the anchor edge
  ZXDG_POSITIONER_V6_GRAVITY_BOTTOM = 2; // position below the anchor edge
  ZXDG_POSITIONER_V6_GRAVITY_LEFT = 4; // position to the left of the anchor edge
  ZXDG_POSITIONER_V6_GRAVITY_RIGHT = 8; // position to the right of the anchor edge
  ZXDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_NONE = 0; // 
  ZXDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_SLIDE_X = 1; // 
  ZXDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_SLIDE_Y = 2; // 
  ZXDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_FLIP_X = 4; // 
  ZXDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_FLIP_Y = 8; // 
  ZXDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_RESIZE_X = 16; // 
  ZXDG_POSITIONER_V6_CONSTRAINT_ADJUSTMENT_RESIZE_Y = 32; // 

type
  Pzxdg_positioner_v6_listener = ^Tzxdg_positioner_v6_listener;
  Tzxdg_positioner_v6_listener = record
  end;

const
  ZXDG_SURFACE_V6_ERROR_NOT_CONSTRUCTED = 1; // 
  ZXDG_SURFACE_V6_ERROR_ALREADY_CONSTRUCTED = 2; // 
  ZXDG_SURFACE_V6_ERROR_UNCONFIGURED_BUFFER = 3; // 

type
  Pzxdg_surface_v6_listener = ^Tzxdg_surface_v6_listener;
  Tzxdg_surface_v6_listener = record
    configure : procedure(data: Pointer; zxdg_surface_v6: Pzxdg_surface_v6; serial: cuint); cdecl;
  end;

const
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_NONE = 0; // 
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_TOP = 1; // 
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_BOTTOM = 2; // 
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_LEFT = 4; // 
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_TOP_LEFT = 5; // 
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_BOTTOM_LEFT = 6; // 
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_RIGHT = 8; // 
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_TOP_RIGHT = 9; // 
  ZXDG_TOPLEVEL_V6_RESIZE_EDGE_BOTTOM_RIGHT = 10; // 
  ZXDG_TOPLEVEL_V6_STATE_MAXIMIZED = 1; // the surface is maximized
  ZXDG_TOPLEVEL_V6_STATE_FULLSCREEN = 2; // the surface is fullscreen
  ZXDG_TOPLEVEL_V6_STATE_RESIZING = 3; // the surface is being resized
  ZXDG_TOPLEVEL_V6_STATE_ACTIVATED = 4; // the surface is now activated

type
  Pzxdg_toplevel_v6_listener = ^Tzxdg_toplevel_v6_listener;
  Tzxdg_toplevel_v6_listener = record
    configure : procedure(data: Pointer; zxdg_toplevel_v6: Pzxdg_toplevel_v6; width: cint; height: cint; states: Pwl_array); cdecl;
    close : procedure(data: Pointer; zxdg_toplevel_v6: Pzxdg_toplevel_v6); cdecl;
  end;

const
  ZXDG_POPUP_V6_ERROR_INVALID_GRAB = 0; // tried to grab after being mapped

type
  Pzxdg_popup_v6_listener = ^Tzxdg_popup_v6_listener;
  Tzxdg_popup_v6_listener = record
    configure : procedure(data: Pointer; zxdg_popup_v6: Pzxdg_popup_v6; x: cint; y: cint; width: cint; height: cint); cdecl;
    popup_done : procedure(data: Pointer; zxdg_popup_v6: Pzxdg_popup_v6); cdecl;
  end;



  Izxdg_shell_v6Listener = interface
  ['Izxdg_shell_v6Listener']
    procedure zxdg_shell_v6_ping(zxdg_shell_v6: Pzxdg_shell_v6; serial: cuint);
  end;

  Izxdg_positioner_v6Listener = interface
  ['Izxdg_positioner_v6Listener']
  end;

  Izxdg_surface_v6Listener = interface
  ['Izxdg_surface_v6Listener']
    procedure zxdg_surface_v6_configure(zxdg_surface_v6: Pzxdg_surface_v6; serial: cuint);
  end;

  Izxdg_toplevel_v6Listener = interface
  ['Izxdg_toplevel_v6Listener']
    procedure zxdg_toplevel_v6_configure(zxdg_toplevel_v6: Pzxdg_toplevel_v6; width: cint; height: cint; states: Pwl_array);
    procedure zxdg_toplevel_v6_close(zxdg_toplevel_v6: Pzxdg_toplevel_v6);
  end;

  Izxdg_popup_v6Listener = interface
  ['Izxdg_popup_v6Listener']
    procedure zxdg_popup_v6_configure(zxdg_popup_v6: Pzxdg_popup_v6; x: cint; y: cint; width: cint; height: cint);
    procedure zxdg_popup_v6_popup_done(zxdg_popup_v6: Pzxdg_popup_v6);
  end;



procedure zxdg_shell_v6_destroy(zxdg_shell_v6: Pzxdg_shell_v6);
function  zxdg_shell_v6_create_positioner(zxdg_shell_v6: Pzxdg_shell_v6): Pzxdg_positioner_v6;
function  zxdg_shell_v6_get_xdg_surface(zxdg_shell_v6: Pzxdg_shell_v6; surface: Pwl_surface): Pzxdg_surface_v6;
procedure zxdg_shell_v6_pong(zxdg_shell_v6: Pzxdg_shell_v6; serial: cuint);
function  zxdg_shell_v6_add_listener(zxdg_shell_v6: Pzxdg_shell_v6; listener: Pzxdg_shell_v6_listener; data: Pointer): cint;
procedure  zxdg_shell_v6_add_listener(zxdg_shell_v6: Pzxdg_shell_v6; AIntf: Izxdg_shell_v6Listener);
procedure zxdg_shell_v6_set_user_data(zxdg_shell_v6: Pzxdg_shell_v6; user_data: Pointer);
function  zxdg_shell_v6_get_user_data(zxdg_shell_v6: Pzxdg_shell_v6): Pointer;
function  zxdg_shell_v6_get_version(zxdg_shell_v6: Pzxdg_shell_v6): cuint32;
procedure zxdg_positioner_v6_destroy(zxdg_positioner_v6: Pzxdg_positioner_v6);
procedure zxdg_positioner_v6_set_size(zxdg_positioner_v6: Pzxdg_positioner_v6; width: cint; height: cint);
procedure zxdg_positioner_v6_set_anchor_rect(zxdg_positioner_v6: Pzxdg_positioner_v6; x: cint; y: cint; width: cint; height: cint);
procedure zxdg_positioner_v6_set_anchor(zxdg_positioner_v6: Pzxdg_positioner_v6; anchor: cuint);
procedure zxdg_positioner_v6_set_gravity(zxdg_positioner_v6: Pzxdg_positioner_v6; gravity: cuint);
procedure zxdg_positioner_v6_set_constraint_adjustment(zxdg_positioner_v6: Pzxdg_positioner_v6; constraint_adjustment: cuint);
procedure zxdg_positioner_v6_set_offset(zxdg_positioner_v6: Pzxdg_positioner_v6; x: cint; y: cint);
function  zxdg_positioner_v6_add_listener(zxdg_positioner_v6: Pzxdg_positioner_v6; listener: Pzxdg_positioner_v6_listener; data: Pointer): cint;
procedure  zxdg_positioner_v6_add_listener(zxdg_positioner_v6: Pzxdg_positioner_v6; AIntf: Izxdg_positioner_v6Listener);
procedure zxdg_positioner_v6_set_user_data(zxdg_positioner_v6: Pzxdg_positioner_v6; user_data: Pointer);
function  zxdg_positioner_v6_get_user_data(zxdg_positioner_v6: Pzxdg_positioner_v6): Pointer;
function  zxdg_positioner_v6_get_version(zxdg_positioner_v6: Pzxdg_positioner_v6): cuint32;
procedure zxdg_surface_v6_destroy(zxdg_surface_v6: Pzxdg_surface_v6);
function  zxdg_surface_v6_get_toplevel(zxdg_surface_v6: Pzxdg_surface_v6): Pzxdg_toplevel_v6;
function  zxdg_surface_v6_get_popup(zxdg_surface_v6: Pzxdg_surface_v6; parent: Pzxdg_surface_v6; positioner: Pzxdg_positioner_v6): Pzxdg_popup_v6;
procedure zxdg_surface_v6_set_window_geometry(zxdg_surface_v6: Pzxdg_surface_v6; x: cint; y: cint; width: cint; height: cint);
procedure zxdg_surface_v6_ack_configure(zxdg_surface_v6: Pzxdg_surface_v6; serial: cuint);
function  zxdg_surface_v6_add_listener(zxdg_surface_v6: Pzxdg_surface_v6; listener: Pzxdg_surface_v6_listener; data: Pointer): cint;
procedure  zxdg_surface_v6_add_listener(zxdg_surface_v6: Pzxdg_surface_v6; AIntf: Izxdg_surface_v6Listener);
procedure zxdg_surface_v6_set_user_data(zxdg_surface_v6: Pzxdg_surface_v6; user_data: Pointer);
function  zxdg_surface_v6_get_user_data(zxdg_surface_v6: Pzxdg_surface_v6): Pointer;
function  zxdg_surface_v6_get_version(zxdg_surface_v6: Pzxdg_surface_v6): cuint32;
procedure zxdg_toplevel_v6_destroy(zxdg_toplevel_v6: Pzxdg_toplevel_v6);
procedure zxdg_toplevel_v6_set_parent(zxdg_toplevel_v6: Pzxdg_toplevel_v6; parent: Pzxdg_toplevel_v6);
procedure zxdg_toplevel_v6_set_title(zxdg_toplevel_v6: Pzxdg_toplevel_v6; title: pchar);
procedure zxdg_toplevel_v6_set_app_id(zxdg_toplevel_v6: Pzxdg_toplevel_v6; app_id: pchar);
procedure zxdg_toplevel_v6_show_window_menu(zxdg_toplevel_v6: Pzxdg_toplevel_v6; seat: Pwl_seat; serial: cuint; x: cint; y: cint);
procedure zxdg_toplevel_v6_move(zxdg_toplevel_v6: Pzxdg_toplevel_v6; seat: Pwl_seat; serial: cuint);
procedure zxdg_toplevel_v6_resize(zxdg_toplevel_v6: Pzxdg_toplevel_v6; seat: Pwl_seat; serial: cuint; edges: cuint);
procedure zxdg_toplevel_v6_set_max_size(zxdg_toplevel_v6: Pzxdg_toplevel_v6; width: cint; height: cint);
procedure zxdg_toplevel_v6_set_min_size(zxdg_toplevel_v6: Pzxdg_toplevel_v6; width: cint; height: cint);
procedure zxdg_toplevel_v6_set_maximized(zxdg_toplevel_v6: Pzxdg_toplevel_v6);
procedure zxdg_toplevel_v6_unset_maximized(zxdg_toplevel_v6: Pzxdg_toplevel_v6);
procedure zxdg_toplevel_v6_set_fullscreen(zxdg_toplevel_v6: Pzxdg_toplevel_v6; output: Pwl_output);
procedure zxdg_toplevel_v6_unset_fullscreen(zxdg_toplevel_v6: Pzxdg_toplevel_v6);
procedure zxdg_toplevel_v6_set_minimized(zxdg_toplevel_v6: Pzxdg_toplevel_v6);
function  zxdg_toplevel_v6_add_listener(zxdg_toplevel_v6: Pzxdg_toplevel_v6; listener: Pzxdg_toplevel_v6_listener; data: Pointer): cint;
procedure  zxdg_toplevel_v6_add_listener(zxdg_toplevel_v6: Pzxdg_toplevel_v6; AIntf: Izxdg_toplevel_v6Listener);
procedure zxdg_toplevel_v6_set_user_data(zxdg_toplevel_v6: Pzxdg_toplevel_v6; user_data: Pointer);
function  zxdg_toplevel_v6_get_user_data(zxdg_toplevel_v6: Pzxdg_toplevel_v6): Pointer;
function  zxdg_toplevel_v6_get_version(zxdg_toplevel_v6: Pzxdg_toplevel_v6): cuint32;
procedure zxdg_popup_v6_destroy(zxdg_popup_v6: Pzxdg_popup_v6);
procedure zxdg_popup_v6_grab(zxdg_popup_v6: Pzxdg_popup_v6; seat: Pwl_seat; serial: cuint);
function  zxdg_popup_v6_add_listener(zxdg_popup_v6: Pzxdg_popup_v6; listener: Pzxdg_popup_v6_listener; data: Pointer): cint;
procedure  zxdg_popup_v6_add_listener(zxdg_popup_v6: Pzxdg_popup_v6; AIntf: Izxdg_popup_v6Listener);
procedure zxdg_popup_v6_set_user_data(zxdg_popup_v6: Pzxdg_popup_v6; user_data: Pointer);
function  zxdg_popup_v6_get_user_data(zxdg_popup_v6: Pzxdg_popup_v6): Pointer;
function  zxdg_popup_v6_get_version(zxdg_popup_v6: Pzxdg_popup_v6): cuint32;



var
  zxdg_shell_v6_interface: Twl_interface;
  zxdg_positioner_v6_interface: Twl_interface;
  zxdg_surface_v6_interface: Twl_interface;
  zxdg_toplevel_v6_interface: Twl_interface;
  zxdg_popup_v6_interface: Twl_interface;



implementation

const
_ZXDG_SHELL_V6_DESTROY = 0;
_ZXDG_SHELL_V6_CREATE_POSITIONER = 1;
_ZXDG_SHELL_V6_GET_XDG_SURFACE = 2;
_ZXDG_SHELL_V6_PONG = 3;
_ZXDG_POSITIONER_V6_DESTROY = 0;
_ZXDG_POSITIONER_V6_SET_SIZE = 1;
_ZXDG_POSITIONER_V6_SET_ANCHOR_RECT = 2;
_ZXDG_POSITIONER_V6_SET_ANCHOR = 3;
_ZXDG_POSITIONER_V6_SET_GRAVITY = 4;
_ZXDG_POSITIONER_V6_SET_CONSTRAINT_ADJUSTMENT = 5;
_ZXDG_POSITIONER_V6_SET_OFFSET = 6;
_ZXDG_SURFACE_V6_DESTROY = 0;
_ZXDG_SURFACE_V6_GET_TOPLEVEL = 1;
_ZXDG_SURFACE_V6_GET_POPUP = 2;
_ZXDG_SURFACE_V6_SET_WINDOW_GEOMETRY = 3;
_ZXDG_SURFACE_V6_ACK_CONFIGURE = 4;
_ZXDG_TOPLEVEL_V6_DESTROY = 0;
_ZXDG_TOPLEVEL_V6_SET_PARENT = 1;
_ZXDG_TOPLEVEL_V6_SET_TITLE = 2;
_ZXDG_TOPLEVEL_V6_SET_APP_ID = 3;
_ZXDG_TOPLEVEL_V6_SHOW_WINDOW_MENU = 4;
_ZXDG_TOPLEVEL_V6_MOVE = 5;
_ZXDG_TOPLEVEL_V6_RESIZE = 6;
_ZXDG_TOPLEVEL_V6_SET_MAX_SIZE = 7;
_ZXDG_TOPLEVEL_V6_SET_MIN_SIZE = 8;
_ZXDG_TOPLEVEL_V6_SET_MAXIMIZED = 9;
_ZXDG_TOPLEVEL_V6_UNSET_MAXIMIZED = 10;
_ZXDG_TOPLEVEL_V6_SET_FULLSCREEN = 11;
_ZXDG_TOPLEVEL_V6_UNSET_FULLSCREEN = 12;
_ZXDG_TOPLEVEL_V6_SET_MINIMIZED = 13;
_ZXDG_POPUP_V6_DESTROY = 0;
_ZXDG_POPUP_V6_GRAB = 1;


var
  vIntf_zxdg_shell_v6_Listener: Tzxdg_shell_v6_listener;
  vIntf_zxdg_positioner_v6_Listener: Tzxdg_positioner_v6_listener;
  vIntf_zxdg_surface_v6_Listener: Tzxdg_surface_v6_listener;
  vIntf_zxdg_toplevel_v6_Listener: Tzxdg_toplevel_v6_listener;
  vIntf_zxdg_popup_v6_Listener: Tzxdg_popup_v6_listener;



procedure zxdg_shell_v6_destroy(zxdg_shell_v6: Pzxdg_shell_v6);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_shell_v6), _ZXDG_SHELL_V6_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zxdg_shell_v6));
end;

function  zxdg_shell_v6_create_positioner(zxdg_shell_v6: Pzxdg_shell_v6): Pzxdg_positioner_v6;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zxdg_shell_v6),
      _ZXDG_SHELL_V6_CREATE_POSITIONER, @zxdg_positioner_v6_interface, nil);
  Result := Pzxdg_positioner_v6(id);
end;

function  zxdg_shell_v6_get_xdg_surface(zxdg_shell_v6: Pzxdg_shell_v6; surface: Pwl_surface): Pzxdg_surface_v6;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zxdg_shell_v6),
      _ZXDG_SHELL_V6_GET_XDG_SURFACE, @zxdg_surface_v6_interface, nil, surface);
  Result := Pzxdg_surface_v6(id);
end;

procedure zxdg_shell_v6_pong(zxdg_shell_v6: Pzxdg_shell_v6; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_shell_v6),
      _ZXDG_SHELL_V6_PONG, serial);
end;

function  zxdg_shell_v6_add_listener(zxdg_shell_v6: Pzxdg_shell_v6; listener: Pzxdg_shell_v6_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zxdg_shell_v6), listener, data);
end;

procedure  zxdg_shell_v6_add_listener(zxdg_shell_v6: Pzxdg_shell_v6; AIntf: Izxdg_shell_v6Listener);
begin
  zxdg_shell_v6_add_listener(zxdg_shell_v6, @vIntf_zxdg_shell_v6_Listener, AIntf);
end;

procedure zxdg_shell_v6_set_user_data(zxdg_shell_v6: Pzxdg_shell_v6; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zxdg_shell_v6), user_data);
end;

function  zxdg_shell_v6_get_user_data(zxdg_shell_v6: Pzxdg_shell_v6): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zxdg_shell_v6));
end;

function  zxdg_shell_v6_get_version(zxdg_shell_v6: Pzxdg_shell_v6): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zxdg_shell_v6));
end;

procedure zxdg_positioner_v6_destroy(zxdg_positioner_v6: Pzxdg_positioner_v6);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_positioner_v6), _ZXDG_POSITIONER_V6_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zxdg_positioner_v6));
end;

procedure zxdg_positioner_v6_set_size(zxdg_positioner_v6: Pzxdg_positioner_v6; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_positioner_v6),
      _ZXDG_POSITIONER_V6_SET_SIZE, width, height);
end;

procedure zxdg_positioner_v6_set_anchor_rect(zxdg_positioner_v6: Pzxdg_positioner_v6; x: cint; y: cint; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_positioner_v6),
      _ZXDG_POSITIONER_V6_SET_ANCHOR_RECT, x, y, width, height);
end;

procedure zxdg_positioner_v6_set_anchor(zxdg_positioner_v6: Pzxdg_positioner_v6; anchor: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_positioner_v6),
      _ZXDG_POSITIONER_V6_SET_ANCHOR, anchor);
end;

procedure zxdg_positioner_v6_set_gravity(zxdg_positioner_v6: Pzxdg_positioner_v6; gravity: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_positioner_v6),
      _ZXDG_POSITIONER_V6_SET_GRAVITY, gravity);
end;

procedure zxdg_positioner_v6_set_constraint_adjustment(zxdg_positioner_v6: Pzxdg_positioner_v6; constraint_adjustment: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_positioner_v6),
      _ZXDG_POSITIONER_V6_SET_CONSTRAINT_ADJUSTMENT, constraint_adjustment);
end;

procedure zxdg_positioner_v6_set_offset(zxdg_positioner_v6: Pzxdg_positioner_v6; x: cint; y: cint);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_positioner_v6),
      _ZXDG_POSITIONER_V6_SET_OFFSET, x, y);
end;

function  zxdg_positioner_v6_add_listener(zxdg_positioner_v6: Pzxdg_positioner_v6; listener: Pzxdg_positioner_v6_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zxdg_positioner_v6), listener, data);
end;

procedure  zxdg_positioner_v6_add_listener(zxdg_positioner_v6: Pzxdg_positioner_v6; AIntf: Izxdg_positioner_v6Listener);
begin
  zxdg_positioner_v6_add_listener(zxdg_positioner_v6, @vIntf_zxdg_positioner_v6_Listener, AIntf);
end;

procedure zxdg_positioner_v6_set_user_data(zxdg_positioner_v6: Pzxdg_positioner_v6; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zxdg_positioner_v6), user_data);
end;

function  zxdg_positioner_v6_get_user_data(zxdg_positioner_v6: Pzxdg_positioner_v6): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zxdg_positioner_v6));
end;

function  zxdg_positioner_v6_get_version(zxdg_positioner_v6: Pzxdg_positioner_v6): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zxdg_positioner_v6));
end;

procedure zxdg_surface_v6_destroy(zxdg_surface_v6: Pzxdg_surface_v6);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_surface_v6), _ZXDG_SURFACE_V6_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zxdg_surface_v6));
end;

function  zxdg_surface_v6_get_toplevel(zxdg_surface_v6: Pzxdg_surface_v6): Pzxdg_toplevel_v6;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zxdg_surface_v6),
      _ZXDG_SURFACE_V6_GET_TOPLEVEL, @zxdg_toplevel_v6_interface, nil);
  Result := Pzxdg_toplevel_v6(id);
end;

function  zxdg_surface_v6_get_popup(zxdg_surface_v6: Pzxdg_surface_v6; parent: Pzxdg_surface_v6; positioner: Pzxdg_positioner_v6): Pzxdg_popup_v6;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zxdg_surface_v6),
      _ZXDG_SURFACE_V6_GET_POPUP, @zxdg_popup_v6_interface, nil, parent, positioner);
  Result := Pzxdg_popup_v6(id);
end;

procedure zxdg_surface_v6_set_window_geometry(zxdg_surface_v6: Pzxdg_surface_v6; x: cint; y: cint; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_surface_v6),
      _ZXDG_SURFACE_V6_SET_WINDOW_GEOMETRY, x, y, width, height);
end;

procedure zxdg_surface_v6_ack_configure(zxdg_surface_v6: Pzxdg_surface_v6; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_surface_v6),
      _ZXDG_SURFACE_V6_ACK_CONFIGURE, serial);
end;

function  zxdg_surface_v6_add_listener(zxdg_surface_v6: Pzxdg_surface_v6; listener: Pzxdg_surface_v6_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zxdg_surface_v6), listener, data);
end;

procedure  zxdg_surface_v6_add_listener(zxdg_surface_v6: Pzxdg_surface_v6; AIntf: Izxdg_surface_v6Listener);
begin
  zxdg_surface_v6_add_listener(zxdg_surface_v6, @vIntf_zxdg_surface_v6_Listener, AIntf);
end;

procedure zxdg_surface_v6_set_user_data(zxdg_surface_v6: Pzxdg_surface_v6; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zxdg_surface_v6), user_data);
end;

function  zxdg_surface_v6_get_user_data(zxdg_surface_v6: Pzxdg_surface_v6): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zxdg_surface_v6));
end;

function  zxdg_surface_v6_get_version(zxdg_surface_v6: Pzxdg_surface_v6): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zxdg_surface_v6));
end;

procedure zxdg_toplevel_v6_destroy(zxdg_toplevel_v6: Pzxdg_toplevel_v6);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_toplevel_v6), _ZXDG_TOPLEVEL_V6_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zxdg_toplevel_v6));
end;

procedure zxdg_toplevel_v6_set_parent(zxdg_toplevel_v6: Pzxdg_toplevel_v6; parent: Pzxdg_toplevel_v6);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_toplevel_v6),
      _ZXDG_TOPLEVEL_V6_SET_PARENT, parent);
end;

procedure zxdg_toplevel_v6_set_title(zxdg_toplevel_v6: Pzxdg_toplevel_v6; title: pchar);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_toplevel_v6),
      _ZXDG_TOPLEVEL_V6_SET_TITLE, title);
end;

procedure zxdg_toplevel_v6_set_app_id(zxdg_toplevel_v6: Pzxdg_toplevel_v6; app_id: pchar);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_toplevel_v6),
      _ZXDG_TOPLEVEL_V6_SET_APP_ID, app_id);
end;

procedure zxdg_toplevel_v6_show_window_menu(zxdg_toplevel_v6: Pzxdg_toplevel_v6; seat: Pwl_seat; serial: cuint; x: cint; y: cint);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_toplevel_v6),
      _ZXDG_TOPLEVEL_V6_SHOW_WINDOW_MENU, seat, serial, x, y);
end;

procedure zxdg_toplevel_v6_move(zxdg_toplevel_v6: Pzxdg_toplevel_v6; seat: Pwl_seat; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_toplevel_v6),
      _ZXDG_TOPLEVEL_V6_MOVE, seat, serial);
end;

procedure zxdg_toplevel_v6_resize(zxdg_toplevel_v6: Pzxdg_toplevel_v6; seat: Pwl_seat; serial: cuint; edges: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_toplevel_v6),
      _ZXDG_TOPLEVEL_V6_RESIZE, seat, serial, edges);
end;

procedure zxdg_toplevel_v6_set_max_size(zxdg_toplevel_v6: Pzxdg_toplevel_v6; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_toplevel_v6),
      _ZXDG_TOPLEVEL_V6_SET_MAX_SIZE, width, height);
end;

procedure zxdg_toplevel_v6_set_min_size(zxdg_toplevel_v6: Pzxdg_toplevel_v6; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_toplevel_v6),
      _ZXDG_TOPLEVEL_V6_SET_MIN_SIZE, width, height);
end;

procedure zxdg_toplevel_v6_set_maximized(zxdg_toplevel_v6: Pzxdg_toplevel_v6);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_toplevel_v6),
      _ZXDG_TOPLEVEL_V6_SET_MAXIMIZED);
end;

procedure zxdg_toplevel_v6_unset_maximized(zxdg_toplevel_v6: Pzxdg_toplevel_v6);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_toplevel_v6),
      _ZXDG_TOPLEVEL_V6_UNSET_MAXIMIZED);
end;

procedure zxdg_toplevel_v6_set_fullscreen(zxdg_toplevel_v6: Pzxdg_toplevel_v6; output: Pwl_output);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_toplevel_v6),
      _ZXDG_TOPLEVEL_V6_SET_FULLSCREEN, output);
end;

procedure zxdg_toplevel_v6_unset_fullscreen(zxdg_toplevel_v6: Pzxdg_toplevel_v6);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_toplevel_v6),
      _ZXDG_TOPLEVEL_V6_UNSET_FULLSCREEN);
end;

procedure zxdg_toplevel_v6_set_minimized(zxdg_toplevel_v6: Pzxdg_toplevel_v6);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_toplevel_v6),
      _ZXDG_TOPLEVEL_V6_SET_MINIMIZED);
end;

function  zxdg_toplevel_v6_add_listener(zxdg_toplevel_v6: Pzxdg_toplevel_v6; listener: Pzxdg_toplevel_v6_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zxdg_toplevel_v6), listener, data);
end;

procedure  zxdg_toplevel_v6_add_listener(zxdg_toplevel_v6: Pzxdg_toplevel_v6; AIntf: Izxdg_toplevel_v6Listener);
begin
  zxdg_toplevel_v6_add_listener(zxdg_toplevel_v6, @vIntf_zxdg_toplevel_v6_Listener, AIntf);
end;

procedure zxdg_toplevel_v6_set_user_data(zxdg_toplevel_v6: Pzxdg_toplevel_v6; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zxdg_toplevel_v6), user_data);
end;

function  zxdg_toplevel_v6_get_user_data(zxdg_toplevel_v6: Pzxdg_toplevel_v6): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zxdg_toplevel_v6));
end;

function  zxdg_toplevel_v6_get_version(zxdg_toplevel_v6: Pzxdg_toplevel_v6): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zxdg_toplevel_v6));
end;

procedure zxdg_popup_v6_destroy(zxdg_popup_v6: Pzxdg_popup_v6);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_popup_v6), _ZXDG_POPUP_V6_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zxdg_popup_v6));
end;

procedure zxdg_popup_v6_grab(zxdg_popup_v6: Pzxdg_popup_v6; seat: Pwl_seat; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_popup_v6),
      _ZXDG_POPUP_V6_GRAB, seat, serial);
end;

function  zxdg_popup_v6_add_listener(zxdg_popup_v6: Pzxdg_popup_v6; listener: Pzxdg_popup_v6_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zxdg_popup_v6), listener, data);
end;

procedure  zxdg_popup_v6_add_listener(zxdg_popup_v6: Pzxdg_popup_v6; AIntf: Izxdg_popup_v6Listener);
begin
  zxdg_popup_v6_add_listener(zxdg_popup_v6, @vIntf_zxdg_popup_v6_Listener, AIntf);
end;

procedure zxdg_popup_v6_set_user_data(zxdg_popup_v6: Pzxdg_popup_v6; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zxdg_popup_v6), user_data);
end;

function  zxdg_popup_v6_get_user_data(zxdg_popup_v6: Pzxdg_popup_v6): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zxdg_popup_v6));
end;

function  zxdg_popup_v6_get_version(zxdg_popup_v6: Pzxdg_popup_v6): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zxdg_popup_v6));
end;


procedure zxdg_shell_v6_ping_Intf(AIntf: Izxdg_shell_v6Listener; zxdg_shell_v6: Pzxdg_shell_v6; serial: cuint); cdecl;
begin
  WriteLn('zxdg_shell_v6.ping');
  AIntf.zxdg_shell_v6_ping(zxdg_shell_v6, serial);
end;

procedure zxdg_surface_v6_configure_Intf(AIntf: Izxdg_surface_v6Listener; zxdg_surface_v6: Pzxdg_surface_v6; serial: cuint); cdecl;
begin
  WriteLn('zxdg_surface_v6.configure');
  AIntf.zxdg_surface_v6_configure(zxdg_surface_v6, serial);
end;

procedure zxdg_toplevel_v6_configure_Intf(AIntf: Izxdg_toplevel_v6Listener; zxdg_toplevel_v6: Pzxdg_toplevel_v6; width: cint; height: cint; states: Pwl_array); cdecl;
begin
  WriteLn('zxdg_toplevel_v6.configure');
  AIntf.zxdg_toplevel_v6_configure(zxdg_toplevel_v6, width, height, states);
end;

procedure zxdg_toplevel_v6_close_Intf(AIntf: Izxdg_toplevel_v6Listener; zxdg_toplevel_v6: Pzxdg_toplevel_v6); cdecl;
begin
  WriteLn('zxdg_toplevel_v6.close');
  AIntf.zxdg_toplevel_v6_close(zxdg_toplevel_v6);
end;

procedure zxdg_popup_v6_configure_Intf(AIntf: Izxdg_popup_v6Listener; zxdg_popup_v6: Pzxdg_popup_v6; x: cint; y: cint; width: cint; height: cint); cdecl;
begin
  WriteLn('zxdg_popup_v6.configure');
  AIntf.zxdg_popup_v6_configure(zxdg_popup_v6, x, y, width, height);
end;

procedure zxdg_popup_v6_popup_done_Intf(AIntf: Izxdg_popup_v6Listener; zxdg_popup_v6: Pzxdg_popup_v6); cdecl;
begin
  WriteLn('zxdg_popup_v6.popup_done');
  AIntf.zxdg_popup_v6_popup_done(zxdg_popup_v6);
end;



const
  pInterfaces: array[0..27] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@zxdg_positioner_v6_interface),
    (@zxdg_surface_v6_interface),
    (@wl_surface_interface),
    (@zxdg_toplevel_v6_interface),
    (@zxdg_popup_v6_interface),
    (@zxdg_surface_v6_interface),
    (@zxdg_positioner_v6_interface),
    (@zxdg_toplevel_v6_interface),
    (@wl_seat_interface),
    (nil),
    (nil),
    (nil),
    (@wl_seat_interface),
    (nil),
    (@wl_seat_interface),
    (nil),
    (nil),
    (@wl_output_interface),
    (@wl_seat_interface),
    (nil)
  );

  zxdg_shell_v6_requests: array[0..3] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'create_positioner'; signature: 'n'; types: @pInterfaces[8]),
    (name: 'get_xdg_surface'; signature: 'no'; types: @pInterfaces[9]),
    (name: 'pong'; signature: 'u'; types: @pInterfaces[0])
  );
  zxdg_shell_v6_events: array[0..0] of Twl_message = (
    (name: 'ping'; signature: 'u'; types: @pInterfaces[0])
  );
  zxdg_positioner_v6_requests: array[0..6] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_size'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'set_anchor_rect'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'set_anchor'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_gravity'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_constraint_adjustment'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_offset'; signature: 'ii'; types: @pInterfaces[0])
  );
  zxdg_surface_v6_requests: array[0..4] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_toplevel'; signature: 'n'; types: @pInterfaces[11]),
    (name: 'get_popup'; signature: 'noo'; types: @pInterfaces[12]),
    (name: 'set_window_geometry'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'ack_configure'; signature: 'u'; types: @pInterfaces[0])
  );
  zxdg_surface_v6_events: array[0..0] of Twl_message = (
    (name: 'configure'; signature: 'u'; types: @pInterfaces[0])
  );
  zxdg_toplevel_v6_requests: array[0..13] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_parent'; signature: '?o'; types: @pInterfaces[15]),
    (name: 'set_title'; signature: 's'; types: @pInterfaces[0]),
    (name: 'set_app_id'; signature: 's'; types: @pInterfaces[0]),
    (name: 'show_window_menu'; signature: 'ouii'; types: @pInterfaces[16]),
    (name: 'move'; signature: 'ou'; types: @pInterfaces[20]),
    (name: 'resize'; signature: 'ouu'; types: @pInterfaces[22]),
    (name: 'set_max_size'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'set_min_size'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'set_maximized'; signature: ''; types: @pInterfaces[0]),
    (name: 'unset_maximized'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_fullscreen'; signature: '?o'; types: @pInterfaces[25]),
    (name: 'unset_fullscreen'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_minimized'; signature: ''; types: @pInterfaces[0])
  );
  zxdg_toplevel_v6_events: array[0..1] of Twl_message = (
    (name: 'configure'; signature: 'iia'; types: @pInterfaces[0]),
    (name: 'close'; signature: ''; types: @pInterfaces[0])
  );
  zxdg_popup_v6_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'grab'; signature: 'ou'; types: @pInterfaces[26])
  );
  zxdg_popup_v6_events: array[0..1] of Twl_message = (
    (name: 'configure'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'popup_done'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zxdg_shell_v6_Listener.ping) := @zxdg_shell_v6_ping_Intf;
  Pointer(vIntf_zxdg_surface_v6_Listener.configure) := @zxdg_surface_v6_configure_Intf;
  Pointer(vIntf_zxdg_toplevel_v6_Listener.configure) := @zxdg_toplevel_v6_configure_Intf;
  Pointer(vIntf_zxdg_toplevel_v6_Listener.close) := @zxdg_toplevel_v6_close_Intf;
  Pointer(vIntf_zxdg_popup_v6_Listener.configure) := @zxdg_popup_v6_configure_Intf;
  Pointer(vIntf_zxdg_popup_v6_Listener.popup_done) := @zxdg_popup_v6_popup_done_Intf;


  zxdg_shell_v6_interface.name := 'zxdg_shell_v6';
  zxdg_shell_v6_interface.version := 1;
  zxdg_shell_v6_interface.method_count := 4;
  zxdg_shell_v6_interface.methods := @zxdg_shell_v6_requests;
  zxdg_shell_v6_interface.event_count := 1;
  zxdg_shell_v6_interface.events := @zxdg_shell_v6_events;

  zxdg_positioner_v6_interface.name := 'zxdg_positioner_v6';
  zxdg_positioner_v6_interface.version := 1;
  zxdg_positioner_v6_interface.method_count := 7;
  zxdg_positioner_v6_interface.methods := @zxdg_positioner_v6_requests;
  zxdg_positioner_v6_interface.event_count := 0;
  zxdg_positioner_v6_interface.events := nil;

  zxdg_surface_v6_interface.name := 'zxdg_surface_v6';
  zxdg_surface_v6_interface.version := 1;
  zxdg_surface_v6_interface.method_count := 5;
  zxdg_surface_v6_interface.methods := @zxdg_surface_v6_requests;
  zxdg_surface_v6_interface.event_count := 1;
  zxdg_surface_v6_interface.events := @zxdg_surface_v6_events;

  zxdg_toplevel_v6_interface.name := 'zxdg_toplevel_v6';
  zxdg_toplevel_v6_interface.version := 1;
  zxdg_toplevel_v6_interface.method_count := 14;
  zxdg_toplevel_v6_interface.methods := @zxdg_toplevel_v6_requests;
  zxdg_toplevel_v6_interface.event_count := 2;
  zxdg_toplevel_v6_interface.events := @zxdg_toplevel_v6_events;

  zxdg_popup_v6_interface.name := 'zxdg_popup_v6';
  zxdg_popup_v6_interface.version := 1;
  zxdg_popup_v6_interface.method_count := 2;
  zxdg_popup_v6_interface.methods := @zxdg_popup_v6_requests;
  zxdg_popup_v6_interface.event_count := 2;
  zxdg_popup_v6_interface.events := @zxdg_popup_v6_events;

end.
