unit idle_inhibit_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_idle_inhibit_manager_v1 = ^Tzwp_idle_inhibit_manager_v1;
  Tzwp_idle_inhibit_manager_v1 = record end;
  Pzwp_idle_inhibitor_v1 = ^Tzwp_idle_inhibitor_v1;
  Tzwp_idle_inhibitor_v1 = record end;
  Pzwp_idle_inhibit_manager_v1_listener = ^Tzwp_idle_inhibit_manager_v1_listener;
  Tzwp_idle_inhibit_manager_v1_listener = record
  end;

  Pzwp_idle_inhibitor_v1_listener = ^Tzwp_idle_inhibitor_v1_listener;
  Tzwp_idle_inhibitor_v1_listener = record
  end;



  Izwp_idle_inhibit_manager_v1Listener = interface
  ['Izwp_idle_inhibit_manager_v1Listener']
  end;

  Izwp_idle_inhibitor_v1Listener = interface
  ['Izwp_idle_inhibitor_v1Listener']
  end;



procedure zwp_idle_inhibit_manager_v1_destroy(zwp_idle_inhibit_manager_v1: Pzwp_idle_inhibit_manager_v1);
function  zwp_idle_inhibit_manager_v1_create_inhibitor(zwp_idle_inhibit_manager_v1: Pzwp_idle_inhibit_manager_v1; surface: Pwl_surface): Pzwp_idle_inhibitor_v1;
function  zwp_idle_inhibit_manager_v1_add_listener(zwp_idle_inhibit_manager_v1: Pzwp_idle_inhibit_manager_v1; listener: Pzwp_idle_inhibit_manager_v1_listener; data: Pointer): cint;
procedure  zwp_idle_inhibit_manager_v1_add_listener(zwp_idle_inhibit_manager_v1: Pzwp_idle_inhibit_manager_v1; AIntf: Izwp_idle_inhibit_manager_v1Listener);
procedure zwp_idle_inhibit_manager_v1_set_user_data(zwp_idle_inhibit_manager_v1: Pzwp_idle_inhibit_manager_v1; user_data: Pointer);
function  zwp_idle_inhibit_manager_v1_get_user_data(zwp_idle_inhibit_manager_v1: Pzwp_idle_inhibit_manager_v1): Pointer;
function  zwp_idle_inhibit_manager_v1_get_version(zwp_idle_inhibit_manager_v1: Pzwp_idle_inhibit_manager_v1): cuint32;
procedure zwp_idle_inhibitor_v1_destroy(zwp_idle_inhibitor_v1: Pzwp_idle_inhibitor_v1);
function  zwp_idle_inhibitor_v1_add_listener(zwp_idle_inhibitor_v1: Pzwp_idle_inhibitor_v1; listener: Pzwp_idle_inhibitor_v1_listener; data: Pointer): cint;
procedure  zwp_idle_inhibitor_v1_add_listener(zwp_idle_inhibitor_v1: Pzwp_idle_inhibitor_v1; AIntf: Izwp_idle_inhibitor_v1Listener);
procedure zwp_idle_inhibitor_v1_set_user_data(zwp_idle_inhibitor_v1: Pzwp_idle_inhibitor_v1; user_data: Pointer);
function  zwp_idle_inhibitor_v1_get_user_data(zwp_idle_inhibitor_v1: Pzwp_idle_inhibitor_v1): Pointer;
function  zwp_idle_inhibitor_v1_get_version(zwp_idle_inhibitor_v1: Pzwp_idle_inhibitor_v1): cuint32;



var
  zwp_idle_inhibit_manager_v1_interface: Twl_interface;
  zwp_idle_inhibitor_v1_interface: Twl_interface;



implementation

const
_ZWP_IDLE_INHIBIT_MANAGER_V1_DESTROY = 0;
_ZWP_IDLE_INHIBIT_MANAGER_V1_CREATE_INHIBITOR = 1;
_ZWP_IDLE_INHIBITOR_V1_DESTROY = 0;


var
  vIntf_zwp_idle_inhibit_manager_v1_Listener: Tzwp_idle_inhibit_manager_v1_listener;
  vIntf_zwp_idle_inhibitor_v1_Listener: Tzwp_idle_inhibitor_v1_listener;



procedure zwp_idle_inhibit_manager_v1_destroy(zwp_idle_inhibit_manager_v1: Pzwp_idle_inhibit_manager_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_idle_inhibit_manager_v1), _ZWP_IDLE_INHIBIT_MANAGER_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_idle_inhibit_manager_v1));
end;

