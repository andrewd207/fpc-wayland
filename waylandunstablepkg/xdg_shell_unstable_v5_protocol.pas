unit xdg_shell_unstable_v5_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pxdg_shell = ^Txdg_shell;
  Txdg_shell = record end;
  Pxdg_surface = ^Txdg_surface;
  Txdg_surface = record end;
  Pxdg_popup = ^Txdg_popup;
  Txdg_popup = record end;
const
  XDG_SHELL_VERSION_CURRENT = 5; // Always the latest version
  XDG_SHELL_ERROR_ROLE = 0; // given wl_surface has another role
  XDG_SHELL_ERROR_DEFUNCT_SURFACES = 1; // xdg_shell was destroyed before children
  XDG_SHELL_ERROR_NOT_THE_TOPMOST_POPUP = 2; // the client tried to map or destroy a non-topmost popup
  XDG_SHELL_ERROR_INVALID_POPUP_PARENT = 3; // the client specified an invalid popup parent surface

type
  Pxdg_shell_listener = ^Txdg_shell_listener;
  Txdg_shell_listener = record
    ping : procedure(data: Pointer; xdg_shell: Pxdg_shell; serial: cuint); cdecl;
  end;

const
  XDG_SURFACE_RESIZE_EDGE_NONE = 0; // 
  XDG_SURFACE_RESIZE_EDGE_TOP = 1; // 
  XDG_SURFACE_RESIZE_EDGE_BOTTOM = 2; // 
  XDG_SURFACE_RESIZE_EDGE_LEFT = 4; // 
  XDG_SURFACE_RESIZE_EDGE_TOP_LEFT = 5; // 
  XDG_SURFACE_RESIZE_EDGE_BOTTOM_LEFT = 6; // 
  XDG_SURFACE_RESIZE_EDGE_RIGHT = 8; // 
  XDG_SURFACE_RESIZE_EDGE_TOP_RIGHT = 9; // 
  XDG_SURFACE_RESIZE_EDGE_BOTTOM_RIGHT = 10; // 
  XDG_SURFACE_STATE_MAXIMIZED = 1; // the surface is maximized
  XDG_SURFACE_STATE_FULLSCREEN = 2; // the surface is fullscreen
  XDG_SURFACE_STATE_RESIZING = 3; // the surface is being resized
  XDG_SURFACE_STATE_ACTIVATED = 4; // the surface is now activated

type
  Pxdg_surface_listener = ^Txdg_surface_listener;
  Txdg_surface_listener = record
    configure : procedure(data: Pointer; xdg_surface: Pxdg_surface; width: cint; height: cint; states: Pwl_array; serial: cuint); cdecl;
    close : procedure(data: Pointer; xdg_surface: Pxdg_surface); cdecl;
  end;

  Pxdg_popup_listener = ^Txdg_popup_listener;
  Txdg_popup_listener = record
    popup_done : procedure(data: Pointer; xdg_popup: Pxdg_popup); cdecl;
  end;



  Ixdg_shellListener = interface
  ['Ixdg_shellListener']
    procedure xdg_shell_ping(xdg_shell: Pxdg_shell; serial: cuint);
  end;

  Ixdg_surfaceListener = interface
  ['Ixdg_surfaceListener']
    procedure xdg_surface_configure(xdg_surface: Pxdg_surface; width: cint; height: cint; states: Pwl_array; serial: cuint);
    procedure xdg_surface_close(xdg_surface: Pxdg_surface);
  end;

  Ixdg_popupListener = interface
  ['Ixdg_popupListener']
    procedure xdg_popup_popup_done(xdg_popup: Pxdg_popup);
  end;



