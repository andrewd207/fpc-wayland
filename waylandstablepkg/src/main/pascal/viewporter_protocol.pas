unit viewporter_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_viewporter = Pointer;
  Pwp_viewport = Pointer;
const
  WP_VIEWPORTER_ERROR_VIEWPORT_EXISTS = 0; // the surface already has a viewport object associated

type
  Pwp_viewporter_listener = ^Twp_viewporter_listener;
  Twp_viewporter_listener = record
  end;

const
  WP_VIEWPORT_ERROR_BAD_VALUE = 0; // negative or zero values in width or height
  WP_VIEWPORT_ERROR_BAD_SIZE = 1; // destination size is not integer
  WP_VIEWPORT_ERROR_OUT_OF_BUFFER = 2; // source rectangle extends outside of the content area
  WP_VIEWPORT_ERROR_NO_SURFACE = 3; // the wl_surface was destroyed

type
  Pwp_viewport_listener = ^Twp_viewport_listener;
  Twp_viewport_listener = record
  end;



  TWpViewporter = class;
  TWpViewport = class;


  IWpViewporterListener = interface
  ['IWpViewporterListener']
  end;

  IWpViewportListener = interface
  ['IWpViewportListener']
  end;




  TWpViewporter = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpViewporter;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_VIEWPORT = 1;
  public
    destructor Destroy; override;
    function GetViewport(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpViewport}): TWpViewport;
    function AddListener(AIntf: IWpViewporterListener): LongInt;
  end;

  TWpViewport = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpViewport;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _SET_SOURCE = 1;
    const _SET_DESTINATION = 2;
  public
    destructor Destroy; override;
    procedure SetSource(AX: Twl_fixed; AY: Twl_fixed; AWidth: Twl_fixed; AHeight: Twl_fixed);
    procedure SetDestination(AWidth: LongInt; AHeight: LongInt);
    function AddListener(AIntf: IWpViewportListener): LongInt;
  end;






var
  wp_viewporter_interface: Twl_interface;
  WP_VIEWPORTER_INTERFACE_NAME: String = 'wp_viewporter';
  wp_viewport_interface: Twl_interface;
  WP_VIEWPORT_INTERFACE_NAME: String = 'wp_viewport';



implementation

var
  vwp_viewporter_registered: Boolean = False;
  vIntf_wp_viewporter_Listener: Twp_viewporter_listener;
  vwp_viewport_registered: Boolean = False;
  vIntf_wp_viewport_Listener: Twp_viewport_listener;



constructor TWpViewporter.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpViewporter.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpViewporter;
begin
  RegisterInterface;
  Result := TWpViewporter.Create(ARegistry.Bind(AName, @wp_viewporter_interface, AVersion));
end;

destructor TWpViewporter.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpViewporter.GetViewport(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpViewport}): TWpViewport;
var
  id: Pwl_proxy;
begin
  TWpViewport.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_VIEWPORT, @wp_viewport_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpViewport;
  Result := TWpViewport(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpViewport) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpViewport]);
end;

function TWpViewporter.AddListener(AIntf: IWpViewporterListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_viewporter_Listener, @FUserDataRec);
end;
constructor TWpViewport.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpViewport.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpViewport;
begin
  RegisterInterface;
  Result := TWpViewport.Create(ARegistry.Bind(AName, @wp_viewport_interface, AVersion));
end;

destructor TWpViewport.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWpViewport.SetSource(AX: Twl_fixed; AY: Twl_fixed; AWidth: Twl_fixed; AHeight: Twl_fixed);
begin
  wl_proxy_marshal(FProxy, _SET_SOURCE, AX.AsFixed24_8, AY.AsFixed24_8, AWidth.AsFixed24_8, AHeight.AsFixed24_8);
end;

procedure TWpViewport.SetDestination(AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _SET_DESTINATION, AWidth, AHeight);
end;

function TWpViewport.AddListener(AIntf: IWpViewportListener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_viewport_Listener, @FUserDataRec);
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
    (@wp_viewport_interface),
    (@wl_surface_interface)
  );

  wp_viewporter_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_viewport'; signature: 'no'; types: @pInterfaces[8])
  );
  wp_viewport_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_source'; signature: 'ffff'; types: @pInterfaces[0]),
    (name: 'set_destination'; signature: 'ii'; types: @pInterfaces[0])
  );

class procedure TWpViewporter.RegisterInterface;
begin
  if vwp_viewporter_registered then Exit;
  vwp_viewporter_registered := True;
  wp_viewporter_interface.name := PChar(WP_VIEWPORTER_INTERFACE_NAME);
  wp_viewporter_interface.version := 1;
  wp_viewporter_interface.method_count := 2;
  wp_viewporter_interface.methods := @wp_viewporter_requests;
  wp_viewporter_interface.event_count := 0;
  wp_viewporter_interface.events := nil;
end;

class procedure TWpViewport.RegisterInterface;
begin
  if vwp_viewport_registered then Exit;
  vwp_viewport_registered := True;
  wp_viewport_interface.name := PChar(WP_VIEWPORT_INTERFACE_NAME);
  wp_viewport_interface.version := 1;
  wp_viewport_interface.method_count := 3;
  wp_viewport_interface.methods := @wp_viewport_requests;
  wp_viewport_interface.event_count := 0;
  wp_viewport_interface.events := nil;
end;


end.
