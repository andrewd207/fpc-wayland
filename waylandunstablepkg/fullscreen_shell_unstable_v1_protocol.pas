unit fullscreen_shell_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_fullscreen_shell_v1 = ^Tzwp_fullscreen_shell_v1;
  Tzwp_fullscreen_shell_v1 = record end;
  Pzwp_fullscreen_shell_mode_feedback_v1 = ^Tzwp_fullscreen_shell_mode_feedback_v1;
  Tzwp_fullscreen_shell_mode_feedback_v1 = record end;
const
  ZWP_FULLSCREEN_SHELL_V1_CAPABILITY_ARBITRARY_MODES = 1; // compositor is capable of almost any output mode
  ZWP_FULLSCREEN_SHELL_V1_CAPABILITY_CURSOR_PLANE = 2; // compositor has a separate cursor plane
  ZWP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_DEFAULT = 0; // no preference, apply default policy
  ZWP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_CENTER = 1; // center the surface on the output
  ZWP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_ZOOM = 2; // scale the surface, preserving aspect ratio, to the largest size that will fit on the output
  ZWP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_ZOOM_CROP = 3; // scale the surface, preserving aspect ratio, to fully fill the output cropping if needed
  ZWP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_STRETCH = 4; // scale the surface to the size of the output ignoring aspect ratio
  ZWP_FULLSCREEN_SHELL_V1_ERROR_INVALID_METHOD = 0; // present_method is not known

type
  Pzwp_fullscreen_shell_v1_listener = ^Tzwp_fullscreen_shell_v1_listener;
  Tzwp_fullscreen_shell_v1_listener = record
    capability : procedure(data: Pointer; zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1; capability: cuint); cdecl;
  end;

  Pzwp_fullscreen_shell_mode_feedback_v1_listener = ^Tzwp_fullscreen_shell_mode_feedback_v1_listener;
  Tzwp_fullscreen_shell_mode_feedback_v1_listener = record
    mode_successful : procedure(data: Pointer; zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1); cdecl;
    mode_failed : procedure(data: Pointer; zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1); cdecl;
    present_cancelled : procedure(data: Pointer; zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1); cdecl;
  end;



  Izwp_fullscreen_shell_v1Listener = interface
  ['Izwp_fullscreen_shell_v1Listener']
    procedure zwp_fullscreen_shell_v1_capability(zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1; capability: cuint);
  end;

  Izwp_fullscreen_shell_mode_feedback_v1Listener = interface
  ['Izwp_fullscreen_shell_mode_feedback_v1Listener']
    procedure zwp_fullscreen_shell_mode_feedback_v1_mode_successful(zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1);
    procedure zwp_fullscreen_shell_mode_feedback_v1_mode_failed(zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1);
    procedure zwp_fullscreen_shell_mode_feedback_v1_present_cancelled(zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1);
  end;



procedure zwp_fullscreen_shell_v1_release(zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1);
procedure zwp_fullscreen_shell_v1_present_surface(zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1; surface: Pwl_surface; method: cuint; output: Pwl_output);
function  zwp_fullscreen_shell_v1_present_surface_for_mode(zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1; surface: Pwl_surface; output: Pwl_output; framerate: cint): Pzwp_fullscreen_shell_mode_feedback_v1;
function  zwp_fullscreen_shell_v1_add_listener(zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1; listener: Pzwp_fullscreen_shell_v1_listener; data: Pointer): cint;
procedure  zwp_fullscreen_shell_v1_add_listener(zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1; AIntf: Izwp_fullscreen_shell_v1Listener);
procedure zwp_fullscreen_shell_v1_set_user_data(zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1; user_data: Pointer);
function  zwp_fullscreen_shell_v1_get_user_data(zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1): Pointer;
function  zwp_fullscreen_shell_v1_get_version(zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1): cuint32;
function  zwp_fullscreen_shell_mode_feedback_v1_add_listener(zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1; listener: Pzwp_fullscreen_shell_mode_feedback_v1_listener; data: Pointer): cint;
procedure  zwp_fullscreen_shell_mode_feedback_v1_add_listener(zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1; AIntf: Izwp_fullscreen_shell_mode_feedback_v1Listener);
procedure zwp_fullscreen_shell_mode_feedback_v1_set_user_data(zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1; user_data: Pointer);
function  zwp_fullscreen_shell_mode_feedback_v1_get_user_data(zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1): Pointer;
function  zwp_fullscreen_shell_mode_feedback_v1_get_version(zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1): cuint32;
procedure zwp_fullscreen_shell_mode_feedback_v1_destroy(zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1);



