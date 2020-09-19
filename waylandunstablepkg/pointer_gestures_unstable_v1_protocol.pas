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



  TZwpPointerGesturesV1 = class;
  TZwpPointerGestureSwipeV1 = class;
  TZwpPointerGesturePinchV1 = class;


  IZwpPointerGesturesV1Listener = interface
  ['IZwpPointerGesturesV1Listener']
  end;

  IZwpPointerGestureSwipeV1Listener = interface
  ['IZwpPointerGestureSwipeV1Listener']
    procedure zwp_pointer_gesture_swipe_v1_begin(AZwpPointerGestureSwipeV1: TZwpPointerGestureSwipeV1; ASerial: DWord; ATime: DWord; ASurface: TWlSurface; AFingers: DWord);
    procedure zwp_pointer_gesture_swipe_v1_update(AZwpPointerGestureSwipeV1: TZwpPointerGestureSwipeV1; ATime: DWord; ADx: Longint{24.8}; ADy: Longint{24.8});
    procedure zwp_pointer_gesture_swipe_v1_end(AZwpPointerGestureSwipeV1: TZwpPointerGestureSwipeV1; ASerial: DWord; ATime: DWord; ACancelled: LongInt);
  end;

  IZwpPointerGesturePinchV1Listener = interface
  ['IZwpPointerGesturePinchV1Listener']
    procedure zwp_pointer_gesture_pinch_v1_begin(AZwpPointerGesturePinchV1: TZwpPointerGesturePinchV1; ASerial: DWord; ATime: DWord; ASurface: TWlSurface; AFingers: DWord);
    procedure zwp_pointer_gesture_pinch_v1_update(AZwpPointerGesturePinchV1: TZwpPointerGesturePinchV1; ATime: DWord; ADx: Longint{24.8}; ADy: Longint{24.8}; AScale: Longint{24.8}; ARotation: Longint{24.8});
    procedure zwp_pointer_gesture_pinch_v1_end(AZwpPointerGesturePinchV1: TZwpPointerGesturePinchV1; ASerial: DWord; ATime: DWord; ACancelled: LongInt);
  end;




  TZwpPointerGesturesV1 = class(TWLProxyObject)
  private
    const _GET_SWIPE_GESTURE = 0;
    const _GET_PINCH_GESTURE = 1;
  public
    function GetSwipeGesture(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TZwpPointerGestureSwipeV1}): TZwpPointerGestureSwipeV1;
    function GetPinchGesture(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TZwpPointerGesturePinchV1}): TZwpPointerGesturePinchV1;
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






var
  zwp_pointer_gestures_v1_interface: Twl_interface;
  zwp_pointer_gesture_swipe_v1_interface: Twl_interface;
  zwp_pointer_gesture_pinch_v1_interface: Twl_interface;



implementation

var
  vIntf_zwp_pointer_gestures_v1_Listener: Tzwp_pointer_gestures_v1_listener;
  vIntf_zwp_pointer_gesture_swipe_v1_Listener: Tzwp_pointer_gesture_swipe_v1_listener;
  vIntf_zwp_pointer_gesture_pinch_v1_Listener: Tzwp_pointer_gesture_pinch_v1_listener;



function TZwpPointerGesturesV1.GetSwipeGesture(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TZwpPointerGestureSwipeV1}): TZwpPointerGestureSwipeV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_SWIPE_GESTURE, @zwp_pointer_gesture_swipe_v1_interface, nil, APointer.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpPointerGestureSwipeV1;
  Result := TZwpPointerGestureSwipeV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TZwpPointerGestureSwipeV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpPointerGestureSwipeV1]);
end;

function TZwpPointerGesturesV1.GetPinchGesture(APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TZwpPointerGesturePinchV1}): TZwpPointerGesturePinchV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_PINCH_GESTURE, @zwp_pointer_gesture_pinch_v1_interface, nil, APointer.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpPointerGesturePinchV1;
  Result := TZwpPointerGesturePinchV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TZwpPointerGesturePinchV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpPointerGesturePinchV1]);
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
  AIntf.zwp_pointer_gesture_swipe_v1_update(TZwpPointerGestureSwipeV1(AData^.PascalObject), ATime, ADx, ADy);
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
  AIntf.zwp_pointer_gesture_pinch_v1_update(TZwpPointerGesturePinchV1(AData^.PascalObject), ATime, ADx, ADy, AScale, ARotation);
end;

