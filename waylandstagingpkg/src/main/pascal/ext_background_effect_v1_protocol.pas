unit ext_background_effect_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pext_background_effect_manager_v1 = Pointer;
  Pext_background_effect_surface_v1 = Pointer;
const
  EXT_BACKGROUND_EFFECT_MANAGER_V1_ERROR_BACKGROUND_EFFECT_EXISTS = 0; // the surface already has a background effect object
  EXT_BACKGROUND_EFFECT_MANAGER_V1_CAPABILITY_BLUR = 0; // the compositor supports applying blur

type
  Pext_background_effect_manager_v1_listener = ^Text_background_effect_manager_v1_listener;
  Text_background_effect_manager_v1_listener = record
    capabilities : procedure(data: Pointer; AExtBackgroundEffectManagerV1: Pext_background_effect_manager_v1; AFlags: DWord); cdecl;
  end;

const
  EXT_BACKGROUND_EFFECT_SURFACE_V1_ERROR_SURFACE_DESTROYED = 0; // the associated surface has been destroyed

type
  Pext_background_effect_surface_v1_listener = ^Text_background_effect_surface_v1_listener;
  Text_background_effect_surface_v1_listener = record
  end;



  TExtBackgroundEffectManagerV1 = class;
  TExtBackgroundEffectSurfaceV1 = class;


  IExtBackgroundEffectManagerV1Listener = interface
  ['IExtBackgroundEffectManagerV1Listener']
    procedure ext_background_effect_manager_v1_capabilities(AExtBackgroundEffectManagerV1: TExtBackgroundEffectManagerV1; AFlags: DWord);
  end;

  IExtBackgroundEffectSurfaceV1Listener = interface
  ['IExtBackgroundEffectSurfaceV1Listener']
  end;




  TExtBackgroundEffectManagerV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtBackgroundEffectManagerV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_BACKGROUND_EFFECT = 1;
  public
    destructor Destroy; override;
    function GetBackgroundEffect(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TExtBackgroundEffectSurfaceV1}): TExtBackgroundEffectSurfaceV1;
    function AddListener(AIntf: IExtBackgroundEffectManagerV1Listener): LongInt;
  end;

  TExtBackgroundEffectSurfaceV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtBackgroundEffectSurfaceV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _SET_BLUR_REGION = 1;
  public
    destructor Destroy; override;
    procedure SetBlurRegion(ARegion: TWlRegion);
    function AddListener(AIntf: IExtBackgroundEffectSurfaceV1Listener): LongInt;
  end;






var
  ext_background_effect_manager_v1_interface: Twl_interface;
  EXT_BACKGROUND_EFFECT_MANAGER_V1_INTERFACE_NAME: String = 'ext_background_effect_manager_v1';
  ext_background_effect_surface_v1_interface: Twl_interface;
  EXT_BACKGROUND_EFFECT_SURFACE_V1_INTERFACE_NAME: String = 'ext_background_effect_surface_v1';



implementation

var
  vext_background_effect_manager_v1_registered: Boolean = False;
  vIntf_ext_background_effect_manager_v1_Listener: Text_background_effect_manager_v1_listener;
  vext_background_effect_surface_v1_registered: Boolean = False;
  vIntf_ext_background_effect_surface_v1_Listener: Text_background_effect_surface_v1_listener;



constructor TExtBackgroundEffectManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TExtBackgroundEffectManagerV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtBackgroundEffectManagerV1;
begin
  RegisterInterface;
  Result := TExtBackgroundEffectManagerV1.Create(ARegistry.Bind(AName, @ext_background_effect_manager_v1_interface, AVersion));
end;

destructor TExtBackgroundEffectManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtBackgroundEffectManagerV1.GetBackgroundEffect(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TExtBackgroundEffectSurfaceV1}): TExtBackgroundEffectSurfaceV1;
var
  id: Pwl_proxy;
