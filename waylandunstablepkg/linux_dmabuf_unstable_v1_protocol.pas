unit linux_dmabuf_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_linux_dmabuf_v1 = Pointer;
  Pzwp_linux_buffer_params_v1 = Pointer;
  Pzwp_linux_dmabuf_feedback_v1 = Pointer;
  Pzwp_linux_dmabuf_v1_listener = ^Tzwp_linux_dmabuf_v1_listener;
  Tzwp_linux_dmabuf_v1_listener = record
    format : procedure(data: Pointer; AZwpLinuxDmabufV1: Pzwp_linux_dmabuf_v1; AFormat: DWord); cdecl;
    modifier : procedure(data: Pointer; AZwpLinuxDmabufV1: Pzwp_linux_dmabuf_v1; AFormat: DWord; AModifierHi: DWord; AModifierLo: DWord); cdecl;
  end;

const
  ZWP_LINUX_BUFFER_PARAMS_V1_ERROR_ALREADY_USED = 0; // the dmabuf_batch object has already been used to create a wl_buffer
  ZWP_LINUX_BUFFER_PARAMS_V1_ERROR_PLANE_IDX = 1; // plane index out of bounds
  ZWP_LINUX_BUFFER_PARAMS_V1_ERROR_PLANE_SET = 2; // the plane index was already set
  ZWP_LINUX_BUFFER_PARAMS_V1_ERROR_INCOMPLETE = 3; // missing or too many planes to create a buffer
  ZWP_LINUX_BUFFER_PARAMS_V1_ERROR_INVALID_FORMAT = 4; // format not supported
  ZWP_LINUX_BUFFER_PARAMS_V1_ERROR_INVALID_DIMENSIONS = 5; // invalid width or height
  ZWP_LINUX_BUFFER_PARAMS_V1_ERROR_OUT_OF_BOUNDS = 6; // offset + stride * height goes out of dmabuf bounds
  ZWP_LINUX_BUFFER_PARAMS_V1_ERROR_INVALID_WL_BUFFER = 7; // invalid wl_buffer resulted from importing dmabufs via                the create_immed request on given buffer_params
  ZWP_LINUX_BUFFER_PARAMS_V1_FLAGS_Y_INVERT = 1; // contents are y-inverted
  ZWP_LINUX_BUFFER_PARAMS_V1_FLAGS_INTERLACED = 2; // content is interlaced
  ZWP_LINUX_BUFFER_PARAMS_V1_FLAGS_BOTTOM_FIRST = 4; // bottom field first

type
  Pzwp_linux_buffer_params_v1_listener = ^Tzwp_linux_buffer_params_v1_listener;
  Tzwp_linux_buffer_params_v1_listener = record
    created : procedure(data: Pointer; AZwpLinuxBufferParamsV1: Pzwp_linux_buffer_params_v1; ABuffer: Pwl_buffer); cdecl;
    failed : procedure(data: Pointer; AZwpLinuxBufferParamsV1: Pzwp_linux_buffer_params_v1); cdecl;
  end;

const
  ZWP_LINUX_DMABUF_FEEDBACK_V1_TRANCHE_FLAGS_SCANOUT = 1; // direct scan-out tranche

