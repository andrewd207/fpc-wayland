unit pointer_constraints_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_pointer_constraints_v1 = ^Tzwp_pointer_constraints_v1;
  Tzwp_pointer_constraints_v1 = record end;
  Pzwp_locked_pointer_v1 = ^Tzwp_locked_pointer_v1;
  Tzwp_locked_pointer_v1 = record end;
  Pzwp_confined_pointer_v1 = ^Tzwp_confined_pointer_v1;
  Tzwp_confined_pointer_v1 = record end;
const
  ZWP_POINTER_CONSTRAINTS_V1_ERROR_ALREADY_CONSTRAINED = 1; // pointer constraint already requested on that surface
  ZWP_POINTER_CONSTRAINTS_V1_LIFETIME_ONESHOT = 1; // 
  ZWP_POINTER_CONSTRAINTS_V1_LIFETIME_PERSISTENT = 2; // 

type
  Pzwp_pointer_constraints_v1_listener = ^Tzwp_pointer_constraints_v1_listener;
  Tzwp_pointer_constraints_v1_listener = record
  end;

  Pzwp_locked_pointer_v1_listener = ^Tzwp_locked_pointer_v1_listener;
  Tzwp_locked_pointer_v1_listener = record
    locked : procedure(data: Pointer; zwp_locked_pointer_v1: Pzwp_locked_pointer_v1); cdecl;
    unlocked : procedure(data: Pointer; zwp_locked_pointer_v1: Pzwp_locked_pointer_v1); cdecl;
  end;

  Pzwp_confined_pointer_v1_listener = ^Tzwp_confined_pointer_v1_listener;
  Tzwp_confined_pointer_v1_listener = record
    confined : procedure(data: Pointer; zwp_confined_pointer_v1: Pzwp_confined_pointer_v1); cdecl;
    unconfined : procedure(data: Pointer; zwp_confined_pointer_v1: Pzwp_confined_pointer_v1); cdecl;
  end;



  Izwp_pointer_constraints_v1Listener = interface
  ['Izwp_pointer_constraints_v1Listener']
  end;

  Izwp_locked_pointer_v1Listener = interface
  ['Izwp_locked_pointer_v1Listener']
    procedure zwp_locked_pointer_v1_locked(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1);
    procedure zwp_locked_pointer_v1_unlocked(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1);
  end;

  Izwp_confined_pointer_v1Listener = interface
  ['Izwp_confined_pointer_v1Listener']
    procedure zwp_confined_pointer_v1_confined(zwp_confined_pointer_v1: Pzwp_confined_pointer_v1);
    procedure zwp_confined_pointer_v1_unconfined(zwp_confined_pointer_v1: Pzwp_confined_pointer_v1);
  end;



procedure zwp_pointer_constraints_v1_destroy(zwp_pointer_constraints_v1: Pzwp_pointer_constraints_v1);
function  zwp_pointer_constraints_v1_lock_pointer(zwp_pointer_constraints_v1: Pzwp_pointer_constraints_v1; surface: Pwl_surface; pointer: Pwl_pointer; region: Pwl_region; lifetime: cuint): Pzwp_locked_pointer_v1;
function  zwp_pointer_constraints_v1_confine_pointer(zwp_pointer_constraints_v1: Pzwp_pointer_constraints_v1; surface: Pwl_surface; pointer: Pwl_pointer; region: Pwl_region; lifetime: cuint): Pzwp_confined_pointer_v1;
function  zwp_pointer_constraints_v1_add_listener(zwp_pointer_constraints_v1: Pzwp_pointer_constraints_v1; listener: Pzwp_pointer_constraints_v1_listener; data: Pointer): cint;
procedure  zwp_pointer_constraints_v1_add_listener(zwp_pointer_constraints_v1: Pzwp_pointer_constraints_v1; AIntf: Izwp_pointer_constraints_v1Listener);
procedure zwp_pointer_constraints_v1_set_user_data(zwp_pointer_constraints_v1: Pzwp_pointer_constraints_v1; user_data: Pointer);
function  zwp_pointer_constraints_v1_get_user_data(zwp_pointer_constraints_v1: Pzwp_pointer_constraints_v1): Pointer;
function  zwp_pointer_constraints_v1_get_version(zwp_pointer_constraints_v1: Pzwp_pointer_constraints_v1): cuint32;
procedure zwp_locked_pointer_v1_destroy(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1);
procedure zwp_locked_pointer_v1_set_cursor_position_hint(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1; surface_x: cint32; surface_y: cint32);
procedure zwp_locked_pointer_v1_set_region(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1; region: Pwl_region);
function  zwp_locked_pointer_v1_add_listener(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1; listener: Pzwp_locked_pointer_v1_listener; data: Pointer): cint;
procedure  zwp_locked_pointer_v1_add_listener(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1; AIntf: Izwp_locked_pointer_v1Listener);
procedure zwp_locked_pointer_v1_set_user_data(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1; user_data: Pointer);
function  zwp_locked_pointer_v1_get_user_data(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1): Pointer;
function  zwp_locked_pointer_v1_get_version(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1): cuint32;
procedure zwp_confined_pointer_v1_destroy(zwp_confined_pointer_v1: Pzwp_confined_pointer_v1);
procedure zwp_confined_pointer_v1_set_region(zwp_confined_pointer_v1: Pzwp_confined_pointer_v1; region: Pwl_region);
function  zwp_confined_pointer_v1_add_listener(zwp_confined_pointer_v1: Pzwp_confined_pointer_v1; listener: Pzwp_confined_pointer_v1_listener; data: Pointer): cint;
procedure  zwp_confined_pointer_v1_add_listener(zwp_confined_pointer_v1: Pzwp_confined_pointer_v1; AIntf: Izwp_confined_pointer_v1Listener);
procedure zwp_confined_pointer_v1_set_user_data(zwp_confined_pointer_v1: Pzwp_confined_pointer_v1; user_data: Pointer);
function  zwp_confined_pointer_v1_get_user_data(zwp_confined_pointer_v1: Pzwp_confined_pointer_v1): Pointer;
function  zwp_confined_pointer_v1_get_version(zwp_confined_pointer_v1: Pzwp_confined_pointer_v1): cuint32;



