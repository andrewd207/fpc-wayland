unit linux_explicit_synchronization_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_linux_explicit_synchronization_v1 = Pointer;
  Pzwp_linux_surface_synchronization_v1 = Pointer;
  Pzwp_linux_buffer_release_v1 = Pointer;
const
  ZWP_LINUX_EXPLICIT_SYNCHRONIZATION_V1_ERROR_SYNCHRONIZATION_EXISTS = 0; // the surface already has a synchronization object associated

type
  Pzwp_linux_explicit_synchronization_v1_listener = ^Tzwp_linux_explicit_synchronization_v1_listener;
  Tzwp_linux_explicit_synchronization_v1_listener = record
  end;

const
  ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_INVALID_FENCE = 0; // the fence specified by the client could not be imported
  ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_DUPLICATE_FENCE = 1; // multiple fences added for a single surface commit
  ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_DUPLICATE_RELEASE = 2; // multiple releases added for a single surface commit
  ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_NO_SURFACE = 3; // the associated wl_surface was destroyed
  ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_UNSUPPORTED_BUFFER = 4; // the buffer does not support explicit synchronization
  ZWP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_NO_BUFFER = 5; // no buffer was attached

type
  Pzwp_linux_surface_synchronization_v1_listener = ^Tzwp_linux_surface_synchronization_v1_listener;
  Tzwp_linux_surface_synchronization_v1_listener = record
  end;

  Pzwp_linux_buffer_release_v1_listener = ^Tzwp_linux_buffer_release_v1_listener;
  Tzwp_linux_buffer_release_v1_listener = record
    fenced_release : procedure(data: Pointer; AZwpLinuxBufferReleaseV1: Pzwp_linux_buffer_release_v1; AFence: LongInt{fd}); cdecl;
    immediate_release : procedure(data: Pointer; AZwpLinuxBufferReleaseV1: Pzwp_linux_buffer_release_v1); cdecl;
  end;



  TZwpLinuxExplicitSynchronizationV1 = class;
  TZwpLinuxSurfaceSynchronizationV1 = class;
  TZwpLinuxBufferReleaseV1 = class;


  IZwpLinuxExplicitSynchronizationV1Listener = interface
  ['IZwpLinuxExplicitSynchronizationV1Listener']
  end;

  IZwpLinuxSurfaceSynchronizationV1Listener = interface
  ['IZwpLinuxSurfaceSynchronizationV1Listener']
  end;

  IZwpLinuxBufferReleaseV1Listener = interface
  ['IZwpLinuxBufferReleaseV1Listener']
    procedure zwp_linux_buffer_release_v1_fenced_release(AZwpLinuxBufferReleaseV1: TZwpLinuxBufferReleaseV1; AFence: LongInt{fd});
    procedure zwp_linux_buffer_release_v1_immediate_release(AZwpLinuxBufferReleaseV1: TZwpLinuxBufferReleaseV1);
  end;




  TZwpLinuxExplicitSynchronizationV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_SYNCHRONIZATION = 1;
  public
    destructor Destroy; override;
    function GetSynchronization(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TZwpLinuxSurfaceSynchronizationV1}): TZwpLinuxSurfaceSynchronizationV1;
    function AddListener(AIntf: IZwpLinuxExplicitSynchronizationV1Listener): LongInt;
  end;

  TZwpLinuxSurfaceSynchronizationV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _SET_ACQUIRE_FENCE = 1;
    const _GET_RELEASE = 2;
  public
    destructor Destroy; override;
    procedure SetAcquireFence(AFd: LongInt{fd});
    function GetRelease(AProxyClass: TWLProxyObjectClass = nil {TZwpLinuxBufferReleaseV1}): TZwpLinuxBufferReleaseV1;
    function AddListener(AIntf: IZwpLinuxSurfaceSynchronizationV1Listener): LongInt;
  end;

  TZwpLinuxBufferReleaseV1 = class(TWLProxyObject)
    function AddListener(AIntf: IZwpLinuxBufferReleaseV1Listener): LongInt;
  end;






var
  zwp_linux_explicit_synchronization_v1_interface: Twl_interface;
  zwp_linux_surface_synchronization_v1_interface: Twl_interface;
  zwp_linux_buffer_release_v1_interface: Twl_interface;



implementation

var
  vIntf_zwp_linux_explicit_synchronization_v1_Listener: Tzwp_linux_explicit_synchronization_v1_listener;
  vIntf_zwp_linux_surface_synchronization_v1_Listener: Tzwp_linux_surface_synchronization_v1_listener;
  vIntf_zwp_linux_buffer_release_v1_Listener: Tzwp_linux_buffer_release_v1_listener;



destructor TZwpLinuxExplicitSynchronizationV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpLinuxExplicitSynchronizationV1.GetSynchronization(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TZwpLinuxSurfaceSynchronizationV1}): TZwpLinuxSurfaceSynchronizationV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_SYNCHRONIZATION, @zwp_linux_surface_synchronization_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpLinuxSurfaceSynchronizationV1;
  if not AProxyClass.InheritsFrom(TZwpLinuxSurfaceSynchronizationV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpLinuxSurfaceSynchronizationV1]);
  Result := TZwpLinuxSurfaceSynchronizationV1(AProxyClass.Create(id));
