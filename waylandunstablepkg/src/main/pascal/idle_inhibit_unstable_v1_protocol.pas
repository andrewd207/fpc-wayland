unit idle_inhibit_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_idle_inhibit_manager_v1 = Pointer;
  Pwp_idle_inhibitor_v1 = Pointer;
  Pwp_idle_inhibit_manager_v1_listener = ^Twp_idle_inhibit_manager_v1_listener;
  Twp_idle_inhibit_manager_v1_listener = record
  end;

  Pwp_idle_inhibitor_v1_listener = ^Twp_idle_inhibitor_v1_listener;
  Twp_idle_inhibitor_v1_listener = record
  end;



  TWpIdleInhibitManagerV1 = class;
  TWpIdleInhibitorV1 = class;


  IWpIdleInhibitManagerV1Listener = interface
  ['IWpIdleInhibitManagerV1Listener']
  end;

  IWpIdleInhibitorV1Listener = interface
  ['IWpIdleInhibitorV1Listener']
  end;




  TWpIdleInhibitManagerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _CREATE_INHIBITOR = 1;
  public
    destructor Destroy; override;
    function CreateInhibitor(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpIdleInhibitorV1}): TWpIdleInhibitorV1;
    function AddListener(AIntf: IWpIdleInhibitManagerV1Listener): LongInt;
  end;

  TWpIdleInhibitorV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpIdleInhibitorV1Listener): LongInt;
  end;






var
  wp_idle_inhibit_manager_v1_interface: Twl_interface;
  WP_IDLE_INHIBIT_MANAGER_V1_INTERFACE_NAME: String = 'zwp_idle_inhibit_manager_v1';
  wp_idle_inhibitor_v1_interface: Twl_interface;
  WP_IDLE_INHIBITOR_V1_INTERFACE_NAME: String = 'zwp_idle_inhibitor_v1';



implementation

var
  vIntf_wp_idle_inhibit_manager_v1_Listener: Twp_idle_inhibit_manager_v1_listener;
  vIntf_wp_idle_inhibitor_v1_Listener: Twp_idle_inhibitor_v1_listener;



destructor TWpIdleInhibitManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpIdleInhibitManagerV1.CreateInhibitor(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpIdleInhibitorV1}): TWpIdleInhibitorV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_INHIBITOR, @wp_idle_inhibitor_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpIdleInhibitorV1;
  Result := TWpIdleInhibitorV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpIdleInhibitorV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpIdleInhibitorV1]);
end;

function TWpIdleInhibitManagerV1.AddListener(AIntf: IWpIdleInhibitManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_idle_inhibit_manager_v1_Listener, @FUserDataRec);
end;
destructor TWpIdleInhibitorV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpIdleInhibitorV1.AddListener(AIntf: IWpIdleInhibitorV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_idle_inhibitor_v1_Listener, @FUserDataRec);
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
    (@wp_idle_inhibitor_v1_interface),
    (@wl_surface_interface)
  );

  wp_idle_inhibit_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'create_inhibitor'; signature: 'no'; types: @pInterfaces[8])
  );
  wp_idle_inhibitor_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );

initialization


  wp_idle_inhibit_manager_v1_interface.name := PChar(WP_IDLE_INHIBIT_MANAGER_V1_INTERFACE_NAME);
  wp_idle_inhibit_manager_v1_interface.version := 1;
  wp_idle_inhibit_manager_v1_interface.method_count := 2;
  wp_idle_inhibit_manager_v1_interface.methods := @wp_idle_inhibit_manager_v1_requests;
  wp_idle_inhibit_manager_v1_interface.event_count := 0;
  wp_idle_inhibit_manager_v1_interface.events := nil;

  wp_idle_inhibitor_v1_interface.name := PChar(WP_IDLE_INHIBITOR_V1_INTERFACE_NAME);
  wp_idle_inhibitor_v1_interface.version := 1;
  wp_idle_inhibitor_v1_interface.method_count := 1;
  wp_idle_inhibitor_v1_interface.methods := @wp_idle_inhibitor_v1_requests;
  wp_idle_inhibitor_v1_interface.event_count := 0;
  wp_idle_inhibitor_v1_interface.events := nil;

end.
