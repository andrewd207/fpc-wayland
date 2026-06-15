unit pointer_gestures_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_pointer_gestures_v1 = Pointer;
  Pwp_pointer_gesture_swipe_v1 = Pointer;
  Pwp_pointer_gesture_pinch_v1 = Pointer;
  Pwp_pointer_gesture_hold_v1 = Pointer;
  Pwp_pointer_gestures_v1_listener = ^Twp_pointer_gestures_v1_listener;
  Twp_pointer_gestures_v1_listener = record
  end;

  Pwp_pointer_gesture_swipe_v1_listener = ^Twp_pointer_gesture_swipe_v1_listener;
  Twp_pointer_gesture_swipe_v1_listener = record
    begin_ : procedure(data: Pointer; AWpPointerGestureSwipeV1: Pwp_pointer_gesture_swipe_v1; ASerial: DWord; ATime: DWord; ASurface: Pwl_surface; AFingers: DWord); cdecl;
    update : procedure(data: Pointer; AWpPointerGestureSwipeV1: Pwp_pointer_gesture_swipe_v1; ATime: DWord; ADx: Longint{24.8}; ADy: Longint{24.8}); cdecl;
    end_ : procedure(data: Pointer; AWpPointerGestureSwipeV1: Pwp_pointer_gesture_swipe_v1; ASerial: DWord; ATime: DWord; ACancelled: LongInt); cdecl;
  end;

  Pwp_pointer_gesture_pinch_v1_listener = ^Twp_pointer_gesture_pinch_v1_listener;
  Twp_pointer_gesture_pinch_v1_listener = record
    begin_ : procedure(data: Pointer; AWpPointerGesturePinchV1: Pwp_pointer_gesture_pinch_v1; ASerial: DWord; ATime: DWord; ASurface: Pwl_surface; AFingers: DWord); cdecl;
    update : procedure(data: Pointer; AWpPointerGesturePinchV1: Pwp_pointer_gesture_pinch_v1; ATime: DWord; ADx: Longint{24.8}; ADy: Longint{24.8}; AScale: Longint{24.8}; ARotation: Longint{24.8}); cdecl;
    end_ : procedure(data: Pointer; AWpPointerGesturePinchV1: Pwp_pointer_gesture_pinch_v1; ASerial: DWord; ATime: DWord; ACancelled: LongInt); cdecl;
  end;

  Pwp_pointer_gesture_hold_v1_listener = ^Twp_pointer_gesture_hold_v1_listener;
  Twp_pointer_gesture_hold_v1_listener = record
    begin_ : procedure(data: Pointer; AWpPointerGestureHoldV1: Pwp_pointer_gesture_hold_v1; ASerial: DWord; ATime: DWord; ASurface: Pwl_surface; AFingers: DWord); cdecl;
    end_ : procedure(data: Pointer; AWpPointerGestureHoldV1: Pwp_pointer_gesture_hold_v1; ASerial: DWord; ATime: DWord; ACancelled: LongInt); cdecl;
  end;



  TWpPointerGesturesV1 = class;
  TWpPointerGestureSwipeV1 = class;
  TWpPointerGesturePinchV1 = class;
  TWpPointerGestureHoldV1 = class;


  IWpPointerGesturesV1Listener = interface
  ['IWpPointerGesturesV1Listener']
  end;

  IWpPointerGestureSwipeV1Listener = interface
  ['IWpPointerGestureSwipeV1Listener']
    procedure wp_pointer_gesture_swipe_v1_begin(AWpPointerGestureSwipeV1: TWpPointerGestureSwipeV1; ASerial: DWord; ATime: DWord; ASurface: TWlSurface; AFingers: DWord);
    procedure wp_pointer_gesture_swipe_v1_update(AWpPointerGestureSwipeV1: TWpPointerGestureSwipeV1; ATime: DWord; ADx: Twl_fixed; ADy: Twl_fixed);
    procedure wp_pointer_gesture_swipe_v1_end(AWpPointerGestureSwipeV1: TWpPointerGestureSwipeV1; ASerial: DWord; ATime: DWord; ACancelled: LongInt);
  end;

  IWpPointerGesturePinchV1Listener = interface
  ['IWpPointerGesturePinchV1Listener']
    procedure wp_pointer_gesture_pinch_v1_begin(AWpPointerGesturePinchV1: TWpPointerGesturePinchV1; ASerial: DWord; ATime: DWord; ASurface: TWlSurface; AFingers: DWord);
    procedure wp_pointer_gesture_pinch_v1_update(AWpPointerGesturePinchV1: TWpPointerGesturePinchV1; ATime: DWord; ADx: Twl_fixed; ADy: Twl_fixed; AScale: Twl_fixed; ARotation: Twl_fixed);
    procedure wp_pointer_gesture_pinch_v1_end(AWpPointerGesturePinchV1: TWpPointerGesturePinchV1; ASerial: DWord; ATime: DWord; ACancelled: LongInt);
  end;

  IWpPointerGestureHoldV1Listener = interface
  ['IWpPointerGestureHoldV1Listener']
    procedure wp_pointer_gesture_hold_v1_begin(AWpPointerGestureHoldV1: TWpPointerGestureHoldV1; ASerial: DWord; ATime: DWord; ASurface: TWlSurface; AFingers: DWord); {since: 3}
    procedure wp_pointer_gesture_hold_v1_end(AWpPointerGestureHoldV1: TWpPointerGestureHoldV1; ASerial: DWord; ATime: DWord; ACancelled: LongInt); {since: 3}
  end;




  TWpPointerGesturesV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpPointerGesturesV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _GET_SWIPE_GESTURE = 0;
    const _GET_PINCH_GESTURE = 1;
    const _RELEASE = 2; { since version: 2}
    const _GET_HOLD_GESTURE = 3; { since version: 3}
  public
    function GetSwipeGesture(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TWpPointerGestureSwipeV1}): TWpPointerGestureSwipeV1;
    function GetPinchGesture(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TWpPointerGesturePinchV1}): TWpPointerGesturePinchV1;
    procedure Release;
    function GetHoldGesture(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TWpPointerGestureHoldV1}): TWpPointerGestureHoldV1;
    function AddListener(AIntf: IWpPointerGesturesV1Listener): LongInt;
  end;

  TWpPointerGestureSwipeV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpPointerGestureSwipeV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpPointerGestureSwipeV1Listener): LongInt;
  end;

  TWpPointerGesturePinchV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpPointerGesturePinchV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpPointerGesturePinchV1Listener): LongInt;
  end;

  TWpPointerGestureHoldV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpPointerGestureHoldV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0; { since version: 3}
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpPointerGestureHoldV1Listener): LongInt;
  end;






