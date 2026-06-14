unit tearing_control_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_tearing_control_manager_v1 = Pointer;
  Pwp_tearing_control_v1 = Pointer;
const
  WP_TEARING_CONTROL_MANAGER_V1_ERROR_TEARING_CONTROL_EXISTS = 0; // the surface already has a tearing object associated

type
  Pwp_tearing_control_manager_v1_listener = ^Twp_tearing_control_manager_v1_listener;
  Twp_tearing_control_manager_v1_listener = record
  end;

const
  WP_TEARING_CONTROL_V1_PRESENTATION_HINT_VSYNC = 0; // 
  WP_TEARING_CONTROL_V1_PRESENTATION_HINT_ASYNC = 1; // 

type
  Pwp_tearing_control_v1_listener = ^Twp_tearing_control_v1_listener;
  Twp_tearing_control_v1_listener = record
  end;



  TWpTearingControlManagerV1 = class;
  TWpTearingControlV1 = class;


  IWpTearingControlManagerV1Listener = interface
  ['IWpTearingControlManagerV1Listener']
  end;

  IWpTearingControlV1Listener = interface
  ['IWpTearingControlV1Listener']
  end;




  TWpTearingControlManagerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_TEARING_CONTROL = 1;
  public
    destructor Destroy; override;
    function GetTearingControl(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpTearingControlV1}): TWpTearingControlV1;
    function AddListener(AIntf: IWpTearingControlManagerV1Listener): LongInt;
  end;

  TWpTearingControlV1 = class(TWLProxyObject)
  private
    const _SET_PRESENTATION_HINT = 0;
    const _DESTROY = 1;
  public
    procedure SetPresentationHint(AHint: DWord);
    destructor Destroy; override;
    function AddListener(AIntf: IWpTearingControlV1Listener): LongInt;
  end;






var
  wp_tearing_control_manager_v1_interface: Twl_interface;
  WP_TEARING_CONTROL_MANAGER_V1_INTERFACE_NAME: String = 'wp_tearing_control_manager_v1';
  wp_tearing_control_v1_interface: Twl_interface;
  WP_TEARING_CONTROL_V1_INTERFACE_NAME: String = 'wp_tearing_control_v1';



implementation

var
  vIntf_wp_tearing_control_manager_v1_Listener: Twp_tearing_control_manager_v1_listener;
  vIntf_wp_tearing_control_v1_Listener: Twp_tearing_control_v1_listener;



destructor TWpTearingControlManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpTearingControlManagerV1.GetTearingControl(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpTearingControlV1}): TWpTearingControlV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_TEARING_CONTROL, @wp_tearing_control_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpTearingControlV1;
  Result := TWpTearingControlV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpTearingControlV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpTearingControlV1]);
end;

function TWpTearingControlManagerV1.AddListener(AIntf: IWpTearingControlManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_tearing_control_manager_v1_Listener, @FUserDataRec);
end;
procedure TWpTearingControlV1.SetPresentationHint(AHint: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_PRESENTATION_HINT, AHint);
end;

destructor TWpTearingControlV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpTearingControlV1.AddListener(AIntf: IWpTearingControlV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_tearing_control_v1_Listener, @FUserDataRec);
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
    (@wp_tearing_control_v1_interface),
    (@wl_surface_interface)
  );

  wp_tearing_control_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_tearing_control'; signature: 'no'; types: @pInterfaces[8])
  );
  wp_tearing_control_v1_requests: array[0..1] of Twl_message = (
    (name: 'set_presentation_hint'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );

initialization


  wp_tearing_control_manager_v1_interface.name := PChar(WP_TEARING_CONTROL_MANAGER_V1_INTERFACE_NAME);
  wp_tearing_control_manager_v1_interface.version := 1;
  wp_tearing_control_manager_v1_interface.method_count := 2;
  wp_tearing_control_manager_v1_interface.methods := @wp_tearing_control_manager_v1_requests;
  wp_tearing_control_manager_v1_interface.event_count := 0;
  wp_tearing_control_manager_v1_interface.events := nil;

  wp_tearing_control_v1_interface.name := PChar(WP_TEARING_CONTROL_V1_INTERFACE_NAME);
  wp_tearing_control_v1_interface.version := 1;
  wp_tearing_control_v1_interface.method_count := 2;
  wp_tearing_control_v1_interface.methods := @wp_tearing_control_v1_requests;
  wp_tearing_control_v1_interface.event_count := 0;
  wp_tearing_control_v1_interface.events := nil;

end.
