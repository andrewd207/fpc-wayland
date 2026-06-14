unit linux_explicit_synchronization_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_linux_explicit_synchronization_v1 = Pointer;
  Pwp_linux_surface_synchronization_v1 = Pointer;
  Pwp_linux_buffer_release_v1 = Pointer;
const
  WP_LINUX_EXPLICIT_SYNCHRONIZATION_V1_ERROR_SYNCHRONIZATION_EXISTS = 0; // the surface already has a synchronization object associated

type
  Pwp_linux_explicit_synchronization_v1_listener = ^Twp_linux_explicit_synchronization_v1_listener;
  Twp_linux_explicit_synchronization_v1_listener = record
  end;

const
  WP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_INVALID_FENCE = 0; // the fence specified by the client could not be imported
  WP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_DUPLICATE_FENCE = 1; // multiple fences added for a single surface commit
  WP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_DUPLICATE_RELEASE = 2; // multiple releases added for a single surface commit
  WP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_NO_SURFACE = 3; // the associated wl_surface was destroyed
  WP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_UNSUPPORTED_BUFFER = 4; // the buffer does not support explicit synchronization
  WP_LINUX_SURFACE_SYNCHRONIZATION_V1_ERROR_NO_BUFFER = 5; // no buffer was attached

type
  Pwp_linux_surface_synchronization_v1_listener = ^Twp_linux_surface_synchronization_v1_listener;
  Twp_linux_surface_synchronization_v1_listener = record
  end;

  Pwp_linux_buffer_release_v1_listener = ^Twp_linux_buffer_release_v1_listener;
  Twp_linux_buffer_release_v1_listener = record
    fenced_release : procedure(data: Pointer; AWpLinuxBufferReleaseV1: Pwp_linux_buffer_release_v1; AFence: LongInt{fd}); cdecl;
    immediate_release : procedure(data: Pointer; AWpLinuxBufferReleaseV1: Pwp_linux_buffer_release_v1); cdecl;
  end;



  TWpLinuxExplicitSynchronizationV1 = class;
  TWpLinuxSurfaceSynchronizationV1 = class;
  TWpLinuxBufferReleaseV1 = class;


  IWpLinuxExplicitSynchronizationV1Listener = interface
  ['IWpLinuxExplicitSynchronizationV1Listener']
  end;

  IWpLinuxSurfaceSynchronizationV1Listener = interface
  ['IWpLinuxSurfaceSynchronizationV1Listener']
  end;

  IWpLinuxBufferReleaseV1Listener = interface
  ['IWpLinuxBufferReleaseV1Listener']
    procedure wp_linux_buffer_release_v1_fenced_release(AWpLinuxBufferReleaseV1: TWpLinuxBufferReleaseV1; AFence: LongInt{fd});
    procedure wp_linux_buffer_release_v1_immediate_release(AWpLinuxBufferReleaseV1: TWpLinuxBufferReleaseV1);
  end;




  TWpLinuxExplicitSynchronizationV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_SYNCHRONIZATION = 1;
  public
    destructor Destroy; override;
    function GetSynchronization(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpLinuxSurfaceSynchronizationV1}): TWpLinuxSurfaceSynchronizationV1;
    function AddListener(AIntf: IWpLinuxExplicitSynchronizationV1Listener): LongInt;
  end;

  TWpLinuxSurfaceSynchronizationV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _SET_ACQUIRE_FENCE = 1;
    const _GET_RELEASE = 2;
  public
    destructor Destroy; override;
    procedure SetAcquireFence(AFd: LongInt{fd});
    function GetRelease(AProxyClass: TWLProxyObjectClass = nil {TWpLinuxBufferReleaseV1}): TWpLinuxBufferReleaseV1;
    function AddListener(AIntf: IWpLinuxSurfaceSynchronizationV1Listener): LongInt;
  end;

  TWpLinuxBufferReleaseV1 = class(TWLProxyObject)
    function AddListener(AIntf: IWpLinuxBufferReleaseV1Listener): LongInt;
  end;






var
  wp_linux_explicit_synchronization_v1_interface: Twl_interface;
  WP_LINUX_EXPLICIT_SYNCHRONIZATION_V1_INTERFACE_NAME: String = 'zwp_linux_explicit_synchronization_v1';
  wp_linux_surface_synchronization_v1_interface: Twl_interface;
  WP_LINUX_SURFACE_SYNCHRONIZATION_V1_INTERFACE_NAME: String = 'zwp_linux_surface_synchronization_v1';
  wp_linux_buffer_release_v1_interface: Twl_interface;
  WP_LINUX_BUFFER_RELEASE_V1_INTERFACE_NAME: String = 'zwp_linux_buffer_release_v1';



implementation

var
  vIntf_wp_linux_explicit_synchronization_v1_Listener: Twp_linux_explicit_synchronization_v1_listener;
  vIntf_wp_linux_surface_synchronization_v1_Listener: Twp_linux_surface_synchronization_v1_listener;
  vIntf_wp_linux_buffer_release_v1_Listener: Twp_linux_buffer_release_v1_listener;



destructor TWpLinuxExplicitSynchronizationV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpLinuxExplicitSynchronizationV1.GetSynchronization(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpLinuxSurfaceSynchronizationV1}): TWpLinuxSurfaceSynchronizationV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_SYNCHRONIZATION, @wp_linux_surface_synchronization_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpLinuxSurfaceSynchronizationV1;
  Result := TWpLinuxSurfaceSynchronizationV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpLinuxSurfaceSynchronizationV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpLinuxSurfaceSynchronizationV1]);
