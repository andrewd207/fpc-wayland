unit security_context_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_security_context_manager_v1 = Pointer;
  Pwp_security_context_v1 = Pointer;
const
  WP_SECURITY_CONTEXT_MANAGER_V1_ERROR_INVALID_LISTEN_FD = 1; // listening socket FD is invalid
  WP_SECURITY_CONTEXT_MANAGER_V1_ERROR_NESTED = 2; // nested security contexts are forbidden

type
  Pwp_security_context_manager_v1_listener = ^Twp_security_context_manager_v1_listener;
  Twp_security_context_manager_v1_listener = record
  end;

const
  WP_SECURITY_CONTEXT_V1_ERROR_ALREADY_USED = 1; // security context has already been committed
  WP_SECURITY_CONTEXT_V1_ERROR_ALREADY_SET = 2; // metadata has already been set
  WP_SECURITY_CONTEXT_V1_ERROR_INVALID_METADATA = 3; // metadata is invalid

type
  Pwp_security_context_v1_listener = ^Twp_security_context_v1_listener;
  Twp_security_context_v1_listener = record
  end;



  TWpSecurityContextManagerV1 = class;
  TWpSecurityContextV1 = class;


  IWpSecurityContextManagerV1Listener = interface
  ['IWpSecurityContextManagerV1Listener']
  end;

  IWpSecurityContextV1Listener = interface
  ['IWpSecurityContextV1Listener']
  end;




  TWpSecurityContextManagerV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _CREATE_LISTENER = 1;
  public
    destructor Destroy; override;
    function CreateListener(AListenFd: LongInt{fd}; ACloseFd: LongInt{fd}; AProxyClass: TWLProxyObjectClass = nil {TWpSecurityContextV1}): TWpSecurityContextV1;
    function AddListener(AIntf: IWpSecurityContextManagerV1Listener): LongInt;
  end;

  TWpSecurityContextV1 = class(TWLProxyObject)
  public
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _SET_SANDBOX_ENGINE = 1;
    const _SET_APP_ID = 2;
    const _SET_INSTANCE_ID = 3;
    const _COMMIT = 4;
  public
    destructor Destroy; override;
    procedure SetSandboxEngine(AName: String);
    procedure SetAppId(AAppId: String);
    procedure SetInstanceId(AInstanceId: String);
    procedure Commit;
    function AddListener(AIntf: IWpSecurityContextV1Listener): LongInt;
  end;



procedure InitInterfaces;



var
  wp_security_context_manager_v1_interface: Twl_interface;
  WP_SECURITY_CONTEXT_MANAGER_V1_INTERFACE_NAME: String = 'wp_security_context_manager_v1';
  wp_security_context_v1_interface: Twl_interface;
  WP_SECURITY_CONTEXT_V1_INTERFACE_NAME: String = 'wp_security_context_v1';



implementation

var
  vIntf_wp_security_context_manager_v1_Listener: Twp_security_context_manager_v1_listener;
  vIntf_wp_security_context_v1_Listener: Twp_security_context_v1_listener;
  vInterfacesRegistered: Boolean = False;



constructor TWpSecurityContextManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TWpSecurityContextManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpSecurityContextManagerV1.CreateListener(AListenFd: LongInt{fd}; ACloseFd: LongInt{fd}; AProxyClass: TWLProxyObjectClass = nil {TWpSecurityContextV1}): TWpSecurityContextV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_LISTENER, @wp_security_context_v1_interface, nil, AListenFd, ACloseFd);
  if AProxyClass = nil then
    AProxyClass := TWpSecurityContextV1;
  Result := TWpSecurityContextV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpSecurityContextV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpSecurityContextV1]);
end;

function TWpSecurityContextManagerV1.AddListener(AIntf: IWpSecurityContextManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_security_context_manager_v1_Listener, @FUserDataRec);
end;
constructor TWpSecurityContextV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  InitInterfaces;
  inherited Create(AProxy, AOwnsProxy);
end;

destructor TWpSecurityContextV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWpSecurityContextV1.SetSandboxEngine(AName: String);
begin
  wl_proxy_marshal(FProxy, _SET_SANDBOX_ENGINE, PChar(AName));
end;

procedure TWpSecurityContextV1.SetAppId(AAppId: String);
begin
  wl_proxy_marshal(FProxy, _SET_APP_ID, PChar(AAppId));
end;

procedure TWpSecurityContextV1.SetInstanceId(AInstanceId: String);
begin
  wl_proxy_marshal(FProxy, _SET_INSTANCE_ID, PChar(AInstanceId));
end;

procedure TWpSecurityContextV1.Commit;
begin
  wl_proxy_marshal(FProxy, _COMMIT);
end;

function TWpSecurityContextV1.AddListener(AIntf: IWpSecurityContextV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_security_context_v1_Listener, @FUserDataRec);
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
    (@wp_security_context_v1_interface),
    (nil),
    (nil)
  );

  wp_security_context_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'create_listener'; signature: 'nhh'; types: @pInterfaces[8])
  );
  wp_security_context_v1_requests: array[0..4] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_sandbox_engine'; signature: 's'; types: @pInterfaces[0]),
    (name: 'set_app_id'; signature: 's'; types: @pInterfaces[0]),
    (name: 'set_instance_id'; signature: 's'; types: @pInterfaces[0]),
    (name: 'commit'; signature: ''; types: @pInterfaces[0])
  );

procedure InitInterfaces;
begin
  if vInterfacesRegistered then Exit;
  vInterfacesRegistered := True;


  wp_security_context_manager_v1_interface.name := PChar(WP_SECURITY_CONTEXT_MANAGER_V1_INTERFACE_NAME);
  wp_security_context_manager_v1_interface.version := 1;
  wp_security_context_manager_v1_interface.method_count := 2;
  wp_security_context_manager_v1_interface.methods := @wp_security_context_manager_v1_requests;
  wp_security_context_manager_v1_interface.event_count := 0;
  wp_security_context_manager_v1_interface.events := nil;

  wp_security_context_v1_interface.name := PChar(WP_SECURITY_CONTEXT_V1_INTERFACE_NAME);
  wp_security_context_v1_interface.version := 1;
  wp_security_context_v1_interface.method_count := 5;
  wp_security_context_v1_interface.methods := @wp_security_context_v1_requests;
  wp_security_context_v1_interface.event_count := 0;
  wp_security_context_v1_interface.events := nil;

end;

end.
