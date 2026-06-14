unit ext_image_copy_capture_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol, ext_image_capture_source_v1_protocol;


type
  Pext_image_copy_capture_manager_v1 = Pointer;
  Pext_image_copy_capture_session_v1 = Pointer;
  Pext_image_copy_capture_frame_v1 = Pointer;
  Pext_image_copy_capture_cursor_session_v1 = Pointer;
const
  EXT_IMAGE_COPY_CAPTURE_MANAGER_V1_ERROR_INVALID_OPTION = 1; // invalid option flag
  EXT_IMAGE_COPY_CAPTURE_MANAGER_V1_OPTIONS_PAINT_CURSORS = 1; // paint cursors onto captured frames

type
  Pext_image_copy_capture_manager_v1_listener = ^Text_image_copy_capture_manager_v1_listener;
  Text_image_copy_capture_manager_v1_listener = record
  end;

const
  EXT_IMAGE_COPY_CAPTURE_SESSION_V1_ERROR_DUPLICATE_FRAME = 1; // create_frame sent before destroying previous frame

type
  Pext_image_copy_capture_session_v1_listener = ^Text_image_copy_capture_session_v1_listener;
  Text_image_copy_capture_session_v1_listener = record
    buffer_size : procedure(data: Pointer; AExtImageCopyCaptureSessionV1: Pext_image_copy_capture_session_v1; AWidth: DWord; AHeight: DWord); cdecl;
    shm_format : procedure(data: Pointer; AExtImageCopyCaptureSessionV1: Pext_image_copy_capture_session_v1; AFormat: DWord); cdecl;
    dmabuf_device : procedure(data: Pointer; AExtImageCopyCaptureSessionV1: Pext_image_copy_capture_session_v1; ADevice: Pwl_array); cdecl;
    dmabuf_format : procedure(data: Pointer; AExtImageCopyCaptureSessionV1: Pext_image_copy_capture_session_v1; AFormat: DWord; AModifiers: Pwl_array); cdecl;
    done : procedure(data: Pointer; AExtImageCopyCaptureSessionV1: Pext_image_copy_capture_session_v1); cdecl;
    stopped : procedure(data: Pointer; AExtImageCopyCaptureSessionV1: Pext_image_copy_capture_session_v1); cdecl;
  end;

const
  EXT_IMAGE_COPY_CAPTURE_FRAME_V1_ERROR_NO_BUFFER = 1; // capture sent without attach_buffer
  EXT_IMAGE_COPY_CAPTURE_FRAME_V1_ERROR_INVALID_BUFFER_DAMAGE = 2; // invalid buffer damage
  EXT_IMAGE_COPY_CAPTURE_FRAME_V1_ERROR_ALREADY_CAPTURED = 3; // capture request has been sent
  EXT_IMAGE_COPY_CAPTURE_FRAME_V1_FAILURE_REASON_UNKNOWN = 0; // 
  EXT_IMAGE_COPY_CAPTURE_FRAME_V1_FAILURE_REASON_BUFFER_CONSTRAINTS = 1; // 
  EXT_IMAGE_COPY_CAPTURE_FRAME_V1_FAILURE_REASON_STOPPED = 2; // 

type
  Pext_image_copy_capture_frame_v1_listener = ^Text_image_copy_capture_frame_v1_listener;
  Text_image_copy_capture_frame_v1_listener = record
    transform : procedure(data: Pointer; AExtImageCopyCaptureFrameV1: Pext_image_copy_capture_frame_v1; ATransform: DWord); cdecl;
    damage : procedure(data: Pointer; AExtImageCopyCaptureFrameV1: Pext_image_copy_capture_frame_v1; AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt); cdecl;
    presentation_time : procedure(data: Pointer; AExtImageCopyCaptureFrameV1: Pext_image_copy_capture_frame_v1; ATvSecHi: DWord; ATvSecLo: DWord; ATvNsec: DWord); cdecl;
    ready : procedure(data: Pointer; AExtImageCopyCaptureFrameV1: Pext_image_copy_capture_frame_v1); cdecl;
    failed : procedure(data: Pointer; AExtImageCopyCaptureFrameV1: Pext_image_copy_capture_frame_v1; AReason: DWord); cdecl;
  end;

