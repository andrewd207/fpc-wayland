unit ext_transient_seat_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pext_transient_seat_manager_v1 = Pointer;
  Pext_transient_seat_v1 = Pointer;
  Pext_transient_seat_manager_v1_listener = ^Text_transient_seat_manager_v1_listener;
  Text_transient_seat_manager_v1_listener = record
  end;

  Pext_transient_seat_v1_listener = ^Text_transient_seat_v1_listener;
  Text_transient_seat_v1_listener = record
    ready : procedure(data: Pointer; AExtTransientSeatV1: Pext_transient_seat_v1; AGlobalName: DWord); cdecl;
    denied : procedure(data: Pointer; AExtTransientSeatV1: Pext_transient_seat_v1); cdecl;
  end;



  TExtTransientSeatManagerV1 = class;
  TExtTransientSeatV1 = class;


  IExtTransientSeatManagerV1Listener = interface
  ['IExtTransientSeatManagerV1Listener']
  end;

  IExtTransientSeatV1Listener = interface
  ['IExtTransientSeatV1Listener']
    procedure ext_transient_seat_v1_ready(AExtTransientSeatV1: TExtTransientSeatV1; AGlobalName: DWord);
    procedure ext_transient_seat_v1_denied(AExtTransientSeatV1: TExtTransientSeatV1);
  end;




  TExtTransientSeatManagerV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtTransientSeatManagerV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _CREATE = 0;
    const _DESTROY = 1;
  public
    function Create(AProxyClass: TWLProxyObjectClass = nil {TExtTransientSeatV1}): TExtTransientSeatV1;
    destructor Destroy; override;
    function AddListener(AIntf: IExtTransientSeatManagerV1Listener): LongInt;
  end;

  TExtTransientSeatV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtTransientSeatV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IExtTransientSeatV1Listener): LongInt;
  end;






var
  ext_transient_seat_manager_v1_interface: Twl_interface;
  EXT_TRANSIENT_SEAT_MANAGER_V1_INTERFACE_NAME: String = 'ext_transient_seat_manager_v1';
  ext_transient_seat_v1_interface: Twl_interface;
  EXT_TRANSIENT_SEAT_V1_INTERFACE_NAME: String = 'ext_transient_seat_v1';



implementation

var
  vext_transient_seat_manager_v1_registered: Boolean = False;
  vIntf_ext_transient_seat_manager_v1_Listener: Text_transient_seat_manager_v1_listener;
  vext_transient_seat_v1_registered: Boolean = False;
  vIntf_ext_transient_seat_v1_Listener: Text_transient_seat_v1_listener;



constructor TExtTransientSeatManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TExtTransientSeatManagerV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtTransientSeatManagerV1;
begin
  RegisterInterface;
  Result := TExtTransientSeatManagerV1.Create(ARegistry.Bind(AName, @ext_transient_seat_manager_v1_interface, AVersion));
end;

function TExtTransientSeatManagerV1.Create(AProxyClass: TWLProxyObjectClass = nil {TExtTransientSeatV1}): TExtTransientSeatV1;
var
  seat: Pwl_proxy;
begin
  TExtTransientSeatV1.RegisterInterface;
  seat := wl_proxy_marshal_constructor(FProxy,
      _CREATE, @ext_transient_seat_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TExtTransientSeatV1;
  Result := TExtTransientSeatV1(AProxyClass.Create(seat));
  if not AProxyClass.InheritsFrom(TExtTransientSeatV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TExtTransientSeatV1]);
end;

destructor TExtTransientSeatManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtTransientSeatManagerV1.AddListener(AIntf: IExtTransientSeatManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_transient_seat_manager_v1_Listener, @FUserDataRec);
end;
constructor TExtTransientSeatV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TExtTransientSeatV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtTransientSeatV1;
begin
  RegisterInterface;
  Result := TExtTransientSeatV1.Create(ARegistry.Bind(AName, @ext_transient_seat_v1_interface, AVersion));
end;

destructor TExtTransientSeatV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtTransientSeatV1.AddListener(AIntf: IExtTransientSeatV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_transient_seat_v1_Listener, @FUserDataRec);
end;




procedure ext_transient_seat_v1_ready_Intf(AData: PWLUserData; Aext_transient_seat_v1: Pext_transient_seat_v1; AGlobalName: DWord); cdecl;
var
  AIntf: IExtTransientSeatV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtTransientSeatV1Listener(AData^.ListenerUserData);
  AIntf.ext_transient_seat_v1_ready(TExtTransientSeatV1(AData^.PascalObject), AGlobalName);
end;

procedure ext_transient_seat_v1_denied_Intf(AData: PWLUserData; Aext_transient_seat_v1: Pext_transient_seat_v1); cdecl;
var
  AIntf: IExtTransientSeatV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtTransientSeatV1Listener(AData^.ListenerUserData);
  AIntf.ext_transient_seat_v1_denied(TExtTransientSeatV1(AData^.PascalObject));
end;



const
  pInterfaces: array[0..8] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@ext_transient_seat_v1_interface)
  );

  ext_transient_seat_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'create'; signature: 'n'; types: @pInterfaces[8]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  ext_transient_seat_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  ext_transient_seat_v1_events: array[0..1] of Twl_message = (
    (name: 'ready'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'denied'; signature: ''; types: @pInterfaces[0])
  );

class procedure TExtTransientSeatManagerV1.RegisterInterface;
begin
  if vext_transient_seat_manager_v1_registered then Exit;
  vext_transient_seat_manager_v1_registered := True;
  ext_transient_seat_manager_v1_interface.name := PChar(EXT_TRANSIENT_SEAT_MANAGER_V1_INTERFACE_NAME);
  ext_transient_seat_manager_v1_interface.version := 1;
  ext_transient_seat_manager_v1_interface.method_count := 2;
  ext_transient_seat_manager_v1_interface.methods := @ext_transient_seat_manager_v1_requests;
  ext_transient_seat_manager_v1_interface.event_count := 0;
  ext_transient_seat_manager_v1_interface.events := nil;
end;

class procedure TExtTransientSeatV1.RegisterInterface;
begin
  if vext_transient_seat_v1_registered then Exit;
  vext_transient_seat_v1_registered := True;
  Pointer(vIntf_ext_transient_seat_v1_Listener.ready) := @ext_transient_seat_v1_ready_Intf;
  Pointer(vIntf_ext_transient_seat_v1_Listener.denied) := @ext_transient_seat_v1_denied_Intf;
  ext_transient_seat_v1_interface.name := PChar(EXT_TRANSIENT_SEAT_V1_INTERFACE_NAME);
  ext_transient_seat_v1_interface.version := 1;
  ext_transient_seat_v1_interface.method_count := 1;
  ext_transient_seat_v1_interface.methods := @ext_transient_seat_v1_requests;
  ext_transient_seat_v1_interface.event_count := 2;
  ext_transient_seat_v1_interface.events := @ext_transient_seat_v1_events;
end;


end.
