unit commit_timing_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_commit_timing_manager_v1 = Pointer;
  Pwp_commit_timer_v1 = Pointer;
const
  WP_COMMIT_TIMING_MANAGER_V1_ERROR_COMMIT_TIMER_EXISTS = 0; // commit timer already exists for surface

type
  Pwp_commit_timing_manager_v1_listener = ^Twp_commit_timing_manager_v1_listener;
  Twp_commit_timing_manager_v1_listener = record
  end;

const
  WP_COMMIT_TIMER_V1_ERROR_INVALID_TIMESTAMP = 0; // timestamp contains an invalid value
  WP_COMMIT_TIMER_V1_ERROR_TIMESTAMP_EXISTS = 1; // timestamp exists
  WP_COMMIT_TIMER_V1_ERROR_SURFACE_DESTROYED = 2; // the associated surface no longer exists

type
  Pwp_commit_timer_v1_listener = ^Twp_commit_timer_v1_listener;
  Twp_commit_timer_v1_listener = record
  end;



  TWpCommitTimingManagerV1 = class;
  TWpCommitTimerV1 = class;


  IWpCommitTimingManagerV1Listener = interface
  ['IWpCommitTimingManagerV1Listener']
  end;

  IWpCommitTimerV1Listener = interface
  ['IWpCommitTimerV1Listener']
  end;




  TWpCommitTimingManagerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_TIMER = 1;
  public
    destructor Destroy; override;
    function GetTimer(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpCommitTimerV1}): TWpCommitTimerV1;
    function AddListener(AIntf: IWpCommitTimingManagerV1Listener): LongInt;
  end;

  TWpCommitTimerV1 = class(TWLProxyObject)
  private
    const _SET_TIMESTAMP = 0;
    const _DESTROY = 1;
  public
    procedure SetTimestamp(ATvSecHi: DWord; ATvSecLo: DWord; ATvNsec: DWord);
    destructor Destroy; override;
    function AddListener(AIntf: IWpCommitTimerV1Listener): LongInt;
  end;






var
  wp_commit_timing_manager_v1_interface: Twl_interface;
  wp_commit_timer_v1_interface: Twl_interface;



implementation

var
  vIntf_wp_commit_timing_manager_v1_Listener: Twp_commit_timing_manager_v1_listener;
  vIntf_wp_commit_timer_v1_Listener: Twp_commit_timer_v1_listener;



destructor TWpCommitTimingManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpCommitTimingManagerV1.GetTimer(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpCommitTimerV1}): TWpCommitTimerV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_TIMER, @wp_commit_timer_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpCommitTimerV1;
  Result := TWpCommitTimerV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpCommitTimerV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpCommitTimerV1]);
end;

function TWpCommitTimingManagerV1.AddListener(AIntf: IWpCommitTimingManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_commit_timing_manager_v1_Listener, @FUserDataRec);
end;
procedure TWpCommitTimerV1.SetTimestamp(ATvSecHi: DWord; ATvSecLo: DWord; ATvNsec: DWord);
begin
  wl_proxy_marshal(FProxy, _SET_TIMESTAMP, ATvSecHi, ATvSecLo, ATvNsec);
end;

destructor TWpCommitTimerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpCommitTimerV1.AddListener(AIntf: IWpCommitTimerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_commit_timer_v1_Listener, @FUserDataRec);
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
    (@wp_commit_timer_v1_interface),
    (@wl_surface_interface)
  );

  wp_commit_timing_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_timer'; signature: 'no'; types: @pInterfaces[8])
  );
  wp_commit_timer_v1_requests: array[0..1] of Twl_message = (
    (name: 'set_timestamp'; signature: 'uuu'; types: @pInterfaces[0]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );

initialization


  wp_commit_timing_manager_v1_interface.name := 'wp_commit_timing_manager_v1';
  wp_commit_timing_manager_v1_interface.version := 1;
  wp_commit_timing_manager_v1_interface.method_count := 2;
  wp_commit_timing_manager_v1_interface.methods := @wp_commit_timing_manager_v1_requests;
  wp_commit_timing_manager_v1_interface.event_count := 0;
  wp_commit_timing_manager_v1_interface.events := nil;

  wp_commit_timer_v1_interface.name := 'wp_commit_timer_v1';
  wp_commit_timer_v1_interface.version := 1;
  wp_commit_timer_v1_interface.method_count := 2;
  wp_commit_timer_v1_interface.methods := @wp_commit_timer_v1_requests;
  wp_commit_timer_v1_interface.event_count := 0;
  wp_commit_timer_v1_interface.events := nil;

end.
