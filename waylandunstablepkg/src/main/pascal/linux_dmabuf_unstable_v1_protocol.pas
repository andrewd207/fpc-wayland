unit linux_dmabuf_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pwp_linux_dmabuf_v1 = Pointer;
  Pwp_linux_buffer_params_v1 = Pointer;
  Pwp_linux_dmabuf_feedback_v1 = Pointer;
  Pwp_linux_dmabuf_v1_listener = ^Twp_linux_dmabuf_v1_listener;
  Twp_linux_dmabuf_v1_listener = record
    format : procedure(data: Pointer; AWpLinuxDmabufV1: Pwp_linux_dmabuf_v1; AFormat: DWord); cdecl;
    modifier : procedure(data: Pointer; AWpLinuxDmabufV1: Pwp_linux_dmabuf_v1; AFormat: DWord; AModifierHi: DWord; AModifierLo: DWord); cdecl;
  end;

const
  WP_LINUX_BUFFER_PARAMS_V1_ERROR_ALREADY_USED = 0; // the dmabuf_batch object has already been used to create a wl_buffer
  WP_LINUX_BUFFER_PARAMS_V1_ERROR_PLANE_IDX = 1; // plane index out of bounds
  WP_LINUX_BUFFER_PARAMS_V1_ERROR_PLANE_SET = 2; // the plane index was already set
  WP_LINUX_BUFFER_PARAMS_V1_ERROR_INCOMPLETE = 3; // missing or too many planes to create a buffer
  WP_LINUX_BUFFER_PARAMS_V1_ERROR_INVALID_FORMAT = 4; // format not supported
  WP_LINUX_BUFFER_PARAMS_V1_ERROR_INVALID_DIMENSIONS = 5; // invalid width or height
  WP_LINUX_BUFFER_PARAMS_V1_ERROR_OUT_OF_BOUNDS = 6; // offset + stride * height goes out of dmabuf bounds
  WP_LINUX_BUFFER_PARAMS_V1_ERROR_INVALID_WL_BUFFER = 7; // invalid wl_buffer resulted from importing dmabufs via                the create_immed request on given buffer_params
  WP_LINUX_BUFFER_PARAMS_V1_FLAGS_Y_INVERT = 1; // contents are y-inverted
  WP_LINUX_BUFFER_PARAMS_V1_FLAGS_INTERLACED = 2; // content is interlaced
  WP_LINUX_BUFFER_PARAMS_V1_FLAGS_BOTTOM_FIRST = 4; // bottom field first

type
  Pwp_linux_buffer_params_v1_listener = ^Twp_linux_buffer_params_v1_listener;
  Twp_linux_buffer_params_v1_listener = record
    created : procedure(data: Pointer; AWpLinuxBufferParamsV1: Pwp_linux_buffer_params_v1; ABuffer: Pwl_buffer); cdecl;
    failed : procedure(data: Pointer; AWpLinuxBufferParamsV1: Pwp_linux_buffer_params_v1); cdecl;
  end;

const
  WP_LINUX_DMABUF_FEEDBACK_V1_TRANCHE_FLAGS_SCANOUT = 1; // direct scan-out tranche

