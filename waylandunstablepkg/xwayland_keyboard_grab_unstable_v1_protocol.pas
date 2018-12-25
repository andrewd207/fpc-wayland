unit xwayland_keyboard_grab_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_xwayland_keyboard_grab_manager_v1 = ^Tzwp_xwayland_keyboard_grab_manager_v1;
  Tzwp_xwayland_keyboard_grab_manager_v1 = record end;
  Pzwp_xwayland_keyboard_grab_v1 = ^Tzwp_xwayland_keyboard_grab_v1;
  Tzwp_xwayland_keyboard_grab_v1 = record end;
  Pzwp_xwayland_keyboard_grab_manager_v1_listener = ^Tzwp_xwayland_keyboard_grab_manager_v1_listener;
  Tzwp_xwayland_keyboard_grab_manager_v1_listener = record
  end;

  Pzwp_xwayland_keyboard_grab_v1_listener = ^Tzwp_xwayland_keyboard_grab_v1_listener;
  Tzwp_xwayland_keyboard_grab_v1_listener = record
  end;



  Izwp_xwayland_keyboard_grab_manager_v1Listener = interface
  ['Izwp_xwayland_keyboard_grab_manager_v1Listener']
  end;

  Izwp_xwayland_keyboard_grab_v1Listener = interface
  ['Izwp_xwayland_keyboard_grab_v1Listener']
  end;



procedure zwp_xwayland_keyboard_grab_manager_v1_destroy(zwp_xwayland_keyboard_grab_manager_v1: Pzwp_xwayland_keyboard_grab_manager_v1);
function  zwp_xwayland_keyboard_grab_manager_v1_grab_keyboard(zwp_xwayland_keyboard_grab_manager_v1: Pzwp_xwayland_keyboard_grab_manager_v1; surface: Pwl_surface; seat: Pwl_seat): Pzwp_xwayland_keyboard_grab_v1;
function  zwp_xwayland_keyboard_grab_manager_v1_add_listener(zwp_xwayland_keyboard_grab_manager_v1: Pzwp_xwayland_keyboard_grab_manager_v1; listener: Pzwp_xwayland_keyboard_grab_manager_v1_listener; data: Pointer): cint;
procedure  zwp_xwayland_keyboard_grab_manager_v1_add_listener(zwp_xwayland_keyboard_grab_manager_v1: Pzwp_xwayland_keyboard_grab_manager_v1; AIntf: Izwp_xwayland_keyboard_grab_manager_v1Listener);
procedure zwp_xwayland_keyboard_grab_manager_v1_set_user_data(zwp_xwayland_keyboard_grab_manager_v1: Pzwp_xwayland_keyboard_grab_manager_v1; user_data: Pointer);
function  zwp_xwayland_keyboard_grab_manager_v1_get_user_data(zwp_xwayland_keyboard_grab_manager_v1: Pzwp_xwayland_keyboard_grab_manager_v1): Pointer;
function  zwp_xwayland_keyboard_grab_manager_v1_get_version(zwp_xwayland_keyboard_grab_manager_v1: Pzwp_xwayland_keyboard_grab_manager_v1): cuint32;
procedure zwp_xwayland_keyboard_grab_v1_destroy(zwp_xwayland_keyboard_grab_v1: Pzwp_xwayland_keyboard_grab_v1);
function  zwp_xwayland_keyboard_grab_v1_add_listener(zwp_xwayland_keyboard_grab_v1: Pzwp_xwayland_keyboard_grab_v1; listener: Pzwp_xwayland_keyboard_grab_v1_listener; data: Pointer): cint;
procedure  zwp_xwayland_keyboard_grab_v1_add_listener(zwp_xwayland_keyboard_grab_v1: Pzwp_xwayland_keyboard_grab_v1; AIntf: Izwp_xwayland_keyboard_grab_v1Listener);
procedure zwp_xwayland_keyboard_grab_v1_set_user_data(zwp_xwayland_keyboard_grab_v1: Pzwp_xwayland_keyboard_grab_v1; user_data: Pointer);
function  zwp_xwayland_keyboard_grab_v1_get_user_data(zwp_xwayland_keyboard_grab_v1: Pzwp_xwayland_keyboard_grab_v1): Pointer;
function  zwp_xwayland_keyboard_grab_v1_get_version(zwp_xwayland_keyboard_grab_v1: Pzwp_xwayland_keyboard_grab_v1): cuint32;



var
  zwp_xwayland_keyboard_grab_manager_v1_interface: Twl_interface;
  zwp_xwayland_keyboard_grab_v1_interface: Twl_interface;



implementation

const
_ZWP_XWAYLAND_KEYBOARD_GRAB_MANAGER_V1_DESTROY = 0;
_ZWP_XWAYLAND_KEYBOARD_GRAB_MANAGER_V1_GRAB_KEYBOARD = 1;
_ZWP_XWAYLAND_KEYBOARD_GRAB_V1_DESTROY = 0;


var
  vIntf_zwp_xwayland_keyboard_grab_manager_v1_Listener: Tzwp_xwayland_keyboard_grab_manager_v1_listener;
  vIntf_zwp_xwayland_keyboard_grab_v1_Listener: Tzwp_xwayland_keyboard_grab_v1_listener;



procedure zwp_xwayland_keyboard_grab_manager_v1_destroy(zwp_xwayland_keyboard_grab_manager_v1: Pzwp_xwayland_keyboard_grab_manager_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_xwayland_keyboard_grab_manager_v1), _ZWP_XWAYLAND_KEYBOARD_GRAB_MANAGER_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_xwayland_keyboard_grab_manager_v1));
end;

