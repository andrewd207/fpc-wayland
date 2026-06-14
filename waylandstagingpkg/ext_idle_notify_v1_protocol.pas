unit ext_idle_notify_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pext_idle_notifier_v1 = Pointer;
  Pext_idle_notification_v1 = Pointer;
  Pext_idle_notifier_v1_listener = ^Text_idle_notifier_v1_listener;
  Text_idle_notifier_v1_listener = record
  end;

  Pext_idle_notification_v1_listener = ^Text_idle_notification_v1_listener;
  Text_idle_notification_v1_listener = record
    idled : procedure(data: Pointer; AExtIdleNotificationV1: Pext_idle_notification_v1); cdecl;
    resumed : procedure(data: Pointer; AExtIdleNotificationV1: Pext_idle_notification_v1); cdecl;
  end;



  TExtIdleNotifierV1 = class;
  TExtIdleNotificationV1 = class;


  IExtIdleNotifierV1Listener = interface
  ['IExtIdleNotifierV1Listener']
  end;

  IExtIdleNotificationV1Listener = interface
  ['IExtIdleNotificationV1Listener']
    procedure ext_idle_notification_v1_idled(AExtIdleNotificationV1: TExtIdleNotificationV1);
    procedure ext_idle_notification_v1_resumed(AExtIdleNotificationV1: TExtIdleNotificationV1);
  end;




  TExtIdleNotifierV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_IDLE_NOTIFICATION = 1;
    const _GET_INPUT_IDLE_NOTIFICATION = 2;
  public
    destructor Destroy; override;
    function GetIdleNotification(ATimeout: DWord; ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TExtIdleNotificationV1}): TExtIdleNotificationV1;
    function GetInputIdleNotification(ATimeout: DWord; ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TExtIdleNotificationV1}): TExtIdleNotificationV1;
    function AddListener(AIntf: IExtIdleNotifierV1Listener): LongInt;
  end;

  TExtIdleNotificationV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IExtIdleNotificationV1Listener): LongInt;
  end;






var
  ext_idle_notifier_v1_interface: Twl_interface;
  ext_idle_notification_v1_interface: Twl_interface;



implementation

var
  vIntf_ext_idle_notifier_v1_Listener: Text_idle_notifier_v1_listener;
  vIntf_ext_idle_notification_v1_Listener: Text_idle_notification_v1_listener;



destructor TExtIdleNotifierV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtIdleNotifierV1.GetIdleNotification(ATimeout: DWord; ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TExtIdleNotificationV1}): TExtIdleNotificationV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_IDLE_NOTIFICATION, @ext_idle_notification_v1_interface, nil, ATimeout, ASeat.Proxy);
  if AProxyClass = nil then
    AProxyClass := TExtIdleNotificationV1;
  Result := TExtIdleNotificationV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TExtIdleNotificationV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TExtIdleNotificationV1]);
end;

function TExtIdleNotifierV1.GetInputIdleNotification(ATimeout: DWord; ASeat: TWlSeat; AProxyClass: TWLProxyObjectClass = nil {TExtIdleNotificationV1}): TExtIdleNotificationV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_INPUT_IDLE_NOTIFICATION, @ext_idle_notification_v1_interface, nil, ATimeout, ASeat.Proxy);
  if AProxyClass = nil then
    AProxyClass := TExtIdleNotificationV1;
  Result := TExtIdleNotificationV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TExtIdleNotificationV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TExtIdleNotificationV1]);
end;

function TExtIdleNotifierV1.AddListener(AIntf: IExtIdleNotifierV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_idle_notifier_v1_Listener, @FUserDataRec);
end;
destructor TExtIdleNotificationV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtIdleNotificationV1.AddListener(AIntf: IExtIdleNotificationV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_idle_notification_v1_Listener, @FUserDataRec);
end;




procedure ext_idle_notification_v1_idled_Intf(AData: PWLUserData; Aext_idle_notification_v1: Pext_idle_notification_v1); cdecl;
var
  AIntf: IExtIdleNotificationV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtIdleNotificationV1Listener(AData^.ListenerUserData);
  AIntf.ext_idle_notification_v1_idled(TExtIdleNotificationV1(AData^.PascalObject));
end;

procedure ext_idle_notification_v1_resumed_Intf(AData: PWLUserData; Aext_idle_notification_v1: Pext_idle_notification_v1); cdecl;
var
  AIntf: IExtIdleNotificationV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtIdleNotificationV1Listener(AData^.ListenerUserData);
  AIntf.ext_idle_notification_v1_resumed(TExtIdleNotificationV1(AData^.PascalObject));
end;



const
  pInterfaces: array[0..13] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@ext_idle_notification_v1_interface),
    (nil),
    (@wl_seat_interface),
    (@ext_idle_notification_v1_interface),
    (nil),
    (@wl_seat_interface)
  );

  ext_idle_notifier_v1_requests: array[0..2] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_idle_notification'; signature: 'nuo'; types: @pInterfaces[8]),
    (name: 'get_input_idle_notification'; signature: '2nuo'; types: @pInterfaces[11])
  );
  ext_idle_notification_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  ext_idle_notification_v1_events: array[0..1] of Twl_message = (
    (name: 'idled'; signature: ''; types: @pInterfaces[0]),
    (name: 'resumed'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_ext_idle_notification_v1_Listener.idled) := @ext_idle_notification_v1_idled_Intf;
  Pointer(vIntf_ext_idle_notification_v1_Listener.resumed) := @ext_idle_notification_v1_resumed_Intf;


  ext_idle_notifier_v1_interface.name := 'ext_idle_notifier_v1';
  ext_idle_notifier_v1_interface.version := 2;
  ext_idle_notifier_v1_interface.method_count := 3;
  ext_idle_notifier_v1_interface.methods := @ext_idle_notifier_v1_requests;
  ext_idle_notifier_v1_interface.event_count := 0;
  ext_idle_notifier_v1_interface.events := nil;

  ext_idle_notification_v1_interface.name := 'ext_idle_notification_v1';
  ext_idle_notification_v1_interface.version := 2;
  ext_idle_notification_v1_interface.method_count := 1;
  ext_idle_notification_v1_interface.methods := @ext_idle_notification_v1_requests;
  ext_idle_notification_v1_interface.event_count := 2;
  ext_idle_notification_v1_interface.events := @ext_idle_notification_v1_events;

end.
