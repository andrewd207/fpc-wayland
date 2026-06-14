unit linux_drm_syncobj_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_linux_drm_syncobj_manager_v1 = Pointer;
  Pwp_linux_drm_syncobj_timeline_v1 = Pointer;
  Pwp_linux_drm_syncobj_surface_v1 = Pointer;
const
  WP_LINUX_DRM_SYNCOBJ_MANAGER_V1_ERROR_SURFACE_EXISTS = 0; // the surface already has a synchronization object associated
  WP_LINUX_DRM_SYNCOBJ_MANAGER_V1_ERROR_INVALID_TIMELINE = 1; // the timeline object could not be imported

type
  Pwp_linux_drm_syncobj_manager_v1_listener = ^Twp_linux_drm_syncobj_manager_v1_listener;
  Twp_linux_drm_syncobj_manager_v1_listener = record
  end;

  Pwp_linux_drm_syncobj_timeline_v1_listener = ^Twp_linux_drm_syncobj_timeline_v1_listener;
  Twp_linux_drm_syncobj_timeline_v1_listener = record
  end;

const
  WP_LINUX_DRM_SYNCOBJ_SURFACE_V1_ERROR_NO_SURFACE = 1; // the associated wl_surface was destroyed
  WP_LINUX_DRM_SYNCOBJ_SURFACE_V1_ERROR_UNSUPPORTED_BUFFER = 2; // the buffer does not support explicit synchronization
  WP_LINUX_DRM_SYNCOBJ_SURFACE_V1_ERROR_NO_BUFFER = 3; // no buffer was attached
  WP_LINUX_DRM_SYNCOBJ_SURFACE_V1_ERROR_NO_ACQUIRE_POINT = 4; // no acquire timeline point was set
  WP_LINUX_DRM_SYNCOBJ_SURFACE_V1_ERROR_NO_RELEASE_POINT = 5; // no release timeline point was set
  WP_LINUX_DRM_SYNCOBJ_SURFACE_V1_ERROR_CONFLICTING_POINTS = 6; // acquire and release timeline points are in conflict

type
  Pwp_linux_drm_syncobj_surface_v1_listener = ^Twp_linux_drm_syncobj_surface_v1_listener;
  Twp_linux_drm_syncobj_surface_v1_listener = record
  end;



  TWpLinuxDrmSyncobjManagerV1 = class;
  TWpLinuxDrmSyncobjTimelineV1 = class;
  TWpLinuxDrmSyncobjSurfaceV1 = class;


  IWpLinuxDrmSyncobjManagerV1Listener = interface
  ['IWpLinuxDrmSyncobjManagerV1Listener']
  end;

  IWpLinuxDrmSyncobjTimelineV1Listener = interface
  ['IWpLinuxDrmSyncobjTimelineV1Listener']
  end;

  IWpLinuxDrmSyncobjSurfaceV1Listener = interface
  ['IWpLinuxDrmSyncobjSurfaceV1Listener']
  end;




  TWpLinuxDrmSyncobjManagerV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpLinuxDrmSyncobjManagerV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_SURFACE = 1;
    const _IMPORT_TIMELINE = 2;
  public
    destructor Destroy; override;
    function GetSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpLinuxDrmSyncobjSurfaceV1}): TWpLinuxDrmSyncobjSurfaceV1;
    function ImportTimeline(AFd: LongInt{fd}; AProxyClass: TWLProxyObjectClass = nil {TWpLinuxDrmSyncobjTimelineV1}): TWpLinuxDrmSyncobjTimelineV1;
    function AddListener(AIntf: IWpLinuxDrmSyncobjManagerV1Listener): LongInt;
  end;

  TWpLinuxDrmSyncobjTimelineV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpLinuxDrmSyncobjTimelineV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpLinuxDrmSyncobjTimelineV1Listener): LongInt;
  end;

  TWpLinuxDrmSyncobjSurfaceV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpLinuxDrmSyncobjSurfaceV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _SET_ACQUIRE_POINT = 1;
    const _SET_RELEASE_POINT = 2;
  public
    destructor Destroy; override;
    procedure SetAcquirePoint(ATimeline: TWpLinuxDrmSyncobjTimelineV1; APointHi: DWord; APointLo: DWord);
    procedure SetReleasePoint(ATimeline: TWpLinuxDrmSyncobjTimelineV1; APointHi: DWord; APointLo: DWord);
    function AddListener(AIntf: IWpLinuxDrmSyncobjSurfaceV1Listener): LongInt;
  end;