begin
  TExtBackgroundEffectSurfaceV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_BACKGROUND_EFFECT, @ext_background_effect_surface_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TExtBackgroundEffectSurfaceV1;
  Result := TExtBackgroundEffectSurfaceV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TExtBackgroundEffectSurfaceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TExtBackgroundEffectSurfaceV1]);
end;

function TExtBackgroundEffectManagerV1.AddListener(AIntf: IExtBackgroundEffectManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_background_effect_manager_v1_Listener, @FUserDataRec);
end;
constructor TExtBackgroundEffectSurfaceV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TExtBackgroundEffectSurfaceV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtBackgroundEffectSurfaceV1;
begin
  RegisterInterface;
  Result := TExtBackgroundEffectSurfaceV1.Create(ARegistry.Bind(AName, @ext_background_effect_surface_v1_interface, AVersion));
end;

destructor TExtBackgroundEffectSurfaceV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TExtBackgroundEffectSurfaceV1.SetBlurRegion(ARegion: TWlRegion);
begin
  wl_proxy_marshal(FProxy, _SET_BLUR_REGION, ARegion.Proxy);
end;

function TExtBackgroundEffectSurfaceV1.AddListener(AIntf: IExtBackgroundEffectSurfaceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_background_effect_surface_v1_Listener, @FUserDataRec);
end;




procedure ext_background_effect_manager_v1_capabilities_Intf(AData: PWLUserData; Aext_background_effect_manager_v1: Pext_background_effect_manager_v1; AFlags: DWord); cdecl;
var
  AIntf: IExtBackgroundEffectManagerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtBackgroundEffectManagerV1Listener(AData^.ListenerUserData);
  AIntf.ext_background_effect_manager_v1_capabilities(TExtBackgroundEffectManagerV1(AData^.PascalObject), AFlags);
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
    (@ext_background_effect_surface_v1_interface),
    (@wl_surface_interface),
    (@wl_region_interface)
  );

  ext_background_effect_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_background_effect'; signature: 'no'; types: @pInterfaces[8])
  );
  ext_background_effect_manager_v1_events: array[0..0] of Twl_message = (
    (name: 'capabilities'; signature: 'u'; types: @pInterfaces[0])
  );
  ext_background_effect_surface_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_blur_region'; signature: '?o'; types: @pInterfaces[10])
  );

class procedure TExtBackgroundEffectManagerV1.RegisterInterface;
begin
  if vext_background_effect_manager_v1_registered then Exit;
  vext_background_effect_manager_v1_registered := True;
  Pointer(vIntf_ext_background_effect_manager_v1_Listener.capabilities) := @ext_background_effect_manager_v1_capabilities_Intf;
  ext_background_effect_manager_v1_interface.name := PChar(EXT_BACKGROUND_EFFECT_MANAGER_V1_INTERFACE_NAME);
  ext_background_effect_manager_v1_interface.version := 1;
  ext_background_effect_manager_v1_interface.method_count := 2;
  ext_background_effect_manager_v1_interface.methods := @ext_background_effect_manager_v1_requests;
  ext_background_effect_manager_v1_interface.event_count := 1;
  ext_background_effect_manager_v1_interface.events := @ext_background_effect_manager_v1_events;
end;

class procedure TExtBackgroundEffectSurfaceV1.RegisterInterface;
begin
  if vext_background_effect_surface_v1_registered then Exit;
  vext_background_effect_surface_v1_registered := True;
  ext_background_effect_surface_v1_interface.name := PChar(EXT_BACKGROUND_EFFECT_SURFACE_V1_INTERFACE_NAME);
  ext_background_effect_surface_v1_interface.version := 1;
  ext_background_effect_surface_v1_interface.method_count := 2;
  ext_background_effect_surface_v1_interface.methods := @ext_background_effect_surface_v1_requests;
  ext_background_effect_surface_v1_interface.event_count := 0;
  ext_background_effect_surface_v1_interface.events := nil;
end;


end.
