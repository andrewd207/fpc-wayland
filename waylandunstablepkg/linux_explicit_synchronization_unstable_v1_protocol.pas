unit linux_explicit_synchronization_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_linux_explicit_synchronization_v1 = ^Tzwp_linux_explicit_synchronization_v1;
  Tzwp_linux_explicit_synchronization_v1 = record end;
  Pzwp_linux_surface_synchronization_v1 = ^Tzwp_linux_surface_synchronization_v1;
  Tzwp_linux_surface_synchronization_v1 = record end;
  Pzwp_linux_buffer_release_v1 = ^Tzwp_linux_buffer_release_v1;
  Tzwp_linux_buffer_release_v1 = record end;
const
  ZWP_LINUX_EXPLICIT_SYNCHRONIZATION_V1_ERROR_SYNCHRONIZATION_EXISTS = 0; // the surface already has a synchronization object associated

type
  Pzwp_linux_explicit_synchronization_v1_listener = ^Tzwp_linux_explicit_synchronization_v1_listener;
  Tzwp_linux_explicit_synchronization_v1_listener = record
  end;

const
  ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_INVALID_FENCE = 0; // the fence specified by the client could not be imported
  ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_DUPLICATE_FENCE = 1; // multiple fences added for a single surface commit
  ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_DUPLICATE_RELEASE = 2; // multiple releases added for a single surface commit
  ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_NO_SURFACE = 3; // the associated wl_surface was destroyed
  ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_UNSUPPORTED_BUFFER = 4; // the buffer does not support explicit synchronization
  ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_NO_BUFFER = 5; // no buffer was attached

type
  Pzwp_linux_surface_synchronization_v1_listener = ^Tzwp_linux_surface_synchronization_v1_listener;
  Tzwp_linux_surface_synchronization_v1_listener = record
  end;

  Pzwp_linux_buffer_release_v1_listener = ^Tzwp_linux_buffer_release_v1_listener;
  Tzwp_linux_buffer_release_v1_listener = record
    fenced_release : procedure(data: Pointer; zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1; fence: cint); cdecl;
    immediate_release : procedure(data: Pointer; zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1); cdecl;
  end;



  Izwp_linux_explicit_synchronization_v1Listener = interface
  ['Izwp_linux_explicit_synchronization_v1Listener']
  end;

  Izwp_linux_surface_synchronization_v1Listener = interface
  ['Izwp_linux_surface_synchronization_v1Listener']
  end;

  Izwp_linux_buffer_release_v1Listener = interface
  ['Izwp_linux_buffer_release_v1Listener']
    procedure zwp_linux_buffer_release_v1_fenced_release(zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1; fence: cint);
    procedure zwp_linux_buffer_release_v1_immediate_release(zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1);
  end;