var
  zwp_pointer_constraints_v1_interface: Twl_interface;
  zwp_locked_pointer_v1_interface: Twl_interface;
  zwp_confined_pointer_v1_interface: Twl_interface;



implementation

const
_ZWP_POINTER_CONSTRAINTS_V1_DESTROY = 0;
_ZWP_POINTER_CONSTRAINTS_V1_LOCK_POINTER = 1;
_ZWP_POINTER_CONSTRAINTS_V1_CONFINE_POINTER = 2;
_ZWP_LOCKED_POINTER_V1_DESTROY = 0;
_ZWP_LOCKED_POINTER_V1_SET_CURSOR_POSITION_HINT = 1;
_ZWP_LOCKED_POINTER_V1_SET_REGION = 2;
_ZWP_CONFINED_POINTER_V1_DESTROY = 0;
_ZWP_CONFINED_POINTER_V1_SET_REGION = 1;


var
  vIntf_zwp_pointer_constraints_v1_Listener: Tzwp_pointer_constraints_v1_listener;
  vIntf_zwp_locked_pointer_v1_Listener: Tzwp_locked_pointer_v1_listener;
  vIntf_zwp_confined_pointer_v1_Listener: Tzwp_confined_pointer_v1_listener;



procedure zwp_pointer_constraints_v1_destroy(zwp_pointer_constraints_v1: Pzwp_pointer_constraints_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_pointer_constraints_v1), _ZWP_POINTER_CONSTRAINTS_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_pointer_constraints_v1));
end;

function  zwp_pointer_constraints_v1_lock_pointer(zwp_pointer_constraints_v1: Pzwp_pointer_constraints_v1; surface: Pwl_surface; pointer: Pwl_pointer; region: Pwl_region; lifetime: cuint): Pzwp_locked_pointer_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_pointer_constraints_v1),
      _ZWP_POINTER_CONSTRAINTS_V1_LOCK_POINTER, @zwp_locked_pointer_v1_interface, nil, surface, pointer, region, lifetime);
  Result := Pzwp_locked_pointer_v1(id);
end;

function  zwp_pointer_constraints_v1_confine_pointer(zwp_pointer_constraints_v1: Pzwp_pointer_constraints_v1; surface: Pwl_surface; pointer: Pwl_pointer; region: Pwl_region; lifetime: cuint): Pzwp_confined_pointer_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_pointer_constraints_v1),
      _ZWP_POINTER_CONSTRAINTS_V1_CONFINE_POINTER, @zwp_confined_pointer_v1_interface, nil, surface, pointer, region, lifetime);
  Result := Pzwp_confined_pointer_v1(id);
end;

function  zwp_pointer_constraints_v1_add_listener(zwp_pointer_constraints_v1: Pzwp_pointer_constraints_v1; listener: Pzwp_pointer_constraints_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_pointer_constraints_v1), listener, data);
end;

