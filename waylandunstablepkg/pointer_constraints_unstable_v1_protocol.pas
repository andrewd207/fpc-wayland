unit pointer_constraints_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_pointer_constraints_v1 = Pointer;
  Pzwp_locked_pointer_v1 = Pointer;
  Pzwp_confined_pointer_v1 = Pointer;
const
  ZWP_POINTER_CONSTRAINTS_V1_ERROR_ALREADY_CONSTRAINED = 1; // pointer constraint already requested on that surface
  ZWP_POINTER_CONSTRAINTS_V1_LIFETIME_ONESHOT = 1; // the pointer constraint is defunct once deactivated
  ZWP_POINTER_CONSTRAINTS_V1_LIFETIME_PERSISTENT = 2; // the pointer constraint may reactivate

type
  Pzwp_pointer_constraints_v1_listener = ^Tzwp_pointer_constraints_v1_listener;
  Tzwp_pointer_constraints_v1_listener = record
  end;

  Pzwp_locked_pointer_v1_listener = ^Tzwp_locked_pointer_v1_listener;
  Tzwp_locked_pointer_v1_listener = record
    locked : procedure(data: Pointer; AZwpLockedPointerV1: Pzwp_locked_pointer_v1); cdecl;
    unlocked : procedure(data: Pointer; AZwpLockedPointerV1: Pzwp_locked_pointer_v1); cdecl;
  end;

  Pzwp_confined_pointer_v1_listener = ^Tzwp_confined_pointer_v1_listener;
  Tzwp_confined_pointer_v1_listener = record
    confined : procedure(data: Pointer; AZwpConfinedPointerV1: Pzwp_confined_pointer_v1); cdecl;
    unconfined : procedure(data: Pointer; AZwpConfinedPointerV1: Pzwp_confined_pointer_v1); cdecl;
  end;



  TZwpPointerConstraintsV1 = class;
  TZwpLockedPointerV1 = class;
  TZwpConfinedPointerV1 = class;


  IZwpPointerConstraintsV1Listener = interface
  ['IZwpPointerConstraintsV1Listener']
  end;

  IZwpLockedPointerV1Listener = interface
  ['IZwpLockedPointerV1Listener']
    procedure zwp_locked_pointer_v1_locked(AZwpLockedPointerV1: TZwpLockedPointerV1);
    procedure zwp_locked_pointer_v1_unlocked(AZwpLockedPointerV1: TZwpLockedPointerV1);
  end;

  IZwpConfinedPointerV1Listener = interface
  ['IZwpConfinedPointerV1Listener']
    procedure zwp_confined_pointer_v1_confined(AZwpConfinedPointerV1: TZwpConfinedPointerV1);
    procedure zwp_confined_pointer_v1_unconfined(AZwpConfinedPointerV1: TZwpConfinedPointerV1);
  end;




  TZwpPointerConstraintsV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _LOCK_POINTER = 1;
    const _CONFINE_POINTER = 2;
  public
    destructor Destroy; override;
    function LockPointer(ASurface: TWlSurface; APointer: TWlPointer; ARegion: TWlRegion; ALifetime: DWord; AProxyClass: TWLProxyObjectClass = nil {TZwpLockedPointerV1}): TZwpLockedPointerV1;
    function ConfinePointer(ASurface: TWlSurface; APointer: TWlPointer; ARegion: TWlRegion; ALifetime: DWord; AProxyClass: TWLProxyObjectClass = nil {TZwpConfinedPointerV1}): TZwpConfinedPointerV1;
    function AddListener(AIntf: IZwpPointerConstraintsV1Listener): LongInt;
  end;

  TZwpLockedPointerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _SET_CURSOR_POSITION_HINT = 1;
    const _SET_REGION = 2;
  public
    destructor Destroy; override;
    procedure SetCursorPositionHint(ASurfaceX: Longint{24.8}; ASurfaceY: Longint{24.8});
    procedure SetRegion(ARegion: TWlRegion);
    function AddListener(AIntf: IZwpLockedPointerV1Listener): LongInt;
  end;

  TZwpConfinedPointerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _SET_REGION = 1;
  public
    destructor Destroy; override;
    procedure SetRegion(ARegion: TWlRegion);
    function AddListener(AIntf: IZwpConfinedPointerV1Listener): LongInt;
  end;






