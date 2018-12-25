unit xdg_foreign_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzxdg_exporter_v1 = ^Tzxdg_exporter_v1;
  Tzxdg_exporter_v1 = record end;
  Pzxdg_importer_v1 = ^Tzxdg_importer_v1;
  Tzxdg_importer_v1 = record end;
  Pzxdg_exported_v1 = ^Tzxdg_exported_v1;
  Tzxdg_exported_v1 = record end;
  Pzxdg_imported_v1 = ^Tzxdg_imported_v1;
  Tzxdg_imported_v1 = record end;
  Pzxdg_exporter_v1_listener = ^Tzxdg_exporter_v1_listener;
  Tzxdg_exporter_v1_listener = record
  end;

  Pzxdg_importer_v1_listener = ^Tzxdg_importer_v1_listener;
  Tzxdg_importer_v1_listener = record
  end;

  Pzxdg_exported_v1_listener = ^Tzxdg_exported_v1_listener;
  Tzxdg_exported_v1_listener = record
    handle : procedure(data: Pointer; zxdg_exported_v1: Pzxdg_exported_v1; handle: pchar); cdecl;
  end;

  Pzxdg_imported_v1_listener = ^Tzxdg_imported_v1_listener;
  Tzxdg_imported_v1_listener = record
    destroyed : procedure(data: Pointer; zxdg_imported_v1: Pzxdg_imported_v1); cdecl;
  end;



  Izxdg_exporter_v1Listener = interface
  ['Izxdg_exporter_v1Listener']
  end;

  Izxdg_importer_v1Listener = interface
  ['Izxdg_importer_v1Listener']
  end;

  Izxdg_exported_v1Listener = interface
  ['Izxdg_exported_v1Listener']
    procedure zxdg_exported_v1_handle(zxdg_exported_v1: Pzxdg_exported_v1; handle: pchar);
  end;

  Izxdg_imported_v1Listener = interface
  ['Izxdg_imported_v1Listener']
    procedure zxdg_imported_v1_destroyed(zxdg_imported_v1: Pzxdg_imported_v1);
  end;



procedure zxdg_exporter_v1_destroy(zxdg_exporter_v1: Pzxdg_exporter_v1);
function  zxdg_exporter_v1_export(zxdg_exporter_v1: Pzxdg_exporter_v1; surface: Pwl_surface): Pzxdg_exported_v1;
function  zxdg_exporter_v1_add_listener(zxdg_exporter_v1: Pzxdg_exporter_v1; listener: Pzxdg_exporter_v1_listener; data: Pointer): cint;
procedure  zxdg_exporter_v1_add_listener(zxdg_exporter_v1: Pzxdg_exporter_v1; AIntf: Izxdg_exporter_v1Listener);
procedure zxdg_exporter_v1_set_user_data(zxdg_exporter_v1: Pzxdg_exporter_v1; user_data: Pointer);
function  zxdg_exporter_v1_get_user_data(zxdg_exporter_v1: Pzxdg_exporter_v1): Pointer;
function  zxdg_exporter_v1_get_version(zxdg_exporter_v1: Pzxdg_exporter_v1): cuint32;
procedure zxdg_importer_v1_destroy(zxdg_importer_v1: Pzxdg_importer_v1);
function  zxdg_importer_v1_import(zxdg_importer_v1: Pzxdg_importer_v1; handle: pchar): Pzxdg_imported_v1;
function  zxdg_importer_v1_add_listener(zxdg_importer_v1: Pzxdg_importer_v1; listener: Pzxdg_importer_v1_listener; data: Pointer): cint;
procedure  zxdg_importer_v1_add_listener(zxdg_importer_v1: Pzxdg_importer_v1; AIntf: Izxdg_importer_v1Listener);
procedure zxdg_importer_v1_set_user_data(zxdg_importer_v1: Pzxdg_importer_v1; user_data: Pointer);
function  zxdg_importer_v1_get_user_data(zxdg_importer_v1: Pzxdg_importer_v1): Pointer;
function  zxdg_importer_v1_get_version(zxdg_importer_v1: Pzxdg_importer_v1): cuint32;
procedure zxdg_exported_v1_destroy(zxdg_exported_v1: Pzxdg_exported_v1);
function  zxdg_exported_v1_add_listener(zxdg_exported_v1: Pzxdg_exported_v1; listener: Pzxdg_exported_v1_listener; data: Pointer): cint;
procedure  zxdg_exported_v1_add_listener(zxdg_exported_v1: Pzxdg_exported_v1; AIntf: Izxdg_exported_v1Listener);
procedure zxdg_exported_v1_set_user_data(zxdg_exported_v1: Pzxdg_exported_v1; user_data: Pointer);
function  zxdg_exported_v1_get_user_data(zxdg_exported_v1: Pzxdg_exported_v1): Pointer;
function  zxdg_exported_v1_get_version(zxdg_exported_v1: Pzxdg_exported_v1): cuint32;
procedure zxdg_imported_v1_destroy(zxdg_imported_v1: Pzxdg_imported_v1);
procedure zxdg_imported_v1_set_parent_of(zxdg_imported_v1: Pzxdg_imported_v1; surface: Pwl_surface);
function  zxdg_imported_v1_add_listener(zxdg_imported_v1: Pzxdg_imported_v1; listener: Pzxdg_imported_v1_listener; data: Pointer): cint;
procedure  zxdg_imported_v1_add_listener(zxdg_imported_v1: Pzxdg_imported_v1; AIntf: Izxdg_imported_v1Listener);
procedure zxdg_imported_v1_set_user_data(zxdg_imported_v1: Pzxdg_imported_v1; user_data: Pointer);
function  zxdg_imported_v1_get_user_data(zxdg_imported_v1: Pzxdg_imported_v1): Pointer;
function  zxdg_imported_v1_get_version(zxdg_imported_v1: Pzxdg_imported_v1): cuint32;



