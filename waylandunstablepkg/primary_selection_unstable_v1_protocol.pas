unit primary_selection_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_primary_selection_device_manager_v1 = ^Tzwp_primary_selection_device_manager_v1;
  Tzwp_primary_selection_device_manager_v1 = record end;
  Pzwp_primary_selection_device_v1 = ^Tzwp_primary_selection_device_v1;
  Tzwp_primary_selection_device_v1 = record end;
  Pzwp_primary_selection_offer_v1 = ^Tzwp_primary_selection_offer_v1;
  Tzwp_primary_selection_offer_v1 = record end;
  Pzwp_primary_selection_source_v1 = ^Tzwp_primary_selection_source_v1;
  Tzwp_primary_selection_source_v1 = record end;
  Pzwp_primary_selection_device_manager_v1_listener = ^Tzwp_primary_selection_device_manager_v1_listener;
  Tzwp_primary_selection_device_manager_v1_listener = record
  end;

  Pzwp_primary_selection_device_v1_listener = ^Tzwp_primary_selection_device_v1_listener;
  Tzwp_primary_selection_device_v1_listener = record
    data_offer : procedure(data: Pointer; zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1; offer: Pzwp_primary_selection_offer_v1); cdecl;
    selection : procedure(data: Pointer; zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1; id: Pzwp_primary_selection_offer_v1); cdecl;
  end;

  Pzwp_primary_selection_offer_v1_listener = ^Tzwp_primary_selection_offer_v1_listener;
  Tzwp_primary_selection_offer_v1_listener = record
    offer : procedure(data: Pointer; zwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1; mime_type: pchar); cdecl;
  end;

  Pzwp_primary_selection_source_v1_listener = ^Tzwp_primary_selection_source_v1_listener;
  Tzwp_primary_selection_source_v1_listener = record
    send : procedure(data: Pointer; zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1; mime_type: pchar; fd: cint); cdecl;
    cancelled : procedure(data: Pointer; zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1); cdecl;
  end;



  Izwp_primary_selection_device_manager_v1Listener = interface
  ['Izwp_primary_selection_device_manager_v1Listener']
  end;

  Izwp_primary_selection_device_v1Listener = interface
  ['Izwp_primary_selection_device_v1Listener']
    procedure zwp_primary_selection_device_v1_data_offer(zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1; offer: Pzwp_primary_selection_offer_v1);
    procedure zwp_primary_selection_device_v1_selection(zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1; id: Pzwp_primary_selection_offer_v1);
  end;

  Izwp_primary_selection_offer_v1Listener = interface
  ['Izwp_primary_selection_offer_v1Listener']
    procedure zwp_primary_selection_offer_v1_offer(zwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1; mime_type: pchar);
  end;

  Izwp_primary_selection_source_v1Listener = interface
  ['Izwp_primary_selection_source_v1Listener']
    procedure zwp_primary_selection_source_v1_send(zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1; mime_type: pchar; fd: cint);
    procedure zwp_primary_selection_source_v1_cancelled(zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1);
  end;



