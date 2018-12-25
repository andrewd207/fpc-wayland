unit linux_dmabuf_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_linux_dmabuf_v1 = ^Tzwp_linux_dmabuf_v1;
  Tzwp_linux_dmabuf_v1 = record end;
  Pzwp_linux_buffer_params_v1 = ^Tzwp_linux_buffer_params_v1;
  Tzwp_linux_buffer_params_v1 = record end;
  Pzwp_linux_dmabuf_v1_listener = ^Tzwp_linux_dmabuf_v1_listener;
  Tzwp_linux_dmabuf_v1_listener = record
    format : procedure(data: Pointer; zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1; format: cuint); cdecl;
    modifier : procedure(data: Pointer; zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1; format: cuint; modifier_hi: cuint; modifier_lo: cuint); cdecl;
  end;

const
  ZWP_LINUX_BUFFER_PARAMS_V1_ERROR_ALREADY_USED = 0; // the dmabuf_batch object has already been used to create a wl_buffer
  ZWP_LINUX_BUFFER_PARAMS_V1_ERROR_PLANE_IDX = 1; // plane index out of bounds
  ZWP_LINUX_BUFFER_PARAMS_V1_ERROR_PLANE_SET = 2; // the plane index was already set
  ZWP_LINUX_BUFFER_PARAMS_V1_ERROR_INCOMPLETE = 3; // missing or too many planes to create a buffer
  ZWP_LINUX_BUFFER_PARAMS_V1_ERROR_INVALID_FORMAT = 4; // format not supported
  ZWP_LINUX_BUFFER_PARAMS_V1_ERROR_INVALID_DIMENSIONS = 5; // invalid width or height
  ZWP_LINUX_BUFFER_PARAMS_V1_ERROR_OUT_OF_BOUNDS = 6; // offset + stride * height goes out of dmabuf bounds
  ZWP_LINUX_BUFFER_PARAMS_V1_ERROR_INVALID_WL_BUFFER = 7; // invalid wl_buffer resulted from importing dmabufs via                the create_immed request on given buffer_params
  ZWP_LINUX_BUFFER_PARAMS_V1_FLAGS_Y_INVERT = 1; // contents are y-inverted
  ZWP_LINUX_BUFFER_PARAMS_V1_FLAGS_INTERLACED = 2; // content is interlaced
  ZWP_LINUX_BUFFER_PARAMS_V1_FLAGS_BOTTOM_FIRST = 4; // bottom field first

type
  Pzwp_linux_buffer_params_v1_listener = ^Tzwp_linux_buffer_params_v1_listener;
  Tzwp_linux_buffer_params_v1_listener = record
    created : procedure(data: Pointer; zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1; buffer: Pwl_buffer); cdecl;
    failed : procedure(data: Pointer; zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1); cdecl;
  end;



  Izwp_linux_dmabuf_v1Listener = interface
  ['Izwp_linux_dmabuf_v1Listener']
    procedure zwp_linux_dmabuf_v1_format(zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1; format: cuint);
    procedure zwp_linux_dmabuf_v1_modifier(zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1; format: cuint; modifier_hi: cuint; modifier_lo: cuint);
  end;

  Izwp_linux_buffer_params_v1Listener = interface
  ['Izwp_linux_buffer_params_v1Listener']
    procedure zwp_linux_buffer_params_v1_created(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1; buffer: Pwl_buffer);
    procedure zwp_linux_buffer_params_v1_failed(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1);
  end;



procedure zwp_linux_dmabuf_v1_destroy(zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1);
function  zwp_linux_dmabuf_v1_create_params(zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1): Pzwp_linux_buffer_params_v1;
function  zwp_linux_dmabuf_v1_add_listener(zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1; listener: Pzwp_linux_dmabuf_v1_listener; data: Pointer): cint;
procedure  zwp_linux_dmabuf_v1_add_listener(zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1; AIntf: Izwp_linux_dmabuf_v1Listener);
procedure zwp_linux_dmabuf_v1_set_user_data(zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1; user_data: Pointer);
function  zwp_linux_dmabuf_v1_get_user_data(zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1): Pointer;
function  zwp_linux_dmabuf_v1_get_version(zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1): cuint32;
procedure zwp_linux_buffer_params_v1_destroy(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1);
procedure zwp_linux_buffer_params_v1_add(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1; fd: cint; plane_idx: cuint; offset: cuint; stride: cuint; modifier_hi: cuint; modifier_lo: cuint);
procedure zwp_linux_buffer_params_v1_create(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1; width: cint; height: cint; format: cuint; flags: cuint);
function  zwp_linux_buffer_params_v1_create_immed(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1; width: cint; height: cint; format: cuint; flags: cuint): Pwl_buffer;
function  zwp_linux_buffer_params_v1_add_listener(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1; listener: Pzwp_linux_buffer_params_v1_listener; data: Pointer): cint;
procedure  zwp_linux_buffer_params_v1_add_listener(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1; AIntf: Izwp_linux_buffer_params_v1Listener);
procedure zwp_linux_buffer_params_v1_set_user_data(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1; user_data: Pointer);
function  zwp_linux_buffer_params_v1_get_user_data(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1): Pointer;
function  zwp_linux_buffer_params_v1_get_version(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1): cuint32;



