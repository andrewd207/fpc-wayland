unit pointer_gestures_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_pointer_gestures_v1 = Pointer;
  Pzwp_pointer_gesture_swipe_v1 = Pointer;
  Pzwp_pointer_gesture_pinch_v1 = Pointer;
  Pzwp_pointer_gesture_hold_v1 = Pointer;
  Pzwp_pointer_gestures_v1_listener = ^Tzwp_pointer_gestures_v1_listener;
  Tzwp_pointer_gestures_v1_listener = record
  end;

  Pzwp_pointer_gesture_swipe_v1_listener = ^Tzwp_pointer_gesture_swipe_v1_listener;
  Tzwp_pointer_gesture_swipe_v1_listener = record
    begin_ : procedure(data: Pointer; AZwpPointerGestureSwipeV1: Pzwp_pointer_gesture_swipe_v1; ASerial: DWord; ATime: DWord; ASurface: Pwl_surface; AFingers: DWord); cdecl;
    update : procedure(data: Pointer; AZwpPointerGestureSwipeV1: Pzwp_pointer_gesture_swipe_v1; ATime: DWord; ADx: Longint{24.8}; ADy: Longint{24.8}); cdecl;
    end_ : procedure(data: Pointer; AZwpPointerGestureSwipeV1: Pzwp_pointer_gesture_swipe_v1; ASerial: DWord; ATime: DWord; ACancelled: LongInt); cdecl;
  end;

  Pzwp_pointer_gesture_pinch_v1_listener = ^Tzwp_pointer_gesture_pinch_v1_listener;
  Tzwp_pointer_gesture_pinch_v1_listener = record
    begin_ : procedure(data: Pointer; AZwpPointerGesturePinchV1: Pzwp_pointer_gesture_pinch_v1; ASerial: DWord; ATime: DWord; ASurface: Pwl_surface; AFingers: DWord); cdecl;
    update : procedure(data: Pointer; AZwpPointerGesturePinchV1: Pzwp_pointer_gesture_pinch_v1; ATime: DWord; ADx: Longint{24.8}; ADy: Longint{24.8}; AScale: Longint{24.8}; ARotation: Longint{24.8}); cdecl;
    end_ : procedure(data: Pointer; AZwpPointerGesturePinchV1: Pzwp_pointer_gesture_pinch_v1; ASerial: DWord; ATime: DWord; ACancelled: LongInt); cdecl;
  end;

  Pzwp_pointer_gesture_hold_v1_listener = ^Tzwp_pointer_gesture_hold_v1_listener;
  Tzwp_pointer_gesture_hold_v1_listener = record
    begin_ : procedure(data: Pointer; AZwpPointerGestureHoldV1: Pzwp_pointer_gesture_hold_v1; ASerial: DWord; ATime: DWord; ASurface: Pwl_surface; AFingers: DWord); cdecl;
    end_ : procedure(data: Pointer; AZwpPointerGestureHoldV1: Pzwp_pointer_gesture_hold_v1; ASerial: DWord; ATime: DWord; ACancelled: LongInt); cdecl;
  end;



  TZwpPointerGesturesV1 = class;
  TZwpPointerGestureSwipeV1 = class;
  TZwpPointerGesturePinchV1 = class;
  TZwpPointerGestureHoldV1 = class;


  IZwpPointerGesturesV1Listener = interface
  ['IZwpPointerGesturesV1Listener']
  end;

  IZwpPointerGestureSwipeV1Listener = interface
  ['IZwpPointerGestureSwipeV1Listener']
    procedure zwp_pointer_gesture_swipe_v1_begin(AZwpPointerGestureSwipeV1: TZwpPointerGestureSwipeV1; ASerial: DWord; ATime: DWord; ASurface: TWlSurface; AFingers: DWord);
    procedure zwp_pointer_gesture_swipe_v1_update(AZwpPointerGestureSwipeV1: TZwpPointerGestureSwipeV1; ATime: DWord; ADx: Twl_fixed; ADy: Twl_fixed);
    procedure zwp_pointer_gesture_swipe_v1_end(AZwpPointerGestureSwipeV1: TZwpPointerGestureSwipeV1; ASerial: DWord; ATime: DWord; ACancelled: LongInt);
  end;

  IZwpPointerGesturePinchV1Listener = interface
  ['IZwpPointerGesturePinchV1Listener']
    procedure zwp_pointer_gesture_pinch_v1_begin(AZwpPointerGesturePinchV1: TZwpPointerGesturePinchV1; ASerial: DWord; ATime: DWord; ASurface: TWlSurface; AFingers: DWord);
    procedure zwp_pointer_gesture_pinch_v1_update(AZwpPointerGesturePinchV1: TZwpPointerGesturePinchV1; ATime: DWord; ADx: Twl_fixed; ADy: Twl_fixed; AScale: Twl_fixed; ARotation: Twl_fixed);
    procedure zwp_pointer_gesture_pinch_v1_end(AZwpPointerGesturePinchV1: TZwpPointerGesturePinchV1; ASerial: DWord; ATime: DWord; ACancelled: LongInt);
  end;

  IZwpPointerGestureHoldV1Listener = interface
  ['IZwpPointerGestureHoldV1Listener']
    procedure zwp_pointer_gesture_hold_v1_begin(AZwpPointerGestureHoldV1: TZwpPointerGestureHoldV1; ASerial: DWord; ATime: DWord; ASurface: TWlSurface; AFingers: DWord); {since: 3}
    procedure zwp_pointer_gesture_hold_v1_end(AZwpPointerGestureHoldV1: TZwpPointerGestureHoldV1; ASerial: DWord; ATime: DWord; ACancelled: LongInt); {since: 3}
  end;




  TZwpPointerGesturesV1 = class(TWLProxyObject)
  private
    const _GET_SWIPE_GESTURE = 0;
    const _GET_PINCH_GESTURE = 1;
    const _RELEASE = 2; { since version: 2}
    const _GET_HOLD_GESTURE = 3; { since version: 3}
  public
    function GetSwipeGesture(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TZwpPointerGestureSwipeV1}): TZwpPointerGestureSwipeV1;
    function GetPinchGesture(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TZwpPointerGesturePinchV1}): TZwpPointerGesturePinchV1;
    destructor Destroy; override; {since version: 2}
    function GetHoldGesture(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TZwpPointerGestureHoldV1}): TZwpPointerGestureHoldV1; {since version: 3}
    function AddListener(AIntf: IZwpPointerGesturesV1Listener): LongInt;
  end;

  TZwpPointerGestureSwipeV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IZwpPointerGestureSwipeV1Listener): LongInt;
  end;

  TZwpPointerGesturePinchV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IZwpPointerGesturePinchV1Listener): LongInt;
  end;

  TZwpPointerGestureHoldV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0; { since version: 3}
  public
    destructor Destroy; override; {since version: 3}
    function AddListener(AIntf: IZwpPointerGestureHoldV1Listener): LongInt;
  end;






