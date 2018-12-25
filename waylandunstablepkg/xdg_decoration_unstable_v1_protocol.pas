unit xdg_decoration_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol, xdg_shell_unstable_v6_protocol;


type
  Pzxdg_decoration_manager_v1 = ^Tzxdg_decoration_manager_v1;
  Tzxdg_decoration_manager_v1 = record end;
  Pzxdg_toplevel_decoration_v1 = ^Tzxdg_toplevel_decoration_v1;
  Tzxdg_toplevel_decoration_v1 = record end;
  Pzxdg_decoration_manager_v1_listener = ^Tzxdg_decoration_manager_v1_listener;
  Tzxdg_decoration_manager_v1_listener = record
  end;

const
  ZXDG_TOPLEVEL_DECORATION_V1_ERROR_UNCONFIGURED_BUFFER = 0; // xdg_toplevel has a buffer attached before configure
  ZXDG_TOPLEVEL_DECORATION_V1_ERROR_ALREADY_CONSTRUCTED = 1; // xdg_toplevel already has a decoration object
  ZXDG_TOPLEVEL_DECORATION_V1_ERROR_ORPHANED = 2; // xdg_toplevel destroyed before the decoration object
  ZXDG_TOPLEVEL_DECORATION_V1_MODE_CLIENT_SIDE = 1; // no server-side window decoration
  ZXDG_TOPLEVEL_DECORATION_V1_MODE_SERVER_SIDE = 2; // server-side window decoration

type
  Pzxdg_toplevel_decoration_v1_listener = ^Tzxdg_toplevel_decoration_v1_listener;
  Tzxdg_toplevel_decoration_v1_listener = record
    configure : procedure(data: Pointer; zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1; mode: cuint); cdecl;
  end;



  Izxdg_decoration_manager_v1Listener = interface
  ['Izxdg_decoration_manager_v1Listener']
  end;

  Izxdg_toplevel_decoration_v1Listener = interface
  ['Izxdg_toplevel_decoration_v1Listener']
    procedure zxdg_toplevel_decoration_v1_configure(zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1; mode: cuint);
  end;



procedure zxdg_decoration_manager_v1_destroy(zxdg_decoration_manager_v1: Pzxdg_decoration_manager_v1);
function  zxdg_decoration_manager_v1_get_toplevel_decoration(zxdg_decoration_manager_v1: Pzxdg_decoration_manager_v1; toplevel: Pzxdg_toplevel_v6): Pzxdg_toplevel_decoration_v1;
function  zxdg_decoration_manager_v1_add_listener(zxdg_decoration_manager_v1: Pzxdg_decoration_manager_v1; listener: Pzxdg_decoration_manager_v1_listener; data: Pointer): cint;
procedure  zxdg_decoration_manager_v1_add_listener(zxdg_decoration_manager_v1: Pzxdg_decoration_manager_v1; AIntf: Izxdg_decoration_manager_v1Listener);
procedure zxdg_decoration_manager_v1_set_user_data(zxdg_decoration_manager_v1: Pzxdg_decoration_manager_v1; user_data: Pointer);
function  zxdg_decoration_manager_v1_get_user_data(zxdg_decoration_manager_v1: Pzxdg_decoration_manager_v1): Pointer;
function  zxdg_decoration_manager_v1_get_version(zxdg_decoration_manager_v1: Pzxdg_decoration_manager_v1): cuint32;
procedure zxdg_toplevel_decoration_v1_destroy(zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1);
procedure zxdg_toplevel_decoration_v1_set_mode(zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1; mode: cuint);
procedure zxdg_toplevel_decoration_v1_unset_mode(zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1);
function  zxdg_toplevel_decoration_v1_add_listener(zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1; listener: Pzxdg_toplevel_decoration_v1_listener; data: Pointer): cint;
procedure  zxdg_toplevel_decoration_v1_add_listener(zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1; AIntf: Izxdg_toplevel_decoration_v1Listener);
procedure zxdg_toplevel_decoration_v1_set_user_data(zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1; user_data: Pointer);
function  zxdg_toplevel_decoration_v1_get_user_data(zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1): Pointer;
function  zxdg_toplevel_decoration_v1_get_version(zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1): cuint32;



var
  zxdg_decoration_manager_v1_interface: Twl_interface;
  zxdg_toplevel_decoration_v1_interface: Twl_interface;



implementation

const
_ZXDG_DECORATION_MANAGER_V1_DESTROY = 0;
_ZXDG_DECORATION_MANAGER_V1_GET_TOPLEVEL_DECORATION = 1;
_ZXDG_TOPLEVEL_DECORATION_V1_DESTROY = 0;
_ZXDG_TOPLEVEL_DECORATION_V1_SET_MODE = 1;
_ZXDG_TOPLEVEL_DECORATION_V1_UNSET_MODE = 2;


var
  vIntf_zxdg_decoration_manager_v1_Listener: Tzxdg_decoration_manager_v1_listener;
  vIntf_zxdg_toplevel_decoration_v1_Listener: Tzxdg_toplevel_decoration_v1_listener;



procedure zxdg_decoration_manager_v1_destroy(zxdg_decoration_manager_v1: Pzxdg_decoration_manager_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_decoration_manager_v1), _ZXDG_DECORATION_MANAGER_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zxdg_decoration_manager_v1));
end;