var
  zwp_pointer_constraints_v1_interface: Twl_interface;
  zwp_locked_pointer_v1_interface: Twl_interface;
  zwp_confined_pointer_v1_interface: Twl_interface;



implementation

var
  vIntf_zwp_pointer_constraints_v1_Listener: Tzwp_pointer_constraints_v1_listener;
  vIntf_zwp_locked_pointer_v1_Listener: Tzwp_locked_pointer_v1_listener;
  vIntf_zwp_confined_pointer_v1_Listener: Tzwp_confined_pointer_v1_listener;



destructor TZwpPointerConstraintsV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpPointerConstraintsV1.LockPointer(ASurface: TWlSurface; APointer: TWlPointer; ARegion: TWlRegion; ALifetime: DWord; AProxyClass: TWLProxyObjectClass = nil {TZwpLockedPointerV1}): TZwpLockedPointerV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _LOCK_POINTER, @zwp_locked_pointer_v1_interface, nil, ASurface.Proxy, APointer.Proxy, ARegion.Proxy, ALifetime);
  if AProxyClass = nil then
    AProxyClass := TZwpLockedPointerV1;
  Result := TZwpLockedPointerV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TZwpLockedPointerV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpLockedPointerV1]);
end;

function TZwpPointerConstraintsV1.ConfinePointer(ASurface: TWlSurface; APointer: TWlPointer; ARegion: TWlRegion; ALifetime: DWord; AProxyClass: TWLProxyObjectClass = nil {TZwpConfinedPointerV1}): TZwpConfinedPointerV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _CONFINE_POINTER, @zwp_confined_pointer_v1_interface, nil, ASurface.Proxy, APointer.Proxy, ARegion.Proxy, ALifetime);
  if AProxyClass = nil then
    AProxyClass := TZwpConfinedPointerV1;
  Result := TZwpConfinedPointerV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TZwpConfinedPointerV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpConfinedPointerV1]);
end;

function TZwpPointerConstraintsV1.AddListener(AIntf: IZwpPointerConstraintsV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_pointer_constraints_v1_Listener, @FUserDataRec);
end;
destructor TZwpLockedPointerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TZwpLockedPointerV1.SetCursorPositionHint(ASurfaceX: Longint{24.8}; ASurfaceY: Longint{24.8});
begin
  wl_proxy_marshal(FProxy, _SET_CURSOR_POSITION_HINT, ASurfaceX, ASurfaceY);
end;

procedure TZwpLockedPointerV1.SetRegion(ARegion: TWlRegion);
begin
  wl_proxy_marshal(FProxy, _SET_REGION, ARegion.Proxy);
end;

function TZwpLockedPointerV1.AddListener(AIntf: IZwpLockedPointerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_locked_pointer_v1_Listener, @FUserDataRec);
end;
destructor TZwpConfinedPointerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TZwpConfinedPointerV1.SetRegion(ARegion: TWlRegion);
begin
  wl_proxy_marshal(FProxy, _SET_REGION, ARegion.Proxy);
end;

function TZwpConfinedPointerV1.AddListener(AIntf: IZwpConfinedPointerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_confined_pointer_v1_Listener, @FUserDataRec);
end;




procedure zwp_locked_pointer_v1_locked_Intf(AData: PWLUserData; Azwp_locked_pointer_v1: Pzwp_locked_pointer_v1); cdecl;
var
  AIntf: IZwpLockedPointerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpLockedPointerV1Listener(AData^.ListenerUserData);
  AIntf.zwp_locked_pointer_v1_locked(TZwpLockedPointerV1(AData^.PascalObject));
end;

procedure zwp_locked_pointer_v1_unlocked_Intf(AData: PWLUserData; Azwp_locked_pointer_v1: Pzwp_locked_pointer_v1); cdecl;
var
  AIntf: IZwpLockedPointerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpLockedPointerV1Listener(AData^.ListenerUserData);
  AIntf.zwp_locked_pointer_v1_unlocked(TZwpLockedPointerV1(AData^.PascalObject));
end;