function  zwp_xwayland_keyboard_grab_manager_v1_grab_keyboard(zwp_xwayland_keyboard_grab_manager_v1: Pzwp_xwayland_keyboard_grab_manager_v1; surface: Pwl_surface; seat: Pwl_seat): Pzwp_xwayland_keyboard_grab_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_xwayland_keyboard_grab_manager_v1),
      _ZWP_XWAYLAND_KEYBOARD_GRAB_MANAGER_V1_GRAB_KEYBOARD, @zwp_xwayland_keyboard_grab_v1_interface, nil, surface, seat);
  Result := Pzwp_xwayland_keyboard_grab_v1(id);
end;

function  zwp_xwayland_keyboard_grab_manager_v1_add_listener(zwp_xwayland_keyboard_grab_manager_v1: Pzwp_xwayland_keyboard_grab_manager_v1; listener: Pzwp_xwayland_keyboard_grab_manager_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_xwayland_keyboard_grab_manager_v1), listener, data);
end;

procedure  zwp_xwayland_keyboard_grab_manager_v1_add_listener(zwp_xwayland_keyboard_grab_manager_v1: Pzwp_xwayland_keyboard_grab_manager_v1; AIntf: Izwp_xwayland_keyboard_grab_manager_v1Listener);
begin
  zwp_xwayland_keyboard_grab_manager_v1_add_listener(zwp_xwayland_keyboard_grab_manager_v1, @vIntf_zwp_xwayland_keyboard_grab_manager_v1_Listener, AIntf);
end;

procedure zwp_xwayland_keyboard_grab_manager_v1_set_user_data(zwp_xwayland_keyboard_grab_manager_v1: Pzwp_xwayland_keyboard_grab_manager_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_xwayland_keyboard_grab_manager_v1), user_data);
end;

function  zwp_xwayland_keyboard_grab_manager_v1_get_user_data(zwp_xwayland_keyboard_grab_manager_v1: Pzwp_xwayland_keyboard_grab_manager_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_xwayland_keyboard_grab_manager_v1));
end;

function  zwp_xwayland_keyboard_grab_manager_v1_get_version(zwp_xwayland_keyboard_grab_manager_v1: Pzwp_xwayland_keyboard_grab_manager_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_xwayland_keyboard_grab_manager_v1));
end;

procedure zwp_xwayland_keyboard_grab_v1_destroy(zwp_xwayland_keyboard_grab_v1: Pzwp_xwayland_keyboard_grab_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_xwayland_keyboard_grab_v1), _ZWP_XWAYLAND_KEYBOARD_GRAB_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_xwayland_keyboard_grab_v1));
end;

function  zwp_xwayland_keyboard_grab_v1_add_listener(zwp_xwayland_keyboard_grab_v1: Pzwp_xwayland_keyboard_grab_v1; listener: Pzwp_xwayland_keyboard_grab_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_xwayland_keyboard_grab_v1), listener, data);
end;

procedure  zwp_xwayland_keyboard_grab_v1_add_listener(zwp_xwayland_keyboard_grab_v1: Pzwp_xwayland_keyboard_grab_v1; AIntf: Izwp_xwayland_keyboard_grab_v1Listener);
begin
  zwp_xwayland_keyboard_grab_v1_add_listener(zwp_xwayland_keyboard_grab_v1, @vIntf_zwp_xwayland_keyboard_grab_v1_Listener, AIntf);
end;

procedure zwp_xwayland_keyboard_grab_v1_set_user_data(zwp_xwayland_keyboard_grab_v1: Pzwp_xwayland_keyboard_grab_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_xwayland_keyboard_grab_v1), user_data);
end;

function  zwp_xwayland_keyboard_grab_v1_get_user_data(zwp_xwayland_keyboard_grab_v1: Pzwp_xwayland_keyboard_grab_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_xwayland_keyboard_grab_v1));
end;

function  zwp_xwayland_keyboard_grab_v1_get_version(zwp_xwayland_keyboard_grab_v1: Pzwp_xwayland_keyboard_grab_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_xwayland_keyboard_grab_v1));
end;




const
  pInterfaces: array[0..10] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@zwp_xwayland_keyboard_grab_v1_interface),
    (@wl_surface_interface),
    (@wl_seat_interface)
  );

  zwp_xwayland_keyboard_grab_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'grab_keyboard'; signature: 'noo'; types: @pInterfaces[8])
  );
  zwp_xwayland_keyboard_grab_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );

initialization


  zwp_xwayland_keyboard_grab_manager_v1_interface.name := 'zwp_xwayland_keyboard_grab_manager_v1';
  zwp_xwayland_keyboard_grab_manager_v1_interface.version := 1;
  zwp_xwayland_keyboard_grab_manager_v1_interface.method_count := 2;
  zwp_xwayland_keyboard_grab_manager_v1_interface.methods := @zwp_xwayland_keyboard_grab_manager_v1_requests;
  zwp_xwayland_keyboard_grab_manager_v1_interface.event_count := 0;
  zwp_xwayland_keyboard_grab_manager_v1_interface.events := nil;

  zwp_xwayland_keyboard_grab_v1_interface.name := 'zwp_xwayland_keyboard_grab_v1';
  zwp_xwayland_keyboard_grab_v1_interface.version := 1;
  zwp_xwayland_keyboard_grab_v1_interface.method_count := 1;
  zwp_xwayland_keyboard_grab_v1_interface.methods := @zwp_xwayland_keyboard_grab_v1_requests;
  zwp_xwayland_keyboard_grab_v1_interface.event_count := 0;
  zwp_xwayland_keyboard_grab_v1_interface.events := nil;

end.
