unit pointer_gestures_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_pointer_gestures_v1 = ^Tzwp_pointer_gestures_v1;
  Tzwp_pointer_gestures_v1 = record end;
  Pzwp_pointer_gesture_swipe_v1 = ^Tzwp_pointer_gesture_swipe_v1;
  Tzwp_pointer_gesture_swipe_v1 = record end;
  Pzwp_pointer_gesture_pinch_v1 = ^Tzwp_pointer_gesture_pinch_v1;
  Tzwp_pointer_gesture_pinch_v1 = record end;
  Pzwp_pointer_gestures_v1_listener = ^Tzwp_pointer_gestures_v1_listener;
  Tzwp_pointer_gestures_v1_listener = record
  end;

  Pzwp_pointer_gesture_swipe_v1_listener = ^Tzwp_pointer_gesture_swipe_v1_listener;
  Tzwp_pointer_gesture_swipe_v1_listener = record
    begin_ : procedure(data: Pointer; zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; serial: cuint; time: cuint; surface: Pwl_surface; fingers: cuint); cdecl;
    update : procedure(data: Pointer; zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; time: cuint; dx: cint32; dy: cint32); cdecl;
    end_ : procedure(data: Pointer; zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; serial: cuint; time: cuint; cancelled: cint); cdecl;
  end;

  Pzwp_pointer_gesture_pinch_v1_listener = ^Tzwp_pointer_gesture_pinch_v1_listener;
  Tzwp_pointer_gesture_pinch_v1_listener = record
    begin_ : procedure(data: Pointer; zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; serial: cuint; time: cuint; surface: Pwl_surface; fingers: cuint); cdecl;
    update : procedure(data: Pointer; zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; time: cuint; dx: cint32; dy: cint32; scale: cint32; rotation: cint32); cdecl;
    end_ : procedure(data: Pointer; zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; serial: cuint; time: cuint; cancelled: cint); cdecl;
  end;



  Izwp_pointer_gestures_v1Listener = interface
  ['Izwp_pointer_gestures_v1Listener']
  end;

  Izwp_pointer_gesture_swipe_v1Listener = interface
  ['Izwp_pointer_gesture_swipe_v1Listener']
    procedure zwp_pointer_gesture_swipe_v1_begin(zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; serial: cuint; time: cuint; surface: Pwl_surface; fingers: cuint);
    procedure zwp_pointer_gesture_swipe_v1_update(zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; time: cuint; dx: cint32; dy: cint32);
    procedure zwp_pointer_gesture_swipe_v1_end(zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; serial: cuint; time: cuint; cancelled: cint);
  end;

  Izwp_pointer_gesture_pinch_v1Listener = interface
  ['Izwp_pointer_gesture_pinch_v1Listener']
    procedure zwp_pointer_gesture_pinch_v1_begin(zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; serial: cuint; time: cuint; surface: Pwl_surface; fingers: cuint);
    procedure zwp_pointer_gesture_pinch_v1_update(zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; time: cuint; dx: cint32; dy: cint32; scale: cint32; rotation: cint32);
    procedure zwp_pointer_gesture_pinch_v1_end(zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; serial: cuint; time: cuint; cancelled: cint);
  end;



function  zwp_pointer_gestures_v1_get_swipe_gesture(zwp_pointer_gestures_v1: Pzwp_pointer_gestures_v1; pointer: Pwl_pointer): Pzwp_pointer_gesture_swipe_v1;
function  zwp_pointer_gestures_v1_get_pinch_gesture(zwp_pointer_gestures_v1: Pzwp_pointer_gestures_v1; pointer: Pwl_pointer): Pzwp_pointer_gesture_pinch_v1;
function  zwp_pointer_gestures_v1_add_listener(zwp_pointer_gestures_v1: Pzwp_pointer_gestures_v1; listener: Pzwp_pointer_gestures_v1_listener; data: Pointer): cint;
procedure  zwp_pointer_gestures_v1_add_listener(zwp_pointer_gestures_v1: Pzwp_pointer_gestures_v1; AIntf: Izwp_pointer_gestures_v1Listener);
procedure zwp_pointer_gestures_v1_set_user_data(zwp_pointer_gestures_v1: Pzwp_pointer_gestures_v1; user_data: Pointer);
function  zwp_pointer_gestures_v1_get_user_data(zwp_pointer_gestures_v1: Pzwp_pointer_gestures_v1): Pointer;
function  zwp_pointer_gestures_v1_get_version(zwp_pointer_gestures_v1: Pzwp_pointer_gestures_v1): cuint32;
procedure zwp_pointer_gestures_v1_destroy(zwp_pointer_gestures_v1: Pzwp_pointer_gestures_v1);
procedure zwp_pointer_gesture_swipe_v1_destroy(zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1);
function  zwp_pointer_gesture_swipe_v1_add_listener(zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; listener: Pzwp_pointer_gesture_swipe_v1_listener; data: Pointer): cint;
procedure  zwp_pointer_gesture_swipe_v1_add_listener(zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; AIntf: Izwp_pointer_gesture_swipe_v1Listener);
procedure zwp_pointer_gesture_swipe_v1_set_user_data(zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; user_data: Pointer);
function  zwp_pointer_gesture_swipe_v1_get_user_data(zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1): Pointer;
function  zwp_pointer_gesture_swipe_v1_get_version(zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1): cuint32;
procedure zwp_pointer_gesture_pinch_v1_destroy(zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1);
function  zwp_pointer_gesture_pinch_v1_add_listener(zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; listener: Pzwp_pointer_gesture_pinch_v1_listener; data: Pointer): cint;
procedure  zwp_pointer_gesture_pinch_v1_add_listener(zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; AIntf: Izwp_pointer_gesture_pinch_v1Listener);
procedure zwp_pointer_gesture_pinch_v1_set_user_data(zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; user_data: Pointer);
function  zwp_pointer_gesture_pinch_v1_get_user_data(zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1): Pointer;
function  zwp_pointer_gesture_pinch_v1_get_version(zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1): cuint32;



