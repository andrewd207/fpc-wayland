unit drm_lease_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_drm_lease_device_v1 = Pointer;
  Pwp_drm_lease_connector_v1 = Pointer;
  Pwp_drm_lease_request_v1 = Pointer;
  Pwp_drm_lease_v1 = Pointer;
  Pwp_drm_lease_device_v1_listener = ^Twp_drm_lease_device_v1_listener;
  Twp_drm_lease_device_v1_listener = record
    drm_fd : procedure(data: Pointer; AWpDrmLeaseDeviceV1: Pwp_drm_lease_device_v1; AFd: LongInt{fd}); cdecl;
    connector : procedure(data: Pointer; AWpDrmLeaseDeviceV1: Pwp_drm_lease_device_v1; AId: Pwp_drm_lease_connector_v1); cdecl;
    done : procedure(data: Pointer; AWpDrmLeaseDeviceV1: Pwp_drm_lease_device_v1); cdecl;
    released : procedure(data: Pointer; AWpDrmLeaseDeviceV1: Pwp_drm_lease_device_v1); cdecl;
  end;

  Pwp_drm_lease_connector_v1_listener = ^Twp_drm_lease_connector_v1_listener;
  Twp_drm_lease_connector_v1_listener = record
    name : procedure(data: Pointer; AWpDrmLeaseConnectorV1: Pwp_drm_lease_connector_v1; AName: Pchar); cdecl;
    description : procedure(data: Pointer; AWpDrmLeaseConnectorV1: Pwp_drm_lease_connector_v1; ADescription: Pchar); cdecl;
    connector_id : procedure(data: Pointer; AWpDrmLeaseConnectorV1: Pwp_drm_lease_connector_v1; AConnectorId: DWord); cdecl;
    done : procedure(data: Pointer; AWpDrmLeaseConnectorV1: Pwp_drm_lease_connector_v1); cdecl;
    withdrawn : procedure(data: Pointer; AWpDrmLeaseConnectorV1: Pwp_drm_lease_connector_v1); cdecl;
  end;

const
  WP_DRM_LEASE_REQUEST_V1_ERROR_WRONG_DEVICE = 0; // requested a connector from a different lease device
  WP_DRM_LEASE_REQUEST_V1_ERROR_DUPLICATE_CONNECTOR = 1; // requested a connector twice
  WP_DRM_LEASE_REQUEST_V1_ERROR_EMPTY_LEASE = 2; // requested a lease without requesting a connector

