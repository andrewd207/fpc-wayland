unit input_timestamps_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_input_timestamps_manager_v1 = Pointer;
  Pwp_input_timestamps_v1 = Pointer;
  Pwp_input_timestamps_manager_v1_listener = ^Twp_input_timestamps_manager_v1_listener;
  Twp_input_timestamps_manager_v1_listener = record
  end;

  Pwp_input_timestamps_v1_listener = ^Twp_input_timestamps_v1_listener;
  Twp_input_timestamps_v1_listener = record
    timestamp : procedure(data: Pointer; AWpInputTimestampsV1: Pwp_input_timestamps_v1; ATvSecHi: DWord; ATvSecLo: DWord; ATvNsec: DWord); cdecl;
  end;



  TWpInputTimestampsManagerV1 = class;
  TWpInputTimestampsV1 = class;


  IWpInputTimestampsManagerV1Listener = interface
  ['IWpInputTimestampsManagerV1Listener']
  end;

  IWpInputTimestampsV1Listener = interface
  ['IWpInputTimestampsV1Listener']
    procedure wp_input_timestamps_v1_timestamp(AWpInputTimestampsV1: TWpInputTimestampsV1; ATvSecHi: DWord; ATvSecLo: DWord; ATvNsec: DWord);
  end;




  TWpInputTimestampsManagerV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpInputTimestampsManagerV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _GET_KEYBOARD_TIMESTAMPS = 1;
    const _GET_POINTER_TIMESTAMPS = 2;
    const _GET_TOUCH_TIMESTAMPS = 3;
  public
    destructor Destroy; override;
    function GetKeyboardTimestamps(AKeyboard: TWlKeyboard; AProxyClass: TWLProxyObjectClass = nil {TWpInputTimestampsV1}): TWpInputTimestampsV1;
    function GetPointerTimestamps(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TWpInputTimestampsV1}): TWpInputTimestampsV1;
    function GetTouchTimestamps(ATouch: TWlTouch; AProxyClass: TWLProxyObjectClass = nil {TWpInputTimestampsV1}): TWpInputTimestampsV1;
    function AddListener(AIntf: IWpInputTimestampsManagerV1Listener): LongInt;
  end;

  TWpInputTimestampsV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpInputTimestampsV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpInputTimestampsV1Listener): LongInt;
  end;






var
  wp_input_timestamps_manager_v1_interface: Twl_interface;
  WP_INPUT_TIMESTAMPS_MANAGER_V1_INTERFACE_NAME: String = 'zwp_input_timestamps_manager_v1';
  wp_input_timestamps_v1_interface: Twl_interface;
  WP_INPUT_TIMESTAMPS_V1_INTERFACE_NAME: String = 'zwp_input_timestamps_v1';



implementation

var
  vwp_input_timestamps_manager_v1_registered: Boolean = False;
  vIntf_wp_input_timestamps_manager_v1_Listener: Twp_input_timestamps_manager_v1_listener;
  vwp_input_timestamps_v1_registered: Boolean = False;
  vIntf_wp_input_timestamps_v1_Listener: Twp_input_timestamps_v1_listener;



constructor TWpInputTimestampsManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpInputTimestampsManagerV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpInputTimestampsManagerV1;
begin
  RegisterInterface;
  Result := TWpInputTimestampsManagerV1.Create(ARegistry.Bind(AName, @wp_input_timestamps_manager_v1_interface, AVersion));
end;

destructor TWpInputTimestampsManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpInputTimestampsManagerV1.GetKeyboardTimestamps(AKeyboard: TWlKeyboard; AProxyClass: TWLProxyObjectClass = nil {TWpInputTimestampsV1}): TWpInputTimestampsV1;
var
  id: Pwl_proxy;
begin
  TWpInputTimestampsV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_KEYBOARD_TIMESTAMPS, @wp_input_timestamps_v1_interface, nil, AKeyboard.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpInputTimestampsV1;
  Result := TWpInputTimestampsV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpInputTimestampsV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpInputTimestampsV1]);
end;

function TWpInputTimestampsManagerV1.GetPointerTimestamps(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TWpInputTimestampsV1}): TWpInputTimestampsV1;
var
  id: Pwl_proxy;
begin
  TWpInputTimestampsV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_POINTER_TIMESTAMPS, @wp_input_timestamps_v1_interface, nil, APointer.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpInputTimestampsV1;
  Result := TWpInputTimestampsV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpInputTimestampsV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpInputTimestampsV1]);