function  zwp_primary_selection_device_manager_v1_create_source(zwp_primary_selection_device_manager_v1: Pzwp_primary_selection_device_manager_v1): Pzwp_primary_selection_source_v1;
function  zwp_primary_selection_device_manager_v1_get_device(zwp_primary_selection_device_manager_v1: Pzwp_primary_selection_device_manager_v1; seat: Pwl_seat): Pzwp_primary_selection_device_v1;
procedure zwp_primary_selection_device_manager_v1_destroy(zwp_primary_selection_device_manager_v1: Pzwp_primary_selection_device_manager_v1);
function  zwp_primary_selection_device_manager_v1_add_listener(zwp_primary_selection_device_manager_v1: Pzwp_primary_selection_device_manager_v1; listener: Pzwp_primary_selection_device_manager_v1_listener; data: Pointer): cint;
procedure  zwp_primary_selection_device_manager_v1_add_listener(zwp_primary_selection_device_manager_v1: Pzwp_primary_selection_device_manager_v1; AIntf: Izwp_primary_selection_device_manager_v1Listener);
procedure zwp_primary_selection_device_manager_v1_set_user_data(zwp_primary_selection_device_manager_v1: Pzwp_primary_selection_device_manager_v1; user_data: Pointer);
function  zwp_primary_selection_device_manager_v1_get_user_data(zwp_primary_selection_device_manager_v1: Pzwp_primary_selection_device_manager_v1): Pointer;
function  zwp_primary_selection_device_manager_v1_get_version(zwp_primary_selection_device_manager_v1: Pzwp_primary_selection_device_manager_v1): cuint32;
procedure zwp_primary_selection_device_v1_set_selection(zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1; source: Pzwp_primary_selection_source_v1; serial: cuint);
procedure zwp_primary_selection_device_v1_destroy(zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1);
function  zwp_primary_selection_device_v1_add_listener(zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1; listener: Pzwp_primary_selection_device_v1_listener; data: Pointer): cint;
procedure  zwp_primary_selection_device_v1_add_listener(zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1; AIntf: Izwp_primary_selection_device_v1Listener);
procedure zwp_primary_selection_device_v1_set_user_data(zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1; user_data: Pointer);
function  zwp_primary_selection_device_v1_get_user_data(zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1): Pointer;
function  zwp_primary_selection_device_v1_get_version(zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1): cuint32;
procedure zwp_primary_selection_offer_v1_receive(zwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1; mime_type: pchar; fd: cint);
procedure zwp_primary_selection_offer_v1_destroy(zwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1);
function  zwp_primary_selection_offer_v1_add_listener(zwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1; listener: Pzwp_primary_selection_offer_v1_listener; data: Pointer): cint;
procedure  zwp_primary_selection_offer_v1_add_listener(zwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1; AIntf: Izwp_primary_selection_offer_v1Listener);
procedure zwp_primary_selection_offer_v1_set_user_data(zwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1; user_data: Pointer);
function  zwp_primary_selection_offer_v1_get_user_data(zwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1): Pointer;
function  zwp_primary_selection_offer_v1_get_version(zwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1): cuint32;
procedure zwp_primary_selection_source_v1_offer(zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1; mime_type: pchar);
procedure zwp_primary_selection_source_v1_destroy(zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1);
function  zwp_primary_selection_source_v1_add_listener(zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1; listener: Pzwp_primary_selection_source_v1_listener; data: Pointer): cint;
procedure  zwp_primary_selection_source_v1_add_listener(zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1; AIntf: Izwp_primary_selection_source_v1Listener);
procedure zwp_primary_selection_source_v1_set_user_data(zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1; user_data: Pointer);
function  zwp_primary_selection_source_v1_get_user_data(zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1): Pointer;
function  zwp_primary_selection_source_v1_get_version(zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1): cuint32;



var
  zwp_primary_selection_device_manager_v1_interface: Twl_interface;
  zwp_primary_selection_device_v1_interface: Twl_interface;
  zwp_primary_selection_offer_v1_interface: Twl_interface;
  zwp_primary_selection_source_v1_interface: Twl_interface;



implementation

const
_ZWP_PRIMARY_SELECTION_DEVICE_MANAGER_V1_CREATE_SOURCE = 0;
_ZWP_PRIMARY_SELECTION_DEVICE_MANAGER_V1_GET_DEVICE = 1;
_ZWP_PRIMARY_SELECTION_DEVICE_MANAGER_V1_DESTROY = 2;
_ZWP_PRIMARY_SELECTION_DEVICE_V1_SET_SELECTION = 0;
_ZWP_PRIMARY_SELECTION_DEVICE_V1_DESTROY = 1;
_ZWP_PRIMARY_SELECTION_OFFER_V1_RECEIVE = 0;
_ZWP_PRIMARY_SELECTION_OFFER_V1_DESTROY = 1;
_ZWP_PRIMARY_SELECTION_SOURCE_V1_OFFER = 0;
_ZWP_PRIMARY_SELECTION_SOURCE_V1_DESTROY = 1;


var
  vIntf_zwp_primary_selection_device_manager_v1_Listener: Tzwp_primary_selection_device_manager_v1_listener;
  vIntf_zwp_primary_selection_device_v1_Listener: Tzwp_primary_selection_device_v1_listener;
  vIntf_zwp_primary_selection_offer_v1_Listener: Tzwp_primary_selection_offer_v1_listener;
  vIntf_zwp_primary_selection_source_v1_Listener: Tzwp_primary_selection_source_v1_listener;