type
  Pwp_linux_dmabuf_feedback_v1_listener = ^Twp_linux_dmabuf_feedback_v1_listener;
  Twp_linux_dmabuf_feedback_v1_listener = record
    done : procedure(data: Pointer; AWpLinuxDmabufFeedbackV1: Pwp_linux_dmabuf_feedback_v1); cdecl;
    format_table : procedure(data: Pointer; AWpLinuxDmabufFeedbackV1: Pwp_linux_dmabuf_feedback_v1; AFd: LongInt{fd}; ASize: DWord); cdecl;
    main_device : procedure(data: Pointer; AWpLinuxDmabufFeedbackV1: Pwp_linux_dmabuf_feedback_v1; ADevice: Pwl_array); cdecl;
    tranche_done : procedure(data: Pointer; AWpLinuxDmabufFeedbackV1: Pwp_linux_dmabuf_feedback_v1); cdecl;
    tranche_target_device : procedure(data: Pointer; AWpLinuxDmabufFeedbackV1: Pwp_linux_dmabuf_feedback_v1; ADevice: Pwl_array); cdecl;
    tranche_formats : procedure(data: Pointer; AWpLinuxDmabufFeedbackV1: Pwp_linux_dmabuf_feedback_v1; AIndices: Pwl_array); cdecl;
    tranche_flags : procedure(data: Pointer; AWpLinuxDmabufFeedbackV1: Pwp_linux_dmabuf_feedback_v1; AFlags: DWord); cdecl;
  end;



  TWpLinuxDmabufV1 = class;
  TWpLinuxBufferParamsV1 = class;
  TWpLinuxDmabufFeedbackV1 = class;


  IWpLinuxDmabufV1Listener = interface
  ['IWpLinuxDmabufV1Listener']
    procedure wp_linux_dmabuf_v1_format(AWpLinuxDmabufV1: TWpLinuxDmabufV1; AFormat: DWord);
    procedure wp_linux_dmabuf_v1_modifier(AWpLinuxDmabufV1: TWpLinuxDmabufV1; AFormat: DWord; AModifierHi: DWord; AModifierLo: DWord);
  end;

  IWpLinuxBufferParamsV1Listener = interface
  ['IWpLinuxBufferParamsV1Listener']
    procedure wp_linux_buffer_params_v1_created(AWpLinuxBufferParamsV1: TWpLinuxBufferParamsV1; ABuffer: TWlBuffer);
    procedure wp_linux_buffer_params_v1_failed(AWpLinuxBufferParamsV1: TWpLinuxBufferParamsV1);
  end;

  IWpLinuxDmabufFeedbackV1Listener = interface
  ['IWpLinuxDmabufFeedbackV1Listener']
    procedure wp_linux_dmabuf_feedback_v1_done(AWpLinuxDmabufFeedbackV1: TWpLinuxDmabufFeedbackV1);
    procedure wp_linux_dmabuf_feedback_v1_format_table(AWpLinuxDmabufFeedbackV1: TWpLinuxDmabufFeedbackV1; AFd: LongInt{fd}; ASize: DWord);
    procedure wp_linux_dmabuf_feedback_v1_main_device(AWpLinuxDmabufFeedbackV1: TWpLinuxDmabufFeedbackV1; ADevice: Pwl_array);
    procedure wp_linux_dmabuf_feedback_v1_tranche_done(AWpLinuxDmabufFeedbackV1: TWpLinuxDmabufFeedbackV1);
    procedure wp_linux_dmabuf_feedback_v1_tranche_target_device(AWpLinuxDmabufFeedbackV1: TWpLinuxDmabufFeedbackV1; ADevice: Pwl_array);
    procedure wp_linux_dmabuf_feedback_v1_tranche_formats(AWpLinuxDmabufFeedbackV1: TWpLinuxDmabufFeedbackV1; AIndices: Pwl_array);
    procedure wp_linux_dmabuf_feedback_v1_tranche_flags(AWpLinuxDmabufFeedbackV1: TWpLinuxDmabufFeedbackV1; AFlags: DWord);
  end;




  TWpLinuxDmabufV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpLinuxDmabufV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _CREATE_PARAMS = 1;
    const _GET_DEFAULT_FEEDBACK = 2;
    const _GET_SURFACE_FEEDBACK = 3;
  public
    destructor Destroy; override;
    function CreateParams(AProxyClass: TWLProxyObjectClass = nil {TWpLinuxBufferParamsV1}): TWpLinuxBufferParamsV1;
    function GetDefaultFeedback(AProxyClass: TWLProxyObjectClass = nil {TWpLinuxDmabufFeedbackV1}): TWpLinuxDmabufFeedbackV1;
    function GetSurfaceFeedback(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpLinuxDmabufFeedbackV1}): TWpLinuxDmabufFeedbackV1;
    function AddListener(AIntf: IWpLinuxDmabufV1Listener): LongInt;
  end;

  TWpLinuxBufferParamsV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpLinuxBufferParamsV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
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
    function AddListener(AIntf: IWpLinuxBufferParamsV1Listener): LongInt;
  end;

  TWpLinuxDmabufFeedbackV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpLinuxDmabufFeedbackV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IWpLinuxDmabufFeedbackV1Listener): LongInt;
  end;






var
  wp_linux_dmabuf_v1_interface: Twl_interface;
  WP_LINUX_DMABUF_V1_INTERFACE_NAME: String = 'zwp_linux_dmabuf_v1';
  wp_linux_buffer_params_v1_interface: Twl_interface;
  WP_LINUX_BUFFER_PARAMS_V1_INTERFACE_NAME: String = 'zwp_linux_buffer_params_v1';
  wp_linux_dmabuf_feedback_v1_interface: Twl_interface;
  WP_LINUX_DMABUF_FEEDBACK_V1_INTERFACE_NAME: String = 'zwp_linux_dmabuf_feedback_v1';