procedure zwp_linux_explicit_synchronization_v1_destroy(zwp_linux_explicit_synchronization_v1: Pzwp_linux_explicit_synchronization_v1);
function  zwp_linux_explicit_synchronization_v1_get_synchronization(zwp_linux_explicit_synchronization_v1: Pzwp_linux_explicit_synchronization_v1; surface: Pwl_surface): Pzwp_linux_surface_synchronization_v1;
function  zwp_linux_explicit_synchronization_v1_add_listener(zwp_linux_explicit_synchronization_v1: Pzwp_linux_explicit_synchronization_v1; listener: Pzwp_linux_explicit_synchronization_v1_listener; data: Pointer): cint;
procedure  zwp_linux_explicit_synchronization_v1_add_listener(zwp_linux_explicit_synchronization_v1: Pzwp_linux_explicit_synchronization_v1; AIntf: Izwp_linux_explicit_synchronization_v1Listener);
procedure zwp_linux_explicit_synchronization_v1_set_user_data(zwp_linux_explicit_synchronization_v1: Pzwp_linux_explicit_synchronization_v1; user_data: Pointer);
function  zwp_linux_explicit_synchronization_v1_get_user_data(zwp_linux_explicit_synchronization_v1: Pzwp_linux_explicit_synchronization_v1): Pointer;
function  zwp_linux_explicit_synchronization_v1_get_version(zwp_linux_explicit_synchronization_v1: Pzwp_linux_explicit_synchronization_v1): cuint32;
procedure zwp_linux_surface_synchronization_v1_destroy(zwp_linux_surface_synchronization_v1: Pzwp_linux_surface_synchronization_v1);
procedure zwp_linux_surface_synchronization_v1_set_acquire_fence(zwp_linux_surface_synchronization_v1: Pzwp_linux_surface_synchronization_v1; fd: cint);
function  zwp_linux_surface_synchronization_v1_get_release(zwp_linux_surface_synchronization_v1: Pzwp_linux_surface_synchronization_v1): Pzwp_linux_buffer_release_v1;
function  zwp_linux_surface_synchronization_v1_add_listener(zwp_linux_surface_synchronization_v1: Pzwp_linux_surface_synchronization_v1; listener: Pzwp_linux_surface_synchronization_v1_listener; data: Pointer): cint;
procedure  zwp_linux_surface_synchronization_v1_add_listener(zwp_linux_surface_synchronization_v1: Pzwp_linux_surface_synchronization_v1; AIntf: Izwp_linux_surface_synchronization_v1Listener);
procedure zwp_linux_surface_synchronization_v1_set_user_data(zwp_linux_surface_synchronization_v1: Pzwp_linux_surface_synchronization_v1; user_data: Pointer);
function  zwp_linux_surface_synchronization_v1_get_user_data(zwp_linux_surface_synchronization_v1: Pzwp_linux_surface_synchronization_v1): Pointer;
function  zwp_linux_surface_synchronization_v1_get_version(zwp_linux_surface_synchronization_v1: Pzwp_linux_surface_synchronization_v1): cuint32;
function  zwp_linux_buffer_release_v1_add_listener(zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1; listener: Pzwp_linux_buffer_release_v1_listener; data: Pointer): cint;
procedure  zwp_linux_buffer_release_v1_add_listener(zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1; AIntf: Izwp_linux_buffer_release_v1Listener);
procedure zwp_linux_buffer_release_v1_set_user_data(zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1; user_data: Pointer);
function  zwp_linux_buffer_release_v1_get_user_data(zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1): Pointer;
function  zwp_linux_buffer_release_v1_get_version(zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1): cuint32;
procedure zwp_linux_buffer_release_v1_destroy(zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1);



var
  zwp_linux_explicit_synchronization_v1_interface: Twl_interface;
  zwp_linux_surface_synchronization_v1_interface: Twl_interface;
  zwp_linux_buffer_release_v1_interface: Twl_interface;



implementation

const
_ZWP_LINUX_EXPLICIT_SYNCHRONIZATION_V1_DESTROY = 0;
_ZWP_LINUX_EXPLICIT_SYNCHRONIZATION_V1_GET_SYNCHRONIZATION = 1;
_ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_DESTROY = 0;
_ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_SET_ACQUIRE_FENCE = 1;
_ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_GET_RELEASE = 2;


var
  vIntf_zwp_linux_explicit_synchronization_v1_Listener: Tzwp_linux_explicit_synchronization_v1_listener;
  vIntf_zwp_linux_surface_synchronization_v1_Listener: Tzwp_linux_surface_synchronization_v1_listener;
  vIntf_zwp_linux_buffer_release_v1_Listener: Tzwp_linux_buffer_release_v1_listener;



procedure zwp_linux_explicit_synchronization_v1_destroy(zwp_linux_explicit_synchronization_v1: Pzwp_linux_explicit_synchronization_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_linux_explicit_synchronization_v1), _ZWP_LINUX_EXPLICIT_SYNCHRONIZATION_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_linux_explicit_synchronization_v1));
end;

function  zwp_linux_explicit_synchronization_v1_get_synchronization(zwp_linux_explicit_synchronization_v1: Pzwp_linux_explicit_synchronization_v1; surface: Pwl_surface): Pzwp_linux_surface_synchronization_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_linux_explicit_synchronization_v1),
      _ZWP_LINUX_EXPLICIT_SYNCHRONIZATION_V1_GET_SYNCHRONIZATION, @zwp_linux_surface_synchronization_v1_interface, nil, surface);
  Result := Pzwp_linux_surface_synchronization_v1(id);
