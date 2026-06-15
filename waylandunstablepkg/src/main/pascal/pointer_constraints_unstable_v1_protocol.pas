unit pointer_constraints_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_pointer_constraints_v1 = Pointer;
  Pwp_locked_pointer_v1 = Pointer;
  Pwp_confined_pointer_v1 = Pointer;
const
  WP_POINTER_CONSTRAINTS_V1_ERROR_ALREADY_CONSTRAINED = 1; // pointer constraint already requested on that surface
  WP_POINTER_CONSTRAINTS_V1_LIFETIME_ONESHOT = 1; // the pointer constraint is defunct once deactivated
  WP_POINTER_CONSTRAINTS_V1_LIFETIME_PERSISTENT = 2; // the pointer constraint may reactivate

type
  Pwp_pointer_constraints_v1_listener = ^Twp_pointer_constraints_v1_listener;
  Twp_pointer_constraints_v1_listener = record
  end;

  Pwp_locked_pointer_v1_listener = ^Twp_locked_pointer_v1_listener;
  Twp_locked_pointer_v1_listener = record
    locked : procedure(data: Pointer; AWpLockedPointerV1: Pwp_locked_pointer_v1); cdecl;
    unlocked : procedure(data: Pointer; AWpLockedPointerV1: Pwp_locked_pointer_v1); cdecl;
  end;

  Pwp_confined_pointer_v1_listener = ^Twp_confined_pointer_v1_listener;
  Twp_confined_pointer_v1_listener = record
    confined : procedure(data: Pointer; AWpConfinedPointerV1: Pwp_confined_pointer_v1); cdecl;
    unconfined : procedure(data: Pointer; AWpConfinedPointerV1: Pwp_confined_pointer_v1); cdecl;
  end;



  TWpPointerConstraintsV1 = class;
  TWpLockedPointerV1 = class;
  TWpConfinedPointerV1 = class;


  IWpPointerConstraintsV1Listener = interface
  ['IWpPointerConstraintsV1Listener']
  end;

  IWpLockedPointerV1Listener = interface
  ['IWpLockedPointerV1Listener']
    procedure wp_locked_pointer_v1_locked(AWpLockedPointerV1: TWpLockedPointerV1);
    procedure wp_locked_pointer_v1_unlocked(AWpLockedPointerV1: TWpLockedPointerV1);
  end;

  IWpConfinedPointerV1Listener = interface
  ['IWpConfinedPointerV1Listener']
    procedure wp_confined_pointer_v1_confined(AWpConfinedPointerV1: TWpConfinedPointerV1);
    procedure wp_confined_pointer_v1_unconfined(AWpConfinedPointerV1: TWpConfinedPointerV1);
  end;




  TWpPointerConstraintsV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpPointerConstraintsV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _LOCK_POINTER = 1;
    const _CONFINE_POINTER = 2;
  public
    destructor Destroy; override;
    function LockPointer(ASurface: TWlSurface; APointer: TWlPointer; ARegion: TWlRegion; ALifetime: DWord; AProxyClass: TWLProxyObjectClass = nil {TWpLockedPointerV1}): TWpLockedPointerV1;
    function ConfinePointer(ASurface: TWlSurface; APointer: TWlPointer; ARegion: TWlRegion; ALifetime: DWord; AProxyClass: TWLProxyObjectClass = nil {TWpConfinedPointerV1}): TWpConfinedPointerV1;
    function AddListener(AIntf: IWpPointerConstraintsV1Listener): LongInt;
  end;

  TWpLockedPointerV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpLockedPointerV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _SET_CURSOR_POSITION_HINT = 1;
    const _SET_REGION = 2;
  public
    destructor Destroy; override;
    procedure SetCursorPositionHint(ASurfaceX: Twl_fixed; ASurfaceY: Twl_fixed);
    procedure SetRegion(ARegion: TWlRegion);
    function AddListener(AIntf: IWpLockedPointerV1Listener): LongInt;
  end;

  TWpConfinedPointerV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpConfinedPointerV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _SET_REGION = 1;
  public
    destructor Destroy; override;
    procedure SetRegion(ARegion: TWlRegion);
    function AddListener(AIntf: IWpConfinedPointerV1Listener): LongInt;
  end;






var
  wp_pointer_constraints_v1_interface: Twl_interface;
  WP_POINTER_CONSTRAINTS_V1_INTERFACE_NAME: String = 'zwp_pointer_constraints_v1';
  wp_locked_pointer_v1_interface: Twl_interface;
  WP_LOCKED_POINTER_V1_INTERFACE_NAME: String = 'zwp_locked_pointer_v1';
  wp_confined_pointer_v1_interface: Twl_interface;
  WP_CONFINED_POINTER_V1_INTERFACE_NAME: String = 'zwp_confined_pointer_v1';



implementation

