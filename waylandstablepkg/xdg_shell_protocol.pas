unit xdg_shell_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pxdg_wm_base = ^Txdg_wm_base;
  Txdg_wm_base = record end;
  Pxdg_positioner = ^Txdg_positioner;
  Txdg_positioner = record end;
  Pxdg_surface = ^Txdg_surface;
  Txdg_surface = record end;
  Pxdg_toplevel = ^Txdg_toplevel;
  Txdg_toplevel = record end;
  Pxdg_popup = ^Txdg_popup;
  Txdg_popup = record end;
const
  XDG_WM_BASE_ERROR_ROLE = 0; // given wl_surface has another role
  XDG_WM_BASE_ERROR_DEFUNCT_SURFACES = 1; // xdg_wm_base was destroyed before children
  XDG_WM_BASE_ERROR_NOT_THE_TOPMOST_POPUP = 2; // the client tried to map or destroy a non-topmost popup
  XDG_WM_BASE_ERROR_INVALID_POPUP_PARENT = 3; // the client specified an invalid popup parent surface
  XDG_WM_BASE_ERROR_INVALID_SURFACE_STATE = 4; // the client provided an invalid surface state
  XDG_WM_BASE_ERROR_INVALID_POSITIONER = 5; // the client provided an invalid positioner

type
  Pxdg_wm_base_listener = ^Txdg_wm_base_listener;
  Txdg_wm_base_listener = record
    ping : procedure(data: Pointer; xdg_wm_base: Pxdg_wm_base; serial: cuint); cdecl;
  end;

const
  XDG_POSITIONER_ERROR_INVALID_INPUT = 0; // invalid input provided
  XDG_POSITIONER_ANCHOR_NONE = 0; // 
  XDG_POSITIONER_ANCHOR_TOP = 1; // 
  XDG_POSITIONER_ANCHOR_BOTTOM = 2; // 
  XDG_POSITIONER_ANCHOR_LEFT = 3; // 
  XDG_POSITIONER_ANCHOR_RIGHT = 4; // 
  XDG_POSITIONER_ANCHOR_TOP_LEFT = 5; // 
  XDG_POSITIONER_ANCHOR_BOTTOM_LEFT = 6; // 
  XDG_POSITIONER_ANCHOR_TOP_RIGHT = 7; // 
  XDG_POSITIONER_ANCHOR_BOTTOM_RIGHT = 8; // 
  XDG_POSITIONER_GRAVITY_NONE = 0; // 
  XDG_POSITIONER_GRAVITY_TOP = 1; // 
  XDG_POSITIONER_GRAVITY_BOTTOM = 2; // 
  XDG_POSITIONER_GRAVITY_LEFT = 3; // 
  XDG_POSITIONER_GRAVITY_RIGHT = 4; // 
  XDG_POSITIONER_GRAVITY_TOP_LEFT = 5; // 
  XDG_POSITIONER_GRAVITY_BOTTOM_LEFT = 6; // 
  XDG_POSITIONER_GRAVITY_TOP_RIGHT = 7; // 
  XDG_POSITIONER_GRAVITY_BOTTOM_RIGHT = 8; // 
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_NONE = 0; // 
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_SLIDE_X = 1; // 
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_SLIDE_Y = 2; // 
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_FLIP_X = 4; // 
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_FLIP_Y = 8; // 
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_RESIZE_X = 16; // 
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_RESIZE_Y = 32; // 

type
  Pxdg_positioner_listener = ^Txdg_positioner_listener;
  Txdg_positioner_listener = record
  end;

const
  XDG_SURFACE_ERROR_NOT_CONSTRUCTED = 1; // 
  XDG_SURFACE_ERROR_ALREADY_CONSTRUCTED = 2; // 
  XDG_SURFACE_ERROR_UNCONFIGURED_BUFFER = 3; // 

type
  Pxdg_surface_listener = ^Txdg_surface_listener;
  Txdg_surface_listener = record
    configure : procedure(data: Pointer; xdg_surface: Pxdg_surface; serial: cuint); cdecl;
  end;

