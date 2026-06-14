unit color_representation_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_color_representation_manager_v1 = Pointer;
  Pwp_color_representation_surface_v1 = Pointer;
const
  WP_COLOR_REPRESENTATION_MANAGER_V1_ERROR_SURFACE_EXISTS = 1; // color representation surface exists already

type
  Pwp_color_representation_manager_v1_listener = ^Twp_color_representation_manager_v1_listener;
  Twp_color_representation_manager_v1_listener = record
    supported_alpha_mode : procedure(data: Pointer; AWpColorRepresentationManagerV1: Pwp_color_representation_manager_v1; AAlphaMode: DWord); cdecl;
    supported_coefficients_and_ranges : procedure(data: Pointer; AWpColorRepresentationManagerV1: Pwp_color_representation_manager_v1; ACoefficients: DWord; ARange: DWord); cdecl;
    done : procedure(data: Pointer; AWpColorRepresentationManagerV1: Pwp_color_representation_manager_v1); cdecl;
  end;

const
  WP_COLOR_REPRESENTATION_SURFACE_V1_ERROR_ALPHA_MODE = 1; // unsupported alpha mode
  WP_COLOR_REPRESENTATION_SURFACE_V1_ERROR_COEFFICIENTS = 2; // unsupported coefficients
  WP_COLOR_REPRESENTATION_SURFACE_V1_ERROR_PIXEL_FORMAT = 3; // the pixel format and a set value are incompatible
  WP_COLOR_REPRESENTATION_SURFACE_V1_ERROR_INERT = 4; // forbidden request on inert object
  WP_COLOR_REPRESENTATION_SURFACE_V1_ALPHA_MODE_PREMULTIPLIED_ELECTRICAL = 0; // 
  WP_COLOR_REPRESENTATION_SURFACE_V1_ALPHA_MODE_PREMULTIPLIED_OPTICAL = 1; // 
  WP_COLOR_REPRESENTATION_SURFACE_V1_ALPHA_MODE_STRAIGHT = 2; // 
  WP_COLOR_REPRESENTATION_SURFACE_V1_COEFFICIENTS_IDENTITY = 1; // 
  WP_COLOR_REPRESENTATION_SURFACE_V1_COEFFICIENTS_BT709 = 2; // 
  WP_COLOR_REPRESENTATION_SURFACE_V1_COEFFICIENTS_FCC = 3; // 
  WP_COLOR_REPRESENTATION_SURFACE_V1_COEFFICIENTS_BT601 = 4; // 
  WP_COLOR_REPRESENTATION_SURFACE_V1_COEFFICIENTS_SMPTE240 = 5; // 
  WP_COLOR_REPRESENTATION_SURFACE_V1_COEFFICIENTS_BT2020 = 6; // 
  WP_COLOR_REPRESENTATION_SURFACE_V1_COEFFICIENTS_BT2020_CL = 7; // 
  WP_COLOR_REPRESENTATION_SURFACE_V1_COEFFICIENTS_ICTCP = 8; // 
  WP_COLOR_REPRESENTATION_SURFACE_V1_RANGE_FULL = 1; // Full color range
  WP_COLOR_REPRESENTATION_SURFACE_V1_RANGE_LIMITED = 2; // Limited color range
  WP_COLOR_REPRESENTATION_SURFACE_V1_CHROMA_LOCATION_TYPE_0 = 1; // 
  WP_COLOR_REPRESENTATION_SURFACE_V1_CHROMA_LOCATION_TYPE_1 = 2; // 
  WP_COLOR_REPRESENTATION_SURFACE_V1_CHROMA_LOCATION_TYPE_2 = 3; // 
  WP_COLOR_REPRESENTATION_SURFACE_V1_CHROMA_LOCATION_TYPE_3 = 4; // 
  WP_COLOR_REPRESENTATION_SURFACE_V1_CHROMA_LOCATION_TYPE_4 = 5; // 
  WP_COLOR_REPRESENTATION_SURFACE_V1_CHROMA_LOCATION_TYPE_5 = 6; // 