var
  zxdg_exporter_v1_interface: Twl_interface;
  zxdg_importer_v1_interface: Twl_interface;
  zxdg_exported_v1_interface: Twl_interface;
  zxdg_imported_v1_interface: Twl_interface;



implementation

const
_ZXDG_EXPORTER_V1_DESTROY = 0;
_ZXDG_EXPORTER_V1_EXPORT = 1;
_ZXDG_IMPORTER_V1_DESTROY = 0;
_ZXDG_IMPORTER_V1_IMPORT = 1;
_ZXDG_EXPORTED_V1_DESTROY = 0;
_ZXDG_IMPORTED_V1_DESTROY = 0;
_ZXDG_IMPORTED_V1_SET_PARENT_OF = 1;


var
  vIntf_zxdg_exporter_v1_Listener: Tzxdg_exporter_v1_listener;
  vIntf_zxdg_importer_v1_Listener: Tzxdg_importer_v1_listener;
  vIntf_zxdg_exported_v1_Listener: Tzxdg_exported_v1_listener;
  vIntf_zxdg_imported_v1_Listener: Tzxdg_imported_v1_listener;



procedure zxdg_exporter_v1_destroy(zxdg_exporter_v1: Pzxdg_exporter_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_exporter_v1), _ZXDG_EXPORTER_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zxdg_exporter_v1));
end;

function  zxdg_exporter_v1_export(zxdg_exporter_v1: Pzxdg_exporter_v1; surface: Pwl_surface): Pzxdg_exported_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zxdg_exporter_v1),
      _ZXDG_EXPORTER_V1_EXPORT, @zxdg_exported_v1_interface, nil, surface);
  Result := Pzxdg_exported_v1(id);
end;

function  zxdg_exporter_v1_add_listener(zxdg_exporter_v1: Pzxdg_exporter_v1; listener: Pzxdg_exporter_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zxdg_exporter_v1), listener, data);
end;

procedure  zxdg_exporter_v1_add_listener(zxdg_exporter_v1: Pzxdg_exporter_v1; AIntf: Izxdg_exporter_v1Listener);
begin
  zxdg_exporter_v1_add_listener(zxdg_exporter_v1, @vIntf_zxdg_exporter_v1_Listener, AIntf);