var
  zwp_fullscreen_shell_v1_interface: Twl_interface;
  zwp_fullscreen_shell_mode_feedback_v1_interface: Twl_interface;



implementation

const
_ZWP_FULLSCREEN_SHELL_V1_RELEASE = 0;
_ZWP_FULLSCREEN_SHELL_V1_PRESENT_SURFACE = 1;
_ZWP_FULLSCREEN_SHELL_V1_PRESENT_SURFACE_FOR_MODE = 2;


var
  vIntf_zwp_fullscreen_shell_v1_Listener: Tzwp_fullscreen_shell_v1_listener;
  vIntf_zwp_fullscreen_shell_mode_feedback_v1_Listener: Tzwp_fullscreen_shell_mode_feedback_v1_listener;



procedure zwp_fullscreen_shell_v1_release(zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_fullscreen_shell_v1), _ZWP_FULLSCREEN_SHELL_V1_RELEASE);
  wl_proxy_destroy(Pwl_proxy(zwp_fullscreen_shell_v1));
end;

procedure zwp_fullscreen_shell_v1_present_surface(zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1; surface: Pwl_surface; method: cuint; output: Pwl_output);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_fullscreen_shell_v1),
      _ZWP_FULLSCREEN_SHELL_V1_PRESENT_SURFACE, surface, method, output);
end;

function  zwp_fullscreen_shell_v1_present_surface_for_mode(zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1; surface: Pwl_surface; output: Pwl_output; framerate: cint): Pzwp_fullscreen_shell_mode_feedback_v1;
var
  feedback: Pwl_proxy;
begin
  feedback := wl_proxy_marshal_constructor(Pwl_proxy(zwp_fullscreen_shell_v1),
      _ZWP_FULLSCREEN_SHELL_V1_PRESENT_SURFACE_FOR_MODE, @zwp_fullscreen_shell_mode_feedback_v1_interface, nil, surface, output, framerate);
  Result := Pzwp_fullscreen_shell_mode_feedback_v1(feedback);
end;

function  zwp_fullscreen_shell_v1_add_listener(zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1; listener: Pzwp_fullscreen_shell_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_fullscreen_shell_v1), listener, data);
end;

procedure  zwp_fullscreen_shell_v1_add_listener(zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1; AIntf: Izwp_fullscreen_shell_v1Listener);
begin
  zwp_fullscreen_shell_v1_add_listener(zwp_fullscreen_shell_v1, @vIntf_zwp_fullscreen_shell_v1_Listener, AIntf);
end;

procedure zwp_fullscreen_shell_v1_set_user_data(zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_fullscreen_shell_v1), user_data);
end;

function  zwp_fullscreen_shell_v1_get_user_data(zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_fullscreen_shell_v1));
end;

function  zwp_fullscreen_shell_v1_get_version(zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_fullscreen_shell_v1));
end;

function  zwp_fullscreen_shell_mode_feedback_v1_add_listener(zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1; listener: Pzwp_fullscreen_shell_mode_feedback_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_fullscreen_shell_mode_feedback_v1), listener, data);
end;

procedure  zwp_fullscreen_shell_mode_feedback_v1_add_listener(zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1; AIntf: Izwp_fullscreen_shell_mode_feedback_v1Listener);
begin
  zwp_fullscreen_shell_mode_feedback_v1_add_listener(zwp_fullscreen_shell_mode_feedback_v1, @vIntf_zwp_fullscreen_shell_mode_feedback_v1_Listener, AIntf);
end;

procedure zwp_fullscreen_shell_mode_feedback_v1_set_user_data(zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_fullscreen_shell_mode_feedback_v1), user_data);
end;

function  zwp_fullscreen_shell_mode_feedback_v1_get_user_data(zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_fullscreen_shell_mode_feedback_v1));
end;

function  zwp_fullscreen_shell_mode_feedback_v1_get_version(zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_fullscreen_shell_mode_feedback_v1));
end;

procedure zwp_fullscreen_shell_mode_feedback_v1_destroy(zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1);
begin
  wl_proxy_destroy(Pwl_proxy(zwp_fullscreen_shell_mode_feedback_v1));
end;


procedure zwp_fullscreen_shell_v1_capability_Intf(AIntf: Izwp_fullscreen_shell_v1Listener; zwp_fullscreen_shell_v1: Pzwp_fullscreen_shell_v1; capability: cuint); cdecl;
begin
  WriteLn('zwp_fullscreen_shell_v1.capability');
  AIntf.zwp_fullscreen_shell_v1_capability(zwp_fullscreen_shell_v1, capability);