type
  Pwp_color_representation_surface_v1_listener = ^Twp_color_representation_surface_v1_listener;
  Twp_color_representation_surface_v1_listener = record
  end;



  TWpColorRepresentationManagerV1 = class;
  TWpColorRepresentationSurfaceV1 = class;


  IWpColorRepresentationManagerV1Listener = interface
  ['IWpColorRepresentationManagerV1Listener']
    procedure wp_color_representation_manager_v1_supported_alpha_mode(AWpColorRepresentationManagerV1: TWpColorRepresentationManagerV1; AAlphaMode: DWord);
    procedure wp_color_representation_manager_v1_supported_coefficients_and_ranges(AWpColorRepresentationManagerV1: TWpColorRepresentationManagerV1; ACoefficients: DWord; ARange: DWord);
    procedure wp_color_representation_manager_v1_done(AWpColorRepresentationManagerV1: TWpColorRepresentationManagerV1);
  end;

  IWpColorRepresentationSurfaceV1Listener = interface
  ['IWpColorRepresentationSurfaceV1Listener']
  end;




  TWpColorRepresentationManagerV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpColorRepresentationManagerV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_SURFACE = 1;
  public
    destructor Destroy; override;
    function GetSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpColorRepresentationSurfaceV1}): TWpColorRepresentationSurfaceV1;
    function AddListener(AIntf: IWpColorRepresentationManagerV1Listener): LongInt;
  end;

  TWpColorRepresentationSurfaceV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpColorRepresentationSurfaceV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _SET_ALPHA_MODE = 1;
    const _SET_COEFFICIENTS_AND_RANGE = 2;
    const _SET_CHROMA_LOCATION = 3;
  public
    destructor Destroy; override;
    procedure SetAlphaMode(AAlphaMode: DWord);
    procedure SetCoefficientsAndRange(ACoefficients: DWord; ARange: DWord);
    procedure SetChromaLocation(AChromaLocation: DWord);
    function AddListener(AIntf: IWpColorRepresentationSurfaceV1Listener): LongInt;
  end;






var
  wp_color_representation_manager_v1_interface: Twl_interface;
  WP_COLOR_REPRESENTATION_MANAGER_V1_INTERFACE_NAME: String = 'wp_color_representation_manager_v1';
  wp_color_representation_surface_v1_interface: Twl_interface;
  WP_COLOR_REPRESENTATION_SURFACE_V1_INTERFACE_NAME: String = 'wp_color_representation_surface_v1';



implementation

var
  vwp_color_representation_manager_v1_registered: Boolean = False;
  vIntf_wp_color_representation_manager_v1_Listener: Twp_color_representation_manager_v1_listener;
  vwp_color_representation_surface_v1_registered: Boolean = False;
  vIntf_wp_color_representation_surface_v1_Listener: Twp_color_representation_surface_v1_listener;



constructor TWpColorRepresentationManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpColorRepresentationManagerV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpColorRepresentationManagerV1;
begin
  RegisterInterface;
  Result := TWpColorRepresentationManagerV1.Create(ARegistry.Bind(AName, @wp_color_representation_manager_v1_interface, AVersion));
end;

destructor TWpColorRepresentationManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpColorRepresentationManagerV1.GetSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpColorRepresentationSurfaceV1}): TWpColorRepresentationSurfaceV1;
var
  id: Pwl_proxy;
begin
  TWpColorRepresentationSurfaceV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_SURFACE, @wp_color_representation_surface_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpColorRepresentationSurfaceV1;
  Result := TWpColorRepresentationSurfaceV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpColorRepresentationSurfaceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpColorRepresentationSurfaceV1]);
end;

function TWpColorRepresentationManagerV1.AddListener(AIntf: IWpColorRepresentationManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_color_representation_manager_v1_Listener, @FUserDataRec);
end;
constructor TWpColorRepresentationSurfaceV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpColorRepresentationSurfaceV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpColorRepresentationSurfaceV1;
begin
  RegisterInterface;
  Result := TWpColorRepresentationSurfaceV1.Create(ARegistry.Bind(AName, @wp_color_representation_surface_v1_interface, AVersion));
end;

destructor TWpColorRepresentationSurfaceV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWpColorRepresentationSurfaceV1.SetAlphaMode(AAlphaMode: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_ALPHA_MODE, AAlphaMode);
end;

procedure TWpColorRepresentationSurfaceV1.SetCoefficientsAndRange(ACoefficients: DWord; ARange: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_COEFFICIENTS_AND_RANGE, ACoefficients, ARange);
end;

procedure TWpColorRepresentationSurfaceV1.SetChromaLocation(AChromaLocation: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_CHROMA_LOCATION, AChromaLocation);
end;