end;

procedure zxdg_exporter_v1_set_user_data(zxdg_exporter_v1: Pzxdg_exporter_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zxdg_exporter_v1), user_data);
end;

function  zxdg_exporter_v1_get_user_data(zxdg_exporter_v1: Pzxdg_exporter_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zxdg_exporter_v1));
end;

function  zxdg_exporter_v1_get_version(zxdg_exporter_v1: Pzxdg_exporter_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zxdg_exporter_v1));
end;

procedure zxdg_importer_v1_destroy(zxdg_importer_v1: Pzxdg_importer_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_importer_v1), _ZXDG_IMPORTER_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zxdg_importer_v1));
end;

function  zxdg_importer_v1_import(zxdg_importer_v1: Pzxdg_importer_v1; handle: pchar): Pzxdg_imported_v1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(zxdg_importer_v1),
      _ZXDG_IMPORTER_V1_IMPORT, @zxdg_imported_v1_interface, nil, handle);
  Result := Pzxdg_imported_v1(id);
end;

function  zxdg_importer_v1_add_listener(zxdg_importer_v1: Pzxdg_importer_v1; listener: Pzxdg_importer_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zxdg_importer_v1), listener, data);
end;

procedure  zxdg_importer_v1_add_listener(zxdg_importer_v1: Pzxdg_importer_v1; AIntf: Izxdg_importer_v1Listener);
begin
  zxdg_importer_v1_add_listener(zxdg_importer_v1, @vIntf_zxdg_importer_v1_Listener, AIntf);
end;

procedure zxdg_importer_v1_set_user_data(zxdg_importer_v1: Pzxdg_importer_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zxdg_importer_v1), user_data);
end;

function  zxdg_importer_v1_get_user_data(zxdg_importer_v1: Pzxdg_importer_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zxdg_importer_v1));
end;

function  zxdg_importer_v1_get_version(zxdg_importer_v1: Pzxdg_importer_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zxdg_importer_v1));
end;

procedure zxdg_exported_v1_destroy(zxdg_exported_v1: Pzxdg_exported_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_exported_v1), _ZXDG_EXPORTED_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zxdg_exported_v1));
end;

function  zxdg_exported_v1_add_listener(zxdg_exported_v1: Pzxdg_exported_v1; listener: Pzxdg_exported_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zxdg_exported_v1), listener, data);
end;

procedure  zxdg_exported_v1_add_listener(zxdg_exported_v1: Pzxdg_exported_v1; AIntf: Izxdg_exported_v1Listener);
begin
  zxdg_exported_v1_add_listener(zxdg_exported_v1, @vIntf_zxdg_exported_v1_Listener, AIntf);
end;

procedure zxdg_exported_v1_set_user_data(zxdg_exported_v1: Pzxdg_exported_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zxdg_exported_v1), user_data);
end;

function  zxdg_exported_v1_get_user_data(zxdg_exported_v1: Pzxdg_exported_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zxdg_exported_v1));
end;

function  zxdg_exported_v1_get_version(zxdg_exported_v1: Pzxdg_exported_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zxdg_exported_v1));
end;

procedure zxdg_imported_v1_destroy(zxdg_imported_v1: Pzxdg_imported_v1);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_imported_v1), _ZXDG_IMPORTED_V1_DESTROY);
  wl_proxy_destroy(Pwl_proxy(zxdg_imported_v1));
end;

procedure zxdg_imported_v1_set_parent_of(zxdg_imported_v1: Pzxdg_imported_v1; surface: Pwl_surface);
begin
  wl_proxy_marshal(Pwl_proxy(zxdg_imported_v1),
      _ZXDG_IMPORTED_V1_SET_PARENT_OF, surface);
end;

function  zxdg_imported_v1_add_listener(zxdg_imported_v1: Pzxdg_imported_v1; listener: Pzxdg_imported_v1_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(zxdg_imported_v1), listener, data);
end;

