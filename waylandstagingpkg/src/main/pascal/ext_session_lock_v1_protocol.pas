unit ext_session_lock_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pext_session_lock_manager_v1 = Pointer;
  Pext_session_lock_v1 = Pointer;
  Pext_session_lock_surface_v1 = Pointer;
  Pext_session_lock_manager_v1_listener = ^Text_session_lock_manager_v1_listener;
  Text_session_lock_manager_v1_listener = record
  end;

const
  EXT_SESSION_LOCK_V1_ERROR_INVALID_DESTROY = 0; // attempted to destroy session lock while locked
  EXT_SESSION_LOCK_V1_ERROR_INVALID_UNLOCK = 1; // unlock requested but locked event was never sent
  EXT_SESSION_LOCK_V1_ERROR_ROLE = 2; // given wl_surface already has a role
  EXT_SESSION_LOCK_V1_ERROR_DUPLICATE_OUTPUT = 3; // given output already has a lock surface
  EXT_SESSION_LOCK_V1_ERROR_ALREADY_CONSTRUCTED = 4; // given wl_surface has a buffer attached or committed

type
  Pext_session_lock_v1_listener = ^Text_session_lock_v1_listener;
  Text_session_lock_v1_listener = record
    locked : procedure(data: Pointer; AExtSessionLockV1: Pext_session_lock_v1); cdecl;
    finished : procedure(data: Pointer; AExtSessionLockV1: Pext_session_lock_v1); cdecl;
  end;

const
  EXT_SESSION_LOCK_SURFACE_V1_ERROR_COMMIT_BEFORE_FIRST_ACK = 0; // surface committed before first ack_configure request
  EXT_SESSION_LOCK_SURFACE_V1_ERROR_NULL_BUFFER = 1; // surface committed with a null buffer
  EXT_SESSION_LOCK_SURFACE_V1_ERROR_DIMENSIONS_MISMATCH = 2; // failed to match ack'd width/height
  EXT_SESSION_LOCK_SURFACE_V1_ERROR_INVALID_SERIAL = 3; // serial provided in ack_configure is invalid

type
  Pext_session_lock_surface_v1_listener = ^Text_session_lock_surface_v1_listener;
  Text_session_lock_surface_v1_listener = record
    configure : procedure(data: Pointer; AExtSessionLockSurfaceV1: Pext_session_lock_surface_v1; ASerial: DWord; AWidth: DWord; AHeight: DWord); cdecl;
  end;



  TExtSessionLockManagerV1 = class;
  TExtSessionLockV1 = class;
  TExtSessionLockSurfaceV1 = class;


  IExtSessionLockManagerV1Listener = interface
  ['IExtSessionLockManagerV1Listener']
  end;

  IExtSessionLockV1Listener = interface
  ['IExtSessionLockV1Listener']
    procedure ext_session_lock_v1_locked(AExtSessionLockV1: TExtSessionLockV1);
    procedure ext_session_lock_v1_finished(AExtSessionLockV1: TExtSessionLockV1);
  end;

  IExtSessionLockSurfaceV1Listener = interface
  ['IExtSessionLockSurfaceV1Listener']
    procedure ext_session_lock_surface_v1_configure(AExtSessionLockSurfaceV1: TExtSessionLockSurfaceV1; ASerial: DWord; AWidth: DWord; AHeight: DWord);
  end;




  TExtSessionLockManagerV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtSessionLockManagerV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _LOCK = 1;
  public
    destructor Destroy; override;
    function Lock(AProxyClass: TWLProxyObjectClass = nil {TExtSessionLockV1}): TExtSessionLockV1;
    function AddListener(AIntf: IExtSessionLockManagerV1Listener): LongInt;
  end;

  TExtSessionLockV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtSessionLockV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_LOCK_SURFACE = 1;
    const _UNLOCK_AND_DESTROY = 2;
  public
    destructor Destroy; override;
    function GetLockSurface(ASurface: TWlSurface; AOutput: TWlOutput; AProxyClass: TWLProxyObjectClass = nil {TExtSessionLockSurfaceV1}): TExtSessionLockSurfaceV1;
    procedure UnlockAndDestroy;
    function AddListener(AIntf: IExtSessionLockV1Listener): LongInt;
  end;

  TExtSessionLockSurfaceV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtSessionLockSurfaceV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _ACK_CONFIGURE = 1;
  public
    destructor Destroy; override;
    procedure AckConfigure(ASerial: DWord);
    function AddListener(AIntf: IExtSessionLockSurfaceV1Listener): LongInt;
  end;






