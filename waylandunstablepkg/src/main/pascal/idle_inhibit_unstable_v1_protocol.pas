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
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpIdleInhibitManagerV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _CREATE_INHIBITOR = 1;
  public
    destructor Destroy; override;
    function CreateInhibitor(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpIdleInhibitorV1}): TWpIdleInhibitorV1;
    function AddListener(AIntf: IWpIdleInhibitManagerV1Listener): LongInt;
  end;

  TWpIdleInhibitorV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpIdleInhibitorV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
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
  vwp_idle_inhibit_manager_v1_registered: Boolean = False;
  vIntf_wp_idle_inhibit_manager_v1_Listener: Twp_idle_inhibit_manager_v1_listener;
  vwp_idle_inhibitor_v1_registered: Boolean = False;
  vIntf_wp_idle_inhibitor_v1_Listener: Twp_idle_inhibitor_v1_listener;



constructor TWpIdleInhibitManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpIdleInhibitManagerV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpIdleInhibitManagerV1;
begin
  RegisterInterface;
  Result := TWpIdleInhibitManagerV1.Create(ARegistry.Bind(AName, @wp_idle_inhibit_manager_v1_interface, AVersion));
end;

destructor TWpIdleInhibitManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpIdleInhibitManagerV1.CreateInhibitor(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpIdleInhibitorV1}): TWpIdleInhibitorV1;
var
  id: Pwl_proxy;
begin
  TWpIdleInhibitorV1.RegisterInterface;
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
constructor TWpIdleInhibitorV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpIdleInhibitorV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpIdleInhibitorV1;
begin
  RegisterInterface;
  Result := TWpIdleInhibitorV1.Create(ARegistry.Bind(AName, @wp_idle_inhibitor_v1_interface, AVersion));
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

class procedure TWpIdleInhibitManagerV1.RegisterInterface;
begin
  if vwp_idle_inhibit_manager_v1_registered then Exit;
  vwp_idle_inhibit_manager_v1_registered := True;
  wp_idle_inhibit_manager_v1_interface.name := PChar(WP_IDLE_INHIBIT_MANAGER_V1_INTERFACE_NAME);
  wp_idle_inhibit_manager_v1_interface.version := 1;
  wp_idle_inhibit_manager_v1_interface.method_count := 2;
  wp_idle_inhibit_manager_v1_interface.methods := @wp_idle_inhibit_manager_v1_requests;
  wp_idle_inhibit_manager_v1_interface.event_count := 0;
  wp_idle_inhibit_manager_v1_interface.events := nil;
end;

class procedure TWpIdleInhibitorV1.RegisterInterface;
begin
  if vwp_idle_inhibitor_v1_registered then Exit;
  vwp_idle_inhibitor_v1_registered := True;
  wp_idle_inhibitor_v1_interface.name := PChar(WP_IDLE_INHIBITOR_V1_INTERFACE_NAME);
  wp_idle_inhibitor_v1_interface.version := 1;
  wp_idle_inhibitor_v1_interface.method_count := 1;
  wp_idle_inhibitor_v1_interface.methods := @wp_idle_inhibitor_v1_requests;
  wp_idle_inhibitor_v1_interface.event_count := 0;
  wp_idle_inhibitor_v1_interface.events := nil;
end;


end.