type
  Pwp_drm_lease_request_v1_listener = ^Twp_drm_lease_request_v1_listener;
  Twp_drm_lease_request_v1_listener = record
  end;

  Pwp_drm_lease_v1_listener = ^Twp_drm_lease_v1_listener;
  Twp_drm_lease_v1_listener = record
    lease_fd : procedure(data: Pointer; AWpDrmLeaseV1: Pwp_drm_lease_v1; ALeasedFd: LongInt{fd}); cdecl;
    finished : procedure(data: Pointer; AWpDrmLeaseV1: Pwp_drm_lease_v1); cdecl;
  end;



  TWpDrmLeaseDeviceV1 = class;
  TWpDrmLeaseConnectorV1 = class;
  TWpDrmLeaseRequestV1 = class;
  TWpDrmLeaseV1 = class;


  IWpDrmLeaseDeviceV1Listener = interface
  ['IWpDrmLeaseDeviceV1Listener']
    procedure wp_drm_lease_device_v1_drm_fd(AWpDrmLeaseDeviceV1: TWpDrmLeaseDeviceV1; AFd: LongInt{fd});
    procedure wp_drm_lease_device_v1_connector(AWpDrmLeaseDeviceV1: TWpDrmLeaseDeviceV1; AId: TWpDrmLeaseConnectorV1);
    procedure wp_drm_lease_device_v1_done(AWpDrmLeaseDeviceV1: TWpDrmLeaseDeviceV1);
    procedure wp_drm_lease_device_v1_released(AWpDrmLeaseDeviceV1: TWpDrmLeaseDeviceV1);
  end;

  IWpDrmLeaseConnectorV1Listener = interface
  ['IWpDrmLeaseConnectorV1Listener']
    procedure wp_drm_lease_connector_v1_name(AWpDrmLeaseConnectorV1: TWpDrmLeaseConnectorV1; AName: String);
    procedure wp_drm_lease_connector_v1_description(AWpDrmLeaseConnectorV1: TWpDrmLeaseConnectorV1; ADescription: String);
    procedure wp_drm_lease_connector_v1_connector_id(AWpDrmLeaseConnectorV1: TWpDrmLeaseConnectorV1; AConnectorId: DWord);
    procedure wp_drm_lease_connector_v1_done(AWpDrmLeaseConnectorV1: TWpDrmLeaseConnectorV1);
    procedure wp_drm_lease_connector_v1_withdrawn(AWpDrmLeaseConnectorV1: TWpDrmLeaseConnectorV1);
  end;

  IWpDrmLeaseRequestV1Listener = interface
  ['IWpDrmLeaseRequestV1Listener']
  end;

  IWpDrmLeaseV1Listener = interface
  ['IWpDrmLeaseV1Listener']
    procedure wp_drm_lease_v1_lease_fd(AWpDrmLeaseV1: TWpDrmLeaseV1; ALeasedFd: LongInt{fd});
    procedure wp_drm_lease_v1_finished(AWpDrmLeaseV1: TWpDrmLeaseV1);
  end;




  TWpDrmLeaseDeviceV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpDrmLeaseDeviceV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _CREATE_LEASE_REQUEST = 0;
    const _RELEASE = 1;
  public
    function CreateLeaseRequest(AProxyClass: TWLProxyObjectClass = nil {TWpDrmLeaseRequestV1}): TWpDrmLeaseRequestV1;
    procedure Release;
    function AddListener(AIntf: IWpDrmLeaseDeviceV1Listener): LongInt;
  end;

  TWpDrmLeaseConnectorV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpDrmLeaseConnectorV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpDrmLeaseConnectorV1Listener): LongInt;
  end;

  TWpDrmLeaseRequestV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpDrmLeaseRequestV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _REQUEST_CONNECTOR = 0;
    const _SUBMIT = 1;
  public
    procedure RequestConnector(AConnector: TWpDrmLeaseConnectorV1);
    function Submit(AProxyClass: TWLProxyObjectClass = nil {TWpDrmLeaseV1}): TWpDrmLeaseV1;
    function AddListener(AIntf: IWpDrmLeaseRequestV1Listener): LongInt;
  end;

  TWpDrmLeaseV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpDrmLeaseV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpDrmLeaseV1Listener): LongInt;
  end;






var
  wp_drm_lease_device_v1_interface: Twl_interface;
  WP_DRM_LEASE_DEVICE_V1_INTERFACE_NAME: String = 'wp_drm_lease_device_v1';
  wp_drm_lease_connector_v1_interface: Twl_interface;
  WP_DRM_LEASE_CONNECTOR_V1_INTERFACE_NAME: String = 'wp_drm_lease_connector_v1';
  wp_drm_lease_request_v1_interface: Twl_interface;
  WP_DRM_LEASE_REQUEST_V1_INTERFACE_NAME: String = 'wp_drm_lease_request_v1';
  wp_drm_lease_v1_interface: Twl_interface;
  WP_DRM_LEASE_V1_INTERFACE_NAME: String = 'wp_drm_lease_v1';



implementation

var
  vwp_drm_lease_device_v1_registered: Boolean = False;
  vIntf_wp_drm_lease_device_v1_Listener: Twp_drm_lease_device_v1_listener;
  vwp_drm_lease_connector_v1_registered: Boolean = False;
  vIntf_wp_drm_lease_connector_v1_Listener: Twp_drm_lease_connector_v1_listener;
  vwp_drm_lease_request_v1_registered: Boolean = False;
  vIntf_wp_drm_lease_request_v1_Listener: Twp_drm_lease_request_v1_listener;
  vwp_drm_lease_v1_registered: Boolean = False;
  vIntf_wp_drm_lease_v1_Listener: Twp_drm_lease_v1_listener;



constructor TWpDrmLeaseDeviceV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpDrmLeaseDeviceV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpDrmLeaseDeviceV1;
begin
  RegisterInterface;
  Result := TWpDrmLeaseDeviceV1.Create(ARegistry.Bind(AName, @wp_drm_lease_device_v1_interface, AVersion));
end;

function TWpDrmLeaseDeviceV1.CreateLeaseRequest(AProxyClass: TWLProxyObjectClass = nil {TWpDrmLeaseRequestV1}): TWpDrmLeaseRequestV1;
var
  id: Pwl_proxy;
begin
  TWpDrmLeaseRequestV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_LEASE_REQUEST, @wp_drm_lease_request_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWpDrmLeaseRequestV1;
  Result := TWpDrmLeaseRequestV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpDrmLeaseRequestV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpDrmLeaseRequestV1]);
end;

procedure TWpDrmLeaseDeviceV1.Release;
begin
  wl_proxy_marshal(FProxy, _RELEASE);