type
  Pzwp_linux_dmabuf_feedback_v1_listener = ^Tzwp_linux_dmabuf_feedback_v1_listener;
  Tzwp_linux_dmabuf_feedback_v1_listener = record
    done : procedure(data: Pointer; AZwpLinuxDmabufFeedbackV1: Pzwp_linux_dmabuf_feedback_v1); cdecl;
    format_table : procedure(data: Pointer; AZwpLinuxDmabufFeedbackV1: Pzwp_linux_dmabuf_feedback_v1; AFd: LongInt{fd}; ASize: DWord); cdecl;
    main_device : procedure(data: Pointer; AZwpLinuxDmabufFeedbackV1: Pzwp_linux_dmabuf_feedback_v1; ADevice: Pwl_array); cdecl;
    tranche_done : procedure(data: Pointer; AZwpLinuxDmabufFeedbackV1: Pzwp_linux_dmabuf_feedback_v1); cdecl;
    tranche_target_device : procedure(data: Pointer; AZwpLinuxDmabufFeedbackV1: Pzwp_linux_dmabuf_feedback_v1; ADevice: Pwl_array); cdecl;
    tranche_formats : procedure(data: Pointer; AZwpLinuxDmabufFeedbackV1: Pzwp_linux_dmabuf_feedback_v1; AIndices: Pwl_array); cdecl;
    tranche_flags : procedure(data: Pointer; AZwpLinuxDmabufFeedbackV1: Pzwp_linux_dmabuf_feedback_v1; AFlags: DWord); cdecl;
  end;



  TZwpLinuxDmabufV1 = class;
  TZwpLinuxBufferParamsV1 = class;
  TZwpLinuxDmabufFeedbackV1 = class;


  IZwpLinuxDmabufV1Listener = interface
  ['IZwpLinuxDmabufV1Listener']
    procedure zwp_linux_dmabuf_v1_format(AZwpLinuxDmabufV1: TZwpLinuxDmabufV1; AFormat: DWord);
    procedure zwp_linux_dmabuf_v1_modifier(AZwpLinuxDmabufV1: TZwpLinuxDmabufV1; AFormat: DWord; AModifierHi: DWord; AModifierLo: DWord); {since: 3}
  end;

  IZwpLinuxBufferParamsV1Listener = interface
  ['IZwpLinuxBufferParamsV1Listener']
    procedure zwp_linux_buffer_params_v1_created(AZwpLinuxBufferParamsV1: TZwpLinuxBufferParamsV1; ABuffer: TWlBuffer);
    procedure zwp_linux_buffer_params_v1_failed(AZwpLinuxBufferParamsV1: TZwpLinuxBufferParamsV1);
  end;

  IZwpLinuxDmabufFeedbackV1Listener = interface
  ['IZwpLinuxDmabufFeedbackV1Listener']
    procedure zwp_linux_dmabuf_feedback_v1_done(AZwpLinuxDmabufFeedbackV1: TZwpLinuxDmabufFeedbackV1);
    procedure zwp_linux_dmabuf_feedback_v1_format_table(AZwpLinuxDmabufFeedbackV1: TZwpLinuxDmabufFeedbackV1; AFd: LongInt{fd}; ASize: DWord);
    procedure zwp_linux_dmabuf_feedback_v1_main_device(AZwpLinuxDmabufFeedbackV1: TZwpLinuxDmabufFeedbackV1; ADevice: Pwl_array);
    procedure zwp_linux_dmabuf_feedback_v1_tranche_done(AZwpLinuxDmabufFeedbackV1: TZwpLinuxDmabufFeedbackV1);
    procedure zwp_linux_dmabuf_feedback_v1_tranche_target_device(AZwpLinuxDmabufFeedbackV1: TZwpLinuxDmabufFeedbackV1; ADevice: Pwl_array);
    procedure zwp_linux_dmabuf_feedback_v1_tranche_formats(AZwpLinuxDmabufFeedbackV1: TZwpLinuxDmabufFeedbackV1; AIndices: Pwl_array);
    procedure zwp_linux_dmabuf_feedback_v1_tranche_flags(AZwpLinuxDmabufFeedbackV1: TZwpLinuxDmabufFeedbackV1; AFlags: DWord);
  end;




  TZwpLinuxDmabufV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _CREATE_PARAMS = 1;
    const _GET_DEFAULT_FEEDBACK = 2; { since version: 4}
    const _GET_SURFACE_FEEDBACK = 3; { since version: 4}
  public
    destructor Destroy; override;
    function CreateParams(AProxyClass: TWLProxyObjectClass = nil {TZwpLinuxBufferParamsV1}): TZwpLinuxBufferParamsV1;
    function GetDefaultFeedback(AProxyClass: TWLProxyObjectClass = nil {TZwpLinuxDmabufFeedbackV1}): TZwpLinuxDmabufFeedbackV1; {since version: 4}
    function GetSurfaceFeedback(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TZwpLinuxDmabufFeedbackV1}): TZwpLinuxDmabufFeedbackV1; {since version: 4}
    function AddListener(AIntf: IZwpLinuxDmabufV1Listener): LongInt;
  end;

  TZwpLinuxBufferParamsV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _ADD = 1;
    const _CREATE = 2;
    const _CREATE_IMMED = 3; { since version: 2}
  public
    destructor Destroy; override;
    procedure Add(AFd: LongInt{fd}; APlaneIdx: DWord; AOffset: DWord; AStride: DWord; AModifierHi: DWord; AModifierLo: DWord);
    procedure Create(AWidth: LongInt; AHeight: LongInt; AFormat: DWord; AFlags: DWord);
    function CreateImmed(AWidth: LongInt; AHeight: LongInt; AFormat: DWord; AFlags: DWord; AProxyClass: TWLProxyObjectClass = nil {TWlBuffer}): TWlBuffer; {since version: 2}
    function AddListener(AIntf: IZwpLinuxBufferParamsV1Listener): LongInt;
  end;

  TZwpLinuxDmabufFeedbackV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IZwpLinuxDmabufFeedbackV1Listener): LongInt;
  end;