function  zxdg_decoration_manager_v1_get_toplevel_decoration(zxdg_decoration_manager_v1: Pzxdg_decoration_manager_v1; toplevel: Pzxdg_toplevel_v6): Pzxdg_toplevel_decoration_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zxdg_decoration_manager_v1),
      _ZXDG_DECORATION_MANAGER_V1_GET_TOPLEVEL_DECORATION, @zxdg_toplevel_decoration_v1_interface, nil, toplevel);
  Result := Pzxdg_toplevel_decoration_v1(id);
end;

function  zxdg_decoration_manager_v1_add_listener(zxdg_decoration_manager_v1: Pzxdg_decoration_manager_v1; listener: Pzxdg_decoration_manager_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zxdg_decoration_manager_v1), listener, data);
end;

procedure  zxdg_decoration_manager_v1_add_listener(zxdg_decoration_manager_v1: Pzxdg_decoration_manager_v1; AIntf: Izxdg_decoration_manager_v1Listener);
begin
  zxdg_decoration_manager_v1_add_listener(zxdg_decoration_manager_v1, @vIntf_zxdg_decoration_manager_v1_Listener, AIntf);
end;

procedure zxdg_decoration_manager_v1_set_user_data(zxdg_decoration_manager_v1: Pzxdg_decoration_manager_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zxdg_decoration_manager_v1), user_data);
end;

function  zxdg_decoration_manager_v1_get_user_data(zxdg_decoration_manager_v1: Pzxdg_decoration_manager_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zxdg_decoration_manager_v1));
end;

function  zxdg_decoration_manager_v1_get_version(zxdg_decoration_manager_v1: Pzxdg_decoration_manager_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zxdg_decoration_manager_v1));
end;

procedure zxdg_toplevel_decoration_v1_destroy(zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_toplevel_decoration_v1), _ZXDG_TOPLEVEL_DECORATION_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zxdg_toplevel_decoration_v1));
end;

procedure zxdg_toplevel_decoration_v1_set_mode(zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1; mode: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_toplevel_decoration_v1),
      _ZXDG_TOPLEVEL_DECORATION_V1_SET_MODE, mode);
end;

procedure zxdg_toplevel_decoration_v1_unset_mode(zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_toplevel_decoration_v1),
      _ZXDG_TOPLEVEL_DECORATION_V1_UNSET_MODE);
end;

function  zxdg_toplevel_decoration_v1_add_listener(zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1; listener: Pzxdg_toplevel_decoration_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zxdg_toplevel_decoration_v1), listener, data);
end;

procedure  zxdg_toplevel_decoration_v1_add_listener(zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1; AIntf: Izxdg_toplevel_decoration_v1Listener);
begin
  zxdg_toplevel_decoration_v1_add_listener(zxdg_toplevel_decoration_v1, @vIntf_zxdg_toplevel_decoration_v1_Listener, AIntf);
end;

procedure zxdg_toplevel_decoration_v1_set_user_data(zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zxdg_toplevel_decoration_v1), user_data);
end;

function  zxdg_toplevel_decoration_v1_get_user_data(zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zxdg_toplevel_decoration_v1));
end;

function  zxdg_toplevel_decoration_v1_get_version(zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zxdg_toplevel_decoration_v1));
end;


procedure zxdg_toplevel_decoration_v1_configure_Intf(AIntf: Izxdg_toplevel_decoration_v1Listener; zxdg_toplevel_decoration_v1: Pzxdg_toplevel_decoration_v1; mode: cuint); cdecl;
begin
  WriteLn('zxdg_toplevel_decoration_v1.configure');
  AIntf.zxdg_toplevel_decoration_v1_configure(zxdg_toplevel_decoration_v1, mode);
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
    (@zxdg_toplevel_decoration_v1_interface),
    (@zxdg_toplevel_v6_interface)
  );

  zxdg_decoration_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_toplevel_decoration'; signature: 'no'; types: @pInterfaces[8])
  );
  zxdg_toplevel_decoration_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_mode'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'unset_mode'; signature: ''; types: @pInterfaces[0])
  );
  zxdg_toplevel_decoration_v1_events: array[0..0] of Twl_message = (
    (name: 'configure'; signature: 'u'; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zxdg_toplevel_decoration_v1_Listener.configure) := @zxdg_toplevel_decoration_v1_configure_Intf;


  zxdg_decoration_manager_v1_interface.name := 'zxdg_decoration_manager_v1';
  zxdg_decoration_manager_v1_interface.version := 1;
  zxdg_decoration_manager_v1_interface.method_count := 2;
  zxdg_decoration_manager_v1_interface.methods := @zxdg_decoration_manager_v1_requests;
  zxdg_decoration_manager_v1_interface.event_count := 0;
  zxdg_decoration_manager_v1_interface.events := nil;

  zxdg_toplevel_decoration_v1_interface.name := 'zxdg_toplevel_decoration_v1';
  zxdg_toplevel_decoration_v1_interface.version := 1;
  zxdg_toplevel_decoration_v1_interface.method_count := 3;
  zxdg_toplevel_decoration_v1_interface.methods := @zxdg_toplevel_decoration_v1_requests;
  zxdg_toplevel_decoration_v1_interface.event_count := 1;
  zxdg_toplevel_decoration_v1_interface.events := @zxdg_toplevel_decoration_v1_events;

end.