procedure  zwp_pointer_constraints_v1_add_listener(zwp_pointer_constraints_v1: Pzwp_pointer_constraints_v1; AIntf: Izwp_pointer_constraints_v1Listener);
begin
  zwp_pointer_constraints_v1_add_listener(zwp_pointer_constraints_v1, @vIntf_zwp_pointer_constraints_v1_Listener, AIntf);
end;

procedure zwp_pointer_constraints_v1_set_user_data(zwp_pointer_constraints_v1: Pzwp_pointer_constraints_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_pointer_constraints_v1), user_data);
end;

function  zwp_pointer_constraints_v1_get_user_data(zwp_pointer_constraints_v1: Pzwp_pointer_constraints_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_pointer_constraints_v1));
end;

function  zwp_pointer_constraints_v1_get_version(zwp_pointer_constraints_v1: Pzwp_pointer_constraints_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_pointer_constraints_v1));
end;

procedure zwp_locked_pointer_v1_destroy(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_locked_pointer_v1), _ZWP_LOCKED_POINTER_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_locked_pointer_v1));
end;

procedure zwp_locked_pointer_v1_set_cursor_position_hint(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1; surface_x: cint32; surface_y: cint32);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_locked_pointer_v1),
      _ZWP_LOCKED_POINTER_V1_SET_CURSOR_POSITION_HINT, surface_x, surface_y);
end;

procedure zwp_locked_pointer_v1_set_region(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1; region: Pwl_region);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_locked_pointer_v1),
      _ZWP_LOCKED_POINTER_V1_SET_REGION, region);
end;

function  zwp_locked_pointer_v1_add_listener(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1; listener: Pzwp_locked_pointer_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_locked_pointer_v1), listener, data);
end;

procedure  zwp_locked_pointer_v1_add_listener(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1; AIntf: Izwp_locked_pointer_v1Listener);
begin
  zwp_locked_pointer_v1_add_listener(zwp_locked_pointer_v1, @vIntf_zwp_locked_pointer_v1_Listener, AIntf);
end;

procedure zwp_locked_pointer_v1_set_user_data(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_locked_pointer_v1), user_data);
end;

function  zwp_locked_pointer_v1_get_user_data(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_locked_pointer_v1));
end;

function  zwp_locked_pointer_v1_get_version(zwp_locked_pointer_v1: Pzwp_locked_pointer_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_locked_pointer_v1));
end;

procedure zwp_confined_pointer_v1_destroy(zwp_confined_pointer_v1: Pzwp_confined_pointer_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_confined_pointer_v1), _ZWP_CONFINED_POINTER_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_confined_pointer_v1));
end;

procedure zwp_confined_pointer_v1_set_region(zwp_confined_pointer_v1: Pzwp_confined_pointer_v1; region: Pwl_region);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_confined_pointer_v1),
      _ZWP_CONFINED_POINTER_V1_SET_REGION, region);
end;

function  zwp_confined_pointer_v1_add_listener(zwp_confined_pointer_v1: Pzwp_confined_pointer_v1; listener: Pzwp_confined_pointer_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_confined_pointer_v1), listener, data);
end;

procedure  zwp_confined_pointer_v1_add_listener(zwp_confined_pointer_v1: Pzwp_confined_pointer_v1; AIntf: Izwp_confined_pointer_v1Listener);
begin
  zwp_confined_pointer_v1_add_listener(zwp_confined_pointer_v1, @vIntf_zwp_confined_pointer_v1_Listener, AIntf);
end;

procedure zwp_confined_pointer_v1_set_user_data(zwp_confined_pointer_v1: Pzwp_confined_pointer_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_confined_pointer_v1), user_data);
end;

function  zwp_confined_pointer_v1_get_user_data(zwp_confined_pointer_v1: Pzwp_confined_pointer_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_confined_pointer_v1));
end;

function  zwp_confined_pointer_v1_get_version(zwp_confined_pointer_v1: Pzwp_confined_pointer_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_confined_pointer_v1));
end;


procedure zwp_locked_pointer_v1_locked_Intf(AIntf: Izwp_locked_pointer_v1Listener; zwp_locked_pointer_v1: Pzwp_locked_pointer_v1); cdecl;
begin
  WriteLn('zwp_locked_pointer_v1.locked');
  AIntf.zwp_locked_pointer_v1_locked(zwp_locked_pointer_v1);
end;