var
  zwp_pointer_gestures_v1_interface: Twl_interface;
  zwp_pointer_gesture_swipe_v1_interface: Twl_interface;
  zwp_pointer_gesture_pinch_v1_interface: Twl_interface;
  zwp_pointer_gesture_hold_v1_interface: Twl_interface;



implementation

var
  vIntf_zwp_pointer_gestures_v1_Listener: Tzwp_pointer_gestures_v1_listener;
  vIntf_zwp_pointer_gesture_swipe_v1_Listener: Tzwp_pointer_gesture_swipe_v1_listener;
  vIntf_zwp_pointer_gesture_pinch_v1_Listener: Tzwp_pointer_gesture_pinch_v1_listener;
  vIntf_zwp_pointer_gesture_hold_v1_Listener: Tzwp_pointer_gesture_hold_v1_listener;



function TZwpPointerGesturesV1.GetSwipeGesture(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TZwpPointerGestureSwipeV1}): TZwpPointerGestureSwipeV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_SWIPE_GESTURE, @zwp_pointer_gesture_swipe_v1_interface, nil, APointer.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpPointerGestureSwipeV1;
  if not AProxyClass.InheritsFrom(TZwpPointerGestureSwipeV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpPointerGestureSwipeV1]);
  Result := TZwpPointerGestureSwipeV1(AProxyClass.Create(id));