const
  XDG_TOPLEVEL_RESIZE_EDGE_NONE = 0; // 
  XDG_TOPLEVEL_RESIZE_EDGE_TOP = 1; // 
  XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM = 2; // 
  XDG_TOPLEVEL_RESIZE_EDGE_LEFT = 4; // 
  XDG_TOPLEVEL_RESIZE_EDGE_TOP_LEFT = 5; // 
  XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM_LEFT = 6; // 
  XDG_TOPLEVEL_RESIZE_EDGE_RIGHT = 8; // 
  XDG_TOPLEVEL_RESIZE_EDGE_TOP_RIGHT = 9; // 
  XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM_RIGHT = 10; // 
  XDG_TOPLEVEL_STATE_MAXIMIZED = 1; // the surface is maximized
  XDG_TOPLEVEL_STATE_FULLSCREEN = 2; // the surface is fullscreen
  XDG_TOPLEVEL_STATE_RESIZING = 3; // the surface is being resized
  XDG_TOPLEVEL_STATE_ACTIVATED = 4; // the surface is now activated
  XDG_TOPLEVEL_STATE_TILED_LEFT = 5; // 
  XDG_TOPLEVEL_STATE_TILED_RIGHT = 6; // 
  XDG_TOPLEVEL_STATE_TILED_TOP = 7; // 
  XDG_TOPLEVEL_STATE_TILED_BOTTOM = 8; // 

type
  Pxdg_toplevel_listener = ^Txdg_toplevel_listener;
  Txdg_toplevel_listener = record
    configure : procedure(data: Pointer; xdg_toplevel: Pxdg_toplevel; width: cint; height: cint; states: Pwl_array); cdecl;
    close : procedure(data: Pointer; xdg_toplevel: Pxdg_toplevel); cdecl;
  end;

const
  XDG_POPUP_ERROR_INVALID_GRAB = 0; // tried to grab after being mapped

type
  Pxdg_popup_listener = ^Txdg_popup_listener;
  Txdg_popup_listener = record
    configure : procedure(data: Pointer; xdg_popup: Pxdg_popup; x: cint; y: cint; width: cint; height: cint); cdecl;
    popup_done : procedure(data: Pointer; xdg_popup: Pxdg_popup); cdecl;
  end;



  Ixdg_wm_baseListener = interface
  ['Ixdg_wm_baseListener']
    procedure xdg_wm_base_ping(xdg_wm_base: Pxdg_wm_base; serial: cuint);
  end;

  Ixdg_positionerListener = interface
  ['Ixdg_positionerListener']
  end;

  Ixdg_surfaceListener = interface
  ['Ixdg_surfaceListener']
    procedure xdg_surface_configure(xdg_surface: Pxdg_surface; serial: cuint);
  end;

  Ixdg_toplevelListener = interface
  ['Ixdg_toplevelListener']
    procedure xdg_toplevel_configure(xdg_toplevel: Pxdg_toplevel; width: cint; height: cint; states: Pwl_array);
    procedure xdg_toplevel_close(xdg_toplevel: Pxdg_toplevel);
  end;

  Ixdg_popupListener = interface
  ['Ixdg_popupListener']
    procedure xdg_popup_configure(xdg_popup: Pxdg_popup; x: cint; y: cint; width: cint; height: cint);
    procedure xdg_popup_popup_done(xdg_popup: Pxdg_popup);
  end;