var
  zwp_linux_dmabuf_v1_interface: Twl_interface;
  zwp_linux_buffer_params_v1_interface: Twl_interface;
  zwp_linux_dmabuf_feedback_v1_interface: Twl_interface;



implementation

var
  vIntf_zwp_linux_dmabuf_v1_Listener: Tzwp_linux_dmabuf_v1_listener;
  vIntf_zwp_linux_buffer_params_v1_Listener: Tzwp_linux_buffer_params_v1_listener;
  vIntf_zwp_linux_dmabuf_feedback_v1_Listener: Tzwp_linux_dmabuf_feedback_v1_listener;



destructor TZwpLinuxDmabufV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpLinuxDmabufV1.CreateParams(AProxyClass: TWLProxyObjectClass = nil {TZwpLinuxBufferParamsV1}): TZwpLinuxBufferParamsV1;
var
  params_id: Pwl_proxy;
begin
  params_id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_PARAMS, @zwp_linux_buffer_params_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TZwpLinuxBufferParamsV1;
  if not AProxyClass.InheritsFrom(TZwpLinuxBufferParamsV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpLinuxBufferParamsV1]);
  Result := TZwpLinuxBufferParamsV1(AProxyClass.Create(params_id));
end;

function TZwpLinuxDmabufV1.GetDefaultFeedback(AProxyClass: TWLProxyObjectClass = nil {TZwpLinuxDmabufFeedbackV1}): TZwpLinuxDmabufFeedbackV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_DEFAULT_FEEDBACK, @zwp_linux_dmabuf_feedback_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TZwpLinuxDmabufFeedbackV1;
  if not AProxyClass.InheritsFrom(TZwpLinuxDmabufFeedbackV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpLinuxDmabufFeedbackV1]);
  Result := TZwpLinuxDmabufFeedbackV1(AProxyClass.Create(id));
end;

function TZwpLinuxDmabufV1.GetSurfaceFeedback(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TZwpLinuxDmabufFeedbackV1}): TZwpLinuxDmabufFeedbackV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_SURFACE_FEEDBACK, @zwp_linux_dmabuf_feedback_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZwpLinuxDmabufFeedbackV1;
  if not AProxyClass.InheritsFrom(TZwpLinuxDmabufFeedbackV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpLinuxDmabufFeedbackV1]);
  Result := TZwpLinuxDmabufFeedbackV1(AProxyClass.Create(id));
end;

function TZwpLinuxDmabufV1.AddListener(AIntf: IZwpLinuxDmabufV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_linux_dmabuf_v1_Listener, @FUserDataRec);
end;
destructor TZwpLinuxBufferParamsV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TZwpLinuxBufferParamsV1.Add(AFd: LongInt{fd}; APlaneIdx: DWord; AOffset: DWord; AStride: DWord; AModifierHi: DWord; AModifierLo: DWord);
begin
  wl_proxy_marshal(FProxy, _ADD, AFd, APlaneIdx, AOffset, AStride, AModifierHi, AModifierLo);
end;