function  zwp_primary_selection_device_manager_v1_create_source(zwp_primary_selection_device_manager_v1: Pzwp_primary_selection_device_manager_v1): Pzwp_primary_selection_source_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_primary_selection_device_manager_v1),
      _ZWP_PRIMARY_SELECTION_DEVICE_MANAGER_V1_CREATE_SOURCE, @zwp_primary_selection_source_v1_interface, nil);
  Result := Pzwp_primary_selection_source_v1(id);
end;

function  zwp_primary_selection_device_manager_v1_get_device(zwp_primary_selection_device_manager_v1: Pzwp_primary_selection_device_manager_v1; seat: Pwl_seat): Pzwp_primary_selection_device_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_primary_selection_device_manager_v1),
      _ZWP_PRIMARY_SELECTION_DEVICE_MANAGER_V1_GET_DEVICE, @zwp_primary_selection_device_v1_interface, nil, seat);
  Result := Pzwp_primary_selection_device_v1(id);
end;

procedure zwp_primary_selection_device_manager_v1_destroy(zwp_primary_selection_device_manager_v1: Pzwp_primary_selection_device_manager_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_primary_selection_device_manager_v1), _ZWP_PRIMARY_SELECTION_DEVICE_MANAGER_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_primary_selection_device_manager_v1));
end;

function  zwp_primary_selection_device_manager_v1_add_listener(zwp_primary_selection_device_manager_v1: Pzwp_primary_selection_device_manager_v1; listener: Pzwp_primary_selection_device_manager_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_primary_selection_device_manager_v1), listener, data);
end;

procedure  zwp_primary_selection_device_manager_v1_add_listener(zwp_primary_selection_device_manager_v1: Pzwp_primary_selection_device_manager_v1; AIntf: Izwp_primary_selection_device_manager_v1Listener);
begin
  zwp_primary_selection_device_manager_v1_add_listener(zwp_primary_selection_device_manager_v1, @vIntf_zwp_primary_selection_device_manager_v1_Listener, AIntf);
end;

procedure zwp_primary_selection_device_manager_v1_set_user_data(zwp_primary_selection_device_manager_v1: Pzwp_primary_selection_device_manager_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_primary_selection_device_manager_v1), user_data);
end;

function  zwp_primary_selection_device_manager_v1_get_user_data(zwp_primary_selection_device_manager_v1: Pzwp_primary_selection_device_manager_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_primary_selection_device_manager_v1));
end;

function  zwp_primary_selection_device_manager_v1_get_version(zwp_primary_selection_device_manager_v1: Pzwp_primary_selection_device_manager_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_primary_selection_device_manager_v1));
end;

procedure zwp_primary_selection_device_v1_set_selection(zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1; source: Pzwp_primary_selection_source_v1; serial: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_primary_selection_device_v1),
      _ZWP_PRIMARY_SELECTION_DEVICE_V1_SET_SELECTION, source, serial);
end;

procedure zwp_primary_selection_device_v1_destroy(zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_primary_selection_device_v1), _ZWP_PRIMARY_SELECTION_DEVICE_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_primary_selection_device_v1));
end;

function  zwp_primary_selection_device_v1_add_listener(zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1; listener: Pzwp_primary_selection_device_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_primary_selection_device_v1), listener, data);
end;

procedure  zwp_primary_selection_device_v1_add_listener(zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1; AIntf: Izwp_primary_selection_device_v1Listener);
begin
  zwp_primary_selection_device_v1_add_listener(zwp_primary_selection_device_v1, @vIntf_zwp_primary_selection_device_v1_Listener, AIntf);
end;

procedure zwp_primary_selection_device_v1_set_user_data(zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_primary_selection_device_v1), user_data);
end;

function  zwp_primary_selection_device_v1_get_user_data(zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_primary_selection_device_v1));
end;

function  zwp_primary_selection_device_v1_get_version(zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_primary_selection_device_v1));
end;

procedure zwp_primary_selection_offer_v1_receive(zwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1; mime_type: pchar; fd: cint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_primary_selection_offer_v1),
      _ZWP_PRIMARY_SELECTION_OFFER_V1_RECEIVE, mime_type, fd);
end;

