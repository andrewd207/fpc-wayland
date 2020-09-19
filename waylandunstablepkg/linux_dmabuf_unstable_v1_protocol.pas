unit linux_dmabuf_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzwp_linux_dmabuf_v1 = Pointer;
  Pzwp_linux_buffer_params_v1 = Pointer;
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



  TZwpLinuxDmabufV1 = class;
  TZwpLinuxBufferParamsV1 = class;


  IZwpLinuxDmabufV1Listener = interface
  ['IZwpLinuxDmabufV1Listener']
    procedure zwp_linux_dmabuf_v1_format(AZwpLinuxDmabufV1: TZwpLinuxDmabufV1; AFormat: DWord);
    procedure zwp_linux_dmabuf_v1_modifier(AZwpLinuxDmabufV1: TZwpLinuxDmabufV1; AFormat: DWord; AModifierHi: DWord; AModifierLo: DWord);
  end;

  IZwpLinuxBufferParamsV1Listener = interface
  ['IZwpLinuxBufferParamsV1Listener']
    procedure zwp_linux_buffer_params_v1_created(AZwpLinuxBufferParamsV1: TZwpLinuxBufferParamsV1; ABuffer: TWlBuffer);
    procedure zwp_linux_buffer_params_v1_failed(AZwpLinuxBufferParamsV1: TZwpLinuxBufferParamsV1);
  end;




  TZwpLinuxDmabufV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _CREATE_PARAMS = 1;
  public
    destructor Destroy; override;
    function CreateParams(AProxyClass: TWLProxyObjectClass = nil {TZwpLinuxBufferParamsV1}): TZwpLinuxBufferParamsV1;
    function AddListener(AIntf: IZwpLinuxDmabufV1Listener): LongInt;
  end;

  TZwpLinuxBufferParamsV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _ADD = 1;
    const _CREATE = 2;
    const _CREATE_IMMED = 3;
  public
    destructor Destroy; override;
    procedure Add(AFd: LongInt{fd}; APlaneIdx: DWord; AOffset: DWord; AStride: DWord; AModifierHi: DWord; AModifierLo: DWord);
    procedure Create(AWidth: LongInt; AHeight: LongInt; AFormat: DWord; AFlags: DWord);
    function CreateImmed(AWidth: LongInt; AHeight: LongInt; AFormat: DWord; AFlags: DWord; AProxyClass: TWLProxyObjectClass = nil {TWlBuffer}): TWlBuffer;
    function AddListener(AIntf: IZwpLinuxBufferParamsV1Listener): LongInt;
  end;






var
  zwp_linux_dmabuf_v1_interface: Twl_interface;
  zwp_linux_buffer_params_v1_interface: Twl_interface;



implementation

var
  vIntf_zwp_linux_dmabuf_v1_Listener: Tzwp_linux_dmabuf_v1_listener;
  vIntf_zwp_linux_buffer_params_v1_Listener: Tzwp_linux_buffer_params_v1_listener;



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
  Result := TZwpLinuxBufferParamsV1(AProxyClass.Create(params_id));
  if not AProxyClass.InheritsFrom(TZwpLinuxBufferParamsV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZwpLinuxBufferParamsV1]);
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
  Result := TWlBuffer(AProxyClass.Create(buffer_id));
  if not AProxyClass.InheritsFrom(TWlBuffer) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlBuffer]);
end;

function TZwpLinuxBufferParamsV1.AddListener(AIntf: IZwpLinuxBufferParamsV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zwp_linux_buffer_params_v1_Listener, @FUserDataRec);
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
    (@zwp_linux_buffer_params_v1_interface),
    (@wl_buffer_interface),
    (nil),
    (nil),
    (nil),
    (nil)
  );

  zwp_linux_dmabuf_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'create_params'; signature: 'n'; types: @pInterfaces[8])
  );
  zwp_linux_dmabuf_v1_events: array[0..1] of Twl_message = (
    (name: 'format'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'modifier'; signature: '3uuu'; types: @pInterfaces[0])
  );
  zwp_linux_buffer_params_v1_requests: array[0..3] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'add'; signature: 'huuuuu'; types: @pInterfaces[0]),
    (name: 'create'; signature: 'iiuu'; types: @pInterfaces[0]),
    (name: 'create_immed'; signature: '2niiuu'; types: @pInterfaces[9])
  );
  zwp_linux_buffer_params_v1_events: array[0..1] of Twl_message = (
    (name: 'created'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'failed'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zwp_linux_dmabuf_v1_Listener.format) := @zwp_linux_dmabuf_v1_format_Intf;
  Pointer(vIntf_zwp_linux_dmabuf_v1_Listener.modifier) := @zwp_linux_dmabuf_v1_modifier_Intf;
  Pointer(vIntf_zwp_linux_buffer_params_v1_Listener.created) := @zwp_linux_buffer_params_v1_created_Intf;
  Pointer(vIntf_zwp_linux_buffer_params_v1_Listener.failed) := @zwp_linux_buffer_params_v1_failed_Intf;


  zwp_linux_dmabuf_v1_interface.name := 'zwp_linux_dmabuf_v1';
  zwp_linux_dmabuf_v1_interface.version := 3;
  zwp_linux_dmabuf_v1_interface.method_count := 2;
  zwp_linux_dmabuf_v1_interface.methods := @zwp_linux_dmabuf_v1_requests;
  zwp_linux_dmabuf_v1_interface.event_count := 2;
  zwp_linux_dmabuf_v1_interface.events := @zwp_linux_dmabuf_v1_events;

  zwp_linux_buffer_params_v1_interface.name := 'zwp_linux_buffer_params_v1';
  zwp_linux_buffer_params_v1_interface.version := 3;
  zwp_linux_buffer_params_v1_interface.method_count := 4;
  zwp_linux_buffer_params_v1_interface.methods := @zwp_linux_buffer_params_v1_requests;
  zwp_linux_buffer_params_v1_interface.event_count := 2;
  zwp_linux_buffer_params_v1_interface.events := @zwp_linux_buffer_params_v1_events;

end.