implementation

var
  vwp_linux_dmabuf_v1_registered: Boolean = False;
  vIntf_wp_linux_dmabuf_v1_Listener: Twp_linux_dmabuf_v1_listener;
  vwp_linux_buffer_params_v1_registered: Boolean = False;
  vIntf_wp_linux_buffer_params_v1_Listener: Twp_linux_buffer_params_v1_listener;
  vwp_linux_dmabuf_feedback_v1_registered: Boolean = False;
  vIntf_wp_linux_dmabuf_feedback_v1_Listener: Twp_linux_dmabuf_feedback_v1_listener;



constructor TWpLinuxDmabufV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpLinuxDmabufV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpLinuxDmabufV1;
begin
  RegisterInterface;
  Result := TWpLinuxDmabufV1.Create(ARegistry.Bind(AName, @wp_linux_dmabuf_v1_interface, AVersion));
end;

destructor TWpLinuxDmabufV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpLinuxDmabufV1.CreateParams(AProxyClass: TWLProxyObjectClass = nil {TWpLinuxBufferParamsV1}): TWpLinuxBufferParamsV1;
var
  params_id: Pwl_proxy;
begin
  TWpLinuxBufferParamsV1.RegisterInterface;
  params_id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_PARAMS, @wp_linux_buffer_params_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWpLinuxBufferParamsV1;
  Result := TWpLinuxBufferParamsV1(AProxyClass.Create(params_id));
  if not AProxyClass.InheritsFrom(TWpLinuxBufferParamsV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpLinuxBufferParamsV1]);
end;

function TWpLinuxDmabufV1.GetDefaultFeedback(AProxyClass: TWLProxyObjectClass = nil {TWpLinuxDmabufFeedbackV1}): TWpLinuxDmabufFeedbackV1;
var
  id: Pwl_proxy;
begin
  TWpLinuxDmabufFeedbackV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_DEFAULT_FEEDBACK, @wp_linux_dmabuf_feedback_v1_interface, nil);
  if AProxyClass = nil then
    AProxyClass := TWpLinuxDmabufFeedbackV1;
  Result := TWpLinuxDmabufFeedbackV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpLinuxDmabufFeedbackV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpLinuxDmabufFeedbackV1]);
end;

function TWpLinuxDmabufV1.GetSurfaceFeedback(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TWpLinuxDmabufFeedbackV1}): TWpLinuxDmabufFeedbackV1;
var
  id: Pwl_proxy;
begin
  TWpLinuxDmabufFeedbackV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _GET_SURFACE_FEEDBACK, @wp_linux_dmabuf_feedback_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TWpLinuxDmabufFeedbackV1;
  Result := TWpLinuxDmabufFeedbackV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TWpLinuxDmabufFeedbackV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWpLinuxDmabufFeedbackV1]);
end;

function TWpLinuxDmabufV1.AddListener(AIntf: IWpLinuxDmabufV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_linux_dmabuf_v1_Listener, @FUserDataRec);
end;
constructor TWpLinuxBufferParamsV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpLinuxBufferParamsV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpLinuxBufferParamsV1;
begin
  RegisterInterface;
  Result := TWpLinuxBufferParamsV1.Create(ARegistry.Bind(AName, @wp_linux_buffer_params_v1_interface, AVersion));
end;

destructor TWpLinuxBufferParamsV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TWpLinuxBufferParamsV1.Add(AFd: LongInt{fd}; APlaneIdx: DWord; AOffset: DWord; AStride: DWord; AModifierHi: DWord; AModifierLo: DWord);
begin
  wl_proxy_marshal(FProxy, _ADD, AFd, APlaneIdx, AOffset, AStride, AModifierHi, AModifierLo);
end;

procedure TWpLinuxBufferParamsV1.Create(AWidth: LongInt; AHeight: LongInt; AFormat: DWord; AFlags: DWord);
begin
  wl_proxy_marshal(FProxy, _CREATE, AWidth, AHeight, AFormat, AFlags);
end;

function TWpLinuxBufferParamsV1.CreateImmed(AWidth: LongInt; AHeight: LongInt; AFormat: DWord; AFlags: DWord; AProxyClass: TWLProxyObjectClass = nil {TWlBuffer}): TWlBuffer;
var
  buffer_id: Pwl_proxy;