procedure zwp_primary_selection_offer_v1_destroy(zwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_primary_selection_offer_v1), _ZWP_PRIMARY_SELECTION_OFFER_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_primary_selection_offer_v1));
end;

function  zwp_primary_selection_offer_v1_add_listener(zwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1; listener: Pzwp_primary_selection_offer_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_primary_selection_offer_v1), listener, data);
end;

procedure  zwp_primary_selection_offer_v1_add_listener(zwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1; AIntf: Izwp_primary_selection_offer_v1Listener);
begin
  zwp_primary_selection_offer_v1_add_listener(zwp_primary_selection_offer_v1, @vIntf_zwp_primary_selection_offer_v1_Listener, AIntf);
end;

procedure zwp_primary_selection_offer_v1_set_user_data(zwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_primary_selection_offer_v1), user_data);
end;

function  zwp_primary_selection_offer_v1_get_user_data(zwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_primary_selection_offer_v1));
end;

function  zwp_primary_selection_offer_v1_get_version(zwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_primary_selection_offer_v1));
end;

procedure zwp_primary_selection_source_v1_offer(zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1; mime_type: pchar);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_primary_selection_source_v1),
      _ZWP_PRIMARY_SELECTION_SOURCE_V1_OFFER, mime_type);
end;

procedure zwp_primary_selection_source_v1_destroy(zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_primary_selection_source_v1), _ZWP_PRIMARY_SELECTION_SOURCE_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_primary_selection_source_v1));
end;

function  zwp_primary_selection_source_v1_add_listener(zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1; listener: Pzwp_primary_selection_source_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_primary_selection_source_v1), listener, data);
end;

procedure  zwp_primary_selection_source_v1_add_listener(zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1; AIntf: Izwp_primary_selection_source_v1Listener);
begin
  zwp_primary_selection_source_v1_add_listener(zwp_primary_selection_source_v1, @vIntf_zwp_primary_selection_source_v1_Listener, AIntf);
end;

procedure zwp_primary_selection_source_v1_set_user_data(zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_primary_selection_source_v1), user_data);
end;

function  zwp_primary_selection_source_v1_get_user_data(zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_primary_selection_source_v1));
end;

function  zwp_primary_selection_source_v1_get_version(zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_primary_selection_source_v1));
end;


procedure zwp_primary_selection_device_v1_data_offer_Intf(AIntf: Izwp_primary_selection_device_v1Listener; zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1; offer: Pzwp_primary_selection_offer_v1); cdecl;
begin
  WriteLn('zwp_primary_selection_device_v1.data_offer');
  AIntf.zwp_primary_selection_device_v1_data_offer(zwp_primary_selection_device_v1, offer);
end;

procedure zwp_primary_selection_device_v1_selection_Intf(AIntf: Izwp_primary_selection_device_v1Listener; zwp_primary_selection_device_v1: Pzwp_primary_selection_device_v1; id: Pzwp_primary_selection_offer_v1); cdecl;
begin
  WriteLn('zwp_primary_selection_device_v1.selection');
  AIntf.zwp_primary_selection_device_v1_selection(zwp_primary_selection_device_v1, id);
end;

procedure zwp_primary_selection_offer_v1_offer_Intf(AIntf: Izwp_primary_selection_offer_v1Listener; zwp_primary_selection_offer_v1: Pzwp_primary_selection_offer_v1; mime_type: pchar); cdecl;
begin
  WriteLn('zwp_primary_selection_offer_v1.offer');
  AIntf.zwp_primary_selection_offer_v1_offer(zwp_primary_selection_offer_v1, mime_type);
end;

procedure zwp_primary_selection_source_v1_send_Intf(AIntf: Izwp_primary_selection_source_v1Listener; zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1; mime_type: pchar; fd: cint); cdecl;
begin
  WriteLn('zwp_primary_selection_source_v1.send');
  AIntf.zwp_primary_selection_source_v1_send(zwp_primary_selection_source_v1, mime_type, fd);
end;