var
  zwp_pointer_gestures_v1_interface: Twl_interface;
  zwp_pointer_gesture_swipe_v1_interface: Twl_interface;
  zwp_pointer_gesture_pinch_v1_interface: Twl_interface;



implementation

const
_ZWP_POINTER_GESTURES_V1_GET_SWIPE_GESTURE = 0;
_ZWP_POINTER_GESTURES_V1_GET_PINCH_GESTURE = 1;
_ZWP_POINTER_GESTURE_SWIPE_V1_DESTROY = 0;
_ZWP_POINTER_GESTURE_PINCH_V1_DESTROY = 0;


var
  vIntf_zwp_pointer_gestures_v1_Listener: Tzwp_pointer_gestures_v1_listener;
  vIntf_zwp_pointer_gesture_swipe_v1_Listener: Tzwp_pointer_gesture_swipe_v1_listener;
  vIntf_zwp_pointer_gesture_pinch_v1_Listener: Tzwp_pointer_gesture_pinch_v1_listener;



function  zwp_pointer_gestures_v1_get_swipe_gesture(zwp_pointer_gestures_v1: Pzwp_pointer_gestures_v1; pointer: Pwl_pointer): Pzwp_pointer_gesture_swipe_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_pointer_gestures_v1),
      _ZWP_POINTER_GESTURES_V1_GET_SWIPE_GESTURE, @zwp_pointer_gesture_swipe_v1_interface, nil, pointer);
  Result := Pzwp_pointer_gesture_swipe_v1(id);
end;

function  zwp_pointer_gestures_v1_get_pinch_gesture(zwp_pointer_gestures_v1: Pzwp_pointer_gestures_v1; pointer: Pwl_pointer): Pzwp_pointer_gesture_pinch_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_pointer_gestures_v1),
      _ZWP_POINTER_GESTURES_V1_GET_PINCH_GESTURE, @zwp_pointer_gesture_pinch_v1_interface, nil, pointer);
  Result := Pzwp_pointer_gesture_pinch_v1(id);
end;

function  zwp_pointer_gestures_v1_add_listener(zwp_pointer_gestures_v1: Pzwp_pointer_gestures_v1; listener: Pzwp_pointer_gestures_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_pointer_gestures_v1), listener, data);
end;

procedure  zwp_pointer_gestures_v1_add_listener(zwp_pointer_gestures_v1: Pzwp_pointer_gestures_v1; AIntf: Izwp_pointer_gestures_v1Listener);
begin
  zwp_pointer_gestures_v1_add_listener(zwp_pointer_gestures_v1, @vIntf_zwp_pointer_gestures_v1_Listener, AIntf);
end;

procedure zwp_pointer_gestures_v1_set_user_data(zwp_pointer_gestures_v1: Pzwp_pointer_gestures_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_pointer_gestures_v1), user_data);
end;

function  zwp_pointer_gestures_v1_get_user_data(zwp_pointer_gestures_v1: Pzwp_pointer_gestures_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_pointer_gestures_v1));
end;

function  zwp_pointer_gestures_v1_get_version(zwp_pointer_gestures_v1: Pzwp_pointer_gestures_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_pointer_gestures_v1));
end;