end;

function TZwpPointerGesturesV1.GetPinchGesture(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TZwpPointerGesturePinchV1}): TZwpPointerGesturePinchV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_PINCH_GESTURE, @zwp_pointer_gesture_pinch_v1_interface, nil, APointer.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpPointerGesturePinchV1;
  if not AProxyClass.InheritsFrom(TZwpPointerGesturePinchV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpPointerGesturePinchV1]);
  Result := TZwpPointerGesturePinchV1(AProxyClass.Create(id));
end;

destructor TZwpPointerGesturesV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _RELEASE);
  inherited Destroy;
end;

function TZwpPointerGesturesV1.GetHoldGesture(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TZwpPointerGestureHoldV1}): TZwpPointerGestureHoldV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_HOLD_GESTURE, @zwp_pointer_gesture_hold_v1_interface, nil, APointer.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpPointerGestureHoldV1;
  if not AProxyClass.InheritsFrom(TZwpPointerGestureHoldV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpPointerGestureHoldV1]);
  Result := TZwpPointerGestureHoldV1(AProxyClass.Create(id));
end;

function TZwpPointerGesturesV1.AddListener(AIntf: IZwpPointerGesturesV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_pointer_gestures_v1_Listener, @FUserDataRec);
end;
destructor TZwpPointerGestureSwipeV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpPointerGestureSwipeV1.AddListener(AIntf: IZwpPointerGestureSwipeV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_pointer_gesture_swipe_v1_Listener, @FUserDataRec);
end;
destructor TZwpPointerGesturePinchV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpPointerGesturePinchV1.AddListener(AIntf: IZwpPointerGesturePinchV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_pointer_gesture_pinch_v1_Listener, @FUserDataRec);
end;
destructor TZwpPointerGestureHoldV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpPointerGestureHoldV1.AddListener(AIntf: IZwpPointerGestureHoldV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_pointer_gesture_hold_v1_Listener, @FUserDataRec);
end;




procedure zwp_pointer_gesture_swipe_v1_begin_Intf(AData: PWLUserData; Azwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; ASerial: DWord; ATime: DWord; ASurface: Pwl_surface; AFingers: DWord); cdecl;
var
  AIntf: IZwpPointerGestureSwipeV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpPointerGestureSwipeV1Listener(AData^.ListenerUserData);
  AIntf.zwp_pointer_gesture_swipe_v1_begin(TZwpPointerGestureSwipeV1(AData^.PascalObject), ASerial, ATime,  TWlSurface(TWLProxyObject.WLToObj(ASurface)), AFingers);
end;

procedure zwp_pointer_gesture_swipe_v1_update_Intf(AData: PWLUserData; Azwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; ATime: DWord; ADx: Longint{24.8}; ADy: Longint{24.8}); cdecl;
var
  AIntf: IZwpPointerGestureSwipeV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpPointerGestureSwipeV1Listener(AData^.ListenerUserData);
  AIntf.zwp_pointer_gesture_swipe_v1_update(TZwpPointerGestureSwipeV1(AData^.PascalObject), ATime, Twl_fixed(ADx), Twl_fixed(ADy));
end;

procedure zwp_pointer_gesture_swipe_v1_end_Intf(AData: PWLUserData; Azwp_pointer_gesture_swipe_v1: Pzwp_pointer_gesture_swipe_v1; ASerial: DWord; ATime: DWord; ACancelled: LongInt); cdecl;
var
  AIntf: IZwpPointerGestureSwipeV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpPointerGestureSwipeV1Listener(AData^.ListenerUserData);
  AIntf.zwp_pointer_gesture_swipe_v1_end(TZwpPointerGestureSwipeV1(AData^.PascalObject), ASerial, ATime, ACancelled);
end;