procedure zwp_confined_pointer_v1_confined_Intf(AData: PWLUserData; Azwp_confined_pointer_v1: Pzwp_confined_pointer_v1); cdecl;
var
  AIntf: IZwpConfinedPointerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpConfinedPointerV1Listener(AData^.ListenerUserData);
  AIntf.zwp_confined_pointer_v1_confined(TZwpConfinedPointerV1(AData^.PascalObject));
end;

procedure zwp_confined_pointer_v1_unconfined_Intf(AData: PWLUserData; Azwp_confined_pointer_v1: Pzwp_confined_pointer_v1); cdecl;
var
  AIntf: IZwpConfinedPointerV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpConfinedPointerV1Listener(AData^.ListenerUserData);
  AIntf.zwp_confined_pointer_v1_unconfined(TZwpConfinedPointerV1(AData^.PascalObject));
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
    (@zwp_locked_pointer_v1_interface),
    (@wl_surface_interface),
    (@wl_pointer_interface),
    (@wl_region_interface),
    (nil),
    (@zwp_confined_pointer_v1_interface),
    (@wl_surface_interface),
    (@wl_pointer_interface),
    (@wl_region_interface),
    (nil),
    (@wl_region_interface),
    (@wl_region_interface)
  );

  zwp_pointer_constraints_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'lock_pointer'; signature: 'noo?ou'; types: @pInterfaces[8]),
    (name: 'confine_pointer'; signature: 'noo?ou'; types: @pInterfaces[13])
  );
  zwp_locked_pointer_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_cursor_position_hint'; signature: 'ff'; types: @pInterfaces[0]),
    (name: 'set_region'; signature: '?o'; types: @pInterfaces[18])
  );
  zwp_locked_pointer_v1_events: array[0..1] of Twl_message = (
    (name: 'locked'; signature: ''; types: @pInterfaces[0]),
    (name: 'unlocked'; signature: ''; types: @pInterfaces[0])
  );
  zwp_confined_pointer_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_region'; signature: '?o'; types: @pInterfaces[19])
  );
  zwp_confined_pointer_v1_events: array[0..1] of Twl_message = (
    (name: 'confined'; signature: ''; types: @pInterfaces[0]),
    (name: 'unconfined'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_locked_pointer_v1_Listener.locked) := @zwp_locked_pointer_v1_locked_Intf;
  Pointer(vIntf_zwp_locked_pointer_v1_Listener.unlocked) := @zwp_locked_pointer_v1_unlocked_Intf;
  Pointer(vIntf_zwp_confined_pointer_v1_Listener.confined) := @zwp_confined_pointer_v1_confined_Intf;
  Pointer(vIntf_zwp_confined_pointer_v1_Listener.unconfined) := @zwp_confined_pointer_v1_unconfined_Intf;


  zwp_pointer_constraints_v1_interface.name := 'zwp_pointer_constraints_v1';
  zwp_pointer_constraints_v1_interface.version := 1;
  zwp_pointer_constraints_v1_interface.method_count := 3;
  zwp_pointer_constraints_v1_interface.methods := @zwp_pointer_constraints_v1_requests;
  zwp_pointer_constraints_v1_interface.event_count := 0;
  zwp_pointer_constraints_v1_interface.events := nil;

  zwp_locked_pointer_v1_interface.name := 'zwp_locked_pointer_v1';
  zwp_locked_pointer_v1_interface.version := 1;
  zwp_locked_pointer_v1_interface.method_count := 3;
  zwp_locked_pointer_v1_interface.methods := @zwp_locked_pointer_v1_requests;
  zwp_locked_pointer_v1_interface.event_count := 2;
  zwp_locked_pointer_v1_interface.events := @zwp_locked_pointer_v1_events;

  zwp_confined_pointer_v1_interface.name := 'zwp_confined_pointer_v1';
  zwp_confined_pointer_v1_interface.version := 1;
  zwp_confined_pointer_v1_interface.method_count := 2;
  zwp_confined_pointer_v1_interface.methods := @zwp_confined_pointer_v1_requests;
  zwp_confined_pointer_v1_interface.event_count := 2;
  zwp_confined_pointer_v1_interface.events := @zwp_confined_pointer_v1_events;

end.