var
  ext_session_lock_manager_v1_interface: Twl_interface;
  EXT_SESSION_LOCK_MANAGER_V1_INTERFACE_NAME: String = 'ext_session_lock_manager_v1';
  ext_session_lock_v1_interface: Twl_interface;
  EXT_SESSION_LOCK_V1_INTERFACE_NAME: String = 'ext_session_lock_v1';
  ext_session_lock_surface_v1_interface: Twl_interface;
  EXT_SESSION_LOCK_SURFACE_V1_INTERFACE_NAME: String = 'ext_session_lock_surface_v1';



implementation

var
  vext_session_lock_manager_v1_registered: Boolean = False;
  vIntf_ext_session_lock_manager_v1_Listener: Text_session_lock_manager_v1_listener;
  vext_session_lock_v1_registered: Boolean = False;
  vIntf_ext_session_lock_v1_Listener: Text_session_lock_v1_listener;
  vext_session_lock_surface_v1_registered: Boolean = False;
  vIntf_ext_session_lock_surface_v1_Listener: Text_session_lock_surface_v1_listener;



constructor TExtSessionLockManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TExtSessionLockManagerV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtSessionLockManagerV1;
begin
  RegisterInterface;
  Result := TExtSessionLockManagerV1.Create(ARegistry.Bind(AName, @ext_session_lock_manager_v1_interface, AVersion));
end;

destructor TExtSessionLockManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtSessionLockManagerV1.Lock(AProxyClass: TWLProxyObjectClass = nil {TExtSessionLockV1}): TExtSessionLockV1;
var
  id: Pwl_proxy;
begin
  TExtSessionLockV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _LOCK, @ext_session_lock_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TExtSessionLockV1;
  Result := TExtSessionLockV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TExtSessionLockV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TExtSessionLockV1]);
end;

function TExtSessionLockManagerV1.AddListener(AIntf: IExtSessionLockManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_session_lock_manager_v1_Listener, @FUserDataRec);
end;
constructor TExtSessionLockV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TExtSessionLockV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtSessionLockV1;
begin
  RegisterInterface;
  Result := TExtSessionLockV1.Create(ARegistry.Bind(AName, @ext_session_lock_v1_interface, AVersion));
end;

destructor TExtSessionLockV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtSessionLockV1.GetLockSurface(ASurface: TWlSurface; AOutput: TWlOutput; AProxyClass: TWLProxyObjectClass = nil {TExtSessionLockSurfaceV1}): TExtSessionLockSurfaceV1;
var
  id: Pwl_proxy;
begin
  TExtSessionLockSurfaceV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_LOCK_SURFACE, @ext_session_lock_surface_v1_interface, nil, ASurface.Proxy, AOutput.Proxy);
  if AProxyClass = nil then
    AProxyClass := TExtSessionLockSurfaceV1;
  Result := TExtSessionLockSurfaceV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TExtSessionLockSurfaceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TExtSessionLockSurfaceV1]);
end;

procedure TExtSessionLockV1.UnlockAndDestroy;
begin
  wl_proxy_marshal(FProxy, _UNLOCK_AND_DESTROY);
  inherited Destroy;
end;

function TExtSessionLockV1.AddListener(AIntf: IExtSessionLockV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_session_lock_v1_Listener, @FUserDataRec);
end;
constructor TExtSessionLockSurfaceV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TExtSessionLockSurfaceV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtSessionLockSurfaceV1;
begin
  RegisterInterface;
  Result := TExtSessionLockSurfaceV1.Create(ARegistry.Bind(AName, @ext_session_lock_surface_v1_interface, AVersion));
end;

destructor TExtSessionLockSurfaceV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TExtSessionLockSurfaceV1.AckConfigure(ASerial: DWord);
begin
  wl_proxy_marshal(FProxy, _ACK_CONFIGURE, ASerial);
end;

function TExtSessionLockSurfaceV1.AddListener(AIntf: IExtSessionLockSurfaceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_session_lock_surface_v1_Listener, @FUserDataRec);
end;




procedure ext_session_lock_v1_locked_Intf(AData: PWLUserData; Aext_session_lock_v1: Pext_session_lock_v1); cdecl;
var
  AIntf: IExtSessionLockV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtSessionLockV1Listener(AData^.ListenerUserData);
  AIntf.ext_session_lock_v1_locked(TExtSessionLockV1(AData^.PascalObject));
