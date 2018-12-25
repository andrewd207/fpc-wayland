unit keyboard_shortcuts_inhibit_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_keyboard_shortcuts_inhibit_manager_v1 = ^Tzwp_keyboard_shortcuts_inhibit_manager_v1;
  Tzwp_keyboard_shortcuts_inhibit_manager_v1 = record end;
  Pzwp_keyboard_shortcuts_inhibitor_v1 = ^Tzwp_keyboard_shortcuts_inhibitor_v1;
  Tzwp_keyboard_shortcuts_inhibitor_v1 = record end;
const
  ZWP_KEYBOARD_SHORTCUTS_INHIBIT_MANAGER_V1_ERROR_ALREADY_INHIBITED = 0; // the shortcuts are already inhibited for this surface

type
  Pzwp_keyboard_shortcuts_inhibit_manager_v1_listener = ^Tzwp_keyboard_shortcuts_inhibit_manager_v1_listener;
  Tzwp_keyboard_shortcuts_inhibit_manager_v1_listener = record
  end;

  Pzwp_keyboard_shortcuts_inhibitor_v1_listener = ^Tzwp_keyboard_shortcuts_inhibitor_v1_listener;
  Tzwp_keyboard_shortcuts_inhibitor_v1_listener = record
    active : procedure(data: Pointer; zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1); cdecl;
    inactive : procedure(data: Pointer; zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1); cdecl;
  end;



  Izwp_keyboard_shortcuts_inhibit_manager_v1Listener = interface
  ['Izwp_keyboard_shortcuts_inhibit_manager_v1Listener']
  end;

  Izwp_keyboard_shortcuts_inhibitor_v1Listener = interface
  ['Izwp_keyboard_shortcuts_inhibitor_v1Listener']
    procedure zwp_keyboard_shortcuts_inhibitor_v1_active(zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1);
    procedure zwp_keyboard_shortcuts_inhibitor_v1_inactive(zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1);
  end;



procedure zwp_keyboard_shortcuts_inhibit_manager_v1_destroy(zwp_keyboard_shortcuts_inhibit_manager_v1: Pzwp_keyboard_shortcuts_inhibit_manager_v1);
function  zwp_keyboard_shortcuts_inhibit_manager_v1_inhibit_shortcuts(zwp_keyboard_shortcuts_inhibit_manager_v1: Pzwp_keyboard_shortcuts_inhibit_manager_v1; surface: Pwl_surface; seat: Pwl_seat): Pzwp_keyboard_shortcuts_inhibitor_v1;
function  zwp_keyboard_shortcuts_inhibit_manager_v1_add_listener(zwp_keyboard_shortcuts_inhibit_manager_v1: Pzwp_keyboard_shortcuts_inhibit_manager_v1; listener: Pzwp_keyboard_shortcuts_inhibit_manager_v1_listener; data: Pointer): cint;
procedure  zwp_keyboard_shortcuts_inhibit_manager_v1_add_listener(zwp_keyboard_shortcuts_inhibit_manager_v1: Pzwp_keyboard_shortcuts_inhibit_manager_v1; AIntf: Izwp_keyboard_shortcuts_inhibit_manager_v1Listener);
procedure zwp_keyboard_shortcuts_inhibit_manager_v1_set_user_data(zwp_keyboard_shortcuts_inhibit_manager_v1: Pzwp_keyboard_shortcuts_inhibit_manager_v1; user_data: Pointer);
function  zwp_keyboard_shortcuts_inhibit_manager_v1_get_user_data(zwp_keyboard_shortcuts_inhibit_manager_v1: Pzwp_keyboard_shortcuts_inhibit_manager_v1): Pointer;
function  zwp_keyboard_shortcuts_inhibit_manager_v1_get_version(zwp_keyboard_shortcuts_inhibit_manager_v1: Pzwp_keyboard_shortcuts_inhibit_manager_v1): cuint32;
procedure zwp_keyboard_shortcuts_inhibitor_v1_destroy(zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1);
function  zwp_keyboard_shortcuts_inhibitor_v1_add_listener(zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1; listener: Pzwp_keyboard_shortcuts_inhibitor_v1_listener; data: Pointer): cint;
procedure  zwp_keyboard_shortcuts_inhibitor_v1_add_listener(zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1; AIntf: Izwp_keyboard_shortcuts_inhibitor_v1Listener);
procedure zwp_keyboard_shortcuts_inhibitor_v1_set_user_data(zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1; user_data: Pointer);
function  zwp_keyboard_shortcuts_inhibitor_v1_get_user_data(zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1): Pointer;
function  zwp_keyboard_shortcuts_inhibitor_v1_get_version(zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1): cuint32;



