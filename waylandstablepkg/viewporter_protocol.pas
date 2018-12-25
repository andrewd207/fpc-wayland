unit viewporter_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_viewporter = ^Twp_viewporter;
  Twp_viewporter = record end;
  Pwp_viewport = ^Twp_viewport;
  Twp_viewport = record end;
const
  WP_VIEWPORTER_ERROR_VIEWPORT_EXISTS = 0; // the surface already has a viewport object associated

type
  Pwp_viewporter_listener = ^Twp_viewporter_listener;
  Twp_viewporter_listener = record
  end;

const
  WP_VIEWPORT_ERROR_BAD_VALUE = 0; // negative or zero values in width or height
  WP_VIEWPORT_ERROR_BAD_SIZE = 1; // destination size is not integer
  WP_VIEWPORT_ERROR_OUT_OF_BUFFER = 2; // source rectangle extends outside of the content area
  WP_VIEWPORT_ERROR_NO_SURFACE = 3; // the wl_surface was destroyed

type
  Pwp_viewport_listener = ^Twp_viewport_listener;
  Twp_viewport_listener = record
  end;



  Iwp_viewporterListener = interface
  ['Iwp_viewporterListener']
  end;

  Iwp_viewportListener = interface
  ['Iwp_viewportListener']
  end;



procedure wp_viewporter_destroy(wp_viewporter: Pwp_viewporter);
function  wp_viewporter_get_viewport(wp_viewporter: Pwp_viewporter; surface: Pwl_surface): Pwp_viewport;
function  wp_viewporter_add_listener(wp_viewporter: Pwp_viewporter; listener: Pwp_viewporter_listener; data: Pointer): cint;
procedure  wp_viewporter_add_listener(wp_viewporter: Pwp_viewporter; AIntf: Iwp_viewporterListener);
procedure wp_viewporter_set_user_data(wp_viewporter: Pwp_viewporter; user_data: Pointer);
function  wp_viewporter_get_user_data(wp_viewporter: Pwp_viewporter): Pointer;
function  wp_viewporter_get_version(wp_viewporter: Pwp_viewporter): cuint32;
procedure wp_viewport_destroy(wp_viewport: Pwp_viewport);
procedure wp_viewport_set_source(wp_viewport: Pwp_viewport; x: cint32; y: cint32; width: cint32; height: cint32);
procedure wp_viewport_set_destination(wp_viewport: Pwp_viewport; width: cint; height: cint);
function  wp_viewport_add_listener(wp_viewport: Pwp_viewport; listener: Pwp_viewport_listener; data: Pointer): cint;
procedure  wp_viewport_add_listener(wp_viewport: Pwp_viewport; AIntf: Iwp_viewportListener);
procedure wp_viewport_set_user_data(wp_viewport: Pwp_viewport; user_data: Pointer);
function  wp_viewport_get_user_data(wp_viewport: Pwp_viewport): Pointer;
function  wp_viewport_get_version(wp_viewport: Pwp_viewport): cuint32;



var
  wp_viewporter_interface: Twl_interface;
  wp_viewport_interface: Twl_interface;



implementation

const
_WP_VIEWPORTER_DESTROY = 0;
_WP_VIEWPORTER_GET_VIEWPORT = 1;
_WP_VIEWPORT_DESTROY = 0;
_WP_VIEWPORT_SET_SOURCE = 1;
_WP_VIEWPORT_SET_DESTINATION = 2;


var
  vIntf_wp_viewporter_Listener: Twp_viewporter_listener;
  vIntf_wp_viewport_Listener: Twp_viewport_listener;



procedure wp_viewporter_destroy(wp_viewporter: Pwp_viewporter);
begin
  wl_proxy_marshal(Pwl_proxy(wp_viewporter), _WP_VIEWPORTER_DESTROY);
  wl_proxy_destroy(Pwl_proxy(wp_viewporter));
end;