end;

procedure ext_session_lock_v1_finished_Intf(AData: PWLUserData; Aext_session_lock_v1: Pext_session_lock_v1); cdecl;
var
  AIntf: IExtSessionLockV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtSessionLockV1Listener(AData^.ListenerUserData);
  AIntf.ext_session_lock_v1_finished(TExtSessionLockV1(AData^.PascalObject));
end;

procedure ext_session_lock_surface_v1_configure_Intf(AData: PWLUserData; Aext_session_lock_surface_v1: Pext_session_lock_surface_v1; ASerial: DWord; AWidth: DWord; AHeight: DWord); cdecl;
var
  AIntf: IExtSessionLockSurfaceV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtSessionLockSurfaceV1Listener(AData^.ListenerUserData);
  AIntf.ext_session_lock_surface_v1_configure(TExtSessionLockSurfaceV1(AData^.PascalObject), ASerial, AWidth, AHeight);
end;



const
  pInterfaces: array[0..11] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@ext_session_lock_v1_interface),
    (@ext_session_lock_surface_v1_interface),
    (@wl_surface_interface),
    (@wl_output_interface)
  );

  ext_session_lock_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'lock'; signature: 'n'; types: @pInterfaces[8])
  );
  ext_session_lock_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_lock_surface'; signature: 'noo'; types: @pInterfaces[9]),
    (name: 'unlock_and_destroy'; signature: ''; types: @pInterfaces[0])
  );
  ext_session_lock_v1_events: array[0..1] of Twl_message = (
    (name: 'locked'; signature: ''; types: @pInterfaces[0]),
    (name: 'finished'; signature: ''; types: @pInterfaces[0])
  );
  ext_session_lock_surface_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'ack_configure'; signature: 'u'; types: @pInterfaces[0])
  );
  ext_session_lock_surface_v1_events: array[0..0] of Twl_message = (
    (name: 'configure'; signature: 'uuu'; types: @pInterfaces[0])
  );

class procedure TExtSessionLockManagerV1.RegisterInterface;
begin
  if vext_session_lock_manager_v1_registered then Exit;
  vext_session_lock_manager_v1_registered := True;
  ext_session_lock_manager_v1_interface.name := PChar(EXT_SESSION_LOCK_MANAGER_V1_INTERFACE_NAME);
  ext_session_lock_manager_v1_interface.version := 1;
  ext_session_lock_manager_v1_interface.method_count := 2;
  ext_session_lock_manager_v1_interface.methods := @ext_session_lock_manager_v1_requests;
  ext_session_lock_manager_v1_interface.event_count := 0;
  ext_session_lock_manager_v1_interface.events := nil;
end;

class procedure TExtSessionLockV1.RegisterInterface;
begin
  if vext_session_lock_v1_registered then Exit;
  vext_session_lock_v1_registered := True;
  Pointer(vIntf_ext_session_lock_v1_Listener.locked) := @ext_session_lock_v1_locked_Intf;
  Pointer(vIntf_ext_session_lock_v1_Listener.finished) := @ext_session_lock_v1_finished_Intf;
  ext_session_lock_v1_interface.name := PChar(EXT_SESSION_LOCK_V1_INTERFACE_NAME);
  ext_session_lock_v1_interface.version := 1;
  ext_session_lock_v1_interface.method_count := 3;
  ext_session_lock_v1_interface.methods := @ext_session_lock_v1_requests;
  ext_session_lock_v1_interface.event_count := 2;
  ext_session_lock_v1_interface.events := @ext_session_lock_v1_events;
end;

class procedure TExtSessionLockSurfaceV1.RegisterInterface;
begin
  if vext_session_lock_surface_v1_registered then Exit;
  vext_session_lock_surface_v1_registered := True;
  Pointer(vIntf_ext_session_lock_surface_v1_Listener.configure) := @ext_session_lock_surface_v1_configure_Intf;
  ext_session_lock_surface_v1_interface.name := PChar(EXT_SESSION_LOCK_SURFACE_V1_INTERFACE_NAME);
  ext_session_lock_surface_v1_interface.version := 1;
  ext_session_lock_surface_v1_interface.method_count := 2;
  ext_session_lock_surface_v1_interface.methods := @ext_session_lock_surface_v1_requests;
  ext_session_lock_surface_v1_interface.event_count := 1;
  ext_session_lock_surface_v1_interface.events := @ext_session_lock_surface_v1_events;
end;


end.