function TWpColorRepresentationSurfaceV1.AddListener(AIntf: IWpColorRepresentationSurfaceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_color_representation_surface_v1_Listener, @FUserDataRec);
end;




procedure wp_color_representation_manager_v1_supported_alpha_mode_Intf(AData: PWLUserData; Awp_color_representation_manager_v1: Pwp_color_representation_manager_v1; AAlphaMode: DWord); cdecl;
var
  AIntf: IWpColorRepresentationManagerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpColorRepresentationManagerV1Listener(AData^.ListenerUserData);
  AIntf.wp_color_representation_manager_v1_supported_alpha_mode(TWpColorRepresentationManagerV1(AData^.PascalObject), AAlphaMode);
end;

procedure wp_color_representation_manager_v1_supported_coefficients_and_ranges_Intf(AData: PWLUserData; Awp_color_representation_manager_v1: Pwp_color_representation_manager_v1; ACoefficients: DWord; ARange: DWord); cdecl;
var
  AIntf: IWpColorRepresentationManagerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpColorRepresentationManagerV1Listener(AData^.ListenerUserData);
  AIntf.wp_color_representation_manager_v1_supported_coefficients_and_ranges(TWpColorRepresentationManagerV1(AData^.PascalObject), ACoefficients, ARange);
end;

procedure wp_color_representation_manager_v1_done_Intf(AData: PWLUserData; Awp_color_representation_manager_v1: Pwp_color_representation_manager_v1); cdecl;
var
  AIntf: IWpColorRepresentationManagerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpColorRepresentationManagerV1Listener(AData^.ListenerUserData);
  AIntf.wp_color_representation_manager_v1_done(TWpColorRepresentationManagerV1(AData^.PascalObject));
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
    (@wp_color_representation_surface_v1_interface),
    (@wl_surface_interface)
  );

  wp_color_representation_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_surface'; signature: 'no'; types: @pInterfaces[8])
  );
  wp_color_representation_manager_v1_events: array[0..2] of Twl_message = (
    (name: 'supported_alpha_mode'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'supported_coefficients_and_ranges'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0])
  );
  wp_color_representation_surface_v1_requests: array[0..3] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_alpha_mode'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'set_coefficients_and_range'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'set_chroma_location'; signature: 'u'; types: @pInterfaces[0])
  );

class procedure TWpColorRepresentationManagerV1.RegisterInterface;
begin
  if vwp_color_representation_manager_v1_registered then Exit;
  vwp_color_representation_manager_v1_registered := True;
  Pointer(vIntf_wp_color_representation_manager_v1_Listener.supported_alpha_mode) := @wp_color_representation_manager_v1_supported_alpha_mode_Intf;
  Pointer(vIntf_wp_color_representation_manager_v1_Listener.supported_coefficients_and_ranges) := @wp_color_representation_manager_v1_supported_coefficients_and_ranges_Intf;
  Pointer(vIntf_wp_color_representation_manager_v1_Listener.done) := @wp_color_representation_manager_v1_done_Intf;
  wp_color_representation_manager_v1_interface.name := PChar(WP_COLOR_REPRESENTATION_MANAGER_V1_INTERFACE_NAME);
  wp_color_representation_manager_v1_interface.version := 1;
  wp_color_representation_manager_v1_interface.method_count := 2;
  wp_color_representation_manager_v1_interface.methods := @wp_color_representation_manager_v1_requests;
  wp_color_representation_manager_v1_interface.event_count := 3;
  wp_color_representation_manager_v1_interface.events := @wp_color_representation_manager_v1_events;
end;

class procedure TWpColorRepresentationSurfaceV1.RegisterInterface;
begin
  if vwp_color_representation_surface_v1_registered then Exit;
  vwp_color_representation_surface_v1_registered := True;
  wp_color_representation_surface_v1_interface.name := PChar(WP_COLOR_REPRESENTATION_SURFACE_V1_INTERFACE_NAME);
  wp_color_representation_surface_v1_interface.version := 1;
  wp_color_representation_surface_v1_interface.method_count := 4;
  wp_color_representation_surface_v1_interface.methods := @wp_color_representation_surface_v1_requests;
  wp_color_representation_surface_v1_interface.event_count := 0;
  wp_color_representation_surface_v1_interface.events := nil;
end;


end.