begin
  TWlBuffer.RegisterInterface;
  buffer_id := wl_proxy_marshal_constructor(FProxy,
      _CREATE_IMMED, @wl_buffer_interface, nil, AWidth, AHeight, AFormat, AFlags);
  if AProxyClass = nil then
    AProxyClass := TWlBuffer;
  Result := TWlBuffer(AProxyClass.Create(buffer_id));
  if not AProxyClass.InheritsFrom(TWlBuffer) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TWlBuffer]);
end;

function TWpLinuxBufferParamsV1.AddListener(AIntf: IWpLinuxBufferParamsV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_linux_buffer_params_v1_Listener, @FUserDataRec);
end;
constructor TWpLinuxDmabufFeedbackV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TWpLinuxDmabufFeedbackV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TWpLinuxDmabufFeedbackV1;
begin
  RegisterInterface;
  Result := TWpLinuxDmabufFeedbackV1.Create(ARegistry.Bind(AName, @wp_linux_dmabuf_feedback_v1_interface, AVersion));
end;

destructor TWpLinuxDmabufFeedbackV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TWpLinuxDmabufFeedbackV1.AddListener(AIntf: IWpLinuxDmabufFeedbackV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_wp_linux_dmabuf_feedback_v1_Listener, @FUserDataRec);
end;




procedure wp_linux_dmabuf_v1_format_Intf(AData: PWLUserData; Awp_linux_dmabuf_v1: Pwp_linux_dmabuf_v1; AFormat: DWord); cdecl;
var
  AIntf: IWpLinuxDmabufV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpLinuxDmabufV1Listener(AData^.ListenerUserData);
  AIntf.wp_linux_dmabuf_v1_format(TWpLinuxDmabufV1(AData^.PascalObject), AFormat);
end;

procedure wp_linux_dmabuf_v1_modifier_Intf(AData: PWLUserData; Awp_linux_dmabuf_v1: Pwp_linux_dmabuf_v1; AFormat: DWord; AModifierHi: DWord; AModifierLo: DWord); cdecl;
var
  AIntf: IWpLinuxDmabufV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpLinuxDmabufV1Listener(AData^.ListenerUserData);
  AIntf.wp_linux_dmabuf_v1_modifier(TWpLinuxDmabufV1(AData^.PascalObject), AFormat, AModifierHi, AModifierLo);
end;

procedure wp_linux_buffer_params_v1_created_Intf(AData: PWLUserData; Awp_linux_buffer_params_v1: Pwp_linux_buffer_params_v1; ABuffer: Pwl_buffer); cdecl;
var
  AIntf: IWpLinuxBufferParamsV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpLinuxBufferParamsV1Listener(AData^.ListenerUserData);
  AIntf.wp_linux_buffer_params_v1_created(TWpLinuxBufferParamsV1(AData^.PascalObject),  TWlBuffer.Create(ABuffer));
end;

procedure wp_linux_buffer_params_v1_failed_Intf(AData: PWLUserData; Awp_linux_buffer_params_v1: Pwp_linux_buffer_params_v1); cdecl;
var
  AIntf: IWpLinuxBufferParamsV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpLinuxBufferParamsV1Listener(AData^.ListenerUserData);
  AIntf.wp_linux_buffer_params_v1_failed(TWpLinuxBufferParamsV1(AData^.PascalObject));
end;

procedure wp_linux_dmabuf_feedback_v1_done_Intf(AData: PWLUserData; Awp_linux_dmabuf_feedback_v1: Pwp_linux_dmabuf_feedback_v1); cdecl;
var
  AIntf: IWpLinuxDmabufFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpLinuxDmabufFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.wp_linux_dmabuf_feedback_v1_done(TWpLinuxDmabufFeedbackV1(AData^.PascalObject));
end;

procedure wp_linux_dmabuf_feedback_v1_format_table_Intf(AData: PWLUserData; Awp_linux_dmabuf_feedback_v1: Pwp_linux_dmabuf_feedback_v1; AFd: LongInt{fd}; ASize: DWord); cdecl;
var
  AIntf: IWpLinuxDmabufFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpLinuxDmabufFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.wp_linux_dmabuf_feedback_v1_format_table(TWpLinuxDmabufFeedbackV1(AData^.PascalObject), AFd, ASize);
end;