procedure zwp_primary_selection_source_v1_cancelled_Intf(AIntf: Izwp_primary_selection_source_v1Listener; zwp_primary_selection_source_v1: Pzwp_primary_selection_source_v1); cdecl;
begin
  WriteLn('zwp_primary_selection_source_v1.cancelled');
  AIntf.zwp_primary_selection_source_v1_cancelled(zwp_primary_selection_source_v1);
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
    (@zwp_primary_selection_source_v1_interface),
    (@zwp_primary_selection_device_v1_interface),
    (@wl_seat_interface),
    (@zwp_primary_selection_source_v1_interface),
    (nil),
    (@zwp_primary_selection_offer_v1_interface)
  );

  zwp_primary_selection_device_manager_v1_requests: array[0..2] of Twl_message = (
    (name: 'create_source'; signature: 'n'; types: @pInterfaces[8]),
    (name: 'get_device'; signature: 'no'; types: @pInterfaces[9]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_primary_selection_device_v1_requests: array[0..1] of Twl_message = (
    (name: 'set_selection'; signature: '?ou'; types: @pInterfaces[11]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_primary_selection_device_v1_events: array[0..1] of Twl_message = (
    (name: 'data_offer'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'selection'; signature: '?o'; types: @pInterfaces[13])
  );
  zwp_primary_selection_offer_v1_requests: array[0..1] of Twl_message = (
    (name: 'receive'; signature: 'sh'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_primary_selection_offer_v1_events: array[0..0] of Twl_message = (
    (name: 'offer'; signature: 's'; types: @pInterfaces[0])
  );
  zwp_primary_selection_source_v1_requests: array[0..1] of Twl_message = (
    (name: 'offer'; signature: 's'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_primary_selection_source_v1_events: array[0..1] of Twl_message = (
    (name: 'send'; signature: 'sh'; types: @pInterfaces[0]),
    (name: 'cancelled'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_primary_selection_device_v1_Listener.data_offer) := @zwp_primary_selection_device_v1_data_offer_Intf;
  Pointer(vIntf_zwp_primary_selection_device_v1_Listener.selection) := @zwp_primary_selection_device_v1_selection_Intf;
  Pointer(vIntf_zwp_primary_selection_offer_v1_Listener.offer) := @zwp_primary_selection_offer_v1_offer_Intf;
  Pointer(vIntf_zwp_primary_selection_source_v1_Listener.send) := @zwp_primary_selection_source_v1_send_Intf;
  Pointer(vIntf_zwp_primary_selection_source_v1_Listener.cancelled) := @zwp_primary_selection_source_v1_cancelled_Intf;


  zwp_primary_selection_device_manager_v1_interface.name := 'zwp_primary_selection_device_manager_v1';
  zwp_primary_selection_device_manager_v1_interface.version := 1;
  zwp_primary_selection_device_manager_v1_interface.method_count := 3;
  zwp_primary_selection_device_manager_v1_interface.methods := @zwp_primary_selection_device_manager_v1_requests;
  zwp_primary_selection_device_manager_v1_interface.event_count := 0;
  zwp_primary_selection_device_manager_v1_interface.events := nil;

  zwp_primary_selection_device_v1_interface.name := 'zwp_primary_selection_device_v1';
  zwp_primary_selection_device_v1_interface.version := 1;
  zwp_primary_selection_device_v1_interface.method_count := 2;
  zwp_primary_selection_device_v1_interface.methods := @zwp_primary_selection_device_v1_requests;
  zwp_primary_selection_device_v1_interface.event_count := 2;
  zwp_primary_selection_device_v1_interface.events := @zwp_primary_selection_device_v1_events;

  zwp_primary_selection_offer_v1_interface.name := 'zwp_primary_selection_offer_v1';
  zwp_primary_selection_offer_v1_interface.version := 1;
  zwp_primary_selection_offer_v1_interface.method_count := 2;
  zwp_primary_selection_offer_v1_interface.methods := @zwp_primary_selection_offer_v1_requests;
  zwp_primary_selection_offer_v1_interface.event_count := 1;
  zwp_primary_selection_offer_v1_interface.events := @zwp_primary_selection_offer_v1_events;

  zwp_primary_selection_source_v1_interface.name := 'zwp_primary_selection_source_v1';
  zwp_primary_selection_source_v1_interface.version := 1;
  zwp_primary_selection_source_v1_interface.method_count := 2;
  zwp_primary_selection_source_v1_interface.methods := @zwp_primary_selection_source_v1_requests;
  zwp_primary_selection_source_v1_interface.event_count := 2;
  zwp_primary_selection_source_v1_interface.events := @zwp_primary_selection_source_v1_events;

end.