procedure xdg_wm_base_destroy(xdg_wm_base: Pxdg_wm_base);
function  xdg_wm_base_create_positioner(xdg_wm_base: Pxdg_wm_base): Pxdg_positioner;
function  xdg_wm_base_get_xdg_surface(xdg_wm_base: Pxdg_wm_base; surface: Pwl_surface): Pxdg_surface;
procedure xdg_wm_base_pong(xdg_wm_base: Pxdg_wm_base; serial: cuint);
function  xdg_wm_base_add_listener(xdg_wm_base: Pxdg_wm_base; listener: Pxdg_wm_base_listener; data: Pointer): cint;
procedure  xdg_wm_base_add_listener(xdg_wm_base: Pxdg_wm_base; AIntf: Ixdg_wm_baseListener);
procedure xdg_wm_base_set_user_data(xdg_wm_base: Pxdg_wm_base; user_data: Pointer);
function  xdg_wm_base_get_user_data(xdg_wm_base: Pxdg_wm_base): Pointer;
function  xdg_wm_base_get_version(xdg_wm_base: Pxdg_wm_base): cuint32;
procedure xdg_positioner_destroy(xdg_positioner: Pxdg_positioner);
procedure xdg_positioner_set_size(xdg_positioner: Pxdg_positioner; width: cint; height: cint);
procedure xdg_positioner_set_anchor_rect(xdg_positioner: Pxdg_positioner; x: cint; y: cint; width: cint; height: cint);
procedure xdg_positioner_set_anchor(xdg_positioner: Pxdg_positioner; anchor: cuint);
procedure xdg_positioner_set_gravity(xdg_positioner: Pxdg_positioner; gravity: cuint);
procedure xdg_positioner_set_constraint_adjustment(xdg_positioner: Pxdg_positioner; constraint_adjustment: cuint);
procedure xdg_positioner_set_offset(xdg_positioner: Pxdg_positioner; x: cint; y: cint);
function  xdg_positioner_add_listener(xdg_positioner: Pxdg_positioner; listener: Pxdg_positioner_listener; data: Pointer): cint;
procedure  xdg_positioner_add_listener(xdg_positioner: Pxdg_positioner; AIntf: Ixdg_positionerListener);
procedure xdg_positioner_set_user_data(xdg_positioner: Pxdg_positioner; user_data: Pointer);
function  xdg_positioner_get_user_data(xdg_positioner: Pxdg_positioner): Pointer;
function  xdg_positioner_get_version(xdg_positioner: Pxdg_positioner): cuint32;
procedure xdg_surface_destroy(xdg_surface: Pxdg_surface);
function  xdg_surface_get_toplevel(xdg_surface: Pxdg_surface): Pxdg_toplevel;
function  xdg_surface_get_popup(xdg_surface: Pxdg_surface; parent: Pxdg_surface; positioner: Pxdg_positioner): Pxdg_popup;
procedure xdg_surface_set_window_geometry(xdg_surface: Pxdg_surface; x: cint; y: cint; width: cint; height: cint);
procedure xdg_surface_ack_configure(xdg_surface: Pxdg_surface; serial: cuint);
function  xdg_surface_add_listener(xdg_surface: Pxdg_surface; listener: Pxdg_surface_listener; data: Pointer): cint;
procedure  xdg_surface_add_listener(xdg_surface: Pxdg_surface; AIntf: Ixdg_surfaceListener);
procedure xdg_surface_set_user_data(xdg_surface: Pxdg_surface; user_data: Pointer);
function  xdg_surface_get_user_data(xdg_surface: Pxdg_surface): Pointer;
function  xdg_surface_get_version(xdg_surface: Pxdg_surface): cuint32;
procedure xdg_toplevel_destroy(xdg_toplevel: Pxdg_toplevel);
procedure xdg_toplevel_set_parent(xdg_toplevel: Pxdg_toplevel; parent: Pxdg_toplevel);
procedure xdg_toplevel_set_title(xdg_toplevel: Pxdg_toplevel; title: pchar);
procedure xdg_toplevel_set_app_id(xdg_toplevel: Pxdg_toplevel; app_id: pchar);
procedure xdg_toplevel_show_window_menu(xdg_toplevel: Pxdg_toplevel; seat: Pwl_seat; serial: cuint; x: cint; y: cint);
procedure xdg_toplevel_move(xdg_toplevel: Pxdg_toplevel; seat: Pwl_seat; serial: cuint);
procedure xdg_toplevel_resize(xdg_toplevel: Pxdg_toplevel; seat: Pwl_seat; serial: cuint; edges: cuint);
procedure xdg_toplevel_set_max_size(xdg_toplevel: Pxdg_toplevel; width: cint; height: cint);
procedure xdg_toplevel_set_min_size(xdg_toplevel: Pxdg_toplevel; width: cint; height: cint);
procedure xdg_toplevel_set_maximized(xdg_toplevel: Pxdg_toplevel);
procedure xdg_toplevel_unset_maximized(xdg_toplevel: Pxdg_toplevel);
procedure xdg_toplevel_set_fullscreen(xdg_toplevel: Pxdg_toplevel; output: Pwl_output);
procedure xdg_toplevel_unset_fullscreen(xdg_toplevel: Pxdg_toplevel);
procedure xdg_toplevel_set_minimized(xdg_toplevel: Pxdg_toplevel);
function  xdg_toplevel_add_listener(xdg_toplevel: Pxdg_toplevel; listener: Pxdg_toplevel_listener; data: Pointer): cint;
procedure  xdg_toplevel_add_listener(xdg_toplevel: Pxdg_toplevel; AIntf: Ixdg_toplevelListener);
procedure xdg_toplevel_set_user_data(xdg_toplevel: Pxdg_toplevel; user_data: Pointer);
function  xdg_toplevel_get_user_data(xdg_toplevel: Pxdg_toplevel): Pointer;
function  xdg_toplevel_get_version(xdg_toplevel: Pxdg_toplevel): cuint32;
procedure xdg_popup_destroy(xdg_popup: Pxdg_popup);
procedure xdg_popup_grab(xdg_popup: Pxdg_popup; seat: Pwl_seat; serial: cuint);
function  xdg_popup_add_listener(xdg_popup: Pxdg_popup; listener: Pxdg_popup_listener; data: Pointer): cint;
procedure  xdg_popup_add_listener(xdg_popup: Pxdg_popup; AIntf: Ixdg_popupListener);
procedure xdg_popup_set_user_data(xdg_popup: Pxdg_popup; user_data: Pointer);
function  xdg_popup_get_user_data(xdg_popup: Pxdg_popup): Pointer;
function  xdg_popup_get_version(xdg_popup: Pxdg_popup): cuint32;