procedure zwp_locked_pointer_v1_unlocked_Intf(AIntf: Izwp_locked_pointer_v1Listener; zwp_locked_pointer_v1: Pzwp_locked_pointer_v1); cdecl;
begin
  WriteLn('zwp_locked_pointer_v1.unlocked');
  AIntf.zwp_locked_pointer_v1_unlocked(zwp_locked_pointer_v1);
end;

procedure zwp_confined_pointer_v1_confined_Intf(AIntf: Izwp_confined_pointer_v1Listener; zwp_confined_pointer_v1: Pzwp_confined_pointer_v1); cdecl;
begin
  WriteLn('zwp_confined_pointer_v1.confined');
  AIntf.zwp_confined_pointer_v1_confined(zwp_confined_pointer_v1);
end;

procedure zwp_confined_pointer_v1_unconfined_Intf(AIntf: Izwp_confined_pointer_v1Listener; zwp_confined_pointer_v1: Pzwp_confined_pointer_v1); cdecl;
begin
  WriteLn('zwp_confined_pointer_v1.unconfined');
  AIntf.zwp_confined_pointer_v1_unconfined(zwp_confined_pointer_v1);
end;



const
  pInterfaces: array[0..19] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@zwp_locked_pointer_v1_interface),
    (@wl_surface_interface),
    (@wl_pointer_interface),
    (@wl_region_interface),
    (nil),
    (@zwp_confined_pointer_v1_interface),
    (@wl_surface_interface),
    (@wl_pointer_interface),
    (@wl_region_interface),
    (nil),
    (@wl_region_interface),
    (@wl_region_interface)
  );

  zwp_pointer_constraints_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'lock_pointer'; signature: 'noo?ou'; types: @pInterfaces[8]),
    (name: 'confine_pointer'; signature: 'noo?ou'; types: @pInterfaces[13])
  );
  zwp_locked_pointer_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_cursor_position_hint'; signature: 'ff'; types: @pInterfaces[0]),
    (name: 'set_region'; signature: '?o'; types: @pInterfaces[18])
  );
  zwp_locked_pointer_v1_events: array[0..1] of Twl_message = (
    (name: 'locked'; signature: ''; types: @pInterfaces[0]),
    (name: 'unlocked'; signature: ''; types: @pInterfaces[0])
  );
  zwp_confined_pointer_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_region'; signature: '?o'; types: @pInterfaces[19])
  );
  zwp_confined_pointer_v1_events: array[0..1] of Twl_message = (
    (name: 'confined'; signature: ''; types: @pInterfaces[0]),
    (name: 'unconfined'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_locked_pointer_v1_Listener.locked) := @zwp_locked_pointer_v1_locked_Intf;
  Pointer(vIntf_zwp_locked_pointer_v1_Listener.unlocked) := @zwp_locked_pointer_v1_unlocked_Intf;
  Pointer(vIntf_zwp_confined_pointer_v1_Listener.confined) := @zwp_confined_pointer_v1_confined_Intf;
  Pointer(vIntf_zwp_confined_pointer_v1_Listener.unconfined) := @zwp_confined_pointer_v1_unconfined_Intf;


  zwp_pointer_constraints_v1_interface.name := 'zwp_pointer_constraints_v1';
  zwp_pointer_constraints_v1_interface.version := 1;
  zwp_pointer_constraints_v1_interface.method_count := 3;
  zwp_pointer_constraints_v1_interface.methods := @zwp_pointer_constraints_v1_requests;
  zwp_pointer_constraints_v1_interface.event_count := 0;
  zwp_pointer_constraints_v1_interface.events := nil;

  zwp_locked_pointer_v1_interface.name := 'zwp_locked_pointer_v1';
  zwp_locked_pointer_v1_interface.version := 1;
  zwp_locked_pointer_v1_interface.method_count := 3;
  zwp_locked_pointer_v1_interface.methods := @zwp_locked_pointer_v1_requests;
  zwp_locked_pointer_v1_interface.event_count := 2;
  zwp_locked_pointer_v1_interface.events := @zwp_locked_pointer_v1_events;

  zwp_confined_pointer_v1_interface.name := 'zwp_confined_pointer_v1';
  zwp_confined_pointer_v1_interface.version := 1;
  zwp_confined_pointer_v1_interface.method_count := 2;
  zwp_confined_pointer_v1_interface.methods := @zwp_confined_pointer_v1_requests;
  zwp_confined_pointer_v1_interface.event_count := 2;
  zwp_confined_pointer_v1_interface.events := @zwp_confined_pointer_v1_events;

end.