procedure zwp_pointer_gesture_pinch_v1_begin_Intf(AData: PWLUserData; Azwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; ASerial: DWord; ATime: DWord; ASurface: Pwl_surface; AFingers: DWord); cdecl;
var
  AIntf: IZwpPointerGesturePinchV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpPointerGesturePinchV1Listener(AData^.ListenerUserData);
  AIntf.zwp_pointer_gesture_pinch_v1_begin(TZwpPointerGesturePinchV1(AData^.PascalObject), ASerial, ATime,  TWlSurface(TWLProxyObject.WLToObj(ASurface)), AFingers);
end;

procedure zwp_pointer_gesture_pinch_v1_update_Intf(AData: PWLUserData; Azwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; ATime: DWord; ADx: Longint{24.8}; ADy: Longint{24.8}; AScale: Longint{24.8}; ARotation: Longint{24.8}); cdecl;
var
  AIntf: IZwpPointerGesturePinchV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpPointerGesturePinchV1Listener(AData^.ListenerUserData);
  AIntf.zwp_pointer_gesture_pinch_v1_update(TZwpPointerGesturePinchV1(AData^.PascalObject), ATime, Twl_fixed(ADx), Twl_fixed(ADy), Twl_fixed(AScale), Twl_fixed(ARotation));
end;

procedure zwp_pointer_gesture_pinch_v1_end_Intf(AData: PWLUserData; Azwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; ASerial: DWord; ATime: DWord; ACancelled: LongInt); cdecl;
var
  AIntf: IZwpPointerGesturePinchV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpPointerGesturePinchV1Listener(AData^.ListenerUserData);
  AIntf.zwp_pointer_gesture_pinch_v1_end(TZwpPointerGesturePinchV1(AData^.PascalObject), ASerial, ATime, ACancelled);
end;

procedure zwp_pointer_gesture_hold_v1_begin_Intf(AData: PWLUserData; Azwp_pointer_gesture_hold_v1: Pzwp_pointer_gesture_hold_v1; ASerial: DWord; ATime: DWord; ASurface: Pwl_surface; AFingers: DWord); cdecl;
var
  AIntf: IZwpPointerGestureHoldV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpPointerGestureHoldV1Listener(AData^.ListenerUserData);
  AIntf.zwp_pointer_gesture_hold_v1_begin(TZwpPointerGestureHoldV1(AData^.PascalObject), ASerial, ATime,  TWlSurface(TWLProxyObject.WLToObj(ASurface)), AFingers);
end;

