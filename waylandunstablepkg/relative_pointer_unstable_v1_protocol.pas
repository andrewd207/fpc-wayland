unit relative_pointer_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_relative_pointer_manager_v1 = ^Tzwp_relative_pointer_manager_v1;
  Tzwp_relative_pointer_manager_v1 = record end;
  Pzwp_relative_pointer_v1 = ^Tzwp_relative_pointer_v1;
  Tzwp_relative_pointer_v1 = record end;
  Pzwp_relative_pointer_manager_v1_listener = ^Tzwp_relative_pointer_manager_v1_listener;
  Tzwp_relative_pointer_manager_v1_listener = record
  end;

  Pzwp_relative_pointer_v1_listener = ^Tzwp_relative_pointer_v1_listener;
  Tzwp_relative_pointer_v1_listener = record
    relative_motion : procedure(data: Pointer; zwp_relative_pointer_v1: Pzwp_relative_pointer_v1; utime_hi: cuint; utime_lo: cuint; dx: cint32; dy: cint32; dx_unaccel: cint32; dy_unaccel: cint32); cdecl;
  end;



  Izwp_relative_pointer_manager_v1Listener = interface
  ['Izwp_relative_pointer_manager_v1Listener']
  end;

  Izwp_relative_pointer_v1Listener = interface
  ['Izwp_relative_pointer_v1Listener']
    procedure zwp_relative_pointer_v1_relative_motion(zwp_relative_pointer_v1: Pzwp_relative_pointer_v1; utime_hi: cuint; utime_lo: cuint; dx: cint32; dy: cint32; dx_unaccel: cint32; dy_unaccel: cint32);
  end;



procedure zwp_relative_pointer_manager_v1_destroy(zwp_relative_pointer_manager_v1: Pzwp_relative_pointer_manager_v1);
function  zwp_relative_pointer_manager_v1_get_relative_pointer(zwp_relative_pointer_manager_v1: Pzwp_relative_pointer_manager_v1; pointer: Pwl_pointer): Pzwp_relative_pointer_v1;
function  zwp_relative_pointer_manager_v1_add_listener(zwp_relative_pointer_manager_v1: Pzwp_relative_pointer_manager_v1; listener: Pzwp_relative_pointer_manager_v1_listener; data: Pointer): cint;
procedure  zwp_relative_pointer_manager_v1_add_listener(zwp_relative_pointer_manager_v1: Pzwp_relative_pointer_manager_v1; AIntf: Izwp_relative_pointer_manager_v1Listener);
procedure zwp_relative_pointer_manager_v1_set_user_data(zwp_relative_pointer_manager_v1: Pzwp_relative_pointer_manager_v1; user_data: Pointer);
function  zwp_relative_pointer_manager_v1_get_user_data(zwp_relative_pointer_manager_v1: Pzwp_relative_pointer_manager_v1): Pointer;
function  zwp_relative_pointer_manager_v1_get_version(zwp_relative_pointer_manager_v1: Pzwp_relative_pointer_manager_v1): cuint32;
procedure zwp_relative_pointer_v1_destroy(zwp_relative_pointer_v1: Pzwp_relative_pointer_v1);
function  zwp_relative_pointer_v1_add_listener(zwp_relative_pointer_v1: Pzwp_relative_pointer_v1; listener: Pzwp_relative_pointer_v1_listener; data: Pointer): cint;
procedure  zwp_relative_pointer_v1_add_listener(zwp_relative_pointer_v1: Pzwp_relative_pointer_v1; AIntf: Izwp_relative_pointer_v1Listener);
procedure zwp_relative_pointer_v1_set_user_data(zwp_relative_pointer_v1: Pzwp_relative_pointer_v1; user_data: Pointer);
function  zwp_relative_pointer_v1_get_user_data(zwp_relative_pointer_v1: Pzwp_relative_pointer_v1): Pointer;
function  zwp_relative_pointer_v1_get_version(zwp_relative_pointer_v1: Pzwp_relative_pointer_v1): cuint32;



var
  zwp_relative_pointer_manager_v1_interface: Twl_interface;
  zwp_relative_pointer_v1_interface: Twl_interface;



implementation

const
_ZWP_RELATIVE_POINTER_MANAGER_V1_DESTROY = 0;
_ZWP_RELATIVE_POINTER_MANAGER_V1_GET_RELATIVE_POINTER = 1;
_ZWP_RELATIVE_POINTER_V1_DESTROY = 0;


var
  vIntf_zwp_relative_pointer_manager_v1_Listener: Tzwp_relative_pointer_manager_v1_listener;
  vIntf_zwp_relative_pointer_v1_Listener: Tzwp_relative_pointer_v1_listener;



procedure zwp_relative_pointer_manager_v1_destroy(zwp_relative_pointer_manager_v1: Pzwp_relative_pointer_manager_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_relative_pointer_manager_v1), _ZWP_RELATIVE_POINTER_MANAGER_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_relative_pointer_manager_v1));
end;

