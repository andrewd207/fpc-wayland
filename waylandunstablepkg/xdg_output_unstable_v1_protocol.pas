unit xdg_output_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzxdg_output_manager_v1 = ^Tzxdg_output_manager_v1;
  Tzxdg_output_manager_v1 = record end;
  Pzxdg_output_v1 = ^Tzxdg_output_v1;
  Tzxdg_output_v1 = record end;
  Pzxdg_output_manager_v1_listener = ^Tzxdg_output_manager_v1_listener;
  Tzxdg_output_manager_v1_listener = record
  end;

  Pzxdg_output_v1_listener = ^Tzxdg_output_v1_listener;
  Tzxdg_output_v1_listener = record
    logical_position : procedure(data: Pointer; zxdg_output_v1: Pzxdg_output_v1; x: cint; y: cint); cdecl;
    logical_size : procedure(data: Pointer; zxdg_output_v1: Pzxdg_output_v1; width: cint; height: cint); cdecl;
    done : procedure(data: Pointer; zxdg_output_v1: Pzxdg_output_v1); cdecl;
    name : procedure(data: Pointer; zxdg_output_v1: Pzxdg_output_v1; name: pchar); cdecl;
    description : procedure(data: Pointer; zxdg_output_v1: Pzxdg_output_v1; description: pchar); cdecl;
  end;



  Izxdg_output_manager_v1Listener = interface
  ['Izxdg_output_manager_v1Listener']
  end;

  Izxdg_output_v1Listener = interface
  ['Izxdg_output_v1Listener']
    procedure zxdg_output_v1_logical_position(zxdg_output_v1: Pzxdg_output_v1; x: cint; y: cint);
    procedure zxdg_output_v1_logical_size(zxdg_output_v1: Pzxdg_output_v1; width: cint; height: cint);
    procedure zxdg_output_v1_done(zxdg_output_v1: Pzxdg_output_v1);
    procedure zxdg_output_v1_name(zxdg_output_v1: Pzxdg_output_v1; name: pchar);
    procedure zxdg_output_v1_description(zxdg_output_v1: Pzxdg_output_v1; description: pchar);
  end;



procedure zxdg_output_manager_v1_destroy(zxdg_output_manager_v1: Pzxdg_output_manager_v1);
function  zxdg_output_manager_v1_get_xdg_output(zxdg_output_manager_v1: Pzxdg_output_manager_v1; output: Pwl_output): Pzxdg_output_v1;
function  zxdg_output_manager_v1_add_listener(zxdg_output_manager_v1: Pzxdg_output_manager_v1; listener: Pzxdg_output_manager_v1_listener; data: Pointer): cint;
procedure  zxdg_output_manager_v1_add_listener(zxdg_output_manager_v1: Pzxdg_output_manager_v1; AIntf: Izxdg_output_manager_v1Listener);
procedure zxdg_output_manager_v1_set_user_data(zxdg_output_manager_v1: Pzxdg_output_manager_v1; user_data: Pointer);
function  zxdg_output_manager_v1_get_user_data(zxdg_output_manager_v1: Pzxdg_output_manager_v1): Pointer;
function  zxdg_output_manager_v1_get_version(zxdg_output_manager_v1: Pzxdg_output_manager_v1): cuint32;
procedure zxdg_output_v1_destroy(zxdg_output_v1: Pzxdg_output_v1);
function  zxdg_output_v1_add_listener(zxdg_output_v1: Pzxdg_output_v1; listener: Pzxdg_output_v1_listener; data: Pointer): cint;
procedure  zxdg_output_v1_add_listener(zxdg_output_v1: Pzxdg_output_v1; AIntf: Izxdg_output_v1Listener);
procedure zxdg_output_v1_set_user_data(zxdg_output_v1: Pzxdg_output_v1; user_data: Pointer);
function  zxdg_output_v1_get_user_data(zxdg_output_v1: Pzxdg_output_v1): Pointer;
function  zxdg_output_v1_get_version(zxdg_output_v1: Pzxdg_output_v1): cuint32;



var
  zxdg_output_manager_v1_interface: Twl_interface;
  zxdg_output_v1_interface: Twl_interface;



implementation

const
_ZXDG_OUTPUT_MANAGER_V1_DESTROY = 0;
_ZXDG_OUTPUT_MANAGER_V1_GET_XDG_OUTPUT = 1;
_ZXDG_OUTPUT_V1_DESTROY = 0;


var
  vIntf_zxdg_output_manager_v1_Listener: Tzxdg_output_manager_v1_listener;
  vIntf_zxdg_output_v1_Listener: Tzxdg_output_v1_listener;



procedure zxdg_output_manager_v1_destroy(zxdg_output_manager_v1: Pzxdg_output_manager_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_output_manager_v1), _ZXDG_OUTPUT_MANAGER_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zxdg_output_manager_v1));
end;

function  zxdg_output_manager_v1_get_xdg_output(zxdg_output_manager_v1: Pzxdg_output_manager_v1; output: Pwl_output): Pzxdg_output_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zxdg_output_manager_v1),
      _ZXDG_OUTPUT_MANAGER_V1_GET_XDG_OUTPUT, @zxdg_output_v1_interface, nil, output);
  Result := Pzxdg_output_v1(id);
end;

function  zxdg_output_manager_v1_add_listener(zxdg_output_manager_v1: Pzxdg_output_manager_v1; listener: Pzxdg_output_manager_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zxdg_output_manager_v1), listener, data);
end;