var
  wp_pointer_gestures_v1_interface: Twl_interface;
  WP_POINTER_GESTURES_V1_INTERFACE_NAME: String = 'zwp_pointer_gestures_v1';
  wp_pointer_gesture_swipe_v1_interface: Twl_interface;
  WP_POINTER_GESTURE_SWIPE_V1_INTERFACE_NAME: String = 'zwp_pointer_gesture_swipe_v1';
  wp_pointer_gesture_pinch_v1_interface: Twl_interface;
  WP_POINTER_GESTURE_PINCH_V1_INTERFACE_NAME: String = 'zwp_pointer_gesture_pinch_v1';
  wp_pointer_gesture_hold_v1_interface: Twl_interface;
  WP_POINTER_GESTURE_HOLD_V1_INTERFACE_NAME: String = 'zwp_pointer_gesture_hold_v1';



implementation

var
  vwp_pointer_gestures_v1_registered: Boolean = False;
  vIntf_wp_pointer_gestures_v1_Listener: Twp_pointer_gestures_v1_listener;
  vwp_pointer_gesture_swipe_v1_registered: Boolean = False;
  vIntf_wp_pointer_gesture_swipe_v1_Listener: Twp_pointer_gesture_swipe_v1_listener;
  vwp_pointer_gesture_pinch_v1_registered: Boolean = False;
  vIntf_wp_pointer_gesture_pinch_v1_Listener: Twp_pointer_gesture_pinch_v1_listener;
  vwp_pointer_gesture_hold_v1_registered: Boolean = False;
  vIntf_wp_pointer_gesture_hold_v1_Listener: Twp_pointer_gesture_hold_v1_listener;



