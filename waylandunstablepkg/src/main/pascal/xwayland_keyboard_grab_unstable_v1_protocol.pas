unit xwayland_keyboard_grab_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_xwayland_keyboard_grab_manager_v1 = Pointer;
  Pzwp_xwayland_keyboard_grab_v1 = Pointer;
  Pzwp_xwayland_keyboard_grab_manager_v1_listener = ^Tzwp_xwayland_keyboard_grab_manager_v1_listener;
  Tzwp_xwayland_keyboard_grab_manager_v1_listener = record
  end;

  Pzwp_xwayland_keyboard_grab_v1_listener = ^Tzwp_xwayland_keyboard_grab_v1_listener;
  Tzwp_xwayland_keyboard_grab_v1_listener = record
  end;



  TZwpXwaylandKeyboardGrabManagerV1 = class;
  TZwpXwaylandKeyboardGrabV1 = class;


  IZwpXwaylandKeyboardGrabManagerV1Listener = interface
  ['IZwpXwaylandKeyboardGrabManagerV1Listener']
  end;

  IZwpXwaylandKeyboardGrabV1Listener = interface
  ['IZwpXwaylandKeyboardGrabV1Listener']
  end;




  TZwpXwaylandKeyboardGrabManagerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GRAB_KEYBOARD = 1;
  public
    destructor Destroy; override;
    function GrabKeyboard(ASurface: TWlSurface; ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TZwpXwaylandKeyboardGrabV1}): TZwpXwaylandKeyboardGrabV1;
    function AddListener(AIntf: IZwpXwaylandKeyboardGrabManagerV1Listener): LongInt;
  end;

  TZwpXwaylandKeyboardGrabV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IZwpXwaylandKeyboardGrabV1Listener): LongInt;
  end;






var
  zwp_xwayland_keyboard_grab_manager_v1_interface: Twl_interface;
  zwp_xwayland_keyboard_grab_v1_interface: Twl_interface;



implementation

var
  vIntf_zwp_xwayland_keyboard_grab_manager_v1_Listener: Tzwp_xwayland_keyboard_grab_manager_v1_listener;
  vIntf_zwp_xwayland_keyboard_grab_v1_Listener: Tzwp_xwayland_keyboard_grab_v1_listener;



destructor TZwpXwaylandKeyboardGrabManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpXwaylandKeyboardGrabManagerV1.GrabKeyboard(ASurface: TWlSurface; ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TZwpXwaylandKeyboardGrabV1}): TZwpXwaylandKeyboardGrabV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GRAB_KEYBOARD, @zwp_xwayland_keyboard_grab_v1_interface, nil, ASurface.Proxy, ASeat.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpXwaylandKeyboardGrabV1;
  Result := TZwpXwaylandKeyboardGrabV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TZwpXwaylandKeyboardGrabV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpXwaylandKeyboardGrabV1]);
end;

function TZwpXwaylandKeyboardGrabManagerV1.AddListener(AIntf: IZwpXwaylandKeyboardGrabManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_xwayland_keyboard_grab_manager_v1_Listener, @FUserDataRec);
end;
destructor TZwpXwaylandKeyboardGrabV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpXwaylandKeyboardGrabV1.AddListener(AIntf: IZwpXwaylandKeyboardGrabV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_xwayland_keyboard_grab_v1_Listener, @FUserDataRec);
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
    (@zwp_xwayland_keyboard_grab_v1_interface),
    (@wl_surface_interface),
    (@wl_seat_interface)
  );

  zwp_xwayland_keyboard_grab_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'grab_keyboard'; signature: 'noo'; types: @pInterfaces[8])
  );
  zwp_xwayland_keyboard_grab_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );

initialization


  zwp_xwayland_keyboard_grab_manager_v1_interface.name := 'zwp_xwayland_keyboard_grab_manager_v1';
  zwp_xwayland_keyboard_grab_manager_v1_interface.version := 1;
  zwp_xwayland_keyboard_grab_manager_v1_interface.method_count := 2;
  zwp_xwayland_keyboard_grab_manager_v1_interface.methods := @zwp_xwayland_keyboard_grab_manager_v1_requests;
  zwp_xwayland_keyboard_grab_manager_v1_interface.event_count := 0;
  zwp_xwayland_keyboard_grab_manager_v1_interface.events := nil;

  zwp_xwayland_keyboard_grab_v1_interface.name := 'zwp_xwayland_keyboard_grab_v1';
  zwp_xwayland_keyboard_grab_v1_interface.version := 1;
  zwp_xwayland_keyboard_grab_v1_interface.method_count := 1;
  zwp_xwayland_keyboard_grab_v1_interface.methods := @zwp_xwayland_keyboard_grab_v1_requests;
  zwp_xwayland_keyboard_grab_v1_interface.event_count := 0;
  zwp_xwayland_keyboard_grab_v1_interface.events := nil;

end.