procedure xdg_shell_destroy(xdg_shell: Pxdg_shell);
procedure xdg_shell_use_unstable_version(xdg_shell: Pxdg_shell; version: cint);
function  xdg_shell_get_xdg_surface(xdg_shell: Pxdg_shell; surface: Pwl_surface): Pxdg_surface;
function  xdg_shell_get_xdg_popup(xdg_shell: Pxdg_shell; surface: Pwl_surface; parent: Pwl_surface; seat: Pwl_seat; serial: cuint; x: cint; y: cint): Pxdg_popup;
procedure xdg_shell_pong(xdg_shell: Pxdg_shell; serial: cuint);
function  xdg_shell_add_listener(xdg_shell: Pxdg_shell; listener: Pxdg_shell_listener; data: Pointer): cint;
procedure  xdg_shell_add_listener(xdg_shell: Pxdg_shell; AIntf: Ixdg_shellListener);
procedure xdg_shell_set_user_data(xdg_shell: Pxdg_shell; user_data: Pointer);
function  xdg_shell_get_user_data(xdg_shell: Pxdg_shell): Pointer;
function  xdg_shell_get_version(xdg_shell: Pxdg_shell): cuint32;
procedure xdg_surface_destroy(xdg_surface: Pxdg_surface);
procedure xdg_surface_set_parent(xdg_surface: Pxdg_surface; parent: Pxdg_surface);
procedure xdg_surface_set_title(xdg_surface: Pxdg_surface; title: pchar);
procedure xdg_surface_set_app_id(xdg_surface: Pxdg_surface; app_id: pchar);
procedure xdg_surface_show_window_menu(xdg_surface: Pxdg_surface; seat: Pwl_seat; serial: cuint; x: cint; y: cint);
procedure xdg_surface_move(xdg_surface: Pxdg_surface; seat: Pwl_seat; serial: cuint);
procedure xdg_surface_resize(xdg_surface: Pxdg_surface; seat: Pwl_seat; serial: cuint; edges: cuint);
procedure xdg_surface_ack_configure(xdg_surface: Pxdg_surface; serial: cuint);
procedure xdg_surface_set_window_geometry(xdg_surface: Pxdg_surface; x: cint; y: cint; width: cint; height: cint);
procedure xdg_surface_set_maximized(xdg_surface: Pxdg_surface);
procedure xdg_surface_unset_maximized(xdg_surface: Pxdg_surface);
procedure xdg_surface_set_fullscreen(xdg_surface: Pxdg_surface; output: Pwl_output);
procedure xdg_surface_unset_fullscreen(xdg_surface: Pxdg_surface);
procedure xdg_surface_set_minimized(xdg_surface: Pxdg_surface);
function  xdg_surface_add_listener(xdg_surface: Pxdg_surface; listener: Pxdg_surface_listener; data: Pointer): cint;
procedure  xdg_surface_add_listener(xdg_surface: Pxdg_surface; AIntf: Ixdg_surfaceListener);
procedure xdg_surface_set_user_data(xdg_surface: Pxdg_surface; user_data: Pointer);
function  xdg_surface_get_user_data(xdg_surface: Pxdg_surface): Pointer;
function  xdg_surface_get_version(xdg_surface: Pxdg_surface): cuint32;
procedure xdg_popup_destroy(xdg_popup: Pxdg_popup);
function  xdg_popup_add_listener(xdg_popup: Pxdg_popup; listener: Pxdg_popup_listener; data: Pointer): cint;
procedure  xdg_popup_add_listener(xdg_popup: Pxdg_popup; AIntf: Ixdg_popupListener);
procedure xdg_popup_set_user_data(xdg_popup: Pxdg_popup; user_data: Pointer);
function  xdg_popup_get_user_data(xdg_popup: Pxdg_popup): Pointer;
function  xdg_popup_get_version(xdg_popup: Pxdg_popup): cuint32;



var
  xdg_shell_interface: Twl_interface;
  xdg_surface_interface: Twl_interface;
  xdg_popup_interface: Twl_interface;



implementation

const
_XDG_SHELL_DESTROY = 0;
_XDG_SHELL_USE_UNSTABLE_VERSION = 1;
_XDG_SHELL_GET_XDG_SURFACE = 2;
_XDG_SHELL_GET_XDG_POPUP = 3;
_XDG_SHELL_PONG = 4;
_XDG_SURFACE_DESTROY = 0;
_XDG_SURFACE_SET_PARENT = 1;
_XDG_SURFACE_SET_TITLE = 2;
_XDG_SURFACE_SET_APP_ID = 3;
_XDG_SURFACE_SHOW_WINDOW_MENU = 4;
_XDG_SURFACE_MOVE = 5;
_XDG_SURFACE_RESIZE = 6;
_XDG_SURFACE_ACK_CONFIGURE = 7;
_XDG_SURFACE_SET_WINDOW_GEOMETRY = 8;
_XDG_SURFACE_SET_MAXIMIZED = 9;
_XDG_SURFACE_UNSET_MAXIMIZED = 10;
_XDG_SURFACE_SET_FULLSCREEN = 11;
_XDG_SURFACE_UNSET_FULLSCREEN = 12;
_XDG_SURFACE_SET_MINIMIZED = 13;
_XDG_POPUP_DESTROY = 0;


var
  vIntf_xdg_shell_Listener: Txdg_shell_listener;
  vIntf_xdg_surface_Listener: Txdg_surface_listener;
  vIntf_xdg_popup_Listener: Txdg_popup_listener;



procedure xdg_shell_destroy(xdg_shell: Pxdg_shell);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_shell), _XDG_SHELL_DESTROY);
  wl_proxy_destroy(Pwl_proxy(xdg_shell));
end;