end;

function TZwpLinuxExplicitSynchronizationV1.AddListener(AIntf: IZwpLinuxExplicitSynchronizationV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_linux_explicit_synchronization_v1_Listener, @FUserDataRec);
end;
destructor TZwpLinuxSurfaceSynchronizationV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TZwpLinuxSurfaceSynchronizationV1.SetAcquireFence(AFd: LongInt{fd});
begin
  wl_proxy_marshal(FProxy, _SET_ACQUIRE_FENCE, AFd);
end;

function TZwpLinuxSurfaceSynchronizationV1.GetRelease(AProxyClass: TWLProxyObjectClass = nil {TZwpLinuxBufferReleaseV1}): TZwpLinuxBufferReleaseV1;
var
  release: Pwl_proxy;
begin
  release := wl_proxy_marshal_constructor(FProxy,
      _GET_RELEASE, @zwp_linux_buffer_release_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TZwpLinuxBufferReleaseV1;
  if not AProxyClass.InheritsFrom(TZwpLinuxBufferReleaseV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpLinuxBufferReleaseV1]);
  Result := TZwpLinuxBufferReleaseV1(AProxyClass.Create(release));
end;

function TZwpLinuxSurfaceSynchronizationV1.AddListener(AIntf: IZwpLinuxSurfaceSynchronizationV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_linux_surface_synchronization_v1_Listener, @FUserDataRec);
end;
function TZwpLinuxBufferReleaseV1.AddListener(AIntf: IZwpLinuxBufferReleaseV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_linux_buffer_release_v1_Listener, @FUserDataRec);
end;




procedure zwp_linux_buffer_release_v1_fenced_release_Intf(AData: PWLUserData; Azwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1; AFence: LongInt{fd}); cdecl;
var
  AIntf: IZwpLinuxBufferReleaseV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpLinuxBufferReleaseV1Listener(AData^.ListenerUserData);
  AIntf.zwp_linux_buffer_release_v1_fenced_release(TZwpLinuxBufferReleaseV1(AData^.PascalObject), AFence);
end;

procedure zwp_linux_buffer_release_v1_immediate_release_Intf(AData: PWLUserData; Azwp_linux_buffer_release_v1: Pzwp_linux_buffer_release_v1); cdecl;
var
  AIntf: IZwpLinuxBufferReleaseV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpLinuxBufferReleaseV1Listener(AData^.ListenerUserData);
  AIntf.zwp_linux_buffer_release_v1_immediate_release(TZwpLinuxBufferReleaseV1(AData^.PascalObject));
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
    (@zwp_linux_surface_synchronization_v1_interface),
    (@wl_surface_interface),
    (@zwp_linux_buffer_release_v1_interface)
  );

  zwp_linux_explicit_synchronization_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_synchronization'; signature: 'no'; types: @pInterfaces[8])
  );
  zwp_linux_surface_synchronization_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_acquire_fence'; signature: 'h'; types: @pInterfaces[0]),
    (name: 'get_release'; signature: 'n'; types: @pInterfaces[10])
  );
  zwp_linux_buffer_release_v1_events: array[0..1] of Twl_message = (
    (name: 'fenced_release'; signature: 'h'; types: @pInterfaces[0]),
    (name: 'immediate_release'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_linux_buffer_release_v1_Listener.fenced_release) := @zwp_linux_buffer_release_v1_fenced_release_Intf;
  Pointer(vIntf_zwp_linux_buffer_release_v1_Listener.immediate_release) := @zwp_linux_buffer_release_v1_immediate_release_Intf;


  zwp_linux_explicit_synchronization_v1_interface.name := 'zwp_linux_explicit_synchronization_v1';
  zwp_linux_explicit_synchronization_v1_interface.version := 2;
  zwp_linux_explicit_synchronization_v1_interface.method_count := 2;
  zwp_linux_explicit_synchronization_v1_interface.methods := @zwp_linux_explicit_synchronization_v1_requests;
  zwp_linux_explicit_synchronization_v1_interface.event_count := 0;
  zwp_linux_explicit_synchronization_v1_interface.events := nil;

  zwp_linux_surface_synchronization_v1_interface.name := 'zwp_linux_surface_synchronization_v1';
  zwp_linux_surface_synchronization_v1_interface.version := 2;
  zwp_linux_surface_synchronization_v1_interface.method_count := 3;
  zwp_linux_surface_synchronization_v1_interface.methods := @zwp_linux_surface_synchronization_v1_requests;
  zwp_linux_surface_synchronization_v1_interface.event_count := 0;
  zwp_linux_surface_synchronization_v1_interface.events := nil;

  zwp_linux_buffer_release_v1_interface.name := 'zwp_linux_buffer_release_v1';
  zwp_linux_buffer_release_v1_interface.version := 1;
  zwp_linux_buffer_release_v1_interface.method_count := 0;
  zwp_linux_buffer_release_v1_interface.methods := nil;
  zwp_linux_buffer_release_v1_interface.event_count := 2;
  zwp_linux_buffer_release_v1_interface.events := @zwp_linux_buffer_release_v1_events;

end.