const
  EXT_IMAGE_COPY_CAPTURE_CURSOR_SESSION_V1_ERROR_DUPLICATE_SESSION = 1; // get_capture_session sent twice

type
  Pext_image_copy_capture_cursor_session_v1_listener = ^Text_image_copy_capture_cursor_session_v1_listener;
  Text_image_copy_capture_cursor_session_v1_listener = record
    enter : procedure(data: Pointer; AExtImageCopyCaptureCursorSessionV1: Pext_image_copy_capture_cursor_session_v1); cdecl;
    leave : procedure(data: Pointer; AExtImageCopyCaptureCursorSessionV1: Pext_image_copy_capture_cursor_session_v1); cdecl;
    position : procedure(data: Pointer; AExtImageCopyCaptureCursorSessionV1: Pext_image_copy_capture_cursor_session_v1; AX: LongInt; AY: LongInt); cdecl;
    hotspot : procedure(data: Pointer; AExtImageCopyCaptureCursorSessionV1: Pext_image_copy_capture_cursor_session_v1; AX: LongInt; AY: LongInt); cdecl;
  end;



  TExtImageCopyCaptureManagerV1 = class;
  TExtImageCopyCaptureSessionV1 = class;
  TExtImageCopyCaptureFrameV1 = class;
  TExtImageCopyCaptureCursorSessionV1 = class;


  IExtImageCopyCaptureManagerV1Listener = interface
  ['IExtImageCopyCaptureManagerV1Listener']
  end;

  IExtImageCopyCaptureSessionV1Listener = interface
  ['IExtImageCopyCaptureSessionV1Listener']
    procedure ext_image_copy_capture_session_v1_buffer_size(AExtImageCopyCaptureSessionV1: TExtImageCopyCaptureSessionV1; AWidth: DWord; AHeight: DWord);
    procedure ext_image_copy_capture_session_v1_shm_format(AExtImageCopyCaptureSessionV1: TExtImageCopyCaptureSessionV1; AFormat: DWord);
    procedure ext_image_copy_capture_session_v1_dmabuf_device(AExtImageCopyCaptureSessionV1: TExtImageCopyCaptureSessionV1; ADevice: Pwl_array);
    procedure ext_image_copy_capture_session_v1_dmabuf_format(AExtImageCopyCaptureSessionV1: TExtImageCopyCaptureSessionV1; AFormat: DWord; AModifiers: Pwl_array);
    procedure ext_image_copy_capture_session_v1_done(AExtImageCopyCaptureSessionV1: TExtImageCopyCaptureSessionV1);
    procedure ext_image_copy_capture_session_v1_stopped(AExtImageCopyCaptureSessionV1: TExtImageCopyCaptureSessionV1);
  end;

  IExtImageCopyCaptureFrameV1Listener = interface
  ['IExtImageCopyCaptureFrameV1Listener']
    procedure ext_image_copy_capture_frame_v1_transform(AExtImageCopyCaptureFrameV1: TExtImageCopyCaptureFrameV1; ATransform: DWord);
    procedure ext_image_copy_capture_frame_v1_damage(AExtImageCopyCaptureFrameV1: TExtImageCopyCaptureFrameV1; AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
    procedure ext_image_copy_capture_frame_v1_presentation_time(AExtImageCopyCaptureFrameV1: TExtImageCopyCaptureFrameV1; ATvSecHi: DWord; ATvSecLo: DWord; ATvNsec: DWord);
    procedure ext_image_copy_capture_frame_v1_ready(AExtImageCopyCaptureFrameV1: TExtImageCopyCaptureFrameV1);
    procedure ext_image_copy_capture_frame_v1_failed(AExtImageCopyCaptureFrameV1: TExtImageCopyCaptureFrameV1; AReason: DWord);
  end;

  IExtImageCopyCaptureCursorSessionV1Listener = interface
  ['IExtImageCopyCaptureCursorSessionV1Listener']
    procedure ext_image_copy_capture_cursor_session_v1_enter(AExtImageCopyCaptureCursorSessionV1: TExtImageCopyCaptureCursorSessionV1);
    procedure ext_image_copy_capture_cursor_session_v1_leave(AExtImageCopyCaptureCursorSessionV1: TExtImageCopyCaptureCursorSessionV1);
    procedure ext_image_copy_capture_cursor_session_v1_position(AExtImageCopyCaptureCursorSessionV1: TExtImageCopyCaptureCursorSessionV1; AX: LongInt; AY: LongInt);
    procedure ext_image_copy_capture_cursor_session_v1_hotspot(AExtImageCopyCaptureCursorSessionV1: TExtImageCopyCaptureCursorSessionV1; AX: LongInt; AY: LongInt);
  end;




  TExtImageCopyCaptureManagerV1 = class(TWLProxyObject)
  private
    const _CREATE_SESSION = 0;
    const _CREATE_POINTER_CURSOR_SESSION = 1;
    const _DESTROY = 2;
  public
    function CreateSession(ASource: TExtImageCaptureSourceV1; AOptions: DWord; AProxyClass: TWLProxyObjectClass = nil {TExtImageCopyCaptureSessionV1}): TExtImageCopyCaptureSessionV1;
    function CreatePointerCursorSession(ASource: TExtImageCaptureSourceV1; APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TExtImageCopyCaptureCursorSessionV1}): TExtImageCopyCaptureCursorSessionV1;
    destructor Destroy; override;
    function AddListener(AIntf: IExtImageCopyCaptureManagerV1Listener): LongInt;
  end;

  TExtImageCopyCaptureSessionV1 = class(TWLProxyObject)
  private
    const _CREATE_FRAME = 0;
    const _DESTROY = 1;
  public
    function CreateFrame(AProxyClass: TWLProxyObjectClass = nil {TExtImageCopyCaptureFrameV1}): TExtImageCopyCaptureFrameV1;
    destructor Destroy; override;
    function AddListener(AIntf: IExtImageCopyCaptureSessionV1Listener): LongInt;
  end;

  TExtImageCopyCaptureFrameV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _ATTACH_BUFFER = 1;
    const _DAMAGE_BUFFER = 2;
    const _CAPTURE = 3;
  public
    destructor Destroy; override;
    procedure AttachBuffer(ABuffer: TWlBuffer);
    procedure DamageBuffer(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
    procedure Capture;
    function AddListener(AIntf: IExtImageCopyCaptureFrameV1Listener): LongInt;
  end;

  TExtImageCopyCaptureCursorSessionV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _GET_CAPTURE_SESSION = 1;
  public
    destructor Destroy; override;
    function GetCaptureSession(AProxyClass: TWLProxyObjectClass = nil {TExtImageCopyCaptureSessionV1}): TExtImageCopyCaptureSessionV1;
    function AddListener(AIntf: IExtImageCopyCaptureCursorSessionV1Listener): LongInt;
  end;






var
  ext_image_copy_capture_manager_v1_interface: Twl_interface;
  ext_image_copy_capture_session_v1_interface: Twl_interface;
  ext_image_copy_capture_frame_v1_interface: Twl_interface;
  ext_image_copy_capture_cursor_session_v1_interface: Twl_interface;



implementation

var
  vIntf_ext_image_copy_capture_manager_v1_Listener: Text_image_copy_capture_manager_v1_listener;
  vIntf_ext_image_copy_capture_session_v1_Listener: Text_image_copy_capture_session_v1_listener;
  vIntf_ext_image_copy_capture_frame_v1_Listener: Text_image_copy_capture_frame_v1_listener;
  vIntf_ext_image_copy_capture_cursor_session_v1_Listener: Text_image_copy_capture_cursor_session_v1_listener;



function TExtImageCopyCaptureManagerV1.CreateSession(ASource: TExtImageCaptureSourceV1; AOptions: DWord; AProxyClass: TWLProxyObjectClass = nil {TExtImageCopyCaptureSessionV1}): TExtImageCopyCaptureSessionV1;
var
  session: Pwl_proxy;
begin
  session := wl_proxy_marshal_constructor(FProxy,
      _CREATE_SESSION, @ext_image_copy_capture_session_v1_interface, nil, ASource.Proxy, AOptions);
  if AProxyClass = nil then
    AProxyClass := TExtImageCopyCaptureSessionV1;
  Result := TExtImageCopyCaptureSessionV1(AProxyClass.Create(session));
  if not AProxyClass.InheritsFrom(TExtImageCopyCaptureSessionV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TExtImageCopyCaptureSessionV1]);