procedure xdg_shell_use_unstable_version(xdg_shell: Pxdg_shell; version: cint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_shell),
      _XDG_SHELL_USE_UNSTABLE_VERSION, version);
end;

function  xdg_shell_get_xdg_surface(xdg_shell: Pxdg_shell; surface: Pwl_surface): Pxdg_surface;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(xdg_shell),
      _XDG_SHELL_GET_XDG_SURFACE, @xdg_surface_interface, nil, surface);
  Result := Pxdg_surface(id);
end;

function  xdg_shell_get_xdg_popup(xdg_shell: Pxdg_shell; surface: Pwl_surface; parent: Pwl_surface; seat: Pwl_seat; serial: cuint; x: cint; y: cint): Pxdg_popup;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(xdg_shell),
      _XDG_SHELL_GET_XDG_POPUP, @xdg_popup_interface, nil, surface, parent, seat, serial, x, y);
  Result := Pxdg_popup(id);
end;

procedure xdg_shell_pong(xdg_shell: Pxdg_shell; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_shell),
      _XDG_SHELL_PONG, serial);
end;

function  xdg_shell_add_listener(xdg_shell: Pxdg_shell; listener: Pxdg_shell_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(xdg_shell), listener, data);
end;

procedure  xdg_shell_add_listener(xdg_shell: Pxdg_shell; AIntf: Ixdg_shellListener);
begin
  xdg_shell_add_listener(xdg_shell, @vIntf_xdg_shell_Listener, AIntf);
end;

procedure xdg_shell_set_user_data(xdg_shell: Pxdg_shell; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(xdg_shell), user_data);
end;

function  xdg_shell_get_user_data(xdg_shell: Pxdg_shell): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(xdg_shell));
end;

function  xdg_shell_get_version(xdg_shell: Pxdg_shell): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(xdg_shell));
end;

procedure xdg_surface_destroy(xdg_surface: Pxdg_surface);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_surface), _XDG_SURFACE_DESTROY);
  wl_proxy_destroy(Pwl_proxy(xdg_surface));
end;

procedure xdg_surface_set_parent(xdg_surface: Pxdg_surface; parent: Pxdg_surface);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_surface),
      _XDG_SURFACE_SET_PARENT, parent);
end;

procedure xdg_surface_set_title(xdg_surface: Pxdg_surface; title: pchar);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_surface),
      _XDG_SURFACE_SET_TITLE, title);
end;

procedure xdg_surface_set_app_id(xdg_surface: Pxdg_surface; app_id: pchar);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_surface),
      _XDG_SURFACE_SET_APP_ID, app_id);
end;

procedure xdg_surface_show_window_menu(xdg_surface: Pxdg_surface; seat: Pwl_seat; serial: cuint; x: cint; y: cint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_surface),
      _XDG_SURFACE_SHOW_WINDOW_MENU, seat, serial, x, y);
end;

procedure xdg_surface_move(xdg_surface: Pxdg_surface; seat: Pwl_seat; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_surface),
      _XDG_SURFACE_MOVE, seat, serial);
end;

procedure xdg_surface_resize(xdg_surface: Pxdg_surface; seat: Pwl_seat; serial: cuint; edges: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_surface),
      _XDG_SURFACE_RESIZE, seat, serial, edges);
end;

procedure xdg_surface_ack_configure(xdg_surface: Pxdg_surface; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_surface),
      _XDG_SURFACE_ACK_CONFIGURE, serial);
end;

procedure xdg_surface_set_window_geometry(xdg_surface: Pxdg_surface; x: cint; y: cint; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_surface),
      _XDG_SURFACE_SET_WINDOW_GEOMETRY, x, y, width, height);
end;

procedure xdg_surface_set_maximized(xdg_surface: Pxdg_surface);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_surface),
      _XDG_SURFACE_SET_MAXIMIZED);
end;

procedure xdg_surface_unset_maximized(xdg_surface: Pxdg_surface);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_surface),
      _XDG_SURFACE_UNSET_MAXIMIZED);
end;

procedure xdg_surface_set_fullscreen(xdg_surface: Pxdg_surface; output: Pwl_output);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_surface),
      _XDG_SURFACE_SET_FULLSCREEN, output);
end;

procedure xdg_surface_unset_fullscreen(xdg_surface: Pxdg_surface);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_surface),
      _XDG_SURFACE_UNSET_FULLSCREEN);
end;

procedure xdg_surface_set_minimized(xdg_surface: Pxdg_surface);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_surface),
      _XDG_SURFACE_SET_MINIMIZED);
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

procedure xdg_popup_destroy(xdg_popup: Pxdg_popup);
begin
  wl_proxy_marshal(Pwl_proxy(xdg_popup), _XDG_POPUP_DESTROY);
  wl_proxy_destroy(Pwl_proxy(xdg_popup));
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