var
  xdg_wm_base_interface: Twl_interface;
  xdg_positioner_interface: Twl_interface;
  xdg_surface_interface: Twl_interface;
  xdg_toplevel_interface: Twl_interface;
  xdg_popup_interface: Twl_interface;



implementation

const
_XDG_WM_BASE_DESTROY = 0;
_XDG_WM_BASE_CREATE_POSITIONER = 1;
_XDG_WM_BASE_GET_XDG_SURFACE = 2;
_XDG_WM_BASE_PONG = 3;
_XDG_POSITIONER_DESTROY = 0;
_XDG_POSITIONER_SET_SIZE = 1;
_XDG_POSITIONER_SET_ANCHOR_RECT = 2;
_XDG_POSITIONER_SET_ANCHOR = 3;
_XDG_POSITIONER_SET_GRAVITY = 4;
_XDG_POSITIONER_SET_CONSTRAINT_ADJUSTMENT = 5;
_XDG_POSITIONER_SET_OFFSET = 6;
_XDG_SURFACE_DESTROY = 0;
_XDG_SURFACE_GET_TOPLEVEL = 1;
_XDG_SURFACE_GET_POPUP = 2;
_XDG_SURFACE_SET_WINDOW_GEOMETRY = 3;
_XDG_SURFACE_ACK_CONFIGURE = 4;
_XDG_TOPLEVEL_DESTROY = 0;
_XDG_TOPLEVEL_SET_PARENT = 1;
_XDG_TOPLEVEL_SET_TITLE = 2;
_XDG_TOPLEVEL_SET_APP_ID = 3;
_XDG_TOPLEVEL_SHOW_WINDOW_MENU = 4;
_XDG_TOPLEVEL_MOVE = 5;
_XDG_TOPLEVEL_RESIZE = 6;
_XDG_TOPLEVEL_SET_MAX_SIZE = 7;
_XDG_TOPLEVEL_SET_MIN_SIZE = 8;
_XDG_TOPLEVEL_SET_MAXIMIZED = 9;
_XDG_TOPLEVEL_UNSET_MAXIMIZED = 10;
_XDG_TOPLEVEL_SET_FULLSCREEN = 11;
_XDG_TOPLEVEL_UNSET_FULLSCREEN = 12;
_XDG_TOPLEVEL_SET_MINIMIZED = 13;
_XDG_POPUP_DESTROY = 0;
_XDG_POPUP_GRAB = 1;


var
  vIntf_xdg_wm_base_Listener: Txdg_wm_base_listener;
  vIntf_xdg_positioner_Listener: Txdg_positioner_listener;
  vIntf_xdg_surface_Listener: Txdg_surface_listener;
  vIntf_xdg_toplevel_Listener: Txdg_toplevel_listener;
  vIntf_xdg_popup_Listener: Txdg_popup_listener;



procedure xdg_wm_base_destroy(xdg_wm_base: Pxdg_wm_base);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_wm_base), _XDG_WM_BASE_DESTROY);
  wl_proxy_destroy(Pwl_proxy(xdg_wm_base));