var
  vwp_pointer_constraints_v1_registered: Boolean = False;
  vIntf_wp_pointer_constraints_v1_Listener: Twp_pointer_constraints_v1_listener;
  vwp_locked_pointer_v1_registered: Boolean = False;
  vIntf_wp_locked_pointer_v1_Listener: Twp_locked_pointer_v1_listener;
  vwp_confined_pointer_v1_registered: Boolean = False;
  vIntf_wp_confined_pointer_v1_Listener: Twp_confined_pointer_v1_listener;



constructor TWpPointerConstraintsV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpPointerConstraintsV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpPointerConstraintsV1;
begin
  RegisterInterface;
  Result := TWpPointerConstraintsV1.Create(ARegistry.Bind(AName, @wp_pointer_constraints_v1_interface, AVersion));
end;

destructor TWpPointerConstraintsV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpPointerConstraintsV1.LockPointer(ASurface: TWlSurface; APointer: TWlPointer; ARegion: TWlRegion; ALifetime: DWord; AProxyClass: TWLProxyObjectClass = nil {TWpLockedPointerV1}): TWpLockedPointerV1;
var
  id: Pwl_proxy;
begin
  TWpLockedPointerV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _LOCK_POINTER, @wp_locked_pointer_v1_interface, nil, ASurface.Proxy, APointer.Proxy, ARegion.Proxy, ALifetime);
  if AProxyClass = nil then
    AProxyClass := TWpLockedPointerV1;
  Result := TWpLockedPointerV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpLockedPointerV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpLockedPointerV1]);
end;

function TWpPointerConstraintsV1.ConfinePointer(ASurface: TWlSurface; APointer: TWlPointer; ARegion: TWlRegion; ALifetime: DWord; AProxyClass: TWLProxyObjectClass = nil {TWpConfinedPointerV1}): TWpConfinedPointerV1;
var
  id: Pwl_proxy;
begin
  TWpConfinedPointerV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _CONFINE_POINTER, @wp_confined_pointer_v1_interface, nil, ASurface.Proxy, APointer.Proxy, ARegion.Proxy, ALifetime);
  if AProxyClass = nil then
    AProxyClass := TWpConfinedPointerV1;
  Result := TWpConfinedPointerV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpConfinedPointerV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpConfinedPointerV1]);
end;

function TWpPointerConstraintsV1.AddListener(AIntf: IWpPointerConstraintsV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_pointer_constraints_v1_Listener, @FUserDataRec);
end;
constructor TWpLockedPointerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpLockedPointerV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpLockedPointerV1;
begin
  RegisterInterface;
  Result := TWpLockedPointerV1.Create(ARegistry.Bind(AName, @wp_locked_pointer_v1_interface, AVersion));
end;

destructor TWpLockedPointerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWpLockedPointerV1.SetCursorPositionHint(ASurfaceX: Twl_fixed; ASurfaceY: Twl_fixed);
begin
  wl_proxy_marshal(FProxy, _SET_CURSOR_POSITION_HINT, ASurfaceX, ASurfaceY);
end;

procedure TWpLockedPointerV1.SetRegion(ARegion: TWlRegion);
begin
  wl_proxy_marshal(FProxy, _SET_REGION, ARegion.Proxy);
end;

function TWpLockedPointerV1.AddListener(AIntf: IWpLockedPointerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_locked_pointer_v1_Listener, @FUserDataRec);
end;
constructor TWpConfinedPointerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpConfinedPointerV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpConfinedPointerV1;
begin
  RegisterInterface;
  Result := TWpConfinedPointerV1.Create(ARegistry.Bind(AName, @wp_confined_pointer_v1_interface, AVersion));
end;

destructor TWpConfinedPointerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWpConfinedPointerV1.SetRegion(ARegion: TWlRegion);
begin
  wl_proxy_marshal(FProxy, _SET_REGION, ARegion.Proxy);
end;

function TWpConfinedPointerV1.AddListener(AIntf: IWpConfinedPointerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_confined_pointer_v1_Listener, @FUserDataRec);
end;




procedure wp_locked_pointer_v1_locked_Intf(AData: PWLUserData; Awp_locked_pointer_v1: Pwp_locked_pointer_v1); cdecl;
var
  AIntf: IWpLockedPointerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpLockedPointerV1Listener(AData^.ListenerUserData);
  AIntf.wp_locked_pointer_v1_locked(TWpLockedPointerV1(AData^.PascalObject));
end;

procedure wp_locked_pointer_v1_unlocked_Intf(AData: PWLUserData; Awp_locked_pointer_v1: Pwp_locked_pointer_v1); cdecl;
var
  AIntf: IWpLockedPointerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpLockedPointerV1Listener(AData^.ListenerUserData);
  AIntf.wp_locked_pointer_v1_unlocked(TWpLockedPointerV1(AData^.PascalObject));
end;