end;

function TExtImageCopyCaptureManagerV1.CreatePointerCursorSession(ASource: TExtImageCaptureSourceV1; APointer: TWlPointer; AProxyClass: TWLProxyObjectClass = nil {TExtImageCopyCaptureCursorSessionV1}): TExtImageCopyCaptureCursorSessionV1;
var
  session: Pwl_proxy;
begin
  session := wl_proxy_marshal_constructor(FProxy,
      _CREATE_POINTER_CURSOR_SESSION, @ext_image_copy_capture_cursor_session_v1_interface, nil, ASource.Proxy, APointer.Proxy);
  if AProxyClass = nil then
    AProxyClass := TExtImageCopyCaptureCursorSessionV1;
  Result := TExtImageCopyCaptureCursorSessionV1(AProxyClass.Create(session));
  if not AProxyClass.InheritsFrom(TExtImageCopyCaptureCursorSessionV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TExtImageCopyCaptureCursorSessionV1]);
end;

destructor TExtImageCopyCaptureManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtImageCopyCaptureManagerV1.AddListener(AIntf: IExtImageCopyCaptureManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_image_copy_capture_manager_v1_Listener, @FUserDataRec);
end;
function TExtImageCopyCaptureSessionV1.CreateFrame(AProxyClass: TWLProxyObjectClass = nil {TExtImageCopyCaptureFrameV1}): TExtImageCopyCaptureFrameV1;
var
  frame: Pwl_proxy;