procedure  zxdg_imported_v1_add_listener(zxdg_imported_v1: Pzxdg_imported_v1; AIntf: Izxdg_imported_v1Listener);
begin
  zxdg_imported_v1_add_listener(zxdg_imported_v1, @vIntf_zxdg_imported_v1_Listener, AIntf);
end;

procedure zxdg_imported_v1_set_user_data(zxdg_imported_v1: Pzxdg_imported_v1; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(zxdg_imported_v1), user_data);
end;

function  zxdg_imported_v1_get_user_data(zxdg_imported_v1: Pzxdg_imported_v1): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(zxdg_imported_v1));
end;

function  zxdg_imported_v1_get_version(zxdg_imported_v1: Pzxdg_imported_v1): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(zxdg_imported_v1));
end;


procedure zxdg_exported_v1_handle_Intf(AIntf: Izxdg_exported_v1Listener; zxdg_exported_v1: Pzxdg_exported_v1; handle: pchar); cdecl;
begin
  WriteLn('zxdg_exported_v1.handle');
  AIntf.zxdg_exported_v1_handle(zxdg_exported_v1, handle);
end;

procedure zxdg_imported_v1_destroyed_Intf(AIntf: Izxdg_imported_v1Listener; zxdg_imported_v1: Pzxdg_imported_v1); cdecl;
begin
  WriteLn('zxdg_imported_v1.destroyed');
  AIntf.zxdg_imported_v1_destroyed(zxdg_imported_v1);
end;



const
  pInterfaces: array[0..12] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@zxdg_exported_v1_interface),
    (@wl_surface_interface),
    (@zxdg_imported_v1_interface),
    (nil),
    (@wl_surface_interface)
  );

  zxdg_exporter_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'export'; signature: 'no'; types: @pInterfaces[8])
  );
  zxdg_importer_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'import'; signature: 'ns'; types: @pInterfaces[10])
  );
  zxdg_exported_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zxdg_exported_v1_events: array[0..0] of Twl_message = (
    (name: 'handle'; signature: 's'; types: @pInterfaces[0])
  );
  zxdg_imported_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_parent_of'; signature: 'o'; types: @pInterfaces[12])
  );
  zxdg_imported_v1_events: array[0..0] of Twl_message = (
    (name: 'destroyed'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zxdg_exported_v1_Listener.handle) := @zxdg_exported_v1_handle_Intf;
  Pointer(vIntf_zxdg_imported_v1_Listener.destroyed) := @zxdg_imported_v1_destroyed_Intf;


  zxdg_exporter_v1_interface.name := 'zxdg_exporter_v1';
  zxdg_exporter_v1_interface.version := 1;
  zxdg_exporter_v1_interface.method_count := 2;
  zxdg_exporter_v1_interface.methods := @zxdg_exporter_v1_requests;
  zxdg_exporter_v1_interface.event_count := 0;
  zxdg_exporter_v1_interface.events := nil;

  zxdg_importer_v1_interface.name := 'zxdg_importer_v1';
  zxdg_importer_v1_interface.version := 1;
  zxdg_importer_v1_interface.method_count := 2;
  zxdg_importer_v1_interface.methods := @zxdg_importer_v1_requests;
  zxdg_importer_v1_interface.event_count := 0;
  zxdg_importer_v1_interface.events := nil;

  zxdg_exported_v1_interface.name := 'zxdg_exported_v1';
  zxdg_exported_v1_interface.version := 1;
  zxdg_exported_v1_interface.method_count := 1;
  zxdg_exported_v1_interface.methods := @zxdg_exported_v1_requests;
  zxdg_exported_v1_interface.event_count := 1;
  zxdg_exported_v1_interface.events := @zxdg_exported_v1_events;

  zxdg_imported_v1_interface.name := 'zxdg_imported_v1';
  zxdg_imported_v1_interface.version := 1;
  zxdg_imported_v1_interface.method_count := 2;
  zxdg_imported_v1_interface.methods := @zxdg_imported_v1_requests;
  zxdg_imported_v1_interface.event_count := 1;
  zxdg_imported_v1_interface.events := @zxdg_imported_v1_events;

end.