procedure TZwpLinuxBufferParamsV1.Create(AWidth: LongInt; AHeight: LongInt; AFormat: DWord; AFlags: DWord);
begin
  wl_proxy_marshal(FProxy, _CREATE, AWidth, AHeight, AFormat, AFlags);
end;

function TZwpLinuxBufferParamsV1.CreateImmed(AWidth: LongInt; AHeight: LongInt; AFormat: DWord; AFlags: DWord; AProxyClass: TWLProxyObjectClass = nil {TWlBuffer}): TWlBuffer;
var
  buffer_id: Pwl_proxy;
begin
  buffer_id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_IMMED, @wl_buffer_interface, nil, AWidth, AHeight, AFormat, AFlags);
  if AProxyClass = nil then
    AProxyClass := TWlBuffer;
  if not AProxyClass.InheritsFrom(TWlBuffer) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlBuffer]);
  Result := TWlBuffer(AProxyClass.Create(buffer_id));
end;

function TZwpLinuxBufferParamsV1.AddListener(AIntf: IZwpLinuxBufferParamsV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_linux_buffer_params_v1_Listener, @FUserDataRec);
end;
destructor TZwpLinuxDmabufFeedbackV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZwpLinuxDmabufFeedbackV1.AddListener(AIntf: IZwpLinuxDmabufFeedbackV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_linux_dmabuf_feedback_v1_Listener, @FUserDataRec);
end;




procedure zwp_linux_dmabuf_v1_format_Intf(AData: PWLUserData; Azwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1; AFormat: DWord); cdecl;
var
  AIntf: IZwpLinuxDmabufV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpLinuxDmabufV1Listener(AData^.ListenerUserData);
  AIntf.zwp_linux_dmabuf_v1_format(TZwpLinuxDmabufV1(AData^.PascalObject), AFormat);
end;

procedure zwp_linux_dmabuf_v1_modifier_Intf(AData: PWLUserData; Azwp_linux_dmabuf_v1: Pzwp_linux_dmabuf_v1; AFormat: DWord; AModifierHi: DWord; AModifierLo: DWord); cdecl;
var
  AIntf: IZwpLinuxDmabufV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpLinuxDmabufV1Listener(AData^.ListenerUserData);
  AIntf.zwp_linux_dmabuf_v1_modifier(TZwpLinuxDmabufV1(AData^.PascalObject), AFormat, AModifierHi, AModifierLo);
end;

procedure zwp_linux_buffer_params_v1_created_Intf(AData: PWLUserData; Azwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1; ABuffer: Pwl_buffer); cdecl;
var
  AIntf: IZwpLinuxBufferParamsV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpLinuxBufferParamsV1Listener(AData^.ListenerUserData);
  AIntf.zwp_linux_buffer_params_v1_created(TZwpLinuxBufferParamsV1(AData^.PascalObject),  TWlBuffer.Create(ABuffer));
end;

procedure zwp_linux_buffer_params_v1_failed_Intf(AData: PWLUserData; Azwp_linux_buffer_params_v1: Pzwp_linux_buffer_params_v1); cdecl;
var
  AIntf: IZwpLinuxBufferParamsV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpLinuxBufferParamsV1Listener(AData^.ListenerUserData);
  AIntf.zwp_linux_buffer_params_v1_failed(TZwpLinuxBufferParamsV1(AData^.PascalObject));
end;

procedure zwp_linux_dmabuf_feedback_v1_done_Intf(AData: PWLUserData; Azwp_linux_dmabuf_feedback_v1: Pzwp_linux_dmabuf_feedback_v1); cdecl;
var
  AIntf: IZwpLinuxDmabufFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpLinuxDmabufFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.zwp_linux_dmabuf_feedback_v1_done(TZwpLinuxDmabufFeedbackV1(AData^.PascalObject));
end;

procedure zwp_linux_dmabuf_feedback_v1_format_table_Intf(AData: PWLUserData; Azwp_linux_dmabuf_feedback_v1: Pzwp_linux_dmabuf_feedback_v1; AFd: LongInt{fd}; ASize: DWord); cdecl;
var
  AIntf: IZwpLinuxDmabufFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpLinuxDmabufFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.zwp_linux_dmabuf_feedback_v1_format_table(TZwpLinuxDmabufFeedbackV1(AData^.PascalObject), AFd, ASize);