constructor TWpPointerGesturesV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpPointerGesturesV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpPointerGesturesV1;
begin
  RegisterInterface;
  Result := TWpPointerGesturesV1.Create(ARegistry.Bind(AName, @wp_pointer_gestures_v1_interface, AVersion));
end;

function TWpPointerGesturesV1.GetSwipeGesture(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TWpPointerGestureSwipeV1}): TWpPointerGestureSwipeV1;
var
  id: Pwl_proxy;
begin
  TWpPointerGestureSwipeV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_SWIPE_GESTURE, @wp_pointer_gesture_swipe_v1_interface, nil, APointer.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpPointerGestureSwipeV1;
  Result := TWpPointerGestureSwipeV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpPointerGestureSwipeV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpPointerGestureSwipeV1]);
end;

function TWpPointerGesturesV1.GetPinchGesture(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TWpPointerGesturePinchV1}): TWpPointerGesturePinchV1;
var
  id: Pwl_proxy;
begin
  TWpPointerGesturePinchV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_PINCH_GESTURE, @wp_pointer_gesture_pinch_v1_interface, nil, APointer.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpPointerGesturePinchV1;
  Result := TWpPointerGesturePinchV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpPointerGesturePinchV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpPointerGesturePinchV1]);
end;

procedure TWpPointerGesturesV1.Release;
begin
  wl_proxy_marshal(FProxy, _RELEASE);
  inherited Destroy;
end;

function TWpPointerGesturesV1.GetHoldGesture(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TWpPointerGestureHoldV1}): TWpPointerGestureHoldV1;
var
  id: Pwl_proxy;
begin
  TWpPointerGestureHoldV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_HOLD_GESTURE, @wp_pointer_gesture_hold_v1_interface, nil, APointer.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpPointerGestureHoldV1;
  Result := TWpPointerGestureHoldV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpPointerGestureHoldV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpPointerGestureHoldV1]);
end;

function TWpPointerGesturesV1.AddListener(AIntf: IWpPointerGesturesV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_pointer_gestures_v1_Listener, @FUserDataRec);
end;
constructor TWpPointerGestureSwipeV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpPointerGestureSwipeV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpPointerGestureSwipeV1;
begin
  RegisterInterface;
  Result := TWpPointerGestureSwipeV1.Create(ARegistry.Bind(AName, @wp_pointer_gesture_swipe_v1_interface, AVersion));
end;

destructor TWpPointerGestureSwipeV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpPointerGestureSwipeV1.AddListener(AIntf: IWpPointerGestureSwipeV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_pointer_gesture_swipe_v1_Listener, @FUserDataRec);
end;
constructor TWpPointerGesturePinchV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpPointerGesturePinchV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpPointerGesturePinchV1;
begin
  RegisterInterface;
  Result := TWpPointerGesturePinchV1.Create(ARegistry.Bind(AName, @wp_pointer_gesture_pinch_v1_interface, AVersion));
end;

destructor TWpPointerGesturePinchV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpPointerGesturePinchV1.AddListener(AIntf: IWpPointerGesturePinchV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_pointer_gesture_pinch_v1_Listener, @FUserDataRec);
end;
constructor TWpPointerGestureHoldV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpPointerGestureHoldV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpPointerGestureHoldV1;
begin
  RegisterInterface;
  Result := TWpPointerGestureHoldV1.Create(ARegistry.Bind(AName, @wp_pointer_gesture_hold_v1_interface, AVersion));
end;