end;

function TWpDrmLeaseDeviceV1.AddListener(AIntf: IWpDrmLeaseDeviceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_drm_lease_device_v1_Listener, @FUserDataRec);
end;
constructor TWpDrmLeaseConnectorV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpDrmLeaseConnectorV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpDrmLeaseConnectorV1;
begin
  RegisterInterface;
  Result := TWpDrmLeaseConnectorV1.Create(ARegistry.Bind(AName, @wp_drm_lease_connector_v1_interface, AVersion));
end;

destructor TWpDrmLeaseConnectorV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpDrmLeaseConnectorV1.AddListener(AIntf: IWpDrmLeaseConnectorV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_drm_lease_connector_v1_Listener, @FUserDataRec);
end;
constructor TWpDrmLeaseRequestV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpDrmLeaseRequestV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpDrmLeaseRequestV1;
begin
  RegisterInterface;
  Result := TWpDrmLeaseRequestV1.Create(ARegistry.Bind(AName, @wp_drm_lease_request_v1_interface, AVersion));
end;

procedure TWpDrmLeaseRequestV1.RequestConnector(AConnector: TWpDrmLeaseConnectorV1);
begin
  wl_proxy_marshal(FProxy, _REQUEST_CONNECTOR, AConnector.Proxy);
end;

function TWpDrmLeaseRequestV1.Submit(AProxyClass: TWLProxyObjectClass = nil {TWpDrmLeaseV1}): TWpDrmLeaseV1;
var
  id: Pwl_proxy;
begin
  TWpDrmLeaseV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _SUBMIT, @wp_drm_lease_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWpDrmLeaseV1;
  Result := TWpDrmLeaseV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpDrmLeaseV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpDrmLeaseV1]);
  inherited Destroy;
end;

function TWpDrmLeaseRequestV1.AddListener(AIntf: IWpDrmLeaseRequestV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_drm_lease_request_v1_Listener, @FUserDataRec);
end;
constructor TWpDrmLeaseV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpDrmLeaseV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpDrmLeaseV1;
begin
  RegisterInterface;
  Result := TWpDrmLeaseV1.Create(ARegistry.Bind(AName, @wp_drm_lease_v1_interface, AVersion));
end;

destructor TWpDrmLeaseV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpDrmLeaseV1.AddListener(AIntf: IWpDrmLeaseV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_drm_lease_v1_Listener, @FUserDataRec);
end;




procedure wp_drm_lease_device_v1_drm_fd_Intf(AData: PWLUserData; Awp_drm_lease_device_v1: Pwp_drm_lease_device_v1; AFd: LongInt{fd}); cdecl;
var
  AIntf: IWpDrmLeaseDeviceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpDrmLeaseDeviceV1Listener(AData^.ListenerUserData);
  AIntf.wp_drm_lease_device_v1_drm_fd(TWpDrmLeaseDeviceV1(AData^.PascalObject), AFd);
end;

procedure wp_drm_lease_device_v1_connector_Intf(AData: PWLUserData; Awp_drm_lease_device_v1: Pwp_drm_lease_device_v1; AId: Pwp_drm_lease_connector_v1); cdecl;
var
  AIntf: IWpDrmLeaseDeviceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpDrmLeaseDeviceV1Listener(AData^.ListenerUserData);
  AIntf.wp_drm_lease_device_v1_connector(TWpDrmLeaseDeviceV1(AData^.PascalObject),  TWpDrmLeaseConnectorV1.Create(AId));
end;

procedure wp_drm_lease_device_v1_done_Intf(AData: PWLUserData; Awp_drm_lease_device_v1: Pwp_drm_lease_device_v1); cdecl;
var
  AIntf: IWpDrmLeaseDeviceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpDrmLeaseDeviceV1Listener(AData^.ListenerUserData);
  AIntf.wp_drm_lease_device_v1_done(TWpDrmLeaseDeviceV1(AData^.PascalObject));
end;

procedure wp_drm_lease_device_v1_released_Intf(AData: PWLUserData; Awp_drm_lease_device_v1: Pwp_drm_lease_device_v1); cdecl;
var
  AIntf: IWpDrmLeaseDeviceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpDrmLeaseDeviceV1Listener(AData^.ListenerUserData);
  AIntf.wp_drm_lease_device_v1_released(TWpDrmLeaseDeviceV1(AData^.PascalObject));
end;

