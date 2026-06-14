unit ext_image_capture_source_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol, ext_foreign_toplevel_list_v1_protocol;


type
  Pext_image_capture_source_v1 = Pointer;
  Pext_output_image_capture_source_manager_v1 = Pointer;
  Pext_foreign_toplevel_image_capture_source_manager_v1 = Pointer;
  Pext_image_capture_source_v1_listener = ^Text_image_capture_source_v1_listener;
  Text_image_capture_source_v1_listener = record
  end;

  Pext_output_image_capture_source_manager_v1_listener = ^Text_output_image_capture_source_manager_v1_listener;
  Text_output_image_capture_source_manager_v1_listener = record
  end;

  Pext_foreign_toplevel_image_capture_source_manager_v1_listener = ^Text_foreign_toplevel_image_capture_source_manager_v1_listener;
  Text_foreign_toplevel_image_capture_source_manager_v1_listener = record
  end;



  TExtImageCaptureSourceV1 = class;
  TExtOutputImageCaptureSourceManagerV1 = class;
  TExtForeignToplevelImageCaptureSourceManagerV1 = class;


  IExtImageCaptureSourceV1Listener = interface
  ['IExtImageCaptureSourceV1Listener']
  end;

  IExtOutputImageCaptureSourceManagerV1Listener = interface
  ['IExtOutputImageCaptureSourceManagerV1Listener']
  end;

  IExtForeignToplevelImageCaptureSourceManagerV1Listener = interface
  ['IExtForeignToplevelImageCaptureSourceManagerV1Listener']
  end;




  TExtImageCaptureSourceV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtImageCaptureSourceV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IExtImageCaptureSourceV1Listener): LongInt;
  end;

  TExtOutputImageCaptureSourceManagerV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtOutputImageCaptureSourceManagerV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _CREATE_SOURCE = 0;
    const _DESTROY = 1;
  public
    function CreateSource(AOutput: TWlOutput; AProxyClass: TWLProxyObjectClass = nil {TExtImageCaptureSourceV1}): TExtImageCaptureSourceV1;
    destructor Destroy; override;
    function AddListener(AIntf: IExtOutputImageCaptureSourceManagerV1Listener): LongInt;
  end;

  TExtForeignToplevelImageCaptureSourceManagerV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtForeignToplevelImageCaptureSourceManagerV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _CREATE_SOURCE = 0;
    const _DESTROY = 1;
  public
    function CreateSource(AToplevelHandle: TExtForeignToplevelHandleV1; AProxyClass: TWLProxyObjectClass = nil {TExtImageCaptureSourceV1}): TExtImageCaptureSourceV1;
    destructor Destroy; override;
    function AddListener(AIntf: IExtForeignToplevelImageCaptureSourceManagerV1Listener): LongInt;
  end;






var
  ext_image_capture_source_v1_interface: Twl_interface;
  EXT_IMAGE_CAPTURE_SOURCE_V1_INTERFACE_NAME: String = 'ext_image_capture_source_v1';
  ext_output_image_capture_source_manager_v1_interface: Twl_interface;
  EXT_OUTPUT_IMAGE_CAPTURE_SOURCE_MANAGER_V1_INTERFACE_NAME: String = 'ext_output_image_capture_source_manager_v1';
  ext_foreign_toplevel_image_capture_source_manager_v1_interface: Twl_interface;
  EXT_FOREIGN_TOPLEVEL_IMAGE_CAPTURE_SOURCE_MANAGER_V1_INTERFACE_NAME: String = 'ext_foreign_toplevel_image_capture_source_manager_v1';



implementation

var
  vext_image_capture_source_v1_registered: Boolean = False;
  vIntf_ext_image_capture_source_v1_Listener: Text_image_capture_source_v1_listener;
  vext_output_image_capture_source_manager_v1_registered: Boolean = False;
  vIntf_ext_output_image_capture_source_manager_v1_Listener: Text_output_image_capture_source_manager_v1_listener;
  vext_foreign_toplevel_image_capture_source_manager_v1_registered: Boolean = False;
  vIntf_ext_foreign_toplevel_image_capture_source_manager_v1_Listener: Text_foreign_toplevel_image_capture_source_manager_v1_listener;



constructor TExtImageCaptureSourceV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TExtImageCaptureSourceV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtImageCaptureSourceV1;
begin
  RegisterInterface;
  Result := TExtImageCaptureSourceV1.Create(ARegistry.Bind(AName, @ext_image_capture_source_v1_interface, AVersion));
end;

destructor TExtImageCaptureSourceV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtImageCaptureSourceV1.AddListener(AIntf: IExtImageCaptureSourceV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_image_capture_source_v1_Listener, @FUserDataRec);
end;
constructor TExtOutputImageCaptureSourceManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TExtOutputImageCaptureSourceManagerV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtOutputImageCaptureSourceManagerV1;
begin
  RegisterInterface;
  Result := TExtOutputImageCaptureSourceManagerV1.Create(ARegistry.Bind(AName, @ext_output_image_capture_source_manager_v1_interface, AVersion));
end;

function TExtOutputImageCaptureSourceManagerV1.CreateSource(AOutput: TWlOutput; AProxyClass: TWLProxyObjectClass = nil {TExtImageCaptureSourceV1}): TExtImageCaptureSourceV1;
var
  source: Pwl_proxy;
