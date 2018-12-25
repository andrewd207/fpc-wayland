unit input_timestamps_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_input_timestamps_manager_v1 = ^Tzwp_input_timestamps_manager_v1;
  Tzwp_input_timestamps_manager_v1 = record end;
  Pzwp_input_timestamps_v1 = ^Tzwp_input_timestamps_v1;
  Tzwp_input_timestamps_v1 = record end;
  Pzwp_input_timestamps_manager_v1_listener = ^Tzwp_input_timestamps_manager_v1_listener;
  Tzwp_input_timestamps_manager_v1_listener = record
  end;

  Pzwp_input_timestamps_v1_listener = ^Tzwp_input_timestamps_v1_listener;
  Tzwp_input_timestamps_v1_listener = record
    timestamp : procedure(data: Pointer; zwp_input_timestamps_v1: Pzwp_input_timestamps_v1; tv_sec_hi: cuint; tv_sec_lo: cuint; tv_nsec: cuint); cdecl;
  end;



  Izwp_input_timestamps_manager_v1Listener = interface
  ['Izwp_input_timestamps_manager_v1Listener']
  end;

  Izwp_input_timestamps_v1Listener = interface
  ['Izwp_input_timestamps_v1Listener']
    procedure zwp_input_timestamps_v1_timestamp(zwp_input_timestamps_v1: Pzwp_input_timestamps_v1; tv_sec_hi: cuint; tv_sec_lo: cuint; tv_nsec: cuint);
  end;



procedure zwp_input_timestamps_manager_v1_destroy(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1);
function  zwp_input_timestamps_manager_v1_get_keyboard_timestamps(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1; keyboard: Pwl_keyboard): Pzwp_input_timestamps_v1;
function  zwp_input_timestamps_manager_v1_get_pointer_timestamps(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1; pointer: Pwl_pointer): Pzwp_input_timestamps_v1;
function  zwp_input_timestamps_manager_v1_get_touch_timestamps(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1; touch: Pwl_touch): Pzwp_input_timestamps_v1;
function  zwp_input_timestamps_manager_v1_add_listener(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1; listener: Pzwp_input_timestamps_manager_v1_listener; data: Pointer): cint;
procedure  zwp_input_timestamps_manager_v1_add_listener(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1; AIntf: Izwp_input_timestamps_manager_v1Listener);
procedure zwp_input_timestamps_manager_v1_set_user_data(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1; user_data: Pointer);
function  zwp_input_timestamps_manager_v1_get_user_data(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1): Pointer;
function  zwp_input_timestamps_manager_v1_get_version(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1): cuint32;
procedure zwp_input_timestamps_v1_destroy(zwp_input_timestamps_v1: Pzwp_input_timestamps_v1);
function  zwp_input_timestamps_v1_add_listener(zwp_input_timestamps_v1: Pzwp_input_timestamps_v1; listener: Pzwp_input_timestamps_v1_listener; data: Pointer): cint;
procedure  zwp_input_timestamps_v1_add_listener(zwp_input_timestamps_v1: Pzwp_input_timestamps_v1; AIntf: Izwp_input_timestamps_v1Listener);
procedure zwp_input_timestamps_v1_set_user_data(zwp_input_timestamps_v1: Pzwp_input_timestamps_v1; user_data: Pointer);
function  zwp_input_timestamps_v1_get_user_data(zwp_input_timestamps_v1: Pzwp_input_timestamps_v1): Pointer;
function  zwp_input_timestamps_v1_get_version(zwp_input_timestamps_v1: Pzwp_input_timestamps_v1): cuint32;



var
  zwp_input_timestamps_manager_v1_interface: Twl_interface;
  zwp_input_timestamps_v1_interface: Twl_interface;



implementation

const
_ZWP_INPUT_TIMESTAMPS_MANAGER_V1_DESTROY = 0;
_ZWP_INPUT_TIMESTAMPS_MANAGER_V1_GET_KEYBOARD_TIMESTAMPS = 1;
_ZWP_INPUT_TIMESTAMPS_MANAGER_V1_GET_POINTER_TIMESTAMPS = 2;
_ZWP_INPUT_TIMESTAMPS_MANAGER_V1_GET_TOUCH_TIMESTAMPS = 3;
_ZWP_INPUT_TIMESTAMPS_V1_DESTROY = 0;


var
  vIntf_zwp_input_timestamps_manager_v1_Listener: Tzwp_input_timestamps_manager_v1_listener;
  vIntf_zwp_input_timestamps_v1_Listener: Tzwp_input_timestamps_v1_listener;



procedure zwp_input_timestamps_manager_v1_destroy(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_input_timestamps_manager_v1), _ZWP_INPUT_TIMESTAMPS_MANAGER_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_input_timestamps_manager_v1));
end;

function  zwp_input_timestamps_manager_v1_get_keyboard_timestamps(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1; keyboard: Pwl_keyboard): Pzwp_input_timestamps_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_input_timestamps_manager_v1),
      _ZWP_INPUT_TIMESTAMPS_MANAGER_V1_GET_KEYBOARD_TIMESTAMPS, @zwp_input_timestamps_v1_interface, nil, keyboard);
  Result := Pzwp_input_timestamps_v1(id);
end;