var
  zwp_linux_dmabuf_v1_interface: Twl_interface;
  zwp_linux_buffer_params_v1_interface: Twl_interface;



implementation

const
_ZWP_LINUX_DMABUF_V1_DESTROY = 0;
_ZWP_LINUX_DMABUF_V1_CREATE_PARAMS = 1;
_ZWP_LINUX_BUFFER_PARAMS_V1_DESTROY = 0;
_ZWP_LINUX_BUFFER_PARAMS_V1_ADD = 1;
_ZWP_LINUX_BUFFER_PARAMS_V1_CREATE = 2;
_ZWP_LINUX_BUFFER_PARAMS_V1_CREATE_IMMED = 3;


var
  vIntf_zwp_linux_dmabuf_v1_Listener: Tzwp_linux_dmabuf_v1_listener;
  vIntf_zwp_linux_buffer_params_v1_Listener: Tzwp_linux_buffer_params_v1_listener;



procedure zwp_linux_dmabuf_v1_destroy(zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_linux_dmabuf_v1), _ZWP_LINUX_DMABUF_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_linux_dmabuf_v1));
end;

function  zwp_linux_dmabuf_v1_create_params(zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1): Pzwp_linux_buffer_params_v1;
var
  params_id: Pwl_proxy;
begin
  params_id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_linux_dmabuf_v1),
      _ZWP_LINUX_DMABUF_V1_CREATE_PARAMS, @zwp_linux_buffer_params_v1_interface, nil);
  Result := Pzwp_linux_buffer_params_v1(params_id);
end;

function  zwp_linux_dmabuf_v1_add_listener(zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1; listener: Pzwp_linux_dmabuf_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_linux_dmabuf_v1), listener, data);
end;

procedure  zwp_linux_dmabuf_v1_add_listener(zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1; AIntf: Izwp_linux_dmabuf_v1Listener);
begin
  zwp_linux_dmabuf_v1_add_listener(zwp_linux_dmabuf_v1, @vIntf_zwp_linux_dmabuf_v1_Listener, AIntf);
end;

procedure zwp_linux_dmabuf_v1_set_user_data(zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_linux_dmabuf_v1), user_data);
end;

function  zwp_linux_dmabuf_v1_get_user_data(zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_linux_dmabuf_v1));
end;

function  zwp_linux_dmabuf_v1_get_version(zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_linux_dmabuf_v1));
end;

procedure zwp_linux_buffer_params_v1_destroy(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_linux_buffer_params_v1), _ZWP_LINUX_BUFFER_PARAMS_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zwp_linux_buffer_params_v1));
end;

procedure zwp_linux_buffer_params_v1_add(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1; fd: cint; plane_idx: cuint; offset: cuint; stride: cuint; modifier_hi: cuint; modifier_lo: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_linux_buffer_params_v1),
      _ZWP_LINUX_BUFFER_PARAMS_V1_ADD, fd, plane_idx, offset, stride, modifier_hi, modifier_lo);
end;

procedure zwp_linux_buffer_params_v1_create(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1; width: cint; height: cint; format: cuint; flags: cuint);
begin
  wl_proxy_marshal(Pwl_proxy(zwp_linux_buffer_params_v1),
      _ZWP_LINUX_BUFFER_PARAMS_V1_CREATE, width, height, format, flags);
end;

function  zwp_linux_buffer_params_v1_create_immed(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1; width: cint; height: cint; format: cuint; flags: cuint): Pwl_buffer;
var
  buffer_id: Pwl_proxy;
begin
  buffer_id := wl_proxy_marshal_constructor(Pwl_proxy(zwp_linux_buffer_params_v1),
      _ZWP_LINUX_BUFFER_PARAMS_V1_CREATE_IMMED, @wl_buffer_interface, nil, width, height, format, flags);
  Result := Pwl_buffer(buffer_id);
end;

function  zwp_linux_buffer_params_v1_add_listener(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1; listener: Pzwp_linux_buffer_params_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zwp_linux_buffer_params_v1), listener, data);
end;