function  wp_viewporter_get_viewport(wp_viewporter: Pwp_viewporter; surface: Pwl_surface): Pwp_viewport;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(Pwl_proxy(wp_viewporter),
      _WP_VIEWPORTER_GET_VIEWPORT, @wp_viewport_interface, nil, surface);
  Result := Pwp_viewport(id);
end;

function  wp_viewporter_add_listener(wp_viewporter: Pwp_viewporter; listener: Pwp_viewporter_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wp_viewporter), listener, data);
end;

procedure  wp_viewporter_add_listener(wp_viewporter: Pwp_viewporter; AIntf: Iwp_viewporterListener);
begin
  wp_viewporter_add_listener(wp_viewporter, @vIntf_wp_viewporter_Listener, AIntf);
end;

procedure wp_viewporter_set_user_data(wp_viewporter: Pwp_viewporter; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wp_viewporter), user_data);
end;

function  wp_viewporter_get_user_data(wp_viewporter: Pwp_viewporter): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wp_viewporter));
end;

function  wp_viewporter_get_version(wp_viewporter: Pwp_viewporter): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wp_viewporter));
end;

procedure wp_viewport_destroy(wp_viewport: Pwp_viewport);
begin
  wl_proxy_marshal(Pwl_proxy(wp_viewport), _WP_VIEWPORT_DESTROY);
  wl_proxy_destroy(Pwl_proxy(wp_viewport));
end;

procedure wp_viewport_set_source(wp_viewport: Pwp_viewport; x: cint32; y: cint32; width: cint32; height: cint32);
begin
  wl_proxy_marshal(Pwl_proxy(wp_viewport),
      _WP_VIEWPORT_SET_SOURCE, x, y, width, height);
end;

procedure wp_viewport_set_destination(wp_viewport: Pwp_viewport; width: cint; height: cint);
begin
  wl_proxy_marshal(Pwl_proxy(wp_viewport),
      _WP_VIEWPORT_SET_DESTINATION, width, height);
end;

function  wp_viewport_add_listener(wp_viewport: Pwp_viewport; listener: Pwp_viewport_listener; data: Pointer): cint;
begin
  Result := wl_proxy_add_listener(Pwl_proxy(wp_viewport), listener, data);
end;

procedure  wp_viewport_add_listener(wp_viewport: Pwp_viewport; AIntf: Iwp_viewportListener);
begin
  wp_viewport_add_listener(wp_viewport, @vIntf_wp_viewport_Listener, AIntf);
end;

procedure wp_viewport_set_user_data(wp_viewport: Pwp_viewport; user_data: Pointer);
begin
  wl_proxy_set_user_data(Pwl_proxy(wp_viewport), user_data);
end;

function  wp_viewport_get_user_data(wp_viewport: Pwp_viewport): Pointer;
begin
  Result := wl_proxy_get_user_data(Pwl_proxy(wp_viewport));
end;

function  wp_viewport_get_version(wp_viewport: Pwp_viewport): cuint32;
begin
  Result := wl_proxy_get_version(Pwl_proxy(wp_viewport));
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
    (@wp_viewport_interface),
    (@wl_surface_interface)
  );

  wp_viewporter_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_viewport'; signature: 'no'; types: @pInterfaces[8])
  );
  wp_viewport_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_source'; signature: 'ffff'; types: @pInterfaces[0]),
    (name: 'set_destination'; signature: 'ii'; types: @pInterfaces[0])
  );

initialization


  wp_viewporter_interface.name := 'wp_viewporter';
  wp_viewporter_interface.version := 1;
  wp_viewporter_interface.method_count := 2;
  wp_viewporter_interface.methods := @wp_viewporter_requests;
  wp_viewporter_interface.event_count := 0;
  wp_viewporter_interface.events := nil;

  wp_viewport_interface.name := 'wp_viewport';
  wp_viewport_interface.version := 1;
  wp_viewport_interface.method_count := 3;
  wp_viewport_interface.methods := @wp_viewport_requests;
  wp_viewport_interface.event_count := 0;
  wp_viewport_interface.events := nil;

end.