function  zwp_input_timestamps_manager_v1_get_pointer_timestamps(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1; pointer: Pwl_pointer): Pzwp_input_timestamps_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_input_timestamps_manager_v1),
      _ZWP_INPUT_TIMESTAMPS_MANAGER_V1_GET_POINTER_TIMESTAMPS, @zwp_input_timestamps_v1_interface, nil, pointer);
  Result := Pzwp_input_timestamps_v1(id);
end;

function  zwp_input_timestamps_manager_v1_get_touch_timestamps(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1; touch: Pwl_touch): Pzwp_input_timestamps_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_input_timestamps_manager_v1),
      _ZWP_INPUT_TIMESTAMPS_MANAGER_V1_GET_TOUCH_TIMESTAMPS, @zwp_input_timestamps_v1_interface, nil, touch);
  Result := Pzwp_input_timestamps_v1(id);
end;

function  zwp_input_timestamps_manager_v1_add_listener(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1; listener: Pzwp_input_timestamps_manager_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_input_timestamps_manager_v1), listener, data);
end;

procedure  zwp_input_timestamps_manager_v1_add_listener(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1; AIntf: Izwp_input_timestamps_manager_v1Listener);
begin
  zwp_input_timestamps_manager_v1_add_listener(zwp_input_timestamps_manager_v1, @vIntf_zwp_input_timestamps_manager_v1_Listener, AIntf);
end;

procedure zwp_input_timestamps_manager_v1_set_user_data(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_input_timestamps_manager_v1), user_data);
end;

function  zwp_input_timestamps_manager_v1_get_user_data(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_input_timestamps_manager_v1));
end;

function  zwp_input_timestamps_manager_v1_get_version(zwp_input_timestamps_manager_v1: Pzwp_input_timestamps_manager_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_input_timestamps_manager_v1));
end;

procedure zwp_input_timestamps_v1_destroy(zwp_input_timestamps_v1: Pzwp_input_timestamps_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_input_timestamps_v1), _ZWP_INPUT_TIMESTAMPS_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_input_timestamps_v1));
end;

function  zwp_input_timestamps_v1_add_listener(zwp_input_timestamps_v1: Pzwp_input_timestamps_v1; listener: Pzwp_input_timestamps_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_input_timestamps_v1), listener, data);
end;

procedure  zwp_input_timestamps_v1_add_listener(zwp_input_timestamps_v1: Pzwp_input_timestamps_v1; AIntf: Izwp_input_timestamps_v1Listener);
begin
  zwp_input_timestamps_v1_add_listener(zwp_input_timestamps_v1, @vIntf_zwp_input_timestamps_v1_Listener, AIntf);
end;

procedure zwp_input_timestamps_v1_set_user_data(zwp_input_timestamps_v1: Pzwp_input_timestamps_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_input_timestamps_v1), user_data);
end;

function  zwp_input_timestamps_v1_get_user_data(zwp_input_timestamps_v1: Pzwp_input_timestamps_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_input_timestamps_v1));
end;

function  zwp_input_timestamps_v1_get_version(zwp_input_timestamps_v1: Pzwp_input_timestamps_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_input_timestamps_v1));
end;


procedure zwp_input_timestamps_v1_timestamp_Intf(AIntf: Izwp_input_timestamps_v1Listener; zwp_input_timestamps_v1: Pzwp_input_timestamps_v1; tv_sec_hi: cuint; tv_sec_lo: cuint; tv_nsec: cuint); cdecl;
begin
  WriteLn('zwp_input_timestamps_v1.timestamp');
  AIntf.zwp_input_timestamps_v1_timestamp(zwp_input_timestamps_v1, tv_sec_hi, tv_sec_lo, tv_nsec);
end;



const
  pInterfaces: array[0..13] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@zwp_input_timestamps_v1_interface),
    (@wl_keyboard_interface),
    (@zwp_input_timestamps_v1_interface),
    (@wl_pointer_interface),
    (@zwp_input_timestamps_v1_interface),
    (@wl_touch_interface)
  );

  zwp_input_timestamps_manager_v1_requests: array[0..3] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_keyboard_timestamps'; signature: 'no'; types: @pInterfaces[8]),
    (name: 'get_pointer_timestamps'; signature: 'no'; types: @pInterfaces[10]),
    (name: 'get_touch_timestamps'; signature: 'no'; types: @pInterfaces[12])
  );
  zwp_input_timestamps_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_input_timestamps_v1_events: array[0..0] of Twl_message = (
    (name: 'timestamp'; signature: 'uuu'; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_input_timestamps_v1_Listener.timestamp) := @zwp_input_timestamps_v1_timestamp_Intf;


  zwp_input_timestamps_manager_v1_interface.name := 'zwp_input_timestamps_manager_v1';
  zwp_input_timestamps_manager_v1_interface.version := 1;
  zwp_input_timestamps_manager_v1_interface.method_count := 4;
  zwp_input_timestamps_manager_v1_interface.methods := @zwp_input_timestamps_manager_v1_requests;
  zwp_input_timestamps_manager_v1_interface.event_count := 0;
  zwp_input_timestamps_manager_v1_interface.events := nil;

  zwp_input_timestamps_v1_interface.name := 'zwp_input_timestamps_v1';
  zwp_input_timestamps_v1_interface.version := 1;
  zwp_input_timestamps_v1_interface.method_count := 1;
  zwp_input_timestamps_v1_interface.methods := @zwp_input_timestamps_v1_requests;
  zwp_input_timestamps_v1_interface.event_count := 1;
  zwp_input_timestamps_v1_interface.events := @zwp_input_timestamps_v1_events;

end.