end;

function  xdg_wm_base_create_positioner(xdg_wm_base: Pxdg_wm_base): Pxdg_positioner;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(xdg_wm_base),
      _XDG_WM_BASE_CREATE_POSITIONER, @xdg_positioner_interface, nil);
  Result := Pxdg_positioner(id);
end;

function  xdg_wm_base_get_xdg_surface(xdg_wm_base: Pxdg_wm_base; surface: Pwl_surface): Pxdg_surface;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(xdg_wm_base),
      _XDG_WM_BASE_GET_XDG_SURFACE, @xdg_surface_interface, nil, surface);
  Result := Pxdg_surface(id);
end;

procedure xdg_wm_base_pong(xdg_wm_base: Pxdg_wm_base; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_wm_base),
      _XDG_WM_BASE_PONG, serial);
end;

function  xdg_wm_base_add_listener(xdg_wm_base: Pxdg_wm_base; listener: Pxdg_wm_base_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(xdg_wm_base), listener, data);
end;

procedure  xdg_wm_base_add_listener(xdg_wm_base: Pxdg_wm_base; AIntf: Ixdg_wm_baseListener);
begin
  xdg_wm_base_add_listener(xdg_wm_base, @vIntf_xdg_wm_base_Listener, AIntf);
end;

procedure xdg_wm_base_set_user_data(xdg_wm_base: Pxdg_wm_base; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(xdg_wm_base), user_data);
end;

function  xdg_wm_base_get_user_data(xdg_wm_base: Pxdg_wm_base): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(xdg_wm_base));
end;

function  xdg_wm_base_get_version(xdg_wm_base: Pxdg_wm_base): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(xdg_wm_base));
end;

procedure xdg_positioner_destroy(xdg_positioner: Pxdg_positioner);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_positioner), _XDG_POSITIONER_DESTROY);
  wl_proxy_destroy(Pwl_proxy(xdg_positioner));
end;

procedure xdg_positioner_set_size(xdg_positioner: Pxdg_positioner; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_positioner),
      _XDG_POSITIONER_SET_SIZE, width, height);
end;

procedure xdg_positioner_set_anchor_rect(xdg_positioner: Pxdg_positioner; x: cint; y: cint; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_positioner),
      _XDG_POSITIONER_SET_ANCHOR_RECT, x, y, width, height);
end;

procedure xdg_positioner_set_anchor(xdg_positioner: Pxdg_positioner; anchor: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_positioner),
      _XDG_POSITIONER_SET_ANCHOR, anchor);
end;

procedure xdg_positioner_set_gravity(xdg_positioner: Pxdg_positioner; gravity: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_positioner),
      _XDG_POSITIONER_SET_GRAVITY, gravity);
end;

procedure xdg_positioner_set_constraint_adjustment(xdg_positioner: Pxdg_positioner; constraint_adjustment: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_positioner),
      _XDG_POSITIONER_SET_CONSTRAINT_ADJUSTMENT, constraint_adjustment);
end;

procedure xdg_positioner_set_offset(xdg_positioner: Pxdg_positioner; x: cint; y: cint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_positioner),
      _XDG_POSITIONER_SET_OFFSET, x, y);
end;

function  xdg_positioner_add_listener(xdg_positioner: Pxdg_positioner; listener: Pxdg_positioner_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(xdg_positioner), listener, data);
end;

procedure  xdg_positioner_add_listener(xdg_positioner: Pxdg_positioner; AIntf: Ixdg_positionerListener);
begin
  xdg_positioner_add_listener(xdg_positioner, @vIntf_xdg_positioner_Listener, AIntf);
end;

procedure xdg_positioner_set_user_data(xdg_positioner: Pxdg_positioner; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(xdg_positioner), user_data);
end;

function  xdg_positioner_get_user_data(xdg_positioner: Pxdg_positioner): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(xdg_positioner));
end;

function  xdg_positioner_get_version(xdg_positioner: Pxdg_positioner): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(xdg_positioner));
end;

procedure xdg_surface_destroy(xdg_surface: Pxdg_surface);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_surface), _XDG_SURFACE_DESTROY);
  wl_proxy_destroy(Pwl_proxy(xdg_surface));
end;