procedure zwp_pointer_gestures_v1_destroy(zwp_pointer_gestures_v1: Pzwp_pointer_gestures_v1);
begin
  wl_proxy_destroy(Pwl_proxy(zwp_pointer_gestures_v1));
end;

procedure zwp_pointer_gesture_swipe_v1_destroy(zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_pointer_gesture_swipe_v1), _ZWP_POINTER_GESTURE_SWIPE_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_pointer_gesture_swipe_v1));
end;

function  zwp_pointer_gesture_swipe_v1_add_listener(zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; listener: Pzwp_pointer_gesture_swipe_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_pointer_gesture_swipe_v1), listener, data);
end;

procedure  zwp_pointer_gesture_swipe_v1_add_listener(zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; AIntf: Izwp_pointer_gesture_swipe_v1Listener);
begin
  zwp_pointer_gesture_swipe_v1_add_listener(zwp_pointer_gesture_swipe_v1, @vIntf_zwp_pointer_gesture_swipe_v1_Listener, AIntf);
end;

procedure zwp_pointer_gesture_swipe_v1_set_user_data(zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_pointer_gesture_swipe_v1), user_data);
end;

function  zwp_pointer_gesture_swipe_v1_get_user_data(zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_pointer_gesture_swipe_v1));
end;

function  zwp_pointer_gesture_swipe_v1_get_version(zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_pointer_gesture_swipe_v1));
end;

procedure zwp_pointer_gesture_pinch_v1_destroy(zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_pointer_gesture_pinch_v1), _ZWP_POINTER_GESTURE_PINCH_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_pointer_gesture_pinch_v1));
end;

function  zwp_pointer_gesture_pinch_v1_add_listener(zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; listener: Pzwp_pointer_gesture_pinch_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_pointer_gesture_pinch_v1), listener, data);
end;

procedure  zwp_pointer_gesture_pinch_v1_add_listener(zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; AIntf: Izwp_pointer_gesture_pinch_v1Listener);
begin
  zwp_pointer_gesture_pinch_v1_add_listener(zwp_pointer_gesture_pinch_v1, @vIntf_zwp_pointer_gesture_pinch_v1_Listener, AIntf);
end;

procedure zwp_pointer_gesture_pinch_v1_set_user_data(zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_pointer_gesture_pinch_v1), user_data);
end;

function  zwp_pointer_gesture_pinch_v1_get_user_data(zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_pointer_gesture_pinch_v1));
end;

function  zwp_pointer_gesture_pinch_v1_get_version(zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_pointer_gesture_pinch_v1));
end;


procedure zwp_pointer_gesture_swipe_v1_begin_Intf(AIntf: Izwp_pointer_gesture_swipe_v1Listener; zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; serial: cuint; time: cuint; surface: Pwl_surface; fingers: cuint); cdecl;
begin
  WriteLn('zwp_pointer_gesture_swipe_v1.begin');
  AIntf.zwp_pointer_gesture_swipe_v1_begin(zwp_pointer_gesture_swipe_v1, serial, time, surface, fingers);
end;

procedure zwp_pointer_gesture_swipe_v1_update_Intf(AIntf: Izwp_pointer_gesture_swipe_v1Listener; zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; time: cuint; dx: cint32; dy: cint32); cdecl;
begin
  WriteLn('zwp_pointer_gesture_swipe_v1.update');
  AIntf.zwp_pointer_gesture_swipe_v1_update(zwp_pointer_gesture_swipe_v1, time, dx, dy);
end;

procedure zwp_pointer_gesture_swipe_v1_end_Intf(AIntf: Izwp_pointer_gesture_swipe_v1Listener; zwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; serial: cuint; time: cuint; cancelled: cint); cdecl;
begin
  WriteLn('zwp_pointer_gesture_swipe_v1.end');
  AIntf.zwp_pointer_gesture_swipe_v1_end(zwp_pointer_gesture_swipe_v1, serial, time, cancelled);
end;

procedure zwp_pointer_gesture_pinch_v1_begin_Intf(AIntf: Izwp_pointer_gesture_pinch_v1Listener; zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; serial: cuint; time: cuint; surface: Pwl_surface; fingers: cuint); cdecl;
begin
  WriteLn('zwp_pointer_gesture_pinch_v1.begin');
  AIntf.zwp_pointer_gesture_pinch_v1_begin(zwp_pointer_gesture_pinch_v1, serial, time, surface, fingers);
end;

procedure zwp_pointer_gesture_pinch_v1_update_Intf(AIntf: Izwp_pointer_gesture_pinch_v1Listener; zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; time: cuint; dx: cint32; dy: cint32; scale: cint32; rotation: cint32); cdecl;
begin
  WriteLn('zwp_pointer_gesture_pinch_v1.update');
  AIntf.zwp_pointer_gesture_pinch_v1_update(zwp_pointer_gesture_pinch_v1, time, dx, dy, scale, rotation);