procedure wp_drm_lease_connector_v1_name_Intf(AData: PWLUserData; Awp_drm_lease_connector_v1: Pwp_drm_lease_connector_v1; AName: Pchar); cdecl;
var
  AIntf: IWpDrmLeaseConnectorV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpDrmLeaseConnectorV1Listener(AData^.ListenerUserData);
  AIntf.wp_drm_lease_connector_v1_name(TWpDrmLeaseConnectorV1(AData^.PascalObject), AName);
end;

procedure wp_drm_lease_connector_v1_description_Intf(AData: PWLUserData; Awp_drm_lease_connector_v1: Pwp_drm_lease_connector_v1; ADescription: Pchar); cdecl;
var
  AIntf: IWpDrmLeaseConnectorV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpDrmLeaseConnectorV1Listener(AData^.ListenerUserData);
  AIntf.wp_drm_lease_connector_v1_description(TWpDrmLeaseConnectorV1(AData^.PascalObject), ADescription);
end;

procedure wp_drm_lease_connector_v1_connector_id_Intf(AData: PWLUserData; Awp_drm_lease_connector_v1: Pwp_drm_lease_connector_v1; AConnectorId: DWord); cdecl;
var
  AIntf: IWpDrmLeaseConnectorV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpDrmLeaseConnectorV1Listener(AData^.ListenerUserData);
  AIntf.wp_drm_lease_connector_v1_connector_id(TWpDrmLeaseConnectorV1(AData^.PascalObject), AConnectorId);
end;

procedure wp_drm_lease_connector_v1_done_Intf(AData: PWLUserData; Awp_drm_lease_connector_v1: Pwp_drm_lease_connector_v1); cdecl;
var
  AIntf: IWpDrmLeaseConnectorV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpDrmLeaseConnectorV1Listener(AData^.ListenerUserData);
  AIntf.wp_drm_lease_connector_v1_done(TWpDrmLeaseConnectorV1(AData^.PascalObject));
end;

procedure wp_drm_lease_connector_v1_withdrawn_Intf(AData: PWLUserData; Awp_drm_lease_connector_v1: Pwp_drm_lease_connector_v1); cdecl;
var
  AIntf: IWpDrmLeaseConnectorV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpDrmLeaseConnectorV1Listener(AData^.ListenerUserData);
  AIntf.wp_drm_lease_connector_v1_withdrawn(TWpDrmLeaseConnectorV1(AData^.PascalObject));
end;

procedure wp_drm_lease_v1_lease_fd_Intf(AData: PWLUserData; Awp_drm_lease_v1: Pwp_drm_lease_v1; ALeasedFd: LongInt{fd}); cdecl;
var
  AIntf: IWpDrmLeaseV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpDrmLeaseV1Listener(AData^.ListenerUserData);
  AIntf.wp_drm_lease_v1_lease_fd(TWpDrmLeaseV1(AData^.PascalObject), ALeasedFd);
end;

procedure wp_drm_lease_v1_finished_Intf(AData: PWLUserData; Awp_drm_lease_v1: Pwp_drm_lease_v1); cdecl;
var
  AIntf: IWpDrmLeaseV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpDrmLeaseV1Listener(AData^.ListenerUserData);
  AIntf.wp_drm_lease_v1_finished(TWpDrmLeaseV1(AData^.PascalObject));
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
    (@wp_drm_lease_request_v1_interface),
    (@wp_drm_lease_connector_v1_interface),
    (@wp_drm_lease_v1_interface)
  );

  wp_drm_lease_device_v1_requests: array[0..1] of Twl_message = (
    (name: 'create_lease_request'; signature: 'n'; types: @pInterfaces[8]),
    (name: 'release'; signature: ''; types: @pInterfaces[0])
  );
  wp_drm_lease_device_v1_events: array[0..3] of Twl_message = (
    (name: 'drm_fd'; signature: 'h'; types: @pInterfaces[0]),
    (name: 'connector'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'released'; signature: ''; types: @pInterfaces[0])
  );
  wp_drm_lease_connector_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_drm_lease_connector_v1_events: array[0..4] of Twl_message = (
    (name: 'name'; signature: 's'; types: @pInterfaces[0]),
    (name: 'description'; signature: 's'; types: @pInterfaces[0]),
    (name: 'connector_id'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'withdrawn'; signature: ''; types: @pInterfaces[0])
  );
  wp_drm_lease_request_v1_requests: array[0..1] of Twl_message = (
    (name: 'request_connector'; signature: 'o'; types: @pInterfaces[9]),
    (name: 'submit'; signature: 'n'; types: @pInterfaces[10])
  );
  wp_drm_lease_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_drm_lease_v1_events: array[0..1] of Twl_message = (
    (name: 'lease_fd'; signature: 'h'; types: @pInterfaces[0]),
    (name: 'finished'; signature: ''; types: @pInterfaces[0])
  );