var
  zwp_keyboard_shortcuts_inhibit_manager_v1_interface: Twl_interface;
  zwp_keyboard_shortcuts_inhibitor_v1_interface: Twl_interface;



implementation

const
_ZWP_KEYBOARD_SHORTCUTS_INHIBIT_MANAGER_V1_DESTROY = 0;
_ZWP_KEYBOARD_SHORTCUTS_INHIBIT_MANAGER_V1_INHIBIT_SHORTCUTS = 1;
_ZWP_KEYBOARD_SHORTCUTS_INHIBITOR_V1_DESTROY = 0;


var
  vIntf_zwp_keyboard_shortcuts_inhibit_manager_v1_Listener: Tzwp_keyboard_shortcuts_inhibit_manager_v1_listener;
  vIntf_zwp_keyboard_shortcuts_inhibitor_v1_Listener: Tzwp_keyboard_shortcuts_inhibitor_v1_listener;



procedure zwp_keyboard_shortcuts_inhibit_manager_v1_destroy(zwp_keyboard_shortcuts_inhibit_manager_v1: Pzwp_keyboard_shortcuts_inhibit_manager_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_keyboard_shortcuts_inhibit_manager_v1), _ZWP_KEYBOARD_SHORTCUTS_INHIBIT_MANAGER_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_keyboard_shortcuts_inhibit_manager_v1));
end;

function  zwp_keyboard_shortcuts_inhibit_manager_v1_inhibit_shortcuts(zwp_keyboard_shortcuts_inhibit_manager_v1: Pzwp_keyboard_shortcuts_inhibit_manager_v1; surface: Pwl_surface; seat: Pwl_seat): Pzwp_keyboard_shortcuts_inhibitor_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_keyboard_shortcuts_inhibit_manager_v1),
      _ZWP_KEYBOARD_SHORTCUTS_INHIBIT_MANAGER_V1_INHIBIT_SHORTCUTS, @zwp_keyboard_shortcuts_inhibitor_v1_interface, nil, surface, seat);
  Result := Pzwp_keyboard_shortcuts_inhibitor_v1(id);
end;

function  zwp_keyboard_shortcuts_inhibit_manager_v1_add_listener(zwp_keyboard_shortcuts_inhibit_manager_v1: Pzwp_keyboard_shortcuts_inhibit_manager_v1; listener: Pzwp_keyboard_shortcuts_inhibit_manager_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_keyboard_shortcuts_inhibit_manager_v1), listener, data);
end;

procedure  zwp_keyboard_shortcuts_inhibit_manager_v1_add_listener(zwp_keyboard_shortcuts_inhibit_manager_v1: Pzwp_keyboard_shortcuts_inhibit_manager_v1; AIntf: Izwp_keyboard_shortcuts_inhibit_manager_v1Listener);
begin
  zwp_keyboard_shortcuts_inhibit_manager_v1_add_listener(zwp_keyboard_shortcuts_inhibit_manager_v1, @vIntf_zwp_keyboard_shortcuts_inhibit_manager_v1_Listener, AIntf);
end;

procedure zwp_keyboard_shortcuts_inhibit_manager_v1_set_user_data(zwp_keyboard_shortcuts_inhibit_manager_v1: Pzwp_keyboard_shortcuts_inhibit_manager_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_keyboard_shortcuts_inhibit_manager_v1), user_data);
end;

function  zwp_keyboard_shortcuts_inhibit_manager_v1_get_user_data(zwp_keyboard_shortcuts_inhibit_manager_v1: Pzwp_keyboard_shortcuts_inhibit_manager_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_keyboard_shortcuts_inhibit_manager_v1));
end;

function  zwp_keyboard_shortcuts_inhibit_manager_v1_get_version(zwp_keyboard_shortcuts_inhibit_manager_v1: Pzwp_keyboard_shortcuts_inhibit_manager_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_keyboard_shortcuts_inhibit_manager_v1));
end;

procedure zwp_keyboard_shortcuts_inhibitor_v1_destroy(zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_keyboard_shortcuts_inhibitor_v1), _ZWP_KEYBOARD_SHORTCUTS_INHIBITOR_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_keyboard_shortcuts_inhibitor_v1));
end;

