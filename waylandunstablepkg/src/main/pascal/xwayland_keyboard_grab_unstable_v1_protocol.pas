unit xwayland_keyboard_grab_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_xwayland_keyboard_grab_manager_v1 = Pointer;
  Pwp_xwayland_keyboard_grab_v1 = Pointer;
  Pwp_xwayland_keyboard_grab_manager_v1_listener = ^Twp_xwayland_keyboard_grab_manager_v1_listener;
  Twp_xwayland_keyboard_grab_manager_v1_listener = record
  end;

  Pwp_xwayland_keyboard_grab_v1_listener = ^Twp_xwayland_keyboard_grab_v1_listener;
  Twp_xwayland_keyboard_grab_v1_listener = record
  end;



  TWpXwaylandKeyboardGrabManagerV1 = class;
  TWpXwaylandKeyboardGrabV1 = class;


  IWpXwaylandKeyboardGrabManagerV1Listener = interface
  ['IWpXwaylandKeyboardGrabManagerV1Listener']
  end;

  IWpXwaylandKeyboardGrabV1Listener = interface
  ['IWpXwaylandKeyboardGrabV1Listener']
  end;




  TWpXwaylandKeyboardGrabManagerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GRAB_KEYBOARD = 1;
  public
    destructor Destroy; override;
    function GrabKeyboard(ASurface: TWlSurface; ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TWpXwaylandKeyboardGrabV1}): TWpXwaylandKeyboardGrabV1;
    function AddListener(AIntf: IWpXwaylandKeyboardGrabManagerV1Listener): LongInt;
  end;

  TWpXwaylandKeyboardGrabV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpXwaylandKeyboardGrabV1Listener): LongInt;
  end;






var
  wp_xwayland_keyboard_grab_manager_v1_interface: Twl_interface;
  WP_XWAYLAND_KEYBOARD_GRAB_MANAGER_V1_INTERFACE_NAME: String = 'zwp_xwayland_keyboard_grab_manager_v1';
  wp_xwayland_keyboard_grab_v1_interface: Twl_interface;
  WP_XWAYLAND_KEYBOARD_GRAB_V1_INTERFACE_NAME: String = 'zwp_xwayland_keyboard_grab_v1';



implementation

var
  vIntf_wp_xwayland_keyboard_grab_manager_v1_Listener: Twp_xwayland_keyboard_grab_manager_v1_listener;
  vIntf_wp_xwayland_keyboard_grab_v1_Listener: Twp_xwayland_keyboard_grab_v1_listener;



destructor TWpXwaylandKeyboardGrabManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpXwaylandKeyboardGrabManagerV1.GrabKeyboard(ASurface: TWlSurface; ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TWpXwaylandKeyboardGrabV1}): TWpXwaylandKeyboardGrabV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GRAB_KEYBOARD, @wp_xwayland_keyboard_grab_v1_interface, nil, ASurface.Proxy, ASeat.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpXwaylandKeyboardGrabV1;
  Result := TWpXwaylandKeyboardGrabV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpXwaylandKeyboardGrabV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpXwaylandKeyboardGrabV1]);
end;

function TWpXwaylandKeyboardGrabManagerV1.AddListener(AIntf: IWpXwaylandKeyboardGrabManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_xwayland_keyboard_grab_manager_v1_Listener, @FUserDataRec);
end;
destructor TWpXwaylandKeyboardGrabV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpXwaylandKeyboardGrabV1.AddListener(AIntf: IWpXwaylandKeyboardGrabV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_xwayland_keyboard_grab_v1_Listener, @FUserDataRec);
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
    (@wp_xwayland_keyboard_grab_v1_interface),
    (@wl_surface_interface),
    (@wl_seat_interface)
  );

  wp_xwayland_keyboard_grab_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'grab_keyboard'; signature: 'noo'; types: @pInterfaces[8])
  );
  wp_xwayland_keyboard_grab_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );

initialization


  wp_xwayland_keyboard_grab_manager_v1_interface.name := PChar(WP_XWAYLAND_KEYBOARD_GRAB_MANAGER_V1_INTERFACE_NAME);
  wp_xwayland_keyboard_grab_manager_v1_interface.version := 1;
  wp_xwayland_keyboard_grab_manager_v1_interface.method_count := 2;
  wp_xwayland_keyboard_grab_manager_v1_interface.methods := @wp_xwayland_keyboard_grab_manager_v1_requests;
  wp_xwayland_keyboard_grab_manager_v1_interface.event_count := 0;
  wp_xwayland_keyboard_grab_manager_v1_interface.events := nil;

  wp_xwayland_keyboard_grab_v1_interface.name := PChar(WP_XWAYLAND_KEYBOARD_GRAB_V1_INTERFACE_NAME);
  wp_xwayland_keyboard_grab_v1_interface.version := 1;
  wp_xwayland_keyboard_grab_v1_interface.method_count := 1;
  wp_xwayland_keyboard_grab_v1_interface.methods := @wp_xwayland_keyboard_grab_v1_requests;
  wp_xwayland_keyboard_grab_v1_interface.event_count := 0;
  wp_xwayland_keyboard_grab_v1_interface.events := nil;

end.