begin
  frame := wl_proxy_marshal_constructor(FProxy,
      _CREATE_FRAME, @ext_image_copy_capture_frame_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TExtImageCopyCaptureFrameV1;
  Result := TExtImageCopyCaptureFrameV1(AProxyClass.Create(frame));
  if not AProxyClass.InheritsFrom(TExtImageCopyCaptureFrameV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TExtImageCopyCaptureFrameV1]);
end;

destructor TExtImageCopyCaptureSessionV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtImageCopyCaptureSessionV1.AddListener(AIntf: IExtImageCopyCaptureSessionV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_image_copy_capture_session_v1_Listener, @FUserDataRec);
end;
destructor TExtImageCopyCaptureFrameV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TExtImageCopyCaptureFrameV1.AttachBuffer(ABuffer: TWlBuffer);
begin
  wl_proxy_marshal(FProxy, _ATTACH_BUFFER, ABuffer.Proxy);
end;

procedure TExtImageCopyCaptureFrameV1.DamageBuffer(AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt);
begin
  wl_proxy_marshal(FProxy, _DAMAGE_BUFFER, AX, AY, AWidth, AHeight);
end;

procedure TExtImageCopyCaptureFrameV1.Capture;
begin
  wl_proxy_marshal(FProxy, _CAPTURE);
end;

function TExtImageCopyCaptureFrameV1.AddListener(AIntf: IExtImageCopyCaptureFrameV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_image_copy_capture_frame_v1_Listener, @FUserDataRec);
end;
destructor TExtImageCopyCaptureCursorSessionV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtImageCopyCaptureCursorSessionV1.GetCaptureSession(AProxyClass: TWLProxyObjectClass = nil {TExtImageCopyCaptureSessionV1}): TExtImageCopyCaptureSessionV1;
var
  session: Pwl_proxy;
