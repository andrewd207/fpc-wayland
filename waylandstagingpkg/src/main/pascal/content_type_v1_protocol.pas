unit content_type_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_content_type_manager_v1 = Pointer;
  Pwp_content_type_v1 = Pointer;
const
  WP_CONTENT_TYPE_MANAGER_V1_ERROR_ALREADY_CONSTRUCTED = 0; // wl_surface already has a content type object

type
  Pwp_content_type_manager_v1_listener = ^Twp_content_type_manager_v1_listener;
  Twp_content_type_manager_v1_listener = record
  end;

const
  WP_CONTENT_TYPE_V1_TYPE_NONE = 0; // no content type applies
  WP_CONTENT_TYPE_V1_TYPE_PHOTO = 1; // photo content type
  WP_CONTENT_TYPE_V1_TYPE_VIDEO = 2; // video content type
  WP_CONTENT_TYPE_V1_TYPE_GAME = 3; // game content type

type
  Pwp_content_type_v1_listener = ^Twp_content_type_v1_listener;
  Twp_content_type_v1_listener = record
  end;



  TWpContentTypeManagerV1 = class;
  TWpContentTypeV1 = class;


  IWpContentTypeManagerV1Listener = interface
  ['IWpContentTypeManagerV1Listener']
  end;

  IWpContentTypeV1Listener = interface
  ['IWpContentTypeV1Listener']
  end;




  TWpContentTypeManagerV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpContentTypeManagerV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_SURFACE_CONTENT_TYPE = 1;
  public
    destructor Destroy; override;
    function GetSurfaceContentType(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpContentTypeV1}): TWpContentTypeV1;
    function AddListener(AIntf: IWpContentTypeManagerV1Listener): LongInt;
  end;

  TWpContentTypeV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpContentTypeV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _SET_CONTENT_TYPE = 1;
  public
    destructor Destroy; override;
    procedure SetContentType(AContentType: DWord);
    function AddListener(AIntf: IWpContentTypeV1Listener): LongInt;
  end;






var
  wp_content_type_manager_v1_interface: Twl_interface;
  WP_CONTENT_TYPE_MANAGER_V1_INTERFACE_NAME: String = 'wp_content_type_manager_v1';
  wp_content_type_v1_interface: Twl_interface;
  WP_CONTENT_TYPE_V1_INTERFACE_NAME: String = 'wp_content_type_v1';



implementation

var
  vwp_content_type_manager_v1_registered: Boolean = False;
  vIntf_wp_content_type_manager_v1_Listener: Twp_content_type_manager_v1_listener;
  vwp_content_type_v1_registered: Boolean = False;
  vIntf_wp_content_type_v1_Listener: Twp_content_type_v1_listener;



constructor TWpContentTypeManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpContentTypeManagerV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpContentTypeManagerV1;
begin
  RegisterInterface;
  Result := TWpContentTypeManagerV1.Create(ARegistry.Bind(AName, @wp_content_type_manager_v1_interface, AVersion));
end;

destructor TWpContentTypeManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpContentTypeManagerV1.GetSurfaceContentType(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpContentTypeV1}): TWpContentTypeV1;
var
  id: Pwl_proxy;
begin
  TWpContentTypeV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_SURFACE_CONTENT_TYPE, @wp_content_type_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpContentTypeV1;
  Result := TWpContentTypeV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpContentTypeV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpContentTypeV1]);
end;

function TWpContentTypeManagerV1.AddListener(AIntf: IWpContentTypeManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_content_type_manager_v1_Listener, @FUserDataRec);
end;
constructor TWpContentTypeV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpContentTypeV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpContentTypeV1;
begin
  RegisterInterface;
  Result := TWpContentTypeV1.Create(ARegistry.Bind(AName, @wp_content_type_v1_interface, AVersion));
end;

destructor TWpContentTypeV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWpContentTypeV1.SetContentType(AContentType: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_CONTENT_TYPE, AContentType);
end;

function TWpContentTypeV1.AddListener(AIntf: IWpContentTypeV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_content_type_v1_Listener, @FUserDataRec);
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
    (@wp_content_type_v1_interface),
    (@wl_surface_interface)
  );

  wp_content_type_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_surface_content_type'; signature: 'no'; types: @pInterfaces[8])
  );
  wp_content_type_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_content_type'; signature: 'u'; types: @pInterfaces[0])
  );

class procedure TWpContentTypeManagerV1.RegisterInterface;
begin
  if vwp_content_type_manager_v1_registered then Exit;
  vwp_content_type_manager_v1_registered := True;
  wp_content_type_manager_v1_interface.name := PChar(WP_CONTENT_TYPE_MANAGER_V1_INTERFACE_NAME);
  wp_content_type_manager_v1_interface.version := 1;
  wp_content_type_manager_v1_interface.method_count := 2;
  wp_content_type_manager_v1_interface.methods := @wp_content_type_manager_v1_requests;
  wp_content_type_manager_v1_interface.event_count := 0;
  wp_content_type_manager_v1_interface.events := nil;
end;

class procedure TWpContentTypeV1.RegisterInterface;
begin
  if vwp_content_type_v1_registered then Exit;
  vwp_content_type_v1_registered := True;
  wp_content_type_v1_interface.name := PChar(WP_CONTENT_TYPE_V1_INTERFACE_NAME);
  wp_content_type_v1_interface.version := 1;
  wp_content_type_v1_interface.method_count := 2;
  wp_content_type_v1_interface.methods := @wp_content_type_v1_requests;
  wp_content_type_v1_interface.event_count := 0;
  wp_content_type_v1_interface.events := nil;
end;


end.