var
  wp_linux_drm_syncobj_manager_v1_interface: Twl_interface;
  WP_LINUX_DRM_SYNCOBJ_MANAGER_V1_INTERFACE_NAME: String = 'wp_linux_drm_syncobj_manager_v1';
  wp_linux_drm_syncobj_timeline_v1_interface: Twl_interface;
  WP_LINUX_DRM_SYNCOBJ_TIMELINE_V1_INTERFACE_NAME: String = 'wp_linux_drm_syncobj_timeline_v1';
  wp_linux_drm_syncobj_surface_v1_interface: Twl_interface;
  WP_LINUX_DRM_SYNCOBJ_SURFACE_V1_INTERFACE_NAME: String = 'wp_linux_drm_syncobj_surface_v1';



implementation

var
  vwp_linux_drm_syncobj_manager_v1_registered: Boolean = False;
  vIntf_wp_linux_drm_syncobj_manager_v1_Listener: Twp_linux_drm_syncobj_manager_v1_listener;
  vwp_linux_drm_syncobj_timeline_v1_registered: Boolean = False;
  vIntf_wp_linux_drm_syncobj_timeline_v1_Listener: Twp_linux_drm_syncobj_timeline_v1_listener;
  vwp_linux_drm_syncobj_surface_v1_registered: Boolean = False;
  vIntf_wp_linux_drm_syncobj_surface_v1_Listener: Twp_linux_drm_syncobj_surface_v1_listener;



constructor TWpLinuxDrmSyncobjManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpLinuxDrmSyncobjManagerV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpLinuxDrmSyncobjManagerV1;
begin
  RegisterInterface;
  Result := TWpLinuxDrmSyncobjManagerV1.Create(ARegistry.Bind(AName, @wp_linux_drm_syncobj_manager_v1_interface, AVersion));
end;

destructor TWpLinuxDrmSyncobjManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpLinuxDrmSyncobjManagerV1.GetSurface(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpLinuxDrmSyncobjSurfaceV1}): TWpLinuxDrmSyncobjSurfaceV1;
var
  id: Pwl_proxy;
begin
  TWpLinuxDrmSyncobjSurfaceV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_SURFACE, @wp_linux_drm_syncobj_surface_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpLinuxDrmSyncobjSurfaceV1;
  Result := TWpLinuxDrmSyncobjSurfaceV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpLinuxDrmSyncobjSurfaceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpLinuxDrmSyncobjSurfaceV1]);
end;

function TWpLinuxDrmSyncobjManagerV1.ImportTimeline(AFd: LongInt{fd}; AProxyClass: TWLProxyObjectClass = nil {TWpLinuxDrmSyncobjTimelineV1}): TWpLinuxDrmSyncobjTimelineV1;
var
  id: Pwl_proxy;
begin
  TWpLinuxDrmSyncobjTimelineV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _IMPORT_TIMELINE, @wp_linux_drm_syncobj_timeline_v1_interface, nil, AFd);
  if AProxyClass = nil then
    AProxyClass := TWpLinuxDrmSyncobjTimelineV1;
  Result := TWpLinuxDrmSyncobjTimelineV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpLinuxDrmSyncobjTimelineV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpLinuxDrmSyncobjTimelineV1]);
end;

function TWpLinuxDrmSyncobjManagerV1.AddListener(AIntf: IWpLinuxDrmSyncobjManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_linux_drm_syncobj_manager_v1_Listener, @FUserDataRec);
end;
constructor TWpLinuxDrmSyncobjTimelineV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpLinuxDrmSyncobjTimelineV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpLinuxDrmSyncobjTimelineV1;
begin
  RegisterInterface;
  Result := TWpLinuxDrmSyncobjTimelineV1.Create(ARegistry.Bind(AName, @wp_linux_drm_syncobj_timeline_v1_interface, AVersion));
end;

destructor TWpLinuxDrmSyncobjTimelineV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpLinuxDrmSyncobjTimelineV1.AddListener(AIntf: IWpLinuxDrmSyncobjTimelineV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_linux_drm_syncobj_timeline_v1_Listener, @FUserDataRec);
end;
constructor TWpLinuxDrmSyncobjSurfaceV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpLinuxDrmSyncobjSurfaceV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpLinuxDrmSyncobjSurfaceV1;
begin
  RegisterInterface;
  Result := TWpLinuxDrmSyncobjSurfaceV1.Create(ARegistry.Bind(AName, @wp_linux_drm_syncobj_surface_v1_interface, AVersion));