function  xdg_surface_get_toplevel(xdg_surface: Pxdg_surface): Pxdg_toplevel;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(xdg_surface),
      _XDG_SURFACE_GET_TOPLEVEL, @xdg_toplevel_interface, nil);
  Result := Pxdg_toplevel(id);
end;

function  xdg_surface_get_popup(xdg_surface: Pxdg_surface; parent: Pxdg_surface; positioner: Pxdg_positioner): Pxdg_popup;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(xdg_surface),
      _XDG_SURFACE_GET_POPUP, @xdg_popup_interface, nil, parent, positioner);
  Result := Pxdg_popup(id);
end;

procedure xdg_surface_set_window_geometry(xdg_surface: Pxdg_surface; x: cint; y: cint; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_surface),
      _XDG_SURFACE_SET_WINDOW_GEOMETRY, x, y, width, height);
end;

procedure xdg_surface_ack_configure(xdg_surface: Pxdg_surface; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_surface),
      _XDG_SURFACE_ACK_CONFIGURE, serial);
end;

function  xdg_surface_add_listener(xdg_surface: Pxdg_surface; listener: Pxdg_surface_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(xdg_surface), listener, data);
end;

procedure  xdg_surface_add_listener(xdg_surface: Pxdg_surface; AIntf: Ixdg_surfaceListener);
begin
  xdg_surface_add_listener(xdg_surface, @vIntf_xdg_surface_Listener, AIntf);
end;

procedure xdg_surface_set_user_data(xdg_surface: Pxdg_surface; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(xdg_surface), user_data);
end;

function  xdg_surface_get_user_data(xdg_surface: Pxdg_surface): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(xdg_surface));
end;

function  xdg_surface_get_version(xdg_surface: Pxdg_surface): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(xdg_surface));
end;

procedure xdg_toplevel_destroy(xdg_toplevel: Pxdg_toplevel);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_toplevel), _XDG_TOPLEVEL_DESTROY);
  wl_proxy_destroy(Pwl_proxy(xdg_toplevel));
end;

procedure xdg_toplevel_set_parent(xdg_toplevel: Pxdg_toplevel; parent: Pxdg_toplevel);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_toplevel),
      _XDG_TOPLEVEL_SET_PARENT, parent);
end;

procedure xdg_toplevel_set_title(xdg_toplevel: Pxdg_toplevel; title: pchar);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_toplevel),
      _XDG_TOPLEVEL_SET_TITLE, title);
end;

procedure xdg_toplevel_set_app_id(xdg_toplevel: Pxdg_toplevel; app_id: pchar);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_toplevel),
      _XDG_TOPLEVEL_SET_APP_ID, app_id);
end;

procedure xdg_toplevel_show_window_menu(xdg_toplevel: Pxdg_toplevel; seat: Pwl_seat; serial: cuint; x: cint; y: cint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_toplevel),
      _XDG_TOPLEVEL_SHOW_WINDOW_MENU, seat, serial, x, y);
end;

procedure xdg_toplevel_move(xdg_toplevel: Pxdg_toplevel; seat: Pwl_seat; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_toplevel),
      _XDG_TOPLEVEL_MOVE, seat, serial);
end;

procedure xdg_toplevel_resize(xdg_toplevel: Pxdg_toplevel; seat: Pwl_seat; serial: cuint; edges: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_toplevel),
      _XDG_TOPLEVEL_RESIZE, seat, serial, edges);
end;

procedure xdg_toplevel_set_max_size(xdg_toplevel: Pxdg_toplevel; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_toplevel),
      _XDG_TOPLEVEL_SET_MAX_SIZE, width, height);
end;

procedure xdg_toplevel_set_min_size(xdg_toplevel: Pxdg_toplevel; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_toplevel),
      _XDG_TOPLEVEL_SET_MIN_SIZE, width, height);
end;

procedure xdg_toplevel_set_maximized(xdg_toplevel: Pxdg_toplevel);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_toplevel),
      _XDG_TOPLEVEL_SET_MAXIMIZED);
end;

procedure xdg_toplevel_unset_maximized(xdg_toplevel: Pxdg_toplevel);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_toplevel),
      _XDG_TOPLEVEL_UNSET_MAXIMIZED);
end;

procedure xdg_toplevel_set_fullscreen(xdg_toplevel: Pxdg_toplevel; output: Pwl_output);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_toplevel),
      _XDG_TOPLEVEL_SET_FULLSCREEN, output);