begin
  session := wl_proxy_marshal_constructor(FProxy,
      _GET_CAPTURE_SESSION, @ext_image_copy_capture_session_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TExtImageCopyCaptureSessionV1;
  Result := TExtImageCopyCaptureSessionV1(AProxyClass.Create(session));
  if not AProxyClass.InheritsFrom(TExtImageCopyCaptureSessionV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TExtImageCopyCaptureSessionV1]);
end;

function TExtImageCopyCaptureCursorSessionV1.AddListener(AIntf: IExtImageCopyCaptureCursorSessionV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_image_copy_capture_cursor_session_v1_Listener, @FUserDataRec);
end;




procedure ext_image_copy_capture_session_v1_buffer_size_Intf(AData: PWLUserData; Aext_image_copy_capture_session_v1: Pext_image_copy_capture_session_v1; AWidth: DWord; AHeight: DWord); cdecl;
var
  AIntf: IExtImageCopyCaptureSessionV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtImageCopyCaptureSessionV1Listener(AData^.ListenerUserData);
  AIntf.ext_image_copy_capture_session_v1_buffer_size(TExtImageCopyCaptureSessionV1(AData^.PascalObject), AWidth, AHeight);
end;

procedure ext_image_copy_capture_session_v1_shm_format_Intf(AData: PWLUserData; Aext_image_copy_capture_session_v1: Pext_image_copy_capture_session_v1; AFormat: DWord); cdecl;
var
  AIntf: IExtImageCopyCaptureSessionV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtImageCopyCaptureSessionV1Listener(AData^.ListenerUserData);
  AIntf.ext_image_copy_capture_session_v1_shm_format(TExtImageCopyCaptureSessionV1(AData^.PascalObject), AFormat);
end;

procedure ext_image_copy_capture_session_v1_dmabuf_device_Intf(AData: PWLUserData; Aext_image_copy_capture_session_v1: Pext_image_copy_capture_session_v1; ADevice: Pwl_array); cdecl;
var
  AIntf: IExtImageCopyCaptureSessionV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtImageCopyCaptureSessionV1Listener(AData^.ListenerUserData);
  AIntf.ext_image_copy_capture_session_v1_dmabuf_device(TExtImageCopyCaptureSessionV1(AData^.PascalObject), ADevice);
end;

procedure ext_image_copy_capture_session_v1_dmabuf_format_Intf(AData: PWLUserData; Aext_image_copy_capture_session_v1: Pext_image_copy_capture_session_v1; AFormat: DWord; AModifiers: Pwl_array); cdecl;
var
  AIntf: IExtImageCopyCaptureSessionV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtImageCopyCaptureSessionV1Listener(AData^.ListenerUserData);
  AIntf.ext_image_copy_capture_session_v1_dmabuf_format(TExtImageCopyCaptureSessionV1(AData^.PascalObject), AFormat, AModifiers);
end;

procedure ext_image_copy_capture_session_v1_done_Intf(AData: PWLUserData; Aext_image_copy_capture_session_v1: Pext_image_copy_capture_session_v1); cdecl;
var
  AIntf: IExtImageCopyCaptureSessionV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtImageCopyCaptureSessionV1Listener(AData^.ListenerUserData);
  AIntf.ext_image_copy_capture_session_v1_done(TExtImageCopyCaptureSessionV1(AData^.PascalObject));
end;

procedure ext_image_copy_capture_session_v1_stopped_Intf(AData: PWLUserData; Aext_image_copy_capture_session_v1: Pext_image_copy_capture_session_v1); cdecl;
var
  AIntf: IExtImageCopyCaptureSessionV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtImageCopyCaptureSessionV1Listener(AData^.ListenerUserData);
  AIntf.ext_image_copy_capture_session_v1_stopped(TExtImageCopyCaptureSessionV1(AData^.PascalObject));
end;