function  zwp_idle_inhibit_manager_v1_create_inhibitor(zwp_idle_inhibit_manager_v1: Pzwp_idle_inhibit_manager_v1; surface: Pwl_surface): Pzwp_idle_inhibitor_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_idle_inhibit_manager_v1),
      _ZWP_IDLE_INHIBIT_MANAGER_V1_CREATE_INHIBITOR, @zwp_idle_inhibitor_v1_interface, nil, surface);
  Result := Pzwp_idle_inhibitor_v1(id);
end;

function  zwp_idle_inhibit_manager_v1_add_listener(zwp_idle_inhibit_manager_v1: Pzwp_idle_inhibit_manager_v1; listener: Pzwp_idle_inhibit_manager_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_idle_inhibit_manager_v1), listener, data);
end;

procedure  zwp_idle_inhibit_manager_v1_add_listener(zwp_idle_inhibit_manager_v1: Pzwp_idle_inhibit_manager_v1; AIntf: Izwp_idle_inhibit_manager_v1Listener);
begin
  zwp_idle_inhibit_manager_v1_add_listener(zwp_idle_inhibit_manager_v1, @vIntf_zwp_idle_inhibit_manager_v1_Listener, AIntf);
end;

procedure zwp_idle_inhibit_manager_v1_set_user_data(zwp_idle_inhibit_manager_v1: Pzwp_idle_inhibit_manager_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_idle_inhibit_manager_v1), user_data);
end;

function  zwp_idle_inhibit_manager_v1_get_user_data(zwp_idle_inhibit_manager_v1: Pzwp_idle_inhibit_manager_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_idle_inhibit_manager_v1));
end;

function  zwp_idle_inhibit_manager_v1_get_version(zwp_idle_inhibit_manager_v1: Pzwp_idle_inhibit_manager_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_idle_inhibit_manager_v1));
end;

procedure zwp_idle_inhibitor_v1_destroy(zwp_idle_inhibitor_v1: Pzwp_idle_inhibitor_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_idle_inhibitor_v1), _ZWP_IDLE_INHIBITOR_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_idle_inhibitor_v1));
end;

function  zwp_idle_inhibitor_v1_add_listener(zwp_idle_inhibitor_v1: Pzwp_idle_inhibitor_v1; listener: Pzwp_idle_inhibitor_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_idle_inhibitor_v1), listener, data);
end;

procedure  zwp_idle_inhibitor_v1_add_listener(zwp_idle_inhibitor_v1: Pzwp_idle_inhibitor_v1; AIntf: Izwp_idle_inhibitor_v1Listener);
begin
  zwp_idle_inhibitor_v1_add_listener(zwp_idle_inhibitor_v1, @vIntf_zwp_idle_inhibitor_v1_Listener, AIntf);
end;

procedure zwp_idle_inhibitor_v1_set_user_data(zwp_idle_inhibitor_v1: Pzwp_idle_inhibitor_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_idle_inhibitor_v1), user_data);
end;

function  zwp_idle_inhibitor_v1_get_user_data(zwp_idle_inhibitor_v1: Pzwp_idle_inhibitor_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_idle_inhibitor_v1));
end;

function  zwp_idle_inhibitor_v1_get_version(zwp_idle_inhibitor_v1: Pzwp_idle_inhibitor_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_idle_inhibitor_v1));
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
    (@zwp_idle_inhibitor_v1_interface),
    (@wl_surface_interface)
  );

  zwp_idle_inhibit_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'create_inhibitor'; signature: 'no'; types: @pInterfaces[8])
  );
  zwp_idle_inhibitor_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );

initialization


  zwp_idle_inhibit_manager_v1_interface.name := 'zwp_idle_inhibit_manager_v1';
  zwp_idle_inhibit_manager_v1_interface.version := 1;
  zwp_idle_inhibit_manager_v1_interface.method_count := 2;
  zwp_idle_inhibit_manager_v1_interface.methods := @zwp_idle_inhibit_manager_v1_requests;
  zwp_idle_inhibit_manager_v1_interface.event_count := 0;
  zwp_idle_inhibit_manager_v1_interface.events := nil;

  zwp_idle_inhibitor_v1_interface.name := 'zwp_idle_inhibitor_v1';
  zwp_idle_inhibitor_v1_interface.version := 1;
  zwp_idle_inhibitor_v1_interface.method_count := 1;
  zwp_idle_inhibitor_v1_interface.methods := @zwp_idle_inhibitor_v1_requests;
  zwp_idle_inhibitor_v1_interface.event_count := 0;
  zwp_idle_inhibitor_v1_interface.events := nil;

end.