procedure xdg_shell_ping_Intf(AIntf: Ixdg_shellListener; xdg_shell: Pxdg_shell; serial: cuint); cdecl;
begin
  WriteLn('xdg_shell.ping');
  AIntf.xdg_shell_ping(xdg_shell, serial);
end;

procedure xdg_surface_configure_Intf(AIntf: Ixdg_surfaceListener; xdg_surface: Pxdg_surface; width: cint; height: cint; states: Pwl_array; serial: cuint); cdecl;
begin
  WriteLn('xdg_surface.configure');
  AIntf.xdg_surface_configure(xdg_surface, width, height, states, serial);
end;

procedure xdg_surface_close_Intf(AIntf: Ixdg_surfaceListener; xdg_surface: Pxdg_surface); cdecl;
begin
  WriteLn('xdg_surface.close');
  AIntf.xdg_surface_close(xdg_surface);
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
    (@xdg_surface_interface),
    (@wl_surface_interface),
    (@xdg_popup_interface),
    (@wl_surface_interface),
    (@wl_surface_interface),
    (@wl_seat_interface),
    (nil),
    (nil),
    (nil),
    (@xdg_surface_interface),
    (@wl_seat_interface),
    (nil),
    (nil),
    (nil),
    (@wl_seat_interface),
    (nil),
    (@wl_seat_interface),
    (nil),
    (nil),
    (@wl_output_interface)
  );

  xdg_shell_requests: array[0..4] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'use_unstable_version'; signature: 'i'; types: @pInterfaces[0]),
    (name: 'get_xdg_surface'; signature: 'no'; types: @pInterfaces[8]),
    (name: 'get_xdg_popup'; signature: 'nooouii'; types: @pInterfaces[10]),
    (name: 'pong'; signature: 'u'; types: @pInterfaces[0])
  );
  xdg_shell_events: array[0..0] of Twl_message = (
    (name: 'ping'; signature: 'u'; types: @pInterfaces[0])
  );
  xdg_surface_requests: array[0..13] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_parent'; signature: '?o'; types: @pInterfaces[17]),
    (name: 'set_title'; signature: 's'; types: @pInterfaces[0]),
    (name: 'set_app_id'; signature: 's'; types: @pInterfaces[0]),
    (name: 'show_window_menu'; signature: 'ouii'; types: @pInterfaces[18]),
    (name: 'move'; signature: 'ou'; types: @pInterfaces[22]),
    (name: 'resize'; signature: 'ouu'; types: @pInterfaces[24]),
    (name: 'ack_configure'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_window_geometry'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'set_maximized'; signature: ''; types: @pInterfaces[0]),
    (name: 'unset_maximized'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_fullscreen'; signature: '?o'; types: @pInterfaces[27]),
    (name: 'unset_fullscreen'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_minimized'; signature: ''; types: @pInterfaces[0])
  );
  xdg_surface_events: array[0..1] of Twl_message = (
    (name: 'configure'; signature: 'iiau'; types: @pInterfaces[0]),
    (name: 'close'; signature: ''; types: @pInterfaces[0])
  );
  xdg_popup_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  xdg_popup_events: array[0..0] of Twl_message = (
    (name: 'popup_done'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_xdg_shell_Listener.ping) := @xdg_shell_ping_Intf;
  Pointer(vIntf_xdg_surface_Listener.configure) := @xdg_surface_configure_Intf;
  Pointer(vIntf_xdg_surface_Listener.close) := @xdg_surface_close_Intf;
  Pointer(vIntf_xdg_popup_Listener.popup_done) := @xdg_popup_popup_done_Intf;


  xdg_shell_interface.name := 'xdg_shell';
  xdg_shell_interface.version := 1;
  xdg_shell_interface.method_count := 5;
  xdg_shell_interface.methods := @xdg_shell_requests;
  xdg_shell_interface.event_count := 1;
  xdg_shell_interface.events := @xdg_shell_events;

  xdg_surface_interface.name := 'xdg_surface';
  xdg_surface_interface.version := 1;
  xdg_surface_interface.method_count := 14;
  xdg_surface_interface.methods := @xdg_surface_requests;
  xdg_surface_interface.event_count := 2;
  xdg_surface_interface.events := @xdg_surface_events;

  xdg_popup_interface.name := 'xdg_popup';
  xdg_popup_interface.version := 1;
  xdg_popup_interface.method_count := 1;
  xdg_popup_interface.methods := @xdg_popup_requests;
  xdg_popup_interface.event_count := 1;
  xdg_popup_interface.events := @xdg_popup_events;

end.