end;

function TWpLinuxExplicitSynchronizationV1.AddListener(AIntf: IWpLinuxExplicitSynchronizationV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_linux_explicit_synchronization_v1_Listener, @FUserDataRec);
end;
destructor TWpLinuxSurfaceSynchronizationV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWpLinuxSurfaceSynchronizationV1.SetAcquireFence(AFd: LongInt{fd});
begin
  wl_proxy_marshal(FProxy, _SET_ACQUIRE_FENCE, AFd);
end;

function TWpLinuxSurfaceSynchronizationV1.GetRelease(AProxyClass: TWLProxyObjectClass = nil {TWpLinuxBufferReleaseV1}): TWpLinuxBufferReleaseV1;
var
  release: Pwl_proxy;
begin
  release := wl_proxy_marshal_constructor(FProxy,
      _GET_RELEASE, @wp_linux_buffer_release_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWpLinuxBufferReleaseV1;
  Result := TWpLinuxBufferReleaseV1(AProxyClass.Create(release));
  if not AProxyClass.InheritsFrom(TWpLinuxBufferReleaseV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpLinuxBufferReleaseV1]);
end;

function TWpLinuxSurfaceSynchronizationV1.AddListener(AIntf: IWpLinuxSurfaceSynchronizationV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_linux_surface_synchronization_v1_Listener, @FUserDataRec);
end;
function TWpLinuxBufferReleaseV1.AddListener(AIntf: IWpLinuxBufferReleaseV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_linux_buffer_release_v1_Listener, @FUserDataRec);
end;




procedure wp_linux_buffer_release_v1_fenced_release_Intf(AData: PWLUserData; Awp_linux_buffer_release_v1: Pwp_linux_buffer_release_v1; AFence: LongInt{fd}); cdecl;
var
  AIntf: IWpLinuxBufferReleaseV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpLinuxBufferReleaseV1Listener(AData^.ListenerUserData);
  AIntf.wp_linux_buffer_release_v1_fenced_release(TWpLinuxBufferReleaseV1(AData^.PascalObject), AFence);
end;

procedure wp_linux_buffer_release_v1_immediate_release_Intf(AData: PWLUserData; Awp_linux_buffer_release_v1: Pwp_linux_buffer_release_v1); cdecl;
var
  AIntf: IWpLinuxBufferReleaseV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpLinuxBufferReleaseV1Listener(AData^.ListenerUserData);
  AIntf.wp_linux_buffer_release_v1_immediate_release(TWpLinuxBufferReleaseV1(AData^.PascalObject));
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
    (@wp_linux_surface_synchronization_v1_interface),
    (@wl_surface_interface),
    (@wp_linux_buffer_release_v1_interface)
  );

  wp_linux_explicit_synchronization_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_synchronization'; signature: 'no'; types: @pInterfaces[8])
  );
  wp_linux_surface_synchronization_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_acquire_fence'; signature: 'h'; types: @pInterfaces[0]),
    (name: 'get_release'; signature: 'n'; types: @pInterfaces[10])
  );
  wp_linux_buffer_release_v1_events: array[0..1] of Twl_message = (
    (name: 'fenced_release'; signature: 'h'; types: @pInterfaces[0]),
    (name: 'immediate_release'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_wp_linux_buffer_release_v1_Listener.fenced_release) := @wp_linux_buffer_release_v1_fenced_release_Intf;
  Pointer(vIntf_wp_linux_buffer_release_v1_Listener.immediate_release) := @wp_linux_buffer_release_v1_immediate_release_Intf;


  wp_linux_explicit_synchronization_v1_interface.name := PChar(WP_LINUX_EXPLICIT_SYNCHRONIZATION_V1_INTERFACE_NAME);
  wp_linux_explicit_synchronization_v1_interface.version := 2;
  wp_linux_explicit_synchronization_v1_interface.method_count := 2;
  wp_linux_explicit_synchronization_v1_interface.methods := @wp_linux_explicit_synchronization_v1_requests;
  wp_linux_explicit_synchronization_v1_interface.event_count := 0;
  wp_linux_explicit_synchronization_v1_interface.events := nil;

  wp_linux_surface_synchronization_v1_interface.name := PChar(WP_LINUX_SURFACE_SYNCHRONIZATION_V1_INTERFACE_NAME);
  wp_linux_surface_synchronization_v1_interface.version := 2;
  wp_linux_surface_synchronization_v1_interface.method_count := 3;
  wp_linux_surface_synchronization_v1_interface.methods := @wp_linux_surface_synchronization_v1_requests;
  wp_linux_surface_synchronization_v1_interface.event_count := 0;
  wp_linux_surface_synchronization_v1_interface.events := nil;

  wp_linux_buffer_release_v1_interface.name := PChar(WP_LINUX_BUFFER_RELEASE_V1_INTERFACE_NAME);
  wp_linux_buffer_release_v1_interface.version := 1;
  wp_linux_buffer_release_v1_interface.method_count := 0;
  wp_linux_buffer_release_v1_interface.methods := nil;
  wp_linux_buffer_release_v1_interface.event_count := 2;
  wp_linux_buffer_release_v1_interface.events := @wp_linux_buffer_release_v1_events;

end.