procedure ext_image_copy_capture_frame_v1_transform_Intf(AData: PWLUserData; Aext_image_copy_capture_frame_v1: Pext_image_copy_capture_frame_v1; ATransform: DWord); cdecl;
var
  AIntf: IExtImageCopyCaptureFrameV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtImageCopyCaptureFrameV1Listener(AData^.ListenerUserData);
  AIntf.ext_image_copy_capture_frame_v1_transform(TExtImageCopyCaptureFrameV1(AData^.PascalObject), ATransform);
end;

procedure ext_image_copy_capture_frame_v1_damage_Intf(AData: PWLUserData; Aext_image_copy_capture_frame_v1: Pext_image_copy_capture_frame_v1; AX: LongInt; AY: LongInt; AWidth: LongInt; AHeight: LongInt); cdecl;
var
  AIntf: IExtImageCopyCaptureFrameV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtImageCopyCaptureFrameV1Listener(AData^.ListenerUserData);
  AIntf.ext_image_copy_capture_frame_v1_damage(TExtImageCopyCaptureFrameV1(AData^.PascalObject), AX, AY, AWidth, AHeight);
end;

procedure ext_image_copy_capture_frame_v1_presentation_time_Intf(AData: PWLUserData; Aext_image_copy_capture_frame_v1: Pext_image_copy_capture_frame_v1; ATvSecHi: DWord; ATvSecLo: DWord; ATvNsec: DWord); cdecl;
var
  AIntf: IExtImageCopyCaptureFrameV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtImageCopyCaptureFrameV1Listener(AData^.ListenerUserData);
  AIntf.ext_image_copy_capture_frame_v1_presentation_time(TExtImageCopyCaptureFrameV1(AData^.PascalObject), ATvSecHi, ATvSecLo, ATvNsec);
end;

procedure ext_image_copy_capture_frame_v1_ready_Intf(AData: PWLUserData; Aext_image_copy_capture_frame_v1: Pext_image_copy_capture_frame_v1); cdecl;
var
  AIntf: IExtImageCopyCaptureFrameV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtImageCopyCaptureFrameV1Listener(AData^.ListenerUserData);
  AIntf.ext_image_copy_capture_frame_v1_ready(TExtImageCopyCaptureFrameV1(AData^.PascalObject));
end;

procedure ext_image_copy_capture_frame_v1_failed_Intf(AData: PWLUserData; Aext_image_copy_capture_frame_v1: Pext_image_copy_capture_frame_v1; AReason: DWord); cdecl;
var
  AIntf: IExtImageCopyCaptureFrameV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtImageCopyCaptureFrameV1Listener(AData^.ListenerUserData);
  AIntf.ext_image_copy_capture_frame_v1_failed(TExtImageCopyCaptureFrameV1(AData^.PascalObject), AReason);
end;

procedure ext_image_copy_capture_cursor_session_v1_enter_Intf(AData: PWLUserData; Aext_image_copy_capture_cursor_session_v1: Pext_image_copy_capture_cursor_session_v1); cdecl;
var
  AIntf: IExtImageCopyCaptureCursorSessionV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtImageCopyCaptureCursorSessionV1Listener(AData^.ListenerUserData);
  AIntf.ext_image_copy_capture_cursor_session_v1_enter(TExtImageCopyCaptureCursorSessionV1(AData^.PascalObject));
end;

procedure ext_image_copy_capture_cursor_session_v1_leave_Intf(AData: PWLUserData; Aext_image_copy_capture_cursor_session_v1: Pext_image_copy_capture_cursor_session_v1); cdecl;
var
  AIntf: IExtImageCopyCaptureCursorSessionV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtImageCopyCaptureCursorSessionV1Listener(AData^.ListenerUserData);
  AIntf.ext_image_copy_capture_cursor_session_v1_leave(TExtImageCopyCaptureCursorSessionV1(AData^.PascalObject));
end;

procedure ext_image_copy_capture_cursor_session_v1_position_Intf(AData: PWLUserData; Aext_image_copy_capture_cursor_session_v1: Pext_image_copy_capture_cursor_session_v1; AX: LongInt; AY: LongInt); cdecl;
var
  AIntf: IExtImageCopyCaptureCursorSessionV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtImageCopyCaptureCursorSessionV1Listener(AData^.ListenerUserData);
  AIntf.ext_image_copy_capture_cursor_session_v1_position(TExtImageCopyCaptureCursorSessionV1(AData^.PascalObject), AX, AY);