begin
  TExtImageCaptureSourceV1.RegisterInterface;
  source := wl_proxy_marshal_constructor(FProxy,
      _CREATE_SOURCE, @ext_image_capture_source_v1_interface, nil, AOutput.Proxy);
  if AProxyClass = nil then
    AProxyClass := TExtImageCaptureSourceV1;
  Result := TExtImageCaptureSourceV1(AProxyClass.Create(source));
  if not AProxyClass.InheritsFrom(TExtImageCaptureSourceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TExtImageCaptureSourceV1]);
end;

destructor TExtOutputImageCaptureSourceManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtOutputImageCaptureSourceManagerV1.AddListener(AIntf: IExtOutputImageCaptureSourceManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_output_image_capture_source_manager_v1_Listener, @FUserDataRec);
end;
constructor TExtForeignToplevelImageCaptureSourceManagerV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TExtForeignToplevelImageCaptureSourceManagerV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TExtForeignToplevelImageCaptureSourceManagerV1;
begin
  RegisterInterface;
  Result := TExtForeignToplevelImageCaptureSourceManagerV1.Create(ARegistry.Bind(AName, @ext_foreign_toplevel_image_capture_source_manager_v1_interface, AVersion));
end;

function TExtForeignToplevelImageCaptureSourceManagerV1.CreateSource(AToplevelHandle: TExtForeignToplevelHandleV1; AProxyClass: TWLProxyObjectClass = nil {TExtImageCaptureSourceV1}): TExtImageCaptureSourceV1;
var
  source: Pwl_proxy;
begin
  TExtImageCaptureSourceV1.RegisterInterface;
  source := wl_proxy_marshal_constructor(FProxy,
      _CREATE_SOURCE, @ext_image_capture_source_v1_interface, nil, AToplevelHandle.Proxy);
  if AProxyClass = nil then
    AProxyClass := TExtImageCaptureSourceV1;
  Result := TExtImageCaptureSourceV1(AProxyClass.Create(source));
  if not AProxyClass.InheritsFrom(TExtImageCaptureSourceV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TExtImageCaptureSourceV1]);
end;

destructor TExtForeignToplevelImageCaptureSourceManagerV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TExtForeignToplevelImageCaptureSourceManagerV1.AddListener(AIntf: IExtForeignToplevelImageCaptureSourceManagerV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_ext_foreign_toplevel_image_capture_source_manager_v1_Listener, @FUserDataRec);
end;






const
  pInterfaces: array[0..11] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@ext_image_capture_source_v1_interface),
    (@wl_output_interface),
    (@ext_image_capture_source_v1_interface),
    (@ext_foreign_toplevel_handle_v1_interface)
  );

  ext_image_capture_source_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  ext_output_image_capture_source_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'create_source'; signature: 'no'; types: @pInterfaces[8]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  ext_foreign_toplevel_image_capture_source_manager_v1_requests: array[0..1] of Twl_message = (
    (name: 'create_source'; signature: 'no'; types: @pInterfaces[10]),
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );

class procedure TExtImageCaptureSourceV1.RegisterInterface;
begin
  if vext_image_capture_source_v1_registered then Exit;
  vext_image_capture_source_v1_registered := True;
  ext_image_capture_source_v1_interface.name := PChar(EXT_IMAGE_CAPTURE_SOURCE_V1_INTERFACE_NAME);
  ext_image_capture_source_v1_interface.version := 1;
  ext_image_capture_source_v1_interface.method_count := 1;
  ext_image_capture_source_v1_interface.methods := @ext_image_capture_source_v1_requests;
  ext_image_capture_source_v1_interface.event_count := 0;
  ext_image_capture_source_v1_interface.events := nil;
end;

class procedure TExtOutputImageCaptureSourceManagerV1.RegisterInterface;
begin
  if vext_output_image_capture_source_manager_v1_registered then Exit;
  vext_output_image_capture_source_manager_v1_registered := True;
  ext_output_image_capture_source_manager_v1_interface.name := PChar(EXT_OUTPUT_IMAGE_CAPTURE_SOURCE_MANAGER_V1_INTERFACE_NAME);
  ext_output_image_capture_source_manager_v1_interface.version := 1;
  ext_output_image_capture_source_manager_v1_interface.method_count := 2;
  ext_output_image_capture_source_manager_v1_interface.methods := @ext_output_image_capture_source_manager_v1_requests;
  ext_output_image_capture_source_manager_v1_interface.event_count := 0;
  ext_output_image_capture_source_manager_v1_interface.events := nil;
end;

class procedure TExtForeignToplevelImageCaptureSourceManagerV1.RegisterInterface;
begin
  if vext_foreign_toplevel_image_capture_source_manager_v1_registered then Exit;
  vext_foreign_toplevel_image_capture_source_manager_v1_registered := True;
  ext_foreign_toplevel_image_capture_source_manager_v1_interface.name := PChar(EXT_FOREIGN_TOPLEVEL_IMAGE_CAPTURE_SOURCE_MANAGER_V1_INTERFACE_NAME);
  ext_foreign_toplevel_image_capture_source_manager_v1_interface.version := 1;
  ext_foreign_toplevel_image_capture_source_manager_v1_interface.method_count := 2;
  ext_foreign_toplevel_image_capture_source_manager_v1_interface.methods := @ext_foreign_toplevel_image_capture_source_manager_v1_requests;
  ext_foreign_toplevel_image_capture_source_manager_v1_interface.event_count := 0;
  ext_foreign_toplevel_image_capture_source_manager_v1_interface.events := nil;
end;


end.