end;

procedure zwp_fullscreen_shell_mode_feedback_v1_mode_successful_Intf(AIntf: Izwp_fullscreen_shell_mode_feedback_v1Listener; zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1); cdecl;
begin
  WriteLn('zwp_fullscreen_shell_mode_feedback_v1.mode_successful');
  AIntf.zwp_fullscreen_shell_mode_feedback_v1_mode_successful(zwp_fullscreen_shell_mode_feedback_v1);
end;

procedure zwp_fullscreen_shell_mode_feedback_v1_mode_failed_Intf(AIntf: Izwp_fullscreen_shell_mode_feedback_v1Listener; zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1); cdecl;
begin
  WriteLn('zwp_fullscreen_shell_mode_feedback_v1.mode_failed');
  AIntf.zwp_fullscreen_shell_mode_feedback_v1_mode_failed(zwp_fullscreen_shell_mode_feedback_v1);
end;

procedure zwp_fullscreen_shell_mode_feedback_v1_present_cancelled_Intf(AIntf: Izwp_fullscreen_shell_mode_feedback_v1Listener; zwp_fullscreen_shell_mode_feedback_v1: Pzwp_fullscreen_shell_mode_feedback_v1); cdecl;
begin
  WriteLn('zwp_fullscreen_shell_mode_feedback_v1.present_cancelled');
  AIntf.zwp_fullscreen_shell_mode_feedback_v1_present_cancelled(zwp_fullscreen_shell_mode_feedback_v1);
end;



const
  pInterfaces: array[0..14] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wl_surface_interface),
    (nil),
    (@wl_output_interface),
    (@wl_surface_interface),
    (@wl_output_interface),
    (nil),
    (@zwp_fullscreen_shell_mode_feedback_v1_interface)
  );

  zwp_fullscreen_shell_v1_requests: array[0..2] of Twl_message = (
    (name: 'release'; signature: ''; types: @pInterfaces[0]),
    (name: 'present_surface'; signature: '?ou?o'; types: @pInterfaces[8]),
    (name: 'present_surface_for_mode'; signature: 'ooin'; types: @pInterfaces[11])
  );
  zwp_fullscreen_shell_v1_events: array[0..0] of Twl_message = (
    (name: 'capability'; signature: 'u'; types: @pInterfaces[0])
  );
  zwp_fullscreen_shell_mode_feedback_v1_events: array[0..2] of Twl_message = (
    (name: 'mode_successful'; signature: ''; types: @pInterfaces[0]),
    (name: 'mode_failed'; signature: ''; types: @pInterfaces[0]),
    (name: 'present_cancelled'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_fullscreen_shell_v1_Listener.capability) := @zwp_fullscreen_shell_v1_capability_Intf;
  Pointer(vIntf_zwp_fullscreen_shell_mode_feedback_v1_Listener.mode_successful) := @zwp_fullscreen_shell_mode_feedback_v1_mode_successful_Intf;
  Pointer(vIntf_zwp_fullscreen_shell_mode_feedback_v1_Listener.mode_failed) := @zwp_fullscreen_shell_mode_feedback_v1_mode_failed_Intf;
  Pointer(vIntf_zwp_fullscreen_shell_mode_feedback_v1_Listener.present_cancelled) := @zwp_fullscreen_shell_mode_feedback_v1_present_cancelled_Intf;


  zwp_fullscreen_shell_v1_interface.name := 'zwp_fullscreen_shell_v1';
  zwp_fullscreen_shell_v1_interface.version := 1;
  zwp_fullscreen_shell_v1_interface.method_count := 3;
  zwp_fullscreen_shell_v1_interface.methods := @zwp_fullscreen_shell_v1_requests;
  zwp_fullscreen_shell_v1_interface.event_count := 1;
  zwp_fullscreen_shell_v1_interface.events := @zwp_fullscreen_shell_v1_events;

  zwp_fullscreen_shell_mode_feedback_v1_interface.name := 'zwp_fullscreen_shell_mode_feedback_v1';
  zwp_fullscreen_shell_mode_feedback_v1_interface.version := 1;
  zwp_fullscreen_shell_mode_feedback_v1_interface.method_count := 0;
  zwp_fullscreen_shell_mode_feedback_v1_interface.methods := nil;
  zwp_fullscreen_shell_mode_feedback_v1_interface.event_count := 3;
  zwp_fullscreen_shell_mode_feedback_v1_interface.events := @zwp_fullscreen_shell_mode_feedback_v1_events;

end.