end;

procedure zwp_linux_dmabuf_feedback_v1_main_device_Intf(AData: PWLUserData; Azwp_linux_dmabuf_feedback_v1: Pzwp_linux_dmabuf_feedback_v1; ADevice: Pwl_array); cdecl;
var
  AIntf: IZwpLinuxDmabufFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpLinuxDmabufFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.zwp_linux_dmabuf_feedback_v1_main_device(TZwpLinuxDmabufFeedbackV1(AData^.PascalObject), ADevice);
end;

procedure zwp_linux_dmabuf_feedback_v1_tranche_done_Intf(AData: PWLUserData; Azwp_linux_dmabuf_feedback_v1: Pzwp_linux_dmabuf_feedback_v1); cdecl;
var
  AIntf: IZwpLinuxDmabufFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpLinuxDmabufFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.zwp_linux_dmabuf_feedback_v1_tranche_done(TZwpLinuxDmabufFeedbackV1(AData^.PascalObject));
end;

procedure zwp_linux_dmabuf_feedback_v1_tranche_target_device_Intf(AData: PWLUserData; Azwp_linux_dmabuf_feedback_v1: Pzwp_linux_dmabuf_feedback_v1; ADevice: Pwl_array); cdecl;
var
  AIntf: IZwpLinuxDmabufFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpLinuxDmabufFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.zwp_linux_dmabuf_feedback_v1_tranche_target_device(TZwpLinuxDmabufFeedbackV1(AData^.PascalObject), ADevice);
end;

procedure zwp_linux_dmabuf_feedback_v1_tranche_formats_Intf(AData: PWLUserData; Azwp_linux_dmabuf_feedback_v1: Pzwp_linux_dmabuf_feedback_v1; AIndices: Pwl_array); cdecl;
var
  AIntf: IZwpLinuxDmabufFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpLinuxDmabufFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.zwp_linux_dmabuf_feedback_v1_tranche_formats(TZwpLinuxDmabufFeedbackV1(AData^.PascalObject), AIndices);
end;

