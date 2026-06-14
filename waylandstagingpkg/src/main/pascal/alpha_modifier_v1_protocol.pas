unit alpha_modifier_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_alpha_modifier_v1 = Pointer;
  Pwp_alpha_modifier_surface_v1 = Pointer;
const
  WP_ALPHA_MODIFIER_V1_ERROR_ALREADY_CONSTRUCTED = 0; // wl_surface already has a alpha modifier object

type
  Pwp_alpha_modifier_v1_listener = ^Twp_alpha_modifier_v1_listener;
  Twp_alpha_modifier_v1_listener = record
  end;

const
  WP_ALPHA_MODIFIER_SURFACE_V1_ERROR_NO_SURFACE = 0; // wl_surface was destroyed

type
  Pwp_alpha_modifier_surface_v1_listener = ^Twp_alpha_modifier_surface_v1_listener;
  Twp_alpha_modifier_surface_v1_listener = record
  end;



  TWpAlphaModifierV1 = class;
  TWpAlphaModifierSurfaceV1 = class;


  IWpAlphaModifierV1Listener = interface
  ['IWpAlphaModifierV1Listener']
  end;

  IWpAlphaModifierSurfaceV1Listener = interface
  ['IWpAlphaModifierSurfaceV1Listener']
  end;




  TWpAlphaModifierV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_SURFACE = 1;
  public
    destructor Destroy; override;
    function GetSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpAlphaModifierSurfaceV1}): TWpAlphaModifierSurfaceV1;
    function AddListener(AIntf: IWpAlphaModifierV1Listener): LongInt;
  end;

  TWpAlphaModifierSurfaceV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _SET_MULTIPLIER = 1;
  public
    destructor Destroy; override;
    procedure SetMultiplier(AFactor: DWord);
    function AddListener(AIntf: IWpAlphaModifierSurfaceV1Listener): LongInt;
  end;






var
  wp_alpha_modifier_v1_interface: Twl_interface;
  WP_ALPHA_MODIFIER_V1_INTERFACE_NAME: String = 'wp_alpha_modifier_v1';
  wp_alpha_modifier_surface_v1_interface: Twl_interface;
  WP_ALPHA_MODIFIER_SURFACE_V1_INTERFACE_NAME: String = 'wp_alpha_modifier_surface_v1';



implementation

var
  vIntf_wp_alpha_modifier_v1_Listener: Twp_alpha_modifier_v1_listener;
  vIntf_wp_alpha_modifier_surface_v1_Listener: Twp_alpha_modifier_surface_v1_listener;



destructor TWpAlphaModifierV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpAlphaModifierV1.GetSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpAlphaModifierSurfaceV1}): TWpAlphaModifierSurfaceV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_SURFACE, @wp_alpha_modifier_surface_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpAlphaModifierSurfaceV1;
  Result := TWpAlphaModifierSurfaceV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpAlphaModifierSurfaceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpAlphaModifierSurfaceV1]);
end;

function TWpAlphaModifierV1.AddListener(AIntf: IWpAlphaModifierV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_alpha_modifier_v1_Listener, @FUserDataRec);
end;
destructor TWpAlphaModifierSurfaceV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWpAlphaModifierSurfaceV1.SetMultiplier(AFactor: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_MULTIPLIER, AFactor);
end;

function TWpAlphaModifierSurfaceV1.AddListener(AIntf: IWpAlphaModifierSurfaceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_alpha_modifier_surface_v1_Listener, @FUserDataRec);
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
    (@wp_alpha_modifier_surface_v1_interface),
    (@wl_surface_interface)
  );

  wp_alpha_modifier_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_surface'; signature: 'no'; types: @pInterfaces[8])
  );
  wp_alpha_modifier_surface_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_multiplier'; signature: 'u'; types: @pInterfaces[0])
  );

initialization


  wp_alpha_modifier_v1_interface.name := PChar(WP_ALPHA_MODIFIER_V1_INTERFACE_NAME);
  wp_alpha_modifier_v1_interface.version := 1;
  wp_alpha_modifier_v1_interface.method_count := 2;
  wp_alpha_modifier_v1_interface.methods := @wp_alpha_modifier_v1_requests;
  wp_alpha_modifier_v1_interface.event_count := 0;
  wp_alpha_modifier_v1_interface.events := nil;

  wp_alpha_modifier_surface_v1_interface.name := PChar(WP_ALPHA_MODIFIER_SURFACE_V1_INTERFACE_NAME);
  wp_alpha_modifier_surface_v1_interface.version := 1;
  wp_alpha_modifier_surface_v1_interface.method_count := 2;
  wp_alpha_modifier_surface_v1_interface.methods := @wp_alpha_modifier_surface_v1_requests;
  wp_alpha_modifier_surface_v1_interface.event_count := 0;
  wp_alpha_modifier_surface_v1_interface.events := nil;

end.