class procedure TWpDrmLeaseDeviceV1.RegisterInterface;
begin
  if vwp_drm_lease_device_v1_registered then Exit;
  vwp_drm_lease_device_v1_registered := True;
  Pointer(vIntf_wp_drm_lease_device_v1_Listener.drm_fd) := @wp_drm_lease_device_v1_drm_fd_Intf;
  Pointer(vIntf_wp_drm_lease_device_v1_Listener.connector) := @wp_drm_lease_device_v1_connector_Intf;
  Pointer(vIntf_wp_drm_lease_device_v1_Listener.done) := @wp_drm_lease_device_v1_done_Intf;
  Pointer(vIntf_wp_drm_lease_device_v1_Listener.released) := @wp_drm_lease_device_v1_released_Intf;
  wp_drm_lease_device_v1_interface.name := PChar(WP_DRM_LEASE_DEVICE_V1_INTERFACE_NAME);
  wp_drm_lease_device_v1_interface.version := 1;
  wp_drm_lease_device_v1_interface.method_count := 2;
  wp_drm_lease_device_v1_interface.methods := @wp_drm_lease_device_v1_requests;
  wp_drm_lease_device_v1_interface.event_count := 4;
  wp_drm_lease_device_v1_interface.events := @wp_drm_lease_device_v1_events;
end;

class procedure TWpDrmLeaseConnectorV1.RegisterInterface;
begin
  if vwp_drm_lease_connector_v1_registered then Exit;
  vwp_drm_lease_connector_v1_registered := True;
  Pointer(vIntf_wp_drm_lease_connector_v1_Listener.name) := @wp_drm_lease_connector_v1_name_Intf;
  Pointer(vIntf_wp_drm_lease_connector_v1_Listener.description) := @wp_drm_lease_connector_v1_description_Intf;
  Pointer(vIntf_wp_drm_lease_connector_v1_Listener.connector_id) := @wp_drm_lease_connector_v1_connector_id_Intf;
  Pointer(vIntf_wp_drm_lease_connector_v1_Listener.done) := @wp_drm_lease_connector_v1_done_Intf;
  Pointer(vIntf_wp_drm_lease_connector_v1_Listener.withdrawn) := @wp_drm_lease_connector_v1_withdrawn_Intf;
  wp_drm_lease_connector_v1_interface.name := PChar(WP_DRM_LEASE_CONNECTOR_V1_INTERFACE_NAME);
  wp_drm_lease_connector_v1_interface.version := 1;
  wp_drm_lease_connector_v1_interface.method_count := 1;
  wp_drm_lease_connector_v1_interface.methods := @wp_drm_lease_connector_v1_requests;
  wp_drm_lease_connector_v1_interface.event_count := 5;
  wp_drm_lease_connector_v1_interface.events := @wp_drm_lease_connector_v1_events;
end;

class procedure TWpDrmLeaseRequestV1.RegisterInterface;
begin
  if vwp_drm_lease_request_v1_registered then Exit;
  vwp_drm_lease_request_v1_registered := True;
  wp_drm_lease_request_v1_interface.name := PChar(WP_DRM_LEASE_REQUEST_V1_INTERFACE_NAME);
  wp_drm_lease_request_v1_interface.version := 1;
  wp_drm_lease_request_v1_interface.method_count := 2;
  wp_drm_lease_request_v1_interface.methods := @wp_drm_lease_request_v1_requests;
  wp_drm_lease_request_v1_interface.event_count := 0;
  wp_drm_lease_request_v1_interface.events := nil;
end;

class procedure TWpDrmLeaseV1.RegisterInterface;
begin
  if vwp_drm_lease_v1_registered then Exit;
  vwp_drm_lease_v1_registered := True;
  Pointer(vIntf_wp_drm_lease_v1_Listener.lease_fd) := @wp_drm_lease_v1_lease_fd_Intf;
  Pointer(vIntf_wp_drm_lease_v1_Listener.finished) := @wp_drm_lease_v1_finished_Intf;
  wp_drm_lease_v1_interface.name := PChar(WP_DRM_LEASE_V1_INTERFACE_NAME);
  wp_drm_lease_v1_interface.version := 1;
  wp_drm_lease_v1_interface.method_count := 1;
  wp_drm_lease_v1_interface.methods := @wp_drm_lease_v1_requests;
  wp_drm_lease_v1_interface.event_count := 2;
  wp_drm_lease_v1_interface.events := @wp_drm_lease_v1_events;
end;


end.