procedure zwp_pointer_gesture_pinch_v1_end_Intf(AData: PWLUserData; Azwp_pointer_gesture_pinch_v1: Pzwp_pointer_gesture_pinch_v1; ASerial: DWord; ATime: DWord; ACancelled: LongInt); cdecl;
var
  AIntf: IZwpPointerGesturePinchV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpPointerGesturePinchV1Listener(AData^.ListenerUserData);
  AIntf.zwp_pointer_gesture_pinch_v1_end(TZwpPointerGesturePinchV1(AData^.PascalObject), ASerial, ATime, ACancelled);
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
    (@zwp_pointer_gesture_swipe_v1_interface),
    (@wl_pointer_interface),
    (@zwp_pointer_gesture_pinch_v1_interface),
    (@wl_pointer_interface),
    (nil),
    (nil),
    (@wl_surface_interface),
    (nil),
    (nil),
    (nil),
    (@wl_surface_interface),
    (nil)
  );

  zwp_pointer_gestures_v1_requests: array[0..1] of Twl_message = (
    (name: 'get_swipe_gesture'; signature: 'no'; types: @pInterfaces[8]),
    (name: 'get_pinch_gesture'; signature: 'no'; types: @pInterfaces[10])
  );
  zwp_pointer_gesture_swipe_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_pointer_gesture_swipe_v1_events: array[0..2] of Twl_message = (
    (name: 'begin'; signature: 'uuou'; types: @pInterfaces[12]),
    (name: 'update'; signature: 'uff'; types: @pInterfaces[0]),
    (name: 'end'; signature: 'uui'; types: @pInterfaces[0])
  );
  zwp_pointer_gesture_pinch_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_pointer_gesture_pinch_v1_events: array[0..2] of Twl_message = (
    (name: 'begin'; signature: 'uuou'; types: @pInterfaces[16]),
    (name: 'update'; signature: 'uffff'; types: @pInterfaces[0]),
    (name: 'end'; signature: 'uui'; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_pointer_gesture_swipe_v1_Listener.begin_) := @zwp_pointer_gesture_swipe_v1_begin_Intf;
  Pointer(vIntf_zwp_pointer_gesture_swipe_v1_Listener.update) := @zwp_pointer_gesture_swipe_v1_update_Intf;
  Pointer(vIntf_zwp_pointer_gesture_swipe_v1_Listener.end_) := @zwp_pointer_gesture_swipe_v1_end_Intf;
  Pointer(vIntf_zwp_pointer_gesture_pinch_v1_Listener.begin_) := @zwp_pointer_gesture_pinch_v1_begin_Intf;
  Pointer(vIntf_zwp_pointer_gesture_pinch_v1_Listener.update) := @zwp_pointer_gesture_pinch_v1_update_Intf;
  Pointer(vIntf_zwp_pointer_gesture_pinch_v1_Listener.end_) := @zwp_pointer_gesture_pinch_v1_end_Intf;


  zwp_pointer_gestures_v1_interface.name := 'zwp_pointer_gestures_v1';
  zwp_pointer_gestures_v1_interface.version := 1;
  zwp_pointer_gestures_v1_interface.method_count := 2;
  zwp_pointer_gestures_v1_interface.methods := @zwp_pointer_gestures_v1_requests;
  zwp_pointer_gestures_v1_interface.event_count := 0;
  zwp_pointer_gestures_v1_interface.events := nil;

  zwp_pointer_gesture_swipe_v1_interface.name := 'zwp_pointer_gesture_swipe_v1';
  zwp_pointer_gesture_swipe_v1_interface.version := 1;
  zwp_pointer_gesture_swipe_v1_interface.method_count := 1;
  zwp_pointer_gesture_swipe_v1_interface.methods := @zwp_pointer_gesture_swipe_v1_requests;
  zwp_pointer_gesture_swipe_v1_interface.event_count := 3;
  zwp_pointer_gesture_swipe_v1_interface.events := @zwp_pointer_gesture_swipe_v1_events;

  zwp_pointer_gesture_pinch_v1_interface.name := 'zwp_pointer_gesture_pinch_v1';
  zwp_pointer_gesture_pinch_v1_interface.version := 1;
  zwp_pointer_gesture_pinch_v1_interface.method_count := 1;
  zwp_pointer_gesture_pinch_v1_interface.methods := @zwp_pointer_gesture_pinch_v1_requests;
  zwp_pointer_gesture_pinch_v1_interface.event_count := 3;
  zwp_pointer_gesture_pinch_v1_interface.events := @zwp_pointer_gesture_pinch_v1_events;

end.
