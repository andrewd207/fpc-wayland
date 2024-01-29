unit input_timestamps_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_input_timestamps_manager_v1 = Pointer;
  Pzwp_input_timestamps_v1 = Pointer;
  Pzwp_input_timestamps_manager_v1_listener = ^Tzwp_input_timestamps_manager_v1_listener;
  Tzwp_input_timestamps_manager_v1_listener = record
  end;

  Pzwp_input_timestamps_v1_listener = ^Tzwp_input_timestamps_v1_listener;
  Tzwp_input_timestamps_v1_listener = record
    timestamp : procedure(data: Pointer; AZwpInputTimestampsV1: Pzwp_input_timestamps_v1; ATvSecHi: DWord; ATvSecLo: DWord; ATvNsec: DWord); cdecl;
  end;



  TZwpInputTimestampsManagerV1 = class;
  TZwpInputTimestampsV1 = class;


  IZwpInputTimestampsManagerV1Listener = interface
  ['IZwpInputTimestampsManagerV1Listener']
  end;

  IZwpInputTimestampsV1Listener = interface
  ['IZwpInputTimestampsV1Listener']
    procedure zwp_input_timestamps_v1_timestamp(AZwpInputTimestampsV1: TZwpInputTimestampsV1; ATvSecHi: DWord; ATvSecLo: DWord; ATvNsec: DWord);
  end;




  TZwpInputTimestampsManagerV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_KEYBOARD_TIMESTAMPS = 1;
    const _GET_POINTER_TIMESTAMPS = 2;
    const _GET_TOUCH_TIMESTAMPS = 3;
  public
    destructor Destroy; override;
    function GetKeyboardTimestamps(AKeyboard: TWlKeyboard; AProxyClass: TWLProxyObjectClass = nil {TZwpInputTimestampsV1}): TZwpInputTimestampsV1;
    function GetPointerTimestamps(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TZwpInputTimestampsV1}): TZwpInputTimestampsV1;
    function GetTouchTimestamps(ATouch: TWlTouch; AProxyClass: TWLProxyObjectClass = nil {TZwpInputTimestampsV1}): TZwpInputTimestampsV1;
    function AddListener(AIntf: IZwpInputTimestampsManagerV1Listener): LongInt;
  end;

  TZwpInputTimestampsV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IZwpInputTimestampsV1Listener): LongInt;
  end;






var
  zwp_input_timestamps_manager_v1_interface: Twl_interface;
  zwp_input_timestamps_v1_interface: Twl_interface;



implementation

var
  vIntf_zwp_input_timestamps_manager_v1_Listener: Tzwp_input_timestamps_manager_v1_listener;
  vIntf_zwp_input_timestamps_v1_Listener: Tzwp_input_timestamps_v1_listener;



destructor TZwpInputTimestampsManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpInputTimestampsManagerV1.GetKeyboardTimestamps(AKeyboard: TWlKeyboard; AProxyClass: TWLProxyObjectClass = nil {TZwpInputTimestampsV1}): TZwpInputTimestampsV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_KEYBOARD_TIMESTAMPS, @zwp_input_timestamps_v1_interface, nil, AKeyboard.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpInputTimestampsV1;
  if not AProxyClass.InheritsFrom(TZwpInputTimestampsV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpInputTimestampsV1]);
  Result := TZwpInputTimestampsV1(AProxyClass.Create(id));
end;

function TZwpInputTimestampsManagerV1.GetPointerTimestamps(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TZwpInputTimestampsV1}): TZwpInputTimestampsV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_POINTER_TIMESTAMPS, @zwp_input_timestamps_v1_interface, nil, APointer.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpInputTimestampsV1;
  if not AProxyClass.InheritsFrom(TZwpInputTimestampsV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpInputTimestampsV1]);
  Result := TZwpInputTimestampsV1(AProxyClass.Create(id));
end;

function TZwpInputTimestampsManagerV1.GetTouchTimestamps(ATouch: TWlTouch; AProxyClass: TWLProxyObjectClass = nil {TZwpInputTimestampsV1}): TZwpInputTimestampsV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_TOUCH_TIMESTAMPS, @zwp_input_timestamps_v1_interface, nil, ATouch.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpInputTimestampsV1;
  if not AProxyClass.InheritsFrom(TZwpInputTimestampsV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpInputTimestampsV1]);
  Result := TZwpInputTimestampsV1(AProxyClass.Create(id));
end;

function TZwpInputTimestampsManagerV1.AddListener(AIntf: IZwpInputTimestampsManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_input_timestamps_manager_v1_Listener, @FUserDataRec);
end;
destructor TZwpInputTimestampsV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpInputTimestampsV1.AddListener(AIntf: IZwpInputTimestampsV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_input_timestamps_v1_Listener, @FUserDataRec);
end;




procedure zwp_input_timestamps_v1_timestamp_Intf(AData: PWLUserData; Azwp_input_timestamps_v1: Pzwp_input_timestamps_v1; ATvSecHi: DWord; ATvSecLo: DWord; ATvNsec: DWord); cdecl;
var
  AIntf: IZwpInputTimestampsV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpInputTimestampsV1Listener(AData^.ListenerUserData);
  AIntf.zwp_input_timestamps_v1_timestamp(TZwpInputTimestampsV1(AData^.PascalObject), ATvSecHi, ATvSecLo, ATvNsec);
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
    (@zwp_input_timestamps_v1_interface),
    (@wl_keyboard_interface),
    (@zwp_input_timestamps_v1_interface),
    (@wl_pointer_interface),
    (@zwp_input_timestamps_v1_interface),
    (@wl_touch_interface)
  );

  zwp_input_timestamps_manager_v1_requests: array[0..3] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_keyboard_timestamps'; signature: 'no'; types: @pInterfaces[8]),
    (name: 'get_pointer_timestamps'; signature: 'no'; types: @pInterfaces[10]),
    (name: 'get_touch_timestamps'; signature: 'no'; types: @pInterfaces[12])
  );
  zwp_input_timestamps_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_input_timestamps_v1_events: array[0..0] of Twl_message = (
    (name: 'timestamp'; signature: 'uuu'; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_input_timestamps_v1_Listener.timestamp) := @zwp_input_timestamps_v1_timestamp_Intf;


  zwp_input_timestamps_manager_v1_interface.name := 'zwp_input_timestamps_manager_v1';
  zwp_input_timestamps_manager_v1_interface.version := 1;
  zwp_input_timestamps_manager_v1_interface.method_count := 4;
  zwp_input_timestamps_manager_v1_interface.methods := @zwp_input_timestamps_manager_v1_requests;
  zwp_input_timestamps_manager_v1_interface.event_count := 0;
  zwp_input_timestamps_manager_v1_interface.events := nil;

  zwp_input_timestamps_v1_interface.name := 'zwp_input_timestamps_v1';
  zwp_input_timestamps_v1_interface.version := 1;
  zwp_input_timestamps_v1_interface.method_count := 1;
  zwp_input_timestamps_v1_interface.methods := @zwp_input_timestamps_v1_requests;
  zwp_input_timestamps_v1_interface.event_count := 1;
  zwp_input_timestamps_v1_interface.events := @zwp_input_timestamps_v1_events;

end.