procedure wp_confined_pointer_v1_confined_Intf(AData: PWLUserData; Awp_confined_pointer_v1: Pwp_confined_pointer_v1); cdecl;
var
  AIntf: IWpConfinedPointerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpConfinedPointerV1Listener(AData^.ListenerUserData);
  AIntf.wp_confined_pointer_v1_confined(TWpConfinedPointerV1(AData^.PascalObject));
end;

procedure wp_confined_pointer_v1_unconfined_Intf(AData: PWLUserData; Awp_confined_pointer_v1: Pwp_confined_pointer_v1); cdecl;
var
  AIntf: IWpConfinedPointerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpConfinedPointerV1Listener(AData^.ListenerUserData);
  AIntf.wp_confined_pointer_v1_unconfined(TWpConfinedPointerV1(AData^.PascalObject));
end;



const
  pInterfaces: array[0..19] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wp_locked_pointer_v1_interface),
    (@wl_surface_interface),
    (@wl_pointer_interface),
    (@wl_region_interface),
    (nil),
    (@wp_confined_pointer_v1_interface),
    (@wl_surface_interface),
    (@wl_pointer_interface),
    (@wl_region_interface),
    (nil),
    (@wl_region_interface),
    (@wl_region_interface)
  );

  wp_pointer_constraints_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'lock_pointer'; signature: 'noo?ou'; types: @pInterfaces[8]),
    (name: 'confine_pointer'; signature: 'noo?ou'; types: @pInterfaces[13])
  );
  wp_locked_pointer_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_cursor_position_hint'; signature: 'ff'; types: @pInterfaces[0]),
    (name: 'set_region'; signature: '?o'; types: @pInterfaces[18])
  );
  wp_locked_pointer_v1_events: array[0..1] of Twl_message = (
    (name: 'locked'; signature: ''; types: @pInterfaces[0]),
    (name: 'unlocked'; signature: ''; types: @pInterfaces[0])
  );
  wp_confined_pointer_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_region'; signature: '?o'; types: @pInterfaces[19])
  );
  wp_confined_pointer_v1_events: array[0..1] of Twl_message = (
    (name: 'confined'; signature: ''; types: @pInterfaces[0]),
    (name: 'unconfined'; signature: ''; types: @pInterfaces[0])
  );

class procedure TWpPointerConstraintsV1.RegisterInterface;
begin
  if vwp_pointer_constraints_v1_registered then Exit;
  vwp_pointer_constraints_v1_registered := True;
  wp_pointer_constraints_v1_interface.name := PChar(WP_POINTER_CONSTRAINTS_V1_INTERFACE_NAME);
  wp_pointer_constraints_v1_interface.version := 1;
  wp_pointer_constraints_v1_interface.method_count := 3;
  wp_pointer_constraints_v1_interface.methods := @wp_pointer_constraints_v1_requests;
  wp_pointer_constraints_v1_interface.event_count := 0;
  wp_pointer_constraints_v1_interface.events := nil;
end;

class procedure TWpLockedPointerV1.RegisterInterface;
begin
  if vwp_locked_pointer_v1_registered then Exit;
  vwp_locked_pointer_v1_registered := True;
  Pointer(vIntf_wp_locked_pointer_v1_Listener.locked) := @wp_locked_pointer_v1_locked_Intf;
  Pointer(vIntf_wp_locked_pointer_v1_Listener.unlocked) := @wp_locked_pointer_v1_unlocked_Intf;
  wp_locked_pointer_v1_interface.name := PChar(WP_LOCKED_POINTER_V1_INTERFACE_NAME);
  wp_locked_pointer_v1_interface.version := 1;
  wp_locked_pointer_v1_interface.method_count := 3;
  wp_locked_pointer_v1_interface.methods := @wp_locked_pointer_v1_requests;
  wp_locked_pointer_v1_interface.event_count := 2;
  wp_locked_pointer_v1_interface.events := @wp_locked_pointer_v1_events;
end;

class procedure TWpConfinedPointerV1.RegisterInterface;
begin
  if vwp_confined_pointer_v1_registered then Exit;
  vwp_confined_pointer_v1_registered := True;
  Pointer(vIntf_wp_confined_pointer_v1_Listener.confined) := @wp_confined_pointer_v1_confined_Intf;
  Pointer(vIntf_wp_confined_pointer_v1_Listener.unconfined) := @wp_confined_pointer_v1_unconfined_Intf;
  wp_confined_pointer_v1_interface.name := PChar(WP_CONFINED_POINTER_V1_INTERFACE_NAME);
  wp_confined_pointer_v1_interface.version := 1;
  wp_confined_pointer_v1_interface.method_count := 2;
  wp_confined_pointer_v1_interface.methods := @wp_confined_pointer_v1_requests;
  wp_confined_pointer_v1_interface.event_count := 2;
  wp_confined_pointer_v1_interface.events := @wp_confined_pointer_v1_events;
end;


end.