procedure zwp_linux_dmabuf_feedback_v1_tranche_flags_Intf(AData: PWLUserData; Azwp_linux_dmabuf_feedback_v1: Pzwp_linux_dmabuf_feedback_v1; AFlags: DWord); cdecl;
var
  AIntf: IZwpLinuxDmabufFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZwpLinuxDmabufFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.zwp_linux_dmabuf_feedback_v1_tranche_flags(TZwpLinuxDmabufFeedbackV1(AData^.PascalObject), AFlags);
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
    (@zwp_linux_buffer_params_v1_interface),
    (@zwp_linux_dmabuf_feedback_v1_interface),
    (@zwp_linux_dmabuf_feedback_v1_interface),
    (@wl_surface_interface),
    (@wl_buffer_interface),
    (nil),
    (nil),
    (nil),
    (nil)
  );

  zwp_linux_dmabuf_v1_requests: array[0..3] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'create_params'; signature: 'n'; types: @pInterfaces[8]),
    (name: 'get_default_feedback'; signature: '4n'; types: @pInterfaces[9]),
    (name: 'get_surface_feedback'; signature: '4no'; types: @pInterfaces[10])
  );
  zwp_linux_dmabuf_v1_events: array[0..1] of Twl_message = (
    (name: 'format'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'modifier'; signature: '3uuu'; types: @pInterfaces[0])
  );
  zwp_linux_buffer_params_v1_requests: array[0..3] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'add'; signature: 'huuuuu'; types: @pInterfaces[0]),
    (name: 'create'; signature: 'iiuu'; types: @pInterfaces[0]),
    (name: 'create_immed'; signature: '2niiuu'; types: @pInterfaces[12])
  );
  zwp_linux_buffer_params_v1_events: array[0..1] of Twl_message = (
    (name: 'created'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'failed'; signature: ''; types: @pInterfaces[0])
  );
  zwp_linux_dmabuf_feedback_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zwp_linux_dmabuf_feedback_v1_events: array[0..6] of Twl_message = (
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'format_table'; signature: 'hu'; types: @pInterfaces[0]),
    (name: 'main_device'; signature: 'a'; types: @pInterfaces[0]),
    (name: 'tranche_done'; signature: ''; types: @pInterfaces[0]),
    (name: 'tranche_target_device'; signature: 'a'; types: @pInterfaces[0]),
    (name: 'tranche_formats'; signature: 'a'; types: @pInterfaces[0]),
    (name: 'tranche_flags'; signature: 'u'; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_linux_dmabuf_v1_Listener.format) := @zwp_linux_dmabuf_v1_format_Intf;
  Pointer(vIntf_zwp_linux_dmabuf_v1_Listener.modifier) := @zwp_linux_dmabuf_v1_modifier_Intf;
  Pointer(vIntf_zwp_linux_buffer_params_v1_Listener.created) := @zwp_linux_buffer_params_v1_created_Intf;
  Pointer(vIntf_zwp_linux_buffer_params_v1_Listener.failed) := @zwp_linux_buffer_params_v1_failed_Intf;
  Pointer(vIntf_zwp_linux_dmabuf_feedback_v1_Listener.done) := @zwp_linux_dmabuf_feedback_v1_done_Intf;
  Pointer(vIntf_zwp_linux_dmabuf_feedback_v1_Listener.format_table) := @zwp_linux_dmabuf_feedback_v1_format_table_Intf;
  Pointer(vIntf_zwp_linux_dmabuf_feedback_v1_Listener.main_device) := @zwp_linux_dmabuf_feedback_v1_main_device_Intf;
  Pointer(vIntf_zwp_linux_dmabuf_feedback_v1_Listener.tranche_done) := @zwp_linux_dmabuf_feedback_v1_tranche_done_Intf;
  Pointer(vIntf_zwp_linux_dmabuf_feedback_v1_Listener.tranche_target_device) := @zwp_linux_dmabuf_feedback_v1_tranche_target_device_Intf;
  Pointer(vIntf_zwp_linux_dmabuf_feedback_v1_Listener.tranche_formats) := @zwp_linux_dmabuf_feedback_v1_tranche_formats_Intf;
  Pointer(vIntf_zwp_linux_dmabuf_feedback_v1_Listener.tranche_flags) := @zwp_linux_dmabuf_feedback_v1_tranche_flags_Intf;


  zwp_linux_dmabuf_v1_interface.name := 'zwp_linux_dmabuf_v1';
  zwp_linux_dmabuf_v1_interface.version := 4;
  zwp_linux_dmabuf_v1_interface.method_count := 4;
  zwp_linux_dmabuf_v1_interface.methods := @zwp_linux_dmabuf_v1_requests;
  zwp_linux_dmabuf_v1_interface.event_count := 2;
  zwp_linux_dmabuf_v1_interface.events := @zwp_linux_dmabuf_v1_events;

  zwp_linux_buffer_params_v1_interface.name := 'zwp_linux_buffer_params_v1';
  zwp_linux_buffer_params_v1_interface.version := 4;
  zwp_linux_buffer_params_v1_interface.method_count := 4;
  zwp_linux_buffer_params_v1_interface.methods := @zwp_linux_buffer_params_v1_requests;
  zwp_linux_buffer_params_v1_interface.event_count := 2;
  zwp_linux_buffer_params_v1_interface.events := @zwp_linux_buffer_params_v1_events;

  zwp_linux_dmabuf_feedback_v1_interface.name := 'zwp_linux_dmabuf_feedback_v1';
  zwp_linux_dmabuf_feedback_v1_interface.version := 4;
  zwp_linux_dmabuf_feedback_v1_interface.method_count := 1;
  zwp_linux_dmabuf_feedback_v1_interface.methods := @zwp_linux_dmabuf_feedback_v1_requests;
  zwp_linux_dmabuf_feedback_v1_interface.event_count := 7;
  zwp_linux_dmabuf_feedback_v1_interface.events := @zwp_linux_dmabuf_feedback_v1_events;

end.