procedure wp_linux_dmabuf_feedback_v1_main_device_Intf(AData: PWLUserData; Awp_linux_dmabuf_feedback_v1: Pwp_linux_dmabuf_feedback_v1; ADevice: Pwl_array); cdecl;
var
  AIntf: IWpLinuxDmabufFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpLinuxDmabufFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.wp_linux_dmabuf_feedback_v1_main_device(TWpLinuxDmabufFeedbackV1(AData^.PascalObject), ADevice);
end;

procedure wp_linux_dmabuf_feedback_v1_tranche_done_Intf(AData: PWLUserData; Awp_linux_dmabuf_feedback_v1: Pwp_linux_dmabuf_feedback_v1); cdecl;
var
  AIntf: IWpLinuxDmabufFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpLinuxDmabufFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.wp_linux_dmabuf_feedback_v1_tranche_done(TWpLinuxDmabufFeedbackV1(AData^.PascalObject));
end;

procedure wp_linux_dmabuf_feedback_v1_tranche_target_device_Intf(AData: PWLUserData; Awp_linux_dmabuf_feedback_v1: Pwp_linux_dmabuf_feedback_v1; ADevice: Pwl_array); cdecl;
var
  AIntf: IWpLinuxDmabufFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpLinuxDmabufFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.wp_linux_dmabuf_feedback_v1_tranche_target_device(TWpLinuxDmabufFeedbackV1(AData^.PascalObject), ADevice);
end;

procedure wp_linux_dmabuf_feedback_v1_tranche_formats_Intf(AData: PWLUserData; Awp_linux_dmabuf_feedback_v1: Pwp_linux_dmabuf_feedback_v1; AIndices: Pwl_array); cdecl;
var
  AIntf: IWpLinuxDmabufFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpLinuxDmabufFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.wp_linux_dmabuf_feedback_v1_tranche_formats(TWpLinuxDmabufFeedbackV1(AData^.PascalObject), AIndices);
end;

procedure wp_linux_dmabuf_feedback_v1_tranche_flags_Intf(AData: PWLUserData; Awp_linux_dmabuf_feedback_v1: Pwp_linux_dmabuf_feedback_v1; AFlags: DWord); cdecl;
var
  AIntf: IWpLinuxDmabufFeedbackV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IWpLinuxDmabufFeedbackV1Listener(AData^.ListenerUserData);
  AIntf.wp_linux_dmabuf_feedback_v1_tranche_flags(TWpLinuxDmabufFeedbackV1(AData^.PascalObject), AFlags);
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
    (@wp_linux_buffer_params_v1_interface),
    (@wp_linux_dmabuf_feedback_v1_interface),
    (@wp_linux_dmabuf_feedback_v1_interface),
    (@wl_surface_interface),
    (@wl_buffer_interface),
    (nil),
    (nil),
    (nil),
    (nil)
  );

  wp_linux_dmabuf_v1_requests: array[0..3] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'create_params'; signature: 'n'; types: @pInterfaces[8]),
    (name: 'get_default_feedback'; signature: '4n'; types: @pInterfaces[9]),
    (name: 'get_surface_feedback'; signature: '4no'; types: @pInterfaces[10])
  );
  wp_linux_dmabuf_v1_events: array[0..1] of Twl_message = (
    (name: 'format'; signature: 'u'; types: @pInterfaces[0]),
    (name: 'modifier'; signature: '3uuu'; types: @pInterfaces[0])
  );
  wp_linux_buffer_params_v1_requests: array[0..3] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'add'; signature: 'huuuuu'; types: @pInterfaces[0]),
    (name: 'create'; signature: 'iiuu'; types: @pInterfaces[0]),
    (name: 'create_immed'; signature: '2niiuu'; types: @pInterfaces[12])
  );
  wp_linux_buffer_params_v1_events: array[0..1] of Twl_message = (
    (name: 'created'; signature: 'n'; types: @pInterfaces[0]),
    (name: 'failed'; signature: ''; types: @pInterfaces[0])
  );
  wp_linux_dmabuf_feedback_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  wp_linux_dmabuf_feedback_v1_events: array[0..6] of Twl_message = (
    (name: 'done'; signature: ''; types: @pInterfaces[0]),
    (name: 'format_table'; signature: 'hu'; types: @pInterfaces[0]),
    (name: 'main_device'; signature: 'a'; types: @pInterfaces[0]),
    (name: 'tranche_done'; signature: ''; types: @pInterfaces[0]),
    (name: 'tranche_target_device'; signature: 'a'; types: @pInterfaces[0]),
    (name: 'tranche_formats'; signature: 'a'; types: @pInterfaces[0]),
    (name: 'tranche_flags'; signature: 'u'; types: @pInterfaces[0])
  );