procedure  zwp_linux_buffer_params_v1_add_listener(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1; AIntf: Izwp_linux_buffer_params_v1Listener);
begin
  zwp_linux_buffer_params_v1_add_listener(zwp_linux_buffer_params_v1, @vIntf_zwp_linux_buffer_params_v1_Listener, AIntf);
end;

procedure zwp_linux_buffer_params_v1_set_user_data(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zwp_linux_buffer_params_v1), user_data);
end;

function  zwp_linux_buffer_params_v1_get_user_data(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zwp_linux_buffer_params_v1));
end;

function  zwp_linux_buffer_params_v1_get_version(zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zwp_linux_buffer_params_v1));
end;


procedure zwp_linux_dmabuf_v1_format_Intf(AIntf: Izwp_linux_dmabuf_v1Listener; zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1; format: cuint); cdecl;
begin
  WriteLn('zwp_linux_dmabuf_v1.format');
  AIntf.zwp_linux_dmabuf_v1_format(zwp_linux_dmabuf_v1, format);
end;

procedure zwp_linux_dmabuf_v1_modifier_Intf(AIntf: Izwp_linux_dmabuf_v1Listener; zwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1; format: cuint; modifier_hi: cuint; modifier_lo: cuint); cdecl;
begin
  WriteLn('zwp_linux_dmabuf_v1.modifier');
  AIntf.zwp_linux_dmabuf_v1_modifier(zwp_linux_dmabuf_v1, format, modifier_hi, modifier_lo);
end;

procedure zwp_linux_buffer_params_v1_created_Intf(AIntf: Izwp_linux_buffer_params_v1Listener; zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1; buffer: Pwl_buffer); cdecl;
begin
  WriteLn('zwp_linux_buffer_params_v1.created');
  AIntf.zwp_linux_buffer_params_v1_created(zwp_linux_buffer_params_v1, buffer);
end;

procedure zwp_linux_buffer_params_v1_failed_Intf(AIntf: Izwp_linux_buffer_params_v1Listener; zwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1); cdecl;
begin
  WriteLn('zwp_linux_buffer_params_v1.failed');
  AIntf.zwp_linux_buffer_params_v1_failed(zwp_linux_buffer_params_v1);
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
    (@zwp_linux_buffer_params_v1_interface),
    (@wl_buffer_interface),
    (nil),
    (nil),
    (nil),
    (nil)
  );

  zwp_linux_dmabuf_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'create_params'; signature: 'n'; types: @pInterfaces[8])
  );
  zwp_linux_dmabuf_v1_events: array[0..1] of Twl_message = (
    (name: 'format'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'modifier'; signature: '3uuu'; types: @pInterfaces[0])
  );
  zwp_linux_buffer_params_v1_requests: array[0..3] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'add'; signature: 'huuuuu'; types: @pInterfaces[0]),
    (name: 'create'; signature: 'iiuu'; types: @pInterfaces[0]),
    (name: 'create_immed'; signature: '2niiuu'; types: @pInterfaces[9])
  );
  zwp_linux_buffer_params_v1_events: array[0..1] of Twl_message = (
    (name: 'created'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'failed'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_linux_dmabuf_v1_Listener.format) := @zwp_linux_dmabuf_v1_format_Intf;
  Pointer(vIntf_zwp_linux_dmabuf_v1_Listener.modifier) := @zwp_linux_dmabuf_v1_modifier_Intf;
  Pointer(vIntf_zwp_linux_buffer_params_v1_Listener.created) := @zwp_linux_buffer_params_v1_created_Intf;
  Pointer(vIntf_zwp_linux_buffer_params_v1_Listener.failed) := @zwp_linux_buffer_params_v1_failed_Intf;


  zwp_linux_dmabuf_v1_interface.name := 'zwp_linux_dmabuf_v1';
  zwp_linux_dmabuf_v1_interface.version := 3;
  zwp_linux_dmabuf_v1_interface.method_count := 2;
  zwp_linux_dmabuf_v1_interface.methods := @zwp_linux_dmabuf_v1_requests;
  zwp_linux_dmabuf_v1_interface.event_count := 2;
  zwp_linux_dmabuf_v1_interface.events := @zwp_linux_dmabuf_v1_events;

  zwp_linux_buffer_params_v1_interface.name := 'zwp_linux_buffer_params_v1';
  zwp_linux_buffer_params_v1_interface.version := 3;
  zwp_linux_buffer_params_v1_interface.method_count := 4;
  zwp_linux_buffer_params_v1_interface.methods := @zwp_linux_buffer_params_v1_requests;
  zwp_linux_buffer_params_v1_interface.event_count := 2;
  zwp_linux_buffer_params_v1_interface.events := @zwp_linux_buffer_params_v1_events;

end.