procedure  zxdg_output_manager_v1_add_listener(zxdg_output_manager_v1: Pzxdg_output_manager_v1; AIntf: Izxdg_output_manager_v1Listener);
begin
  zxdg_output_manager_v1_add_listener(zxdg_output_manager_v1, @vIntf_zxdg_output_manager_v1_Listener, AIntf);
end;

procedure zxdg_output_manager_v1_set_user_data(zxdg_output_manager_v1: Pzxdg_output_manager_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zxdg_output_manager_v1), user_data);
end;

function  zxdg_output_manager_v1_get_user_data(zxdg_output_manager_v1: Pzxdg_output_manager_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zxdg_output_manager_v1));
end;

function  zxdg_output_manager_v1_get_version(zxdg_output_manager_v1: Pzxdg_output_manager_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zxdg_output_manager_v1));
end;

procedure zxdg_output_v1_destroy(zxdg_output_v1: Pzxdg_output_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_output_v1), _ZXDG_OUTPUT_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zxdg_output_v1));
end;

function  zxdg_output_v1_add_listener(zxdg_output_v1: Pzxdg_output_v1; listener: Pzxdg_output_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zxdg_output_v1), listener, data);
end;

procedure  zxdg_output_v1_add_listener(zxdg_output_v1: Pzxdg_output_v1; AIntf: Izxdg_output_v1Listener);
begin
  zxdg_output_v1_add_listener(zxdg_output_v1, @vIntf_zxdg_output_v1_Listener, AIntf);
end;

procedure zxdg_output_v1_set_user_data(zxdg_output_v1: Pzxdg_output_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zxdg_output_v1), user_data);
end;

function  zxdg_output_v1_get_user_data(zxdg_output_v1: Pzxdg_output_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zxdg_output_v1));
end;

function  zxdg_output_v1_get_version(zxdg_output_v1: Pzxdg_output_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zxdg_output_v1));
end;


procedure zxdg_output_v1_logical_position_Intf(AIntf: Izxdg_output_v1Listener; zxdg_output_v1: Pzxdg_output_v1; x: cint; y: cint); cdecl;
begin
  WriteLn('zxdg_output_v1.logical_position');
  AIntf.zxdg_output_v1_logical_position(zxdg_output_v1, x, y);
end;

procedure zxdg_output_v1_logical_size_Intf(AIntf: Izxdg_output_v1Listener; zxdg_output_v1: Pzxdg_output_v1; width: cint; height: cint); cdecl;
begin
  WriteLn('zxdg_output_v1.logical_size');
  AIntf.zxdg_output_v1_logical_size(zxdg_output_v1, width, height);
end;

procedure zxdg_output_v1_done_Intf(AIntf: Izxdg_output_v1Listener; zxdg_output_v1: Pzxdg_output_v1); cdecl;
begin
  WriteLn('zxdg_output_v1.done');
  AIntf.zxdg_output_v1_done(zxdg_output_v1);
end;

procedure zxdg_output_v1_name_Intf(AIntf: Izxdg_output_v1Listener; zxdg_output_v1: Pzxdg_output_v1; name: pchar); cdecl;
begin
  WriteLn('zxdg_output_v1.name');
  AIntf.zxdg_output_v1_name(zxdg_output_v1, name);
end;

procedure zxdg_output_v1_description_Intf(AIntf: Izxdg_output_v1Listener; zxdg_output_v1: Pzxdg_output_v1; description: pchar); cdecl;
begin
  WriteLn('zxdg_output_v1.description');
  AIntf.zxdg_output_v1_description(zxdg_output_v1, description);
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
    (@zxdg_output_v1_interface),
    (@wl_output_interface)
  );

  zxdg_output_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_xdg_output'; signature: 'no'; types: @pInterfaces[8])
  );
  zxdg_output_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zxdg_output_v1_events: array[0..4] of Twl_message = (
    (name: 'logical_position'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'logical_size'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'name'; signature: '2s'; types: @pInterfaces[0]),
    (name: 'description'; signature: '2s'; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zxdg_output_v1_Listener.logical_position) := @zxdg_output_v1_logical_position_Intf;
  Pointer(vIntf_zxdg_output_v1_Listener.logical_size) := @zxdg_output_v1_logical_size_Intf;
  Pointer(vIntf_zxdg_output_v1_Listener.done) := @zxdg_output_v1_done_Intf;
  Pointer(vIntf_zxdg_output_v1_Listener.name) := @zxdg_output_v1_name_Intf;
  Pointer(vIntf_zxdg_output_v1_Listener.description) := @zxdg_output_v1_description_Intf;


  zxdg_output_manager_v1_interface.name := 'zxdg_output_manager_v1';
  zxdg_output_manager_v1_interface.version := 2;
  zxdg_output_manager_v1_interface.method_count := 2;
  zxdg_output_manager_v1_interface.methods := @zxdg_output_manager_v1_requests;
  zxdg_output_manager_v1_interface.event_count := 0;
  zxdg_output_manager_v1_interface.events := nil;

  zxdg_output_v1_interface.name := 'zxdg_output_v1';
  zxdg_output_v1_interface.version := 2;
  zxdg_output_v1_interface.method_count := 1;
  zxdg_output_v1_interface.methods := @zxdg_output_v1_requests;
  zxdg_output_v1_interface.event_count := 5;
  zxdg_output_v1_interface.events := @zxdg_output_v1_events;

end.