destructor TWpPointerGestureHoldV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpPointerGestureHoldV1.AddListener(AIntf: IWpPointerGestureHoldV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_pointer_gesture_hold_v1_Listener, @FUserDataRec);
end;




procedure wp_pointer_gesture_swipe_v1_begin_Intf(AData: PWLUserData; Awp_pointer_gesture_swipe_v1: Pwp_pointer_gesture_swipe_v1; ASerial: DWord; ATime: DWord; ASurface: Pwl_surface; AFingers: DWord); cdecl;
var
  AIntf: IWpPointerGestureSwipeV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpPointerGestureSwipeV1Listener(AData^.ListenerUserData);
  AIntf.wp_pointer_gesture_swipe_v1_begin(TWpPointerGestureSwipeV1(AData^.PascalObject), ASerial, ATime,  TWlSurface(TWLProxyObject.WLToObj(ASurface)), AFingers);
end;

procedure wp_pointer_gesture_swipe_v1_update_Intf(AData: PWLUserData; Awp_pointer_gesture_swipe_v1: Pwp_pointer_gesture_swipe_v1; ATime: DWord; ADx: Longint{24.8}; ADy: Longint{24.8}); cdecl;
var
  AIntf: IWpPointerGestureSwipeV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpPointerGestureSwipeV1Listener(AData^.ListenerUserData);
  AIntf.wp_pointer_gesture_swipe_v1_update(TWpPointerGestureSwipeV1(AData^.PascalObject), ATime, Twl_fixed(ADx), Twl_fixed(ADy));
end;

procedure wp_pointer_gesture_swipe_v1_end_Intf(AData: PWLUserData; Awp_pointer_gesture_swipe_v1: Pwp_pointer_gesture_swipe_v1; ASerial: DWord; ATime: DWord; ACancelled: LongInt); cdecl;
var
  AIntf: IWpPointerGestureSwipeV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpPointerGestureSwipeV1Listener(AData^.ListenerUserData);
  AIntf.wp_pointer_gesture_swipe_v1_end(TWpPointerGestureSwipeV1(AData^.PascalObject), ASerial, ATime, ACancelled);
end;

procedure wp_pointer_gesture_pinch_v1_begin_Intf(AData: PWLUserData; Awp_pointer_gesture_pinch_v1: Pwp_pointer_gesture_pinch_v1; ASerial: DWord; ATime: DWord; ASurface: Pwl_surface; AFingers: DWord); cdecl;
var
  AIntf: IWpPointerGesturePinchV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpPointerGesturePinchV1Listener(AData^.ListenerUserData);
  AIntf.wp_pointer_gesture_pinch_v1_begin(TWpPointerGesturePinchV1(AData^.PascalObject), ASerial, ATime,  TWlSurface(TWLProxyObject.WLToObj(ASurface)), AFingers);
end;

procedure wp_pointer_gesture_pinch_v1_update_Intf(AData: PWLUserData; Awp_pointer_gesture_pinch_v1: Pwp_pointer_gesture_pinch_v1; ATime: DWord; ADx: Longint{24.8}; ADy: Longint{24.8}; AScale: Longint{24.8}; ARotation: Longint{24.8}); cdecl;
var
  AIntf: IWpPointerGesturePinchV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpPointerGesturePinchV1Listener(AData^.ListenerUserData);
  AIntf.wp_pointer_gesture_pinch_v1_update(TWpPointerGesturePinchV1(AData^.PascalObject), ATime, Twl_fixed(ADx), Twl_fixed(ADy), Twl_fixed(AScale), Twl_fixed(ARotation));
end;

procedure wp_pointer_gesture_pinch_v1_end_Intf(AData: PWLUserData; Awp_pointer_gesture_pinch_v1: Pwp_pointer_gesture_pinch_v1; ASerial: DWord; ATime: DWord; ACancelled: LongInt); cdecl;
var
  AIntf: IWpPointerGesturePinchV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpPointerGesturePinchV1Listener(AData^.ListenerUserData);
  AIntf.wp_pointer_gesture_pinch_v1_end(TWpPointerGesturePinchV1(AData^.PascalObject), ASerial, ATime, ACancelled);