function  zwp_keyboard_shortcuts_inhibitor_v1_add_listener(zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1; listener: Pzwp_keyboard_shortcuts_inhibitor_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_keyboard_shortcuts_inhibitor_v1), listener, data);
end;

procedure  zwp_keyboard_shortcuts_inhibitor_v1_add_listener(zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1; AIntf: Izwp_keyboard_shortcuts_inhibitor_v1Listener);
begin
  zwp_keyboard_shortcuts_inhibitor_v1_add_listener(zwp_keyboard_shortcuts_inhibitor_v1, @vIntf_zwp_keyboard_shortcuts_inhibitor_v1_Listener, AIntf);
end;

procedure zwp_keyboard_shortcuts_inhibitor_v1_set_user_data(zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_keyboard_shortcuts_inhibitor_v1), user_data);
end;

function  zwp_keyboard_shortcuts_inhibitor_v1_get_user_data(zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_keyboard_shortcuts_inhibitor_v1));
end;

function  zwp_keyboard_shortcuts_inhibitor_v1_get_version(zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_keyboard_shortcuts_inhibitor_v1));
end;


procedure zwp_keyboard_shortcuts_inhibitor_v1_active_Intf(AIntf: Izwp_keyboard_shortcuts_inhibitor_v1Listener; zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1); cdecl;
begin
  WriteLn('zwp_keyboard_shortcuts_inhibitor_v1.active');
  AIntf.zwp_keyboard_shortcuts_inhibitor_v1_active(zwp_keyboard_shortcuts_inhibitor_v1);
end;

procedure zwp_keyboard_shortcuts_inhibitor_v1_inactive_Intf(AIntf: Izwp_keyboard_shortcuts_inhibitor_v1Listener; zwp_keyboard_shortcuts_inhibitor_v1: Pzwp_keyboard_shortcuts_inhibitor_v1); cdecl;
begin
  WriteLn('zwp_keyboard_shortcuts_inhibitor_v1.inactive');
  AIntf.zwp_keyboard_shortcuts_inhibitor_v1_inactive(zwp_keyboard_shortcuts_inhibitor_v1);
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
    (@zwp_keyboard_shortcuts_inhibitor_v1_interface),
    (@wl_surface_interface),
    (@wl_seat_interface)
  );

  zwp_keyboard_shortcuts_inhibit_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'inhibit_shortcuts'; signature: 'noo'; types: @pInterfaces[8])
  );
  zwp_keyboard_shortcuts_inhibitor_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_keyboard_shortcuts_inhibitor_v1_events: array[0..1] of Twl_message = (
    (name: 'active'; signature: ''; types: @pInterfaces[0]),
    (name: 'inactive'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_keyboard_shortcuts_inhibitor_v1_Listener.active) := @zwp_keyboard_shortcuts_inhibitor_v1_active_Intf;
  Pointer(vIntf_zwp_keyboard_shortcuts_inhibitor_v1_Listener.inactive) := @zwp_keyboard_shortcuts_inhibitor_v1_inactive_Intf;


  zwp_keyboard_shortcuts_inhibit_manager_v1_interface.name := 'zwp_keyboard_shortcuts_inhibit_manager_v1';
  zwp_keyboard_shortcuts_inhibit_manager_v1_interface.version := 1;
  zwp_keyboard_shortcuts_inhibit_manager_v1_interface.method_count := 2;
  zwp_keyboard_shortcuts_inhibit_manager_v1_interface.methods := @zwp_keyboard_shortcuts_inhibit_manager_v1_requests;
  zwp_keyboard_shortcuts_inhibit_manager_v1_interface.event_count := 0;
  zwp_keyboard_shortcuts_inhibit_manager_v1_interface.events := nil;

  zwp_keyboard_shortcuts_inhibitor_v1_interface.name := 'zwp_keyboard_shortcuts_inhibitor_v1';
  zwp_keyboard_shortcuts_inhibitor_v1_interface.version := 1;
  zwp_keyboard_shortcuts_inhibitor_v1_interface.method_count := 1;
  zwp_keyboard_shortcuts_inhibitor_v1_interface.methods := @zwp_keyboard_shortcuts_inhibitor_v1_requests;
  zwp_keyboard_shortcuts_inhibitor_v1_interface.event_count := 2;
  zwp_keyboard_shortcuts_inhibitor_v1_interface.events := @zwp_keyboard_shortcuts_inhibitor_v1_events;

end.