end;

function  zwp_linux_explicit_synchronization_v1_add_listener(zwp_linux_explicit_synchronization_v1: Pzwp_linux_explicit_synchronization_v1; listener: Pzwp_linux_explicit_synchronization_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_linux_explicit_synchronization_v1), listener, data);
end;

procedure  zwp_linux_explicit_synchronization_v1_add_listener(zwp_linux_explicit_synchronization_v1: Pzwp_linux_explicit_synchronization_v1; AIntf: Izwp_linux_explicit_synchronization_v1Listener);
begin
  zwp_linux_explicit_synchronization_v1_add_listener(zwp_linux_explicit_synchronization_v1, @vIntf_zwp_linux_explicit_synchronization_v1_Listener, AIntf);
end;

procedure zwp_linux_explicit_synchronization_v1_set_user_data(zwp_linux_explicit_synchronization_v1: Pzwp_linux_explicit_synchronization_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_linux_explicit_synchronization_v1), user_data);
end;

function  zwp_linux_explicit_synchronization_v1_get_user_data(zwp_linux_explicit_synchronization_v1: Pzwp_linux_explicit_synchronization_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_linux_explicit_synchronization_v1));
end;

function  zwp_linux_explicit_synchronization_v1_get_version(zwp_linux_explicit_synchronization_v1: Pzwp_linux_explicit_synchronization_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_linux_explicit_synchronization_v1));
end;

procedure zwp_linux_surface_synchronization_v1_destroy(zwp_linux_surface_synchronization_v1: Pzwp_linux_surface_synchronization_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_linux_surface_synchronization_v1), _ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_linux_surface_synchronization_v1));
end;

procedure zwp_linux_surface_synchronization_v1_set_acquire_fence(zwp_linux_surface_synchronization_v1: Pzwp_linux_surface_synchronization_v1; fd: cint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_linux_surface_synchronization_v1),
      _ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_SET_ACQUIRE_FENCE, fd);
end;

function  zwp_linux_surface_synchronization_v1_get_release(zwp_linux_surface_synchronization_v1: Pzwp_linux_surface_synchronization_v1): Pzwp_linux_buffer_release_v1;
var
  release: Pwl_proxy;
begin
  release := wl_proxy_marshal_constructor(Pwl_proxy(zwp_linux_surface_synchronization_v1),
      _ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_GET_RELEASE, @zwp_linux_buffer_release_v1_interface, nil);
  Result := Pzwp_linux_buffer_release_v1(release);
end;

function  zwp_linux_surface_synchronization_v1_add_listener(zwp_linux_surface_synchronization_v1: Pzwp_linux_surface_synchronization_v1; listener: Pzwp_linux_surface_synchronization_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_linux_surface_synchronization_v1), listener, data);
end;

procedure  zwp_linux_surface_synchronization_v1_add_listener(zwp_linux_surface_synchronization_v1: Pzwp_linux_surface_synchronization_v1; AIntf: Izwp_linux_surface_synchronization_v1Listener);
begin
  zwp_linux_surface_synchronization_v1_add_listener(zwp_linux_surface_synchronization_v1, @vIntf_zwp_linux_surface_synchronization_v1_Listener, AIntf);
end;

procedure zwp_linux_surface_synchronization_v1_set_user_data(zwp_linux_surface_synchronization_v1: Pzwp_linux_surface_synchronization_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_linux_surface_synchronization_v1), user_data);
end;

function  zwp_linux_surface_synchronization_v1_get_user_data(zwp_linux_surface_synchronization_v1: Pzwp_linux_surface_synchronization_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_linux_surface_synchronization_v1));
end;

function  zwp_linux_surface_synchronization_v1_get_version(zwp_linux_surface_synchronization_v1: Pzwp_linux_surface_synchronization_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_linux_surface_synchronization_v1));
end;

function  zwp_linux_buffer_release_v1_add_listener(zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1; listener: Pzwp_linux_buffer_release_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_linux_buffer_release_v1), listener, data);
end;