end;

procedure zwp_pointer_gesture_pinch_v1_end_Intf(AIntf: Izwp_pointer_gesture_pinch_v1Listener; zwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; serial: cuint; time: cuint; cancelled: cint); cdecl;
begin
  WriteLn('zwp_pointer_gesture_pinch_v1.end');
  AIntf.zwp_pointer_gesture_pinch_v1_end(zwp_pointer_gesture_pinch_v1, serial, time, cancelled);
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
    (@zwp_pointer_gesture_swipe_v1_interface),
    (@wl_pointer_interface),
    (@zwp_pointer_gesture_pinch_v1_interface),
    (@wl_pointer_interface),
    (nil),
    (nil),
    (@wl_surface_interface),
    (nil),
    (nil),
    (nil),
    (@wl_surface_interface),
    (nil)
  );

  zwp_pointer_gestures_v1_requests: array[0..1] of Twl_message = (
    (name: 'get_swipe_gesture'; signature: 'no'; types: @pInterfaces[8]),
    (name: 'get_pinch_gesture'; signature: 'no'; types: @pInterfaces[10])
  );
  zwp_pointer_gesture_swipe_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_pointer_gesture_swipe_v1_events: array[0..2] of Twl_message = (
    (name: 'begin'; signature: 'uuou'; types: @pInterfaces[12]),
    (name: 'update'; signature: 'uff'; types: @pInterfaces[0]),
    (name: 'end'; signature: 'uui'; types: @pInterfaces[0])
  );
  zwp_pointer_gesture_pinch_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_pointer_gesture_pinch_v1_events: array[0..2] of Twl_message = (
    (name: 'begin'; signature: 'uuou'; types: @pInterfaces[16]),
    (name: 'update'; signature: 'uffff'; types: @pInterfaces[0]),
    (name: 'end'; signature: 'uui'; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_pointer_gesture_swipe_v1_Listener.begin_) := @zwp_pointer_gesture_swipe_v1_begin_Intf;
  Pointer(vIntf_zwp_pointer_gesture_swipe_v1_Listener.update) := @zwp_pointer_gesture_swipe_v1_update_Intf;
  Pointer(vIntf_zwp_pointer_gesture_swipe_v1_Listener.end_) := @zwp_pointer_gesture_swipe_v1_end_Intf;
  Pointer(vIntf_zwp_pointer_gesture_pinch_v1_Listener.begin_) := @zwp_pointer_gesture_pinch_v1_begin_Intf;
  Pointer(vIntf_zwp_pointer_gesture_pinch_v1_Listener.update) := @zwp_pointer_gesture_pinch_v1_update_Intf;
  Pointer(vIntf_zwp_pointer_gesture_pinch_v1_Listener.end_) := @zwp_pointer_gesture_pinch_v1_end_Intf;


  zwp_pointer_gestures_v1_interface.name := 'zwp_pointer_gestures_v1';
  zwp_pointer_gestures_v1_interface.version := 1;
  zwp_pointer_gestures_v1_interface.method_count := 2;
  zwp_pointer_gestures_v1_interface.methods := @zwp_pointer_gestures_v1_requests;
  zwp_pointer_gestures_v1_interface.event_count := 0;
  zwp_pointer_gestures_v1_interface.events := nil;

  zwp_pointer_gesture_swipe_v1_interface.name := 'zwp_pointer_gesture_swipe_v1';
  zwp_pointer_gesture_swipe_v1_interface.version := 1;
  zwp_pointer_gesture_swipe_v1_interface.method_count := 1;
  zwp_pointer_gesture_swipe_v1_interface.methods := @zwp_pointer_gesture_swipe_v1_requests;
  zwp_pointer_gesture_swipe_v1_interface.event_count := 3;
  zwp_pointer_gesture_swipe_v1_interface.events := @zwp_pointer_gesture_swipe_v1_events;

  zwp_pointer_gesture_pinch_v1_interface.name := 'zwp_pointer_gesture_pinch_v1';
  zwp_pointer_gesture_pinch_v1_interface.version := 1;
  zwp_pointer_gesture_pinch_v1_interface.method_count := 1;
  zwp_pointer_gesture_pinch_v1_interface.methods := @zwp_pointer_gesture_pinch_v1_requests;
  zwp_pointer_gesture_pinch_v1_interface.event_count := 3;
  zwp_pointer_gesture_pinch_v1_interface.events := @zwp_pointer_gesture_pinch_v1_events;

end.