procedure zwp_pointer_gesture_hold_v1_end_Intf(AData: PWLUserData; Azwp_pointer_gesture_hold_v1: Pzwp_pointer_gesture_hold_v1; ASerial: DWord; ATime: DWord; ACancelled: LongInt); cdecl;
var
  AIntf: IZwpPointerGestureHoldV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpPointerGestureHoldV1Listener(AData^.ListenerUserData);
  AIntf.zwp_pointer_gesture_hold_v1_end(TZwpPointerGestureHoldV1(AData^.PascalObject), ASerial, ATime, ACancelled);
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
    (@zwp_pointer_gesture_swipe_v1_interface),
    (@wl_pointer_interface),
    (@zwp_pointer_gesture_pinch_v1_interface),
    (@wl_pointer_interface),
    (@zwp_pointer_gesture_hold_v1_interface),
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

  zwp_pointer_gestures_v1_requests: array[0..3] of Twl_message = (
    (name: 'get_swipe_gesture'; signature: 'no'; types: @pInterfaces[8]),
    (name: 'get_pinch_gesture'; signature: 'no'; types: @pInterfaces[10]),
    (name: 'release'; signature: '2'; types: @pInterfaces[0]),
    (name: 'get_hold_gesture'; signature: '3no'; types: @pInterfaces[12])
  );
  zwp_pointer_gesture_swipe_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_pointer_gesture_swipe_v1_events: array[0..2] of Twl_message = (
    (name: 'begin'; signature: 'uuou'; types: @pInterfaces[14]),
    (name: 'update'; signature: 'uff'; types: @pInterfaces[0]),
    (name: 'end'; signature: 'uui'; types: @pInterfaces[0])
  );
  zwp_pointer_gesture_pinch_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_pointer_gesture_pinch_v1_events: array[0..2] of Twl_message = (
    (name: 'begin'; signature: 'uuou'; types: @pInterfaces[18]),
    (name: 'update'; signature: 'uffff'; types: @pInterfaces[0]),
    (name: 'end'; signature: 'uui'; types: @pInterfaces[0])
  );
  zwp_pointer_gesture_hold_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: '3'; types: @pInterfaces[0])
  );
  zwp_pointer_gesture_hold_v1_events: array[0..1] of Twl_message = (
    (name: 'begin'; signature: '3uuou'; types: @pInterfaces[22]),
    (name: 'end'; signature: '3uui'; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_pointer_gesture_swipe_v1_Listener.begin_) := @zwp_pointer_gesture_swipe_v1_begin_Intf;
  Pointer(vIntf_zwp_pointer_gesture_swipe_v1_Listener.update) := @zwp_pointer_gesture_swipe_v1_update_Intf;
  Pointer(vIntf_zwp_pointer_gesture_swipe_v1_Listener.end_) := @zwp_pointer_gesture_swipe_v1_end_Intf;
  Pointer(vIntf_zwp_pointer_gesture_pinch_v1_Listener.begin_) := @zwp_pointer_gesture_pinch_v1_begin_Intf;
  Pointer(vIntf_zwp_pointer_gesture_pinch_v1_Listener.update) := @zwp_pointer_gesture_pinch_v1_update_Intf;
  Pointer(vIntf_zwp_pointer_gesture_pinch_v1_Listener.end_) := @zwp_pointer_gesture_pinch_v1_end_Intf;
  Pointer(vIntf_zwp_pointer_gesture_hold_v1_Listener.begin_) := @zwp_pointer_gesture_hold_v1_begin_Intf;
  Pointer(vIntf_zwp_pointer_gesture_hold_v1_Listener.end_) := @zwp_pointer_gesture_hold_v1_end_Intf;


  zwp_pointer_gestures_v1_interface.name := 'zwp_pointer_gestures_v1';
  zwp_pointer_gestures_v1_interface.version := 3;
  zwp_pointer_gestures_v1_interface.method_count := 4;
  zwp_pointer_gestures_v1_interface.methods := @zwp_pointer_gestures_v1_requests;
  zwp_pointer_gestures_v1_interface.event_count := 0;
  zwp_pointer_gestures_v1_interface.events := nil;

  zwp_pointer_gesture_swipe_v1_interface.name := 'zwp_pointer_gesture_swipe_v1';
  zwp_pointer_gesture_swipe_v1_interface.version := 2;
  zwp_pointer_gesture_swipe_v1_interface.method_count := 1;
  zwp_pointer_gesture_swipe_v1_interface.methods := @zwp_pointer_gesture_swipe_v1_requests;
  zwp_pointer_gesture_swipe_v1_interface.event_count := 3;
  zwp_pointer_gesture_swipe_v1_interface.events := @zwp_pointer_gesture_swipe_v1_events;

  zwp_pointer_gesture_pinch_v1_interface.name := 'zwp_pointer_gesture_pinch_v1';
  zwp_pointer_gesture_pinch_v1_interface.version := 2;
  zwp_pointer_gesture_pinch_v1_interface.method_count := 1;
  zwp_pointer_gesture_pinch_v1_interface.methods := @zwp_pointer_gesture_pinch_v1_requests;
  zwp_pointer_gesture_pinch_v1_interface.event_count := 3;
  zwp_pointer_gesture_pinch_v1_interface.events := @zwp_pointer_gesture_pinch_v1_events;

  zwp_pointer_gesture_hold_v1_interface.name := 'zwp_pointer_gesture_hold_v1';
  zwp_pointer_gesture_hold_v1_interface.version := 3;
  zwp_pointer_gesture_hold_v1_interface.method_count := 1;
  zwp_pointer_gesture_hold_v1_interface.methods := @zwp_pointer_gesture_hold_v1_requests;
  zwp_pointer_gesture_hold_v1_interface.event_count := 2;
  zwp_pointer_gesture_hold_v1_interface.events := @zwp_pointer_gesture_hold_v1_events;

end.