end;

procedure xdg_toplevel_unset_fullscreen(xdg_toplevel: Pxdg_toplevel);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_toplevel),
      _XDG_TOPLEVEL_UNSET_FULLSCREEN);
end;

procedure xdg_toplevel_set_minimized(xdg_toplevel: Pxdg_toplevel);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_toplevel),
      _XDG_TOPLEVEL_SET_MINIMIZED);
end;

function  xdg_toplevel_add_listener(xdg_toplevel: Pxdg_toplevel; listener: Pxdg_toplevel_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(xdg_toplevel), listener, data);
end;

procedure  xdg_toplevel_add_listener(xdg_toplevel: Pxdg_toplevel; AIntf: Ixdg_toplevelListener);
begin
  xdg_toplevel_add_listener(xdg_toplevel, @vIntf_xdg_toplevel_Listener, AIntf);
end;

procedure xdg_toplevel_set_user_data(xdg_toplevel: Pxdg_toplevel; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(xdg_toplevel), user_data);
end;

function  xdg_toplevel_get_user_data(xdg_toplevel: Pxdg_toplevel): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(xdg_toplevel));
end;

function  xdg_toplevel_get_version(xdg_toplevel: Pxdg_toplevel): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(xdg_toplevel));
end;

procedure xdg_popup_destroy(xdg_popup: Pxdg_popup);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_popup), _XDG_POPUP_DESTROY);
  wl_proxy_destroy(Pwl_proxy(xdg_popup));
end;

procedure xdg_popup_grab(xdg_popup: Pxdg_popup; seat: Pwl_seat; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_popup),
      _XDG_POPUP_GRAB, seat, serial);
end;

function  xdg_popup_add_listener(xdg_popup: Pxdg_popup; listener: Pxdg_popup_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(xdg_popup), listener, data);
end;

procedure  xdg_popup_add_listener(xdg_popup: Pxdg_popup; AIntf: Ixdg_popupListener);
begin
  xdg_popup_add_listener(xdg_popup, @vIntf_xdg_popup_Listener, AIntf);
end;

procedure xdg_popup_set_user_data(xdg_popup: Pxdg_popup; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(xdg_popup), user_data);
end;

function  xdg_popup_get_user_data(xdg_popup: Pxdg_popup): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(xdg_popup));
end;

function  xdg_popup_get_version(xdg_popup: Pxdg_popup): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(xdg_popup));
end;


procedure xdg_wm_base_ping_Intf(AIntf: Ixdg_wm_baseListener; xdg_wm_base: Pxdg_wm_base; serial: cuint); cdecl;
begin
  WriteLn('xdg_wm_base.ping');
  AIntf.xdg_wm_base_ping(xdg_wm_base, serial);
end;

procedure xdg_surface_configure_Intf(AIntf: Ixdg_surfaceListener; xdg_surface: Pxdg_surface; serial: cuint); cdecl;
begin
  WriteLn('xdg_surface.configure');
  AIntf.xdg_surface_configure(xdg_surface, serial);
end;

procedure xdg_toplevel_configure_Intf(AIntf: Ixdg_toplevelListener; xdg_toplevel: Pxdg_toplevel; width: cint; height: cint; states: Pwl_array); cdecl;
begin
  WriteLn('xdg_toplevel.configure');
  AIntf.xdg_toplevel_configure(xdg_toplevel, width, height, states);
end;

procedure xdg_toplevel_close_Intf(AIntf: Ixdg_toplevelListener; xdg_toplevel: Pxdg_toplevel); cdecl;
begin
  WriteLn('xdg_toplevel.close');
  AIntf.xdg_toplevel_close(xdg_toplevel);
end;

procedure xdg_popup_configure_Intf(AIntf: Ixdg_popupListener; xdg_popup: Pxdg_popup; x: cint; y: cint; width: cint; height: cint); cdecl;
begin
  WriteLn('xdg_popup.configure');
  AIntf.xdg_popup_configure(xdg_popup, x, y, width, height);
end;

