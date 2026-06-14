unit fractional_scale_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_fractional_scale_manager_v1 = Pointer;
  Pwp_fractional_scale_v1 = Pointer;
const
  WP_FRACTIONAL_SCALE_MANAGER_V1_ERROR_FRACTIONAL_SCALE_EXISTS = 0; // the surface already has a fractional_scale object associated

type
  Pwp_fractional_scale_manager_v1_listener = ^Twp_fractional_scale_manager_v1_listener;
  Twp_fractional_scale_manager_v1_listener = record
  end;

  Pwp_fractional_scale_v1_listener = ^Twp_fractional_scale_v1_listener;
  Twp_fractional_scale_v1_listener = record
    preferred_scale : procedure(data: Pointer; AWpFractionalScaleV1: Pwp_fractional_scale_v1; AScale: DWord); cdecl;
  end;



  TWpFractionalScaleManagerV1 = class;
  TWpFractionalScaleV1 = class;


  IWpFractionalScaleManagerV1Listener = interface
  ['IWpFractionalScaleManagerV1Listener']
  end;

  IWpFractionalScaleV1Listener = interface
  ['IWpFractionalScaleV1Listener']
    procedure wp_fractional_scale_v1_preferred_scale(AWpFractionalScaleV1: TWpFractionalScaleV1; AScale: DWord);
  end;




  TWpFractionalScaleManagerV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_FRACTIONAL_SCALE = 1;
  public
    destructor Destroy; override;
    function GetFractionalScale(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpFractionalScaleV1}): TWpFractionalScaleV1;
    function AddListener(AIntf: IWpFractionalScaleManagerV1Listener): LongInt;
  end;

  TWpFractionalScaleV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpFractionalScaleV1Listener): LongInt;
  end;



procedure InitInterfaces;



var
  wp_fractional_scale_manager_v1_interface: Twl_interface;
  WP_FRACTIONAL_SCALE_MANAGER_V1_INTERFACE_NAME: String = 'wp_fractional_scale_manager_v1';
  wp_fractional_scale_v1_interface: Twl_interface;
  WP_FRACTIONAL_SCALE_V1_INTERFACE_NAME: String = 'wp_fractional_scale_v1';



implementation

var
  vIntf_wp_fractional_scale_manager_v1_Listener: Twp_fractional_scale_manager_v1_listener;
  vIntf_wp_fractional_scale_v1_Listener: Twp_fractional_scale_v1_listener;
  vInterfacesRegistered: Boolean = False;



constructor TWpFractionalScaleManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TWpFractionalScaleManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpFractionalScaleManagerV1.GetFractionalScale(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpFractionalScaleV1}): TWpFractionalScaleV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_FRACTIONAL_SCALE, @wp_fractional_scale_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpFractionalScaleV1;
  Result := TWpFractionalScaleV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpFractionalScaleV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpFractionalScaleV1]);
end;

function TWpFractionalScaleManagerV1.AddListener(AIntf: IWpFractionalScaleManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_fractional_scale_manager_v1_Listener, @FUserDataRec);
end;
constructor TWpFractionalScaleV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TWpFractionalScaleV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpFractionalScaleV1.AddListener(AIntf: IWpFractionalScaleV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_fractional_scale_v1_Listener, @FUserDataRec);
end;




procedure wp_fractional_scale_v1_preferred_scale_Intf(AData: PWLUserData; Awp_fractional_scale_v1: Pwp_fractional_scale_v1; AScale: DWord); cdecl;
var
  AIntf: IWpFractionalScaleV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpFractionalScaleV1Listener(AData^.ListenerUserData);
  AIntf.wp_fractional_scale_v1_preferred_scale(TWpFractionalScaleV1(AData^.PascalObject), AScale);
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
    (@wp_fractional_scale_v1_interface),
    (@wl_surface_interface)
  );

  wp_fractional_scale_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_fractional_scale'; signature: 'no'; types: @pInterfaces[8])
  );
  wp_fractional_scale_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_fractional_scale_v1_events: array[0..0] of Twl_message = (
    (name: 'preferred_scale'; signature: 'u'; types: @pInterfaces[0])
  );

procedure InitInterfaces;
begin
  if vInterfacesRegistered then Exit;
  vInterfacesRegistered := True;
  Pointer(vIntf_wp_fractional_scale_v1_Listener.preferred_scale) := @wp_fractional_scale_v1_preferred_scale_Intf;


  wp_fractional_scale_manager_v1_interface.name := PChar(WP_FRACTIONAL_SCALE_MANAGER_V1_INTERFACE_NAME);
  wp_fractional_scale_manager_v1_interface.version := 1;
  wp_fractional_scale_manager_v1_interface.method_count := 2;
  wp_fractional_scale_manager_v1_interface.methods := @wp_fractional_scale_manager_v1_requests;
  wp_fractional_scale_manager_v1_interface.event_count := 0;
  wp_fractional_scale_manager_v1_interface.events := nil;

  wp_fractional_scale_v1_interface.name := PChar(WP_FRACTIONAL_SCALE_V1_INTERFACE_NAME);
  wp_fractional_scale_v1_interface.version := 1;
  wp_fractional_scale_v1_interface.method_count := 1;
  wp_fractional_scale_v1_interface.methods := @wp_fractional_scale_v1_requests;
  wp_fractional_scale_v1_interface.event_count := 1;
  wp_fractional_scale_v1_interface.events := @wp_fractional_scale_v1_events;

end;

end.