end;

destructor TWpLinuxDrmSyncobjSurfaceV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWpLinuxDrmSyncobjSurfaceV1.SetAcquirePoint(ATimeline: TWpLinuxDrmSyncobjTimelineV1; APointHi: DWord; APointLo: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_ACQUIRE_POINT, ATimeline.Proxy, APointHi, APointLo);
end;

procedure TWpLinuxDrmSyncobjSurfaceV1.SetReleasePoint(ATimeline: TWpLinuxDrmSyncobjTimelineV1; APointHi: DWord; APointLo: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_RELEASE_POINT, ATimeline.Proxy, APointHi, APointLo);
end;

function TWpLinuxDrmSyncobjSurfaceV1.AddListener(AIntf: IWpLinuxDrmSyncobjSurfaceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_linux_drm_syncobj_surface_v1_Listener, @FUserDataRec);
end;






const
  pInterfaces: array[0..17] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wp_linux_drm_syncobj_surface_v1_interface),
    (@wl_surface_interface),
    (@wp_linux_drm_syncobj_timeline_v1_interface),
    (nil),
    (@wp_linux_drm_syncobj_timeline_v1_interface),
    (nil),
    (nil),
    (@wp_linux_drm_syncobj_timeline_v1_interface),
    (nil),
    (nil)
  );

  wp_linux_drm_syncobj_manager_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_surface'; signature: 'no'; types: @pInterfaces[8]),
    (name: 'import_timeline'; signature: 'nh'; types: @pInterfaces[10])
  );
  wp_linux_drm_syncobj_timeline_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_linux_drm_syncobj_surface_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_acquire_point'; signature: 'ouu'; types: @pInterfaces[12]),
    (name: 'set_release_point'; signature: 'ouu'; types: @pInterfaces[15])
  );

class procedure TWpLinuxDrmSyncobjManagerV1.RegisterInterface;
begin
  if vwp_linux_drm_syncobj_manager_v1_registered then Exit;
  vwp_linux_drm_syncobj_manager_v1_registered := True;
  wp_linux_drm_syncobj_manager_v1_interface.name := PChar(WP_LINUX_DRM_SYNCOBJ_MANAGER_V1_INTERFACE_NAME);
  wp_linux_drm_syncobj_manager_v1_interface.version := 1;
  wp_linux_drm_syncobj_manager_v1_interface.method_count := 3;
  wp_linux_drm_syncobj_manager_v1_interface.methods := @wp_linux_drm_syncobj_manager_v1_requests;
  wp_linux_drm_syncobj_manager_v1_interface.event_count := 0;
  wp_linux_drm_syncobj_manager_v1_interface.events := nil;
end;

class procedure TWpLinuxDrmSyncobjTimelineV1.RegisterInterface;
begin
  if vwp_linux_drm_syncobj_timeline_v1_registered then Exit;
  vwp_linux_drm_syncobj_timeline_v1_registered := True;
  wp_linux_drm_syncobj_timeline_v1_interface.name := PChar(WP_LINUX_DRM_SYNCOBJ_TIMELINE_V1_INTERFACE_NAME);
  wp_linux_drm_syncobj_timeline_v1_interface.version := 1;
  wp_linux_drm_syncobj_timeline_v1_interface.method_count := 1;
  wp_linux_drm_syncobj_timeline_v1_interface.methods := @wp_linux_drm_syncobj_timeline_v1_requests;
  wp_linux_drm_syncobj_timeline_v1_interface.event_count := 0;
  wp_linux_drm_syncobj_timeline_v1_interface.events := nil;
end;

class procedure TWpLinuxDrmSyncobjSurfaceV1.RegisterInterface;
begin
  if vwp_linux_drm_syncobj_surface_v1_registered then Exit;
  vwp_linux_drm_syncobj_surface_v1_registered := True;
  wp_linux_drm_syncobj_surface_v1_interface.name := PChar(WP_LINUX_DRM_SYNCOBJ_SURFACE_V1_INTERFACE_NAME);
  wp_linux_drm_syncobj_surface_v1_interface.version := 1;
  wp_linux_drm_syncobj_surface_v1_interface.method_count := 3;
  wp_linux_drm_syncobj_surface_v1_interface.methods := @wp_linux_drm_syncobj_surface_v1_requests;
  wp_linux_drm_syncobj_surface_v1_interface.event_count := 0;
  wp_linux_drm_syncobj_surface_v1_interface.events := nil;
end;


end.