function  zwp_relative_pointer_manager_v1_get_relative_pointer(zwp_relative_pointer_manager_v1: Pzwp_relative_pointer_manager_v1; pointer: Pwl_pointer): Pzwp_relative_pointer_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_relative_pointer_manager_v1),
      _ZWP_RELATIVE_POINTER_MANAGER_V1_GET_RELATIVE_POINTER, @zwp_relative_pointer_v1_interface, nil, pointer);
  Result := Pzwp_relative_pointer_v1(id);
end;

function  zwp_relative_pointer_manager_v1_add_listener(zwp_relative_pointer_manager_v1: Pzwp_relative_pointer_manager_v1; listener: Pzwp_relative_pointer_manager_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_relative_pointer_manager_v1), listener, data);
end;

procedure  zwp_relative_pointer_manager_v1_add_listener(zwp_relative_pointer_manager_v1: Pzwp_relative_pointer_manager_v1; AIntf: Izwp_relative_pointer_manager_v1Listener);
begin
  zwp_relative_pointer_manager_v1_add_listener(zwp_relative_pointer_manager_v1, @vIntf_zwp_relative_pointer_manager_v1_Listener, AIntf);
end;

procedure zwp_relative_pointer_manager_v1_set_user_data(zwp_relative_pointer_manager_v1: Pzwp_relative_pointer_manager_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_relative_pointer_manager_v1), user_data);
end;

function  zwp_relative_pointer_manager_v1_get_user_data(zwp_relative_pointer_manager_v1: Pzwp_relative_pointer_manager_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_relative_pointer_manager_v1));
end;

function  zwp_relative_pointer_manager_v1_get_version(zwp_relative_pointer_manager_v1: Pzwp_relative_pointer_manager_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_relative_pointer_manager_v1));
end;

procedure zwp_relative_pointer_v1_destroy(zwp_relative_pointer_v1: Pzwp_relative_pointer_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_relative_pointer_v1), _ZWP_RELATIVE_POINTER_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_relative_pointer_v1));
end;

function  zwp_relative_pointer_v1_add_listener(zwp_relative_pointer_v1: Pzwp_relative_pointer_v1; listener: Pzwp_relative_pointer_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_relative_pointer_v1), listener, data);
end;

procedure  zwp_relative_pointer_v1_add_listener(zwp_relative_pointer_v1: Pzwp_relative_pointer_v1; AIntf: Izwp_relative_pointer_v1Listener);
begin
  zwp_relative_pointer_v1_add_listener(zwp_relative_pointer_v1, @vIntf_zwp_relative_pointer_v1_Listener, AIntf);
end;

procedure zwp_relative_pointer_v1_set_user_data(zwp_relative_pointer_v1: Pzwp_relative_pointer_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_relative_pointer_v1), user_data);
end;

function  zwp_relative_pointer_v1_get_user_data(zwp_relative_pointer_v1: Pzwp_relative_pointer_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_relative_pointer_v1));
end;

function  zwp_relative_pointer_v1_get_version(zwp_relative_pointer_v1: Pzwp_relative_pointer_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_relative_pointer_v1));
end;


procedure zwp_relative_pointer_v1_relative_motion_Intf(AIntf: Izwp_relative_pointer_v1Listener; zwp_relative_pointer_v1: Pzwp_relative_pointer_v1; utime_hi: cuint; utime_lo: cuint; dx: cint32; dy: cint32; dx_unaccel: cint32; dy_unaccel: cint32); cdecl;
begin
  WriteLn('zwp_relative_pointer_v1.relative_motion');
  AIntf.zwp_relative_pointer_v1_relative_motion(zwp_relative_pointer_v1, utime_hi, utime_lo, dx, dy, dx_unaccel, dy_unaccel);
end;



const
  pInterfaces: array[0..9] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@zwp_relative_pointer_v1_interface),
    (@wl_pointer_interface)
  );

  zwp_relative_pointer_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_relative_pointer'; signature: 'no'; types: @pInterfaces[8])
  );
  zwp_relative_pointer_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_relative_pointer_v1_events: array[0..0] of Twl_message = (
    (name: 'relative_motion'; signature: 'uuffff'; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_relative_pointer_v1_Listener.relative_motion) := @zwp_relative_pointer_v1_relative_motion_Intf;


  zwp_relative_pointer_manager_v1_interface.name := 'zwp_relative_pointer_manager_v1';
  zwp_relative_pointer_manager_v1_interface.version := 1;
  zwp_relative_pointer_manager_v1_interface.method_count := 2;
  zwp_relative_pointer_manager_v1_interface.methods := @zwp_relative_pointer_manager_v1_requests;
  zwp_relative_pointer_manager_v1_interface.event_count := 0;
  zwp_relative_pointer_manager_v1_interface.events := nil;

  zwp_relative_pointer_v1_interface.name := 'zwp_relative_pointer_v1';
  zwp_relative_pointer_v1_interface.version := 1;
  zwp_relative_pointer_v1_interface.method_count := 1;
  zwp_relative_pointer_v1_interface.methods := @zwp_relative_pointer_v1_requests;
  zwp_relative_pointer_v1_interface.event_count := 1;
  zwp_relative_pointer_v1_interface.events := @zwp_relative_pointer_v1_events;

end.