end;

function TWpInputTimestampsManagerV1.GetTouchTimestamps(ATouch: TWlTouch; AProxyClass: TWLProxyObjectClass = nil {TWpInputTimestampsV1}): TWpInputTimestampsV1;
var
  id: Pwl_proxy;
begin
  TWpInputTimestampsV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_TOUCH_TIMESTAMPS, @wp_input_timestamps_v1_interface, nil, ATouch.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpInputTimestampsV1;
  Result := TWpInputTimestampsV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpInputTimestampsV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpInputTimestampsV1]);
end;

function TWpInputTimestampsManagerV1.AddListener(AIntf: IWpInputTimestampsManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_input_timestamps_manager_v1_Listener, @FUserDataRec);
end;
constructor TWpInputTimestampsV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpInputTimestampsV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpInputTimestampsV1;
begin
  RegisterInterface;
  Result := TWpInputTimestampsV1.Create(ARegistry.Bind(AName, @wp_input_timestamps_v1_interface, AVersion));
end;

destructor TWpInputTimestampsV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpInputTimestampsV1.AddListener(AIntf: IWpInputTimestampsV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_input_timestamps_v1_Listener, @FUserDataRec);
end;




procedure wp_input_timestamps_v1_timestamp_Intf(AData: PWLUserData; Awp_input_timestamps_v1: Pwp_input_timestamps_v1; ATvSecHi: DWord; ATvSecLo: DWord; ATvNsec: DWord); cdecl;
var
  AIntf: IWpInputTimestampsV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpInputTimestampsV1Listener(AData^.ListenerUserData);
  AIntf.wp_input_timestamps_v1_timestamp(TWpInputTimestampsV1(AData^.PascalObject), ATvSecHi, ATvSecLo, ATvNsec);
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
    (@wp_input_timestamps_v1_interface),
    (@wl_keyboard_interface),
    (@wp_input_timestamps_v1_interface),
    (@wl_pointer_interface),
    (@wp_input_timestamps_v1_interface),
    (@wl_touch_interface)
  );

  wp_input_timestamps_manager_v1_requests: array[0..3] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_keyboard_timestamps'; signature: 'no'; types: @pInterfaces[8]),
    (name: 'get_pointer_timestamps'; signature: 'no'; types: @pInterfaces[10]),
    (name: 'get_touch_timestamps'; signature: 'no'; types: @pInterfaces[12])
  );
  wp_input_timestamps_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_input_timestamps_v1_events: array[0..0] of Twl_message = (
    (name: 'timestamp'; signature: 'uuu'; types: @pInterfaces[0])
  );

class procedure TWpInputTimestampsManagerV1.RegisterInterface;
begin
  if vwp_input_timestamps_manager_v1_registered then Exit;
  vwp_input_timestamps_manager_v1_registered := True;
  wp_input_timestamps_manager_v1_interface.name := PChar(WP_INPUT_TIMESTAMPS_MANAGER_V1_INTERFACE_NAME);
  wp_input_timestamps_manager_v1_interface.version := 1;
  wp_input_timestamps_manager_v1_interface.method_count := 4;
  wp_input_timestamps_manager_v1_interface.methods := @wp_input_timestamps_manager_v1_requests;
  wp_input_timestamps_manager_v1_interface.event_count := 0;
  wp_input_timestamps_manager_v1_interface.events := nil;
end;

class procedure TWpInputTimestampsV1.RegisterInterface;
begin
  if vwp_input_timestamps_v1_registered then Exit;
  vwp_input_timestamps_v1_registered := True;
  Pointer(vIntf_wp_input_timestamps_v1_Listener.timestamp) := @wp_input_timestamps_v1_timestamp_Intf;
  wp_input_timestamps_v1_interface.name := PChar(WP_INPUT_TIMESTAMPS_V1_INTERFACE_NAME);
  wp_input_timestamps_v1_interface.version := 1;
  wp_input_timestamps_v1_interface.method_count := 1;
  wp_input_timestamps_v1_interface.methods := @wp_input_timestamps_v1_requests;
  wp_input_timestamps_v1_interface.event_count := 1;
  wp_input_timestamps_v1_interface.events := @wp_input_timestamps_v1_events;
end;


end.