end;

procedure ext_image_copy_capture_cursor_session_v1_hotspot_Intf(AData: PWLUserData; Aext_image_copy_capture_cursor_session_v1: Pext_image_copy_capture_cursor_session_v1; AX: LongInt; AY: LongInt); cdecl;
var
  AIntf: IExtImageCopyCaptureCursorSessionV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IExtImageCopyCaptureCursorSessionV1Listener(AData^.ListenerUserData);
  AIntf.ext_image_copy_capture_cursor_session_v1_hotspot(TExtImageCopyCaptureCursorSessionV1(AData^.PascalObject), AX, AY);
end;



const
  pInterfaces: array[0..16] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@ext_image_copy_capture_session_v1_interface),
    (@ext_image_capture_source_v1_interface),
    (nil),
    (@ext_image_copy_capture_cursor_session_v1_interface),
    (@ext_image_capture_source_v1_interface),
    (@wl_pointer_interface),
    (@ext_image_copy_capture_frame_v1_interface),
    (@wl_buffer_interface),
    (@ext_image_copy_capture_session_v1_interface)
  );

  ext_image_copy_capture_manager_v1_requests: array[0..2] of Twl_message = (
    (name: 'create_session'; signature: 'nou'; types: @pInterfaces[8]),
    (name: 'create_pointer_cursor_session'; signature: 'noo'; types: @pInterfaces[11]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  ext_image_copy_capture_session_v1_requests: array[0..1] of Twl_message = (
    (name: 'create_frame'; signature: 'n'; types: @pInterfaces[14]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  ext_image_copy_capture_session_v1_events: array[0..5] of Twl_message = (
    (name: 'buffer_size'; signature: 'uu'; types: @pInterfaces[0]),
    (name: 'shm_format'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'dmabuf_device'; signature: 'a'; types: @pInterfaces[0]),
    (name: 'dmabuf_format'; signature: 'ua'; types: @pInterfaces[0]),
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'stopped'; signature: ''; types: @pInterfaces[0])
  );
  ext_image_copy_capture_frame_v1_requests: array[0..3] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'attach_buffer'; signature: 'o'; types: @pInterfaces[15]),
    (name: 'damage_buffer'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'capture'; signature: ''; types: @pInterfaces[0])
  );
  ext_image_copy_capture_frame_v1_events: array[0..4] of Twl_message = (
    (name: 'transform'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'damage'; signature: 'iiii'; types: @pInterfaces[0]),
    (name: 'presentation_time'; signature: 'uuu'; types: @pInterfaces[0]),
    (name: 'ready'; signature: ''; types: @pInterfaces[0]),
    (name: 'failed'; signature: 'u'; types: @pInterfaces[0])
  );
  ext_image_copy_capture_cursor_session_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'get_capture_session'; signature: 'n'; types: @pInterfaces[16])
  );
  ext_image_copy_capture_cursor_session_v1_events: array[0..3] of Twl_message = (
    (name: 'enter'; signature: ''; types: @pInterfaces[0]),
    (name: 'leave'; signature: ''; types: @pInterfaces[0]),
    (name: 'position'; signature: 'ii'; types: @pInterfaces[0]),
    (name: 'hotspot'; signature: 'ii'; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_ext_image_copy_capture_session_v1_Listener.buffer_size) := @ext_image_copy_capture_session_v1_buffer_size_Intf;
  Pointer(vIntf_ext_image_copy_capture_session_v1_Listener.shm_format) := @ext_image_copy_capture_session_v1_shm_format_Intf;
  Pointer(vIntf_ext_image_copy_capture_session_v1_Listener.dmabuf_device) := @ext_image_copy_capture_session_v1_dmabuf_device_Intf;
  Pointer(vIntf_ext_image_copy_capture_session_v1_Listener.dmabuf_format) := @ext_image_copy_capture_session_v1_dmabuf_format_Intf;
  Pointer(vIntf_ext_image_copy_capture_session_v1_Listener.done) := @ext_image_copy_capture_session_v1_done_Intf;
  Pointer(vIntf_ext_image_copy_capture_session_v1_Listener.stopped) := @ext_image_copy_capture_session_v1_stopped_Intf;
  Pointer(vIntf_ext_image_copy_capture_frame_v1_Listener.transform) := @ext_image_copy_capture_frame_v1_transform_Intf;
  Pointer(vIntf_ext_image_copy_capture_frame_v1_Listener.damage) := @ext_image_copy_capture_frame_v1_damage_Intf;
  Pointer(vIntf_ext_image_copy_capture_frame_v1_Listener.presentation_time) := @ext_image_copy_capture_frame_v1_presentation_time_Intf;
  Pointer(vIntf_ext_image_copy_capture_frame_v1_Listener.ready) := @ext_image_copy_capture_frame_v1_ready_Intf;
  Pointer(vIntf_ext_image_copy_capture_frame_v1_Listener.failed) := @ext_image_copy_capture_frame_v1_failed_Intf;
  Pointer(vIntf_ext_image_copy_capture_cursor_session_v1_Listener.enter) := @ext_image_copy_capture_cursor_session_v1_enter_Intf;
  Pointer(vIntf_ext_image_copy_capture_cursor_session_v1_Listener.leave) := @ext_image_copy_capture_cursor_session_v1_leave_Intf;
  Pointer(vIntf_ext_image_copy_capture_cursor_session_v1_Listener.position) := @ext_image_copy_capture_cursor_session_v1_position_Intf;
  Pointer(vIntf_ext_image_copy_capture_cursor_session_v1_Listener.hotspot) := @ext_image_copy_capture_cursor_session_v1_hotspot_Intf;


  ext_image_copy_capture_manager_v1_interface.name := 'ext_image_copy_capture_manager_v1';
  ext_image_copy_capture_manager_v1_interface.version := 1;
  ext_image_copy_capture_manager_v1_interface.method_count := 3;
  ext_image_copy_capture_manager_v1_interface.methods := @ext_image_copy_capture_manager_v1_requests;
  ext_image_copy_capture_manager_v1_interface.event_count := 0;
  ext_image_copy_capture_manager_v1_interface.events := nil;

  ext_image_copy_capture_session_v1_interface.name := 'ext_image_copy_capture_session_v1';
  ext_image_copy_capture_session_v1_interface.version := 1;
  ext_image_copy_capture_session_v1_interface.method_count := 2;
  ext_image_copy_capture_session_v1_interface.methods := @ext_image_copy_capture_session_v1_requests;
  ext_image_copy_capture_session_v1_interface.event_count := 6;
  ext_image_copy_capture_session_v1_interface.events := @ext_image_copy_capture_session_v1_events;

  ext_image_copy_capture_frame_v1_interface.name := 'ext_image_copy_capture_frame_v1';
  ext_image_copy_capture_frame_v1_interface.version := 1;
  ext_image_copy_capture_frame_v1_interface.method_count := 4;
  ext_image_copy_capture_frame_v1_interface.methods := @ext_image_copy_capture_frame_v1_requests;
  ext_image_copy_capture_frame_v1_interface.event_count := 5;
  ext_image_copy_capture_frame_v1_interface.events := @ext_image_copy_capture_frame_v1_events;

  ext_image_copy_capture_cursor_session_v1_interface.name := 'ext_image_copy_capture_cursor_session_v1';
  ext_image_copy_capture_cursor_session_v1_interface.version := 1;
  ext_image_copy_capture_cursor_session_v1_interface.method_count := 2;
  ext_image_copy_capture_cursor_session_v1_interface.methods := @ext_image_copy_capture_cursor_session_v1_requests;
  ext_image_copy_capture_cursor_session_v1_interface.event_count := 4;
  ext_image_copy_capture_cursor_session_v1_interface.events := @ext_image_copy_capture_cursor_session_v1_events;

end.