procedure  zwp_linux_buffer_release_v1_add_listener(zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1; AIntf: Izwp_linux_buffer_release_v1Listener);
begin
  zwp_linux_buffer_release_v1_add_listener(zwp_linux_buffer_release_v1, @vIntf_zwp_linux_buffer_release_v1_Listener, AIntf);
end;

procedure zwp_linux_buffer_release_v1_set_user_data(zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_linux_buffer_release_v1), user_data);
end;

function  zwp_linux_buffer_release_v1_get_user_data(zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_linux_buffer_release_v1));
end;

function  zwp_linux_buffer_release_v1_get_version(zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_linux_buffer_release_v1));
end;

procedure zwp_linux_buffer_release_v1_destroy(zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1);
begin
  wl_proxy_destroy(Pwl_proxy(zwp_linux_buffer_release_v1));
end;


procedure zwp_linux_buffer_release_v1_fenced_release_Intf(AIntf: Izwp_linux_buffer_release_v1Listener; zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1; fence: cint); cdecl;
begin
  WriteLn('zwp_linux_buffer_release_v1.fenced_release');
  AIntf.zwp_linux_buffer_release_v1_fenced_release(zwp_linux_buffer_release_v1, fence);
end;

procedure zwp_linux_buffer_release_v1_immediate_release_Intf(AIntf: Izwp_linux_buffer_release_v1Listener; zwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1); cdecl;
begin
  WriteLn('zwp_linux_buffer_release_v1.immediate_release');
  AIntf.zwp_linux_buffer_release_v1_immediate_release(zwp_linux_buffer_release_v1);
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
    (@zwp_linux_surface_synchronization_v1_interface),
    (@wl_surface_interface),
    (@zwp_linux_buffer_release_v1_interface)
  );

  zwp_linux_explicit_synchronization_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_synchronization'; signature: 'no'; types: @pInterfaces[8])
  );
  zwp_linux_surface_synchronization_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_acquire_fence'; signature: 'h'; types: @pInterfaces[0]),
    (name: 'get_release'; signature: 'n'; types: @pInterfaces[10])
  );
  zwp_linux_buffer_release_v1_events: array[0..1] of Twl_message = (
    (name: 'fenced_release'; signature: 'h'; types: @pInterfaces[0]),
    (name: 'immediate_release'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_linux_buffer_release_v1_Listener.fenced_release) := @zwp_linux_buffer_release_v1_fenced_release_Intf;
  Pointer(vIntf_zwp_linux_buffer_release_v1_Listener.immediate_release) := @zwp_linux_buffer_release_v1_immediate_release_Intf;


  zwp_linux_explicit_synchronization_v1_interface.name := 'zwp_linux_explicit_synchronization_v1';
  zwp_linux_explicit_synchronization_v1_interface.version := 2;
  zwp_linux_explicit_synchronization_v1_interface.method_count := 2;
  zwp_linux_explicit_synchronization_v1_interface.methods := @zwp_linux_explicit_synchronization_v1_requests;
  zwp_linux_explicit_synchronization_v1_interface.event_count := 0;
  zwp_linux_explicit_synchronization_v1_interface.events := nil;

  zwp_linux_surface_synchronization_v1_interface.name := 'zwp_linux_surface_synchronization_v1';
  zwp_linux_surface_synchronization_v1_interface.version := 2;
  zwp_linux_surface_synchronization_v1_interface.method_count := 3;
  zwp_linux_surface_synchronization_v1_interface.methods := @zwp_linux_surface_synchronization_v1_requests;
  zwp_linux_surface_synchronization_v1_interface.event_count := 0;
  zwp_linux_surface_synchronization_v1_interface.events := nil;

  zwp_linux_buffer_release_v1_interface.name := 'zwp_linux_buffer_release_v1';
  zwp_linux_buffer_release_v1_interface.version := 1;
  zwp_linux_buffer_release_v1_interface.method_count := 0;
  zwp_linux_buffer_release_v1_interface.methods := nil;
  zwp_linux_buffer_release_v1_interface.event_count := 2;
  zwp_linux_buffer_release_v1_interface.events := @zwp_linux_buffer_release_v1_events;

end.