class procedure TWpLinuxDmabufV1.RegisterInterface;
begin
  if vwp_linux_dmabuf_v1_registered then Exit;
  vwp_linux_dmabuf_v1_registered := True;
  Pointer(vIntf_wp_linux_dmabuf_v1_Listener.format) := @wp_linux_dmabuf_v1_format_Intf;
  Pointer(vIntf_wp_linux_dmabuf_v1_Listener.modifier) := @wp_linux_dmabuf_v1_modifier_Intf;
  wp_linux_dmabuf_v1_interface.name := PChar(WP_LINUX_DMABUF_V1_INTERFACE_NAME);
  wp_linux_dmabuf_v1_interface.version := 5;
  wp_linux_dmabuf_v1_interface.method_count := 4;
  wp_linux_dmabuf_v1_interface.methods := @wp_linux_dmabuf_v1_requests;
  wp_linux_dmabuf_v1_interface.event_count := 2;
  wp_linux_dmabuf_v1_interface.events := @wp_linux_dmabuf_v1_events;
end;

class procedure TWpLinuxBufferParamsV1.RegisterInterface;
begin
  if vwp_linux_buffer_params_v1_registered then Exit;
  vwp_linux_buffer_params_v1_registered := True;
  Pointer(vIntf_wp_linux_buffer_params_v1_Listener.created) := @wp_linux_buffer_params_v1_created_Intf;
  Pointer(vIntf_wp_linux_buffer_params_v1_Listener.failed) := @wp_linux_buffer_params_v1_failed_Intf;
  wp_linux_buffer_params_v1_interface.name := PChar(WP_LINUX_BUFFER_PARAMS_V1_INTERFACE_NAME);
  wp_linux_buffer_params_v1_interface.version := 5;
  wp_linux_buffer_params_v1_interface.method_count := 4;
  wp_linux_buffer_params_v1_interface.methods := @wp_linux_buffer_params_v1_requests;
  wp_linux_buffer_params_v1_interface.event_count := 2;
  wp_linux_buffer_params_v1_interface.events := @wp_linux_buffer_params_v1_events;
end;

class procedure TWpLinuxDmabufFeedbackV1.RegisterInterface;
begin
  if vwp_linux_dmabuf_feedback_v1_registered then Exit;
  vwp_linux_dmabuf_feedback_v1_registered := True;
  Pointer(vIntf_wp_linux_dmabuf_feedback_v1_Listener.done) := @wp_linux_dmabuf_feedback_v1_done_Intf;
  Pointer(vIntf_wp_linux_dmabuf_feedback_v1_Listener.format_table) := @wp_linux_dmabuf_feedback_v1_format_table_Intf;
  Pointer(vIntf_wp_linux_dmabuf_feedback_v1_Listener.main_device) := @wp_linux_dmabuf_feedback_v1_main_device_Intf;
  Pointer(vIntf_wp_linux_dmabuf_feedback_v1_Listener.tranche_done) := @wp_linux_dmabuf_feedback_v1_tranche_done_Intf;
  Pointer(vIntf_wp_linux_dmabuf_feedback_v1_Listener.tranche_target_device) := @wp_linux_dmabuf_feedback_v1_tranche_target_device_Intf;
  Pointer(vIntf_wp_linux_dmabuf_feedback_v1_Listener.tranche_formats) := @wp_linux_dmabuf_feedback_v1_tranche_formats_Intf;
  Pointer(vIntf_wp_linux_dmabuf_feedback_v1_Listener.tranche_flags) := @wp_linux_dmabuf_feedback_v1_tranche_flags_Intf;
  wp_linux_dmabuf_feedback_v1_interface.name := PChar(WP_LINUX_DMABUF_FEEDBACK_V1_INTERFACE_NAME);
  wp_linux_dmabuf_feedback_v1_interface.version := 5;
  wp_linux_dmabuf_feedback_v1_interface.method_count := 1;
  wp_linux_dmabuf_feedback_v1_interface.methods := @wp_linux_dmabuf_feedback_v1_requests;
  wp_linux_dmabuf_feedback_v1_interface.event_count := 7;
  wp_linux_dmabuf_feedback_v1_interface.events := @wp_linux_dmabuf_feedback_v1_events;
end;


end.