procedure xdg_popup_popup_done_Intf(AIntf: Ixdg_popupListener; xdg_popup: Pxdg_popup); cdecl;
begin
  WriteLn('xdg_popup.popup_done');
  AIntf.xdg_popup_popup_done(xdg_popup);
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
    (@xdg_positioner_interface),
    (@xdg_surface_interface),
    (@wl_surface_interface),
    (@xdg_toplevel_interface),
    (@xdg_popup_interface),
    (@xdg_surface_interface),
    (@xdg_positioner_interface),
    (@xdg_toplevel_interface),
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

  xdg_wm_base_requests: array[0..3] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'create_positioner'; signature: 'n'; types: @pInterfaces[8]),
    (name: 'get_xdg_surface'; signature: 'no'; types: @pInterfaces[9]),
    (name: 'pong'; signature: 'u'; types: @pInterfaces[0])
  );
  xdg_wm_base_events: array[0..0] of Twl_message = (
    (name: 'ping'; signature: 'u'; types: @pInterfaces[0])
  );
  xdg_positioner_requests: array[0..6] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_size'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'set_anchor_rect'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'set_anchor'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_gravity'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_constraint_adjustment'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_offset'; signature: 'ii'; types: @pInterfaces[0])
  );
  xdg_surface_requests: array[0..4] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_toplevel'; signature: 'n'; types: @pInterfaces[11]),
    (name: 'get_popup'; signature: 'n?oo'; types: @pInterfaces[12]),
    (name: 'set_window_geometry'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'ack_configure'; signature: 'u'; types: @pInterfaces[0])
  );
  xdg_surface_events: array[0..0] of Twl_message = (
    (name: 'configure'; signature: 'u'; types: @pInterfaces[0])
  );
  xdg_toplevel_requests: array[0..13] of Twl_message = (
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
  xdg_toplevel_events: array[0..1] of Twl_message = (
    (name: 'configure'; signature: 'iia'; types: @pInterfaces[0]),
    (name: 'close'; signature: ''; types: @pInterfaces[0])
  );
  xdg_popup_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'grab'; signature: 'ou'; types: @pInterfaces[26])
  );
  xdg_popup_events: array[0..1] of Twl_message = (
    (name: 'configure'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'popup_done'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_xdg_wm_base_Listener.ping) := @xdg_wm_base_ping_Intf;
  Pointer(vIntf_xdg_surface_Listener.configure) := @xdg_surface_configure_Intf;
  Pointer(vIntf_xdg_toplevel_Listener.configure) := @xdg_toplevel_configure_Intf;
  Pointer(vIntf_xdg_toplevel_Listener.close) := @xdg_toplevel_close_Intf;
  Pointer(vIntf_xdg_popup_Listener.configure) := @xdg_popup_configure_Intf;
  Pointer(vIntf_xdg_popup_Listener.popup_done) := @xdg_popup_popup_done_Intf;


  xdg_wm_base_interface.name := 'xdg_wm_base';
  xdg_wm_base_interface.version := 2;
  xdg_wm_base_interface.method_count := 4;
  xdg_wm_base_interface.methods := @xdg_wm_base_requests;
  xdg_wm_base_interface.event_count := 1;
  xdg_wm_base_interface.events := @xdg_wm_base_events;

  xdg_positioner_interface.name := 'xdg_positioner';
  xdg_positioner_interface.version := 2;
  xdg_positioner_interface.method_count := 7;
  xdg_positioner_interface.methods := @xdg_positioner_requests;
  xdg_positioner_interface.event_count := 0;
  xdg_positioner_interface.events := nil;

  xdg_surface_interface.name := 'xdg_surface';
  xdg_surface_interface.version := 2;
  xdg_surface_interface.method_count := 5;
  xdg_surface_interface.methods := @xdg_surface_requests;
  xdg_surface_interface.event_count := 1;
  xdg_surface_interface.events := @xdg_surface_events;

  xdg_toplevel_interface.name := 'xdg_toplevel';
  xdg_toplevel_interface.version := 2;
  xdg_toplevel_interface.method_count := 14;
  xdg_toplevel_interface.methods := @xdg_toplevel_requests;
  xdg_toplevel_interface.event_count := 2;
  xdg_toplevel_interface.events := @xdg_toplevel_events;

  xdg_popup_interface.name := 'xdg_popup';
  xdg_popup_interface.version := 2;
  xdg_popup_interface.method_count := 2;
  xdg_popup_interface.methods := @xdg_popup_requests;
  xdg_popup_interface.event_count := 2;
  xdg_popup_interface.events := @xdg_popup_events;

end.