end;

procedure wp_pointer_gesture_hold_v1_begin_Intf(AData: PWLUserData; Awp_pointer_gesture_hold_v1: Pwp_pointer_gesture_hold_v1; ASerial: DWord; ATime: DWord; ASurface: Pwl_surface; AFingers: DWord); cdecl;
var
  AIntf: IWpPointerGestureHoldV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpPointerGestureHoldV1Listener(AData^.ListenerUserData);
  AIntf.wp_pointer_gesture_hold_v1_begin(TWpPointerGestureHoldV1(AData^.PascalObject), ASerial, ATime,  TWlSurface(TWLProxyObject.WLToObj(ASurface)), AFingers);
end;

procedure wp_pointer_gesture_hold_v1_end_Intf(AData: PWLUserData; Awp_pointer_gesture_hold_v1: Pwp_pointer_gesture_hold_v1; ASerial: DWord; ATime: DWord; ACancelled: LongInt); cdecl;
var
  AIntf: IWpPointerGestureHoldV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpPointerGestureHoldV1Listener(AData^.ListenerUserData);
  AIntf.wp_pointer_gesture_hold_v1_end(TWpPointerGestureHoldV1(AData^.PascalObject), ASerial, ATime, ACancelled);
end;



const
  pInterfaces: array[0..25] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@wp_pointer_gesture_swipe_v1_interface),
    (@wl_pointer_interface),
    (@wp_pointer_gesture_pinch_v1_interface),
    (@wl_pointer_interface),
    (@wp_pointer_gesture_hold_v1_interface),
    (@wl_pointer_interface),
    (nil),
    (nil),
    (@wl_surface_interface),
    (nil),
    (nil),
    (nil),
    (@wl_surface_interface),
    (nil),
    (nil),
    (nil),
    (@wl_surface_interface),
    (nil)
  );

  wp_pointer_gestures_v1_requests: array[0..3] of Twl_message = (
    (name: 'get_swipe_gesture'; signature: 'no'; types: @pInterfaces[8]),
    (name: 'get_pinch_gesture'; signature: 'no'; types: @pInterfaces[10]),
    (name: 'release'; signature: '2'; types: @pInterfaces[0]),
    (name: 'get_hold_gesture'; signature: '3no'; types: @pInterfaces[12])
  );
  wp_pointer_gesture_swipe_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_pointer_gesture_swipe_v1_events: array[0..2] of Twl_message = (
    (name: 'begin'; signature: 'uuou'; types: @pInterfaces[14]),
    (name: 'update'; signature: 'uff'; types: @pInterfaces[0]),
    (name: 'end'; signature: 'uui'; types: @pInterfaces[0])
  );
  wp_pointer_gesture_pinch_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_pointer_gesture_pinch_v1_events: array[0..2] of Twl_message = (
    (name: 'begin'; signature: 'uuou'; types: @pInterfaces[18]),
    (name: 'update'; signature: 'uffff'; types: @pInterfaces[0]),
    (name: 'end'; signature: 'uui'; types: @pInterfaces[0])
  );
  wp_pointer_gesture_hold_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: '3'; types: @pInterfaces[0])
  );
  wp_pointer_gesture_hold_v1_events: array[0..1] of Twl_message = (
    (name: 'begin'; signature: '3uuou'; types: @pInterfaces[22]),
    (name: 'end'; signature: '3uui'; types: @pInterfaces[0])
  );

class procedure TWpPointerGesturesV1.RegisterInterface;
begin
  if vwp_pointer_gestures_v1_registered then Exit;
  vwp_pointer_gestures_v1_registered := True;
  wp_pointer_gestures_v1_interface.name := PChar(WP_POINTER_GESTURES_V1_INTERFACE_NAME);
  wp_pointer_gestures_v1_interface.version := 3;
  wp_pointer_gestures_v1_interface.method_count := 4;
  wp_pointer_gestures_v1_interface.methods := @wp_pointer_gestures_v1_requests;
  wp_pointer_gestures_v1_interface.event_count := 0;
  wp_pointer_gestures_v1_interface.events := nil;
end;

class procedure TWpPointerGestureSwipeV1.RegisterInterface;
begin
  if vwp_pointer_gesture_swipe_v1_registered then Exit;
  vwp_pointer_gesture_swipe_v1_registered := True;
  Pointer(vIntf_wp_pointer_gesture_swipe_v1_Listener.begin_) := @wp_pointer_gesture_swipe_v1_begin_Intf;
  Pointer(vIntf_wp_pointer_gesture_swipe_v1_Listener.update) := @wp_pointer_gesture_swipe_v1_update_Intf;
  Pointer(vIntf_wp_pointer_gesture_swipe_v1_Listener.end_) := @wp_pointer_gesture_swipe_v1_end_Intf;
  wp_pointer_gesture_swipe_v1_interface.name := PChar(WP_POINTER_GESTURE_SWIPE_V1_INTERFACE_NAME);
  wp_pointer_gesture_swipe_v1_interface.version := 2;
  wp_pointer_gesture_swipe_v1_interface.method_count := 1;
  wp_pointer_gesture_swipe_v1_interface.methods := @wp_pointer_gesture_swipe_v1_requests;
  wp_pointer_gesture_swipe_v1_interface.event_count := 3;
  wp_pointer_gesture_swipe_v1_interface.events := @wp_pointer_gesture_swipe_v1_events;
end;

class procedure TWpPointerGesturePinchV1.RegisterInterface;
begin
  if vwp_pointer_gesture_pinch_v1_registered then Exit;
  vwp_pointer_gesture_pinch_v1_registered := True;
  Pointer(vIntf_wp_pointer_gesture_pinch_v1_Listener.begin_) := @wp_pointer_gesture_pinch_v1_begin_Intf;
  Pointer(vIntf_wp_pointer_gesture_pinch_v1_Listener.update) := @wp_pointer_gesture_pinch_v1_update_Intf;
  Pointer(vIntf_wp_pointer_gesture_pinch_v1_Listener.end_) := @wp_pointer_gesture_pinch_v1_end_Intf;
  wp_pointer_gesture_pinch_v1_interface.name := PChar(WP_POINTER_GESTURE_PINCH_V1_INTERFACE_NAME);
  wp_pointer_gesture_pinch_v1_interface.version := 2;
  wp_pointer_gesture_pinch_v1_interface.method_count := 1;
  wp_pointer_gesture_pinch_v1_interface.methods := @wp_pointer_gesture_pinch_v1_requests;
  wp_pointer_gesture_pinch_v1_interface.event_count := 3;
  wp_pointer_gesture_pinch_v1_interface.events := @wp_pointer_gesture_pinch_v1_events;
end;

class procedure TWpPointerGestureHoldV1.RegisterInterface;
begin
  if vwp_pointer_gesture_hold_v1_registered then Exit;
  vwp_pointer_gesture_hold_v1_registered := True;
  Pointer(vIntf_wp_pointer_gesture_hold_v1_Listener.begin_) := @wp_pointer_gesture_hold_v1_begin_Intf;
  Pointer(vIntf_wp_pointer_gesture_hold_v1_Listener.end_) := @wp_pointer_gesture_hold_v1_end_Intf;
  wp_pointer_gesture_hold_v1_interface.name := PChar(WP_POINTER_GESTURE_HOLD_V1_INTERFACE_NAME);
  wp_pointer_gesture_hold_v1_interface.version := 3;
  wp_pointer_gesture_hold_v1_interface.method_count := 1;
  wp_pointer_gesture_hold_v1_interface.methods := @wp_pointer_gesture_hold_v1_requests;
  wp_pointer_gesture_hold_v1_interface.event_count := 2;
  wp_pointer_gesture_hold_v1_interface.events := @wp_pointer_gesture_hold_v1_events;
end;


end.
