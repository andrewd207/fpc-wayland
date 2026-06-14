unit xdg_foreign_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pxdg_exporter_v1 = Pointer;
  Pxdg_importer_v1 = Pointer;
  Pxdg_exported_v1 = Pointer;
  Pxdg_imported_v1 = Pointer;
  Pxdg_exporter_v1_listener = ^Txdg_exporter_v1_listener;
  Txdg_exporter_v1_listener = record
  end;

  Pxdg_importer_v1_listener = ^Txdg_importer_v1_listener;
  Txdg_importer_v1_listener = record
  end;

  Pxdg_exported_v1_listener = ^Txdg_exported_v1_listener;
  Txdg_exported_v1_listener = record
    handle : procedure(data: Pointer; AXdgExportedV1: Pxdg_exported_v1; AHandle: Pchar); cdecl;
  end;

  Pxdg_imported_v1_listener = ^Txdg_imported_v1_listener;
  Txdg_imported_v1_listener = record
    destroyed : procedure(data: Pointer; AXdgImportedV1: Pxdg_imported_v1); cdecl;
  end;



  TXdgExporterV1 = class;
  TXdgImporterV1 = class;
  TXdgExportedV1 = class;
  TXdgImportedV1 = class;


  IXdgExporterV1Listener = interface
  ['IXdgExporterV1Listener']
  end;

  IXdgImporterV1Listener = interface
  ['IXdgImporterV1Listener']
  end;

  IXdgExportedV1Listener = interface
  ['IXdgExportedV1Listener']
    procedure xdg_exported_v1_handle(AXdgExportedV1: TXdgExportedV1; AHandle: String);
  end;

  IXdgImportedV1Listener = interface
  ['IXdgImportedV1Listener']
    procedure xdg_imported_v1_destroyed(AXdgImportedV1: TXdgImportedV1);
  end;




  TXdgExporterV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgExporterV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _EXPORT = 1;
  public
    destructor Destroy; override;
    function Export(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TXdgExportedV1}): TXdgExportedV1;
    function AddListener(AIntf: IXdgExporterV1Listener): LongInt;
  end;

  TXdgImporterV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgImporterV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _IMPORT = 1;
  public
    destructor Destroy; override;
    function Import(AHandle: String; AProxyClass: TWLProxyObjectClass = nil {TXdgImportedV1}): TXdgImportedV1;
    function AddListener(AIntf: IXdgImporterV1Listener): LongInt;
  end;

  TXdgExportedV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgExportedV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IXdgExportedV1Listener): LongInt;
  end;

  TXdgImportedV1 = class(TWLProxyObject)
  public
    class procedure RegisterInterface; virtual;
    class function BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgImportedV1;
    constructor Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True); override;
  private
    const _DESTROY = 0;
    const _SET_PARENT_OF = 1;
  public
    destructor Destroy; override;
    procedure SetParentOf(ASurface: TWlSurface);
    function AddListener(AIntf: IXdgImportedV1Listener): LongInt;
  end;






var
  xdg_exporter_v1_interface: Twl_interface;
  XDG_EXPORTER_V1_INTERFACE_NAME: String = 'zxdg_exporter_v1';
  xdg_importer_v1_interface: Twl_interface;
  XDG_IMPORTER_V1_INTERFACE_NAME: String = 'zxdg_importer_v1';
  xdg_exported_v1_interface: Twl_interface;
  XDG_EXPORTED_V1_INTERFACE_NAME: String = 'zxdg_exported_v1';
  xdg_imported_v1_interface: Twl_interface;
  XDG_IMPORTED_V1_INTERFACE_NAME: String = 'zxdg_imported_v1';



implementation

var
  vxdg_exporter_v1_registered: Boolean = False;
  vIntf_xdg_exporter_v1_Listener: Txdg_exporter_v1_listener;
  vxdg_importer_v1_registered: Boolean = False;
  vIntf_xdg_importer_v1_Listener: Txdg_importer_v1_listener;
  vxdg_exported_v1_registered: Boolean = False;
  vIntf_xdg_exported_v1_Listener: Txdg_exported_v1_listener;
  vxdg_imported_v1_registered: Boolean = False;
  vIntf_xdg_imported_v1_Listener: Txdg_imported_v1_listener;



constructor TXdgExporterV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TXdgExporterV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgExporterV1;
begin
  RegisterInterface;
  Result := TXdgExporterV1.Create(ARegistry.Bind(AName, @xdg_exporter_v1_interface, AVersion));
end;

destructor TXdgExporterV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgExporterV1.Export(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TXdgExportedV1}): TXdgExportedV1;
var
  id: Pwl_proxy;
begin
  TXdgExportedV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _EXPORT, @xdg_exported_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TXdgExportedV1;
  Result := TXdgExportedV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TXdgExportedV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgExportedV1]);
end;

function TXdgExporterV1.AddListener(AIntf: IXdgExporterV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_exporter_v1_Listener, @FUserDataRec);
end;
constructor TXdgImporterV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TXdgImporterV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgImporterV1;
begin
  RegisterInterface;
  Result := TXdgImporterV1.Create(ARegistry.Bind(AName, @xdg_importer_v1_interface, AVersion));
end;

destructor TXdgImporterV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgImporterV1.Import(AHandle: String; AProxyClass: TWLProxyObjectClass = nil {TXdgImportedV1}): TXdgImportedV1;
var
  id: Pwl_proxy;
begin
  TXdgImportedV1.RegisterInterface;
  id := wl_proxy_marshal_constructor(FProxy,
      _IMPORT, @xdg_imported_v1_interface, nil, PChar(AHandle));
  if AProxyClass = nil then
    AProxyClass := TXdgImportedV1;
  Result := TXdgImportedV1(AProxyClass.Create(id));
  if not AProxyClass.InheritsFrom(TXdgImportedV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TXdgImportedV1]);
end;

function TXdgImporterV1.AddListener(AIntf: IXdgImporterV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_importer_v1_Listener, @FUserDataRec);
end;
constructor TXdgExportedV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TXdgExportedV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgExportedV1;
begin
  RegisterInterface;
  Result := TXdgExportedV1.Create(ARegistry.Bind(AName, @xdg_exported_v1_interface, AVersion));
end;

destructor TXdgExportedV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TXdgExportedV1.AddListener(AIntf: IXdgExportedV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_exported_v1_Listener, @FUserDataRec);
end;
constructor TXdgImportedV1.Create(AProxy: Pwl_proxy; AOwnsProxy: Boolean = True);
begin
  RegisterInterface;
  inherited Create(AProxy, AOwnsProxy);
end;

class function TXdgImportedV1.BindFrom(ARegistry: TWlRegistry; AName: DWord; AVersion: LongInt): TXdgImportedV1;
begin
  RegisterInterface;
  Result := TXdgImportedV1.Create(ARegistry.Bind(AName, @xdg_imported_v1_interface, AVersion));
end;

destructor TXdgImportedV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TXdgImportedV1.SetParentOf(ASurface: TWlSurface);
begin
  wl_proxy_marshal(FProxy, _SET_PARENT_OF, ASurface.Proxy);
end;

function TXdgImportedV1.AddListener(AIntf: IXdgImportedV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_xdg_imported_v1_Listener, @FUserDataRec);
end;




procedure xdg_exported_v1_handle_Intf(AData: PWLUserData; Axdg_exported_v1: Pxdg_exported_v1; AHandle: Pchar); cdecl;
var
  AIntf: IXdgExportedV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgExportedV1Listener(AData^.ListenerUserData);
  AIntf.xdg_exported_v1_handle(TXdgExportedV1(AData^.PascalObject), AHandle);
end;

procedure xdg_imported_v1_destroyed_Intf(AData: PWLUserData; Axdg_imported_v1: Pxdg_imported_v1); cdecl;
var
  AIntf: IXdgImportedV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IXdgImportedV1Listener(AData^.ListenerUserData);
  AIntf.xdg_imported_v1_destroyed(TXdgImportedV1(AData^.PascalObject));
end;



const
  pInterfaces: array[0..12] of Pwl_interface = (
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (nil),
    (@xdg_exported_v1_interface),
    (@wl_surface_interface),
    (@xdg_imported_v1_interface),
    (nil),
    (@wl_surface_interface)
  );

  xdg_exporter_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'export'; signature: 'no'; types: @pInterfaces[8])
  );
  xdg_importer_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'import'; signature: 'ns'; types: @pInterfaces[10])
  );
  xdg_exported_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  xdg_exported_v1_events: array[0..0] of Twl_message = (
    (name: 'handle'; signature: 's'; types: @pInterfaces[0])
  );
  xdg_imported_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_parent_of'; signature: 'o'; types: @pInterfaces[12])
  );
  xdg_imported_v1_events: array[0..0] of Twl_message = (
    (name: 'destroyed'; signature: ''; types: @pInterfaces[0])
  );

class procedure TXdgExporterV1.RegisterInterface;
begin
  if vxdg_exporter_v1_registered then Exit;
  vxdg_exporter_v1_registered := True;
  xdg_exporter_v1_interface.name := PChar(XDG_EXPORTER_V1_INTERFACE_NAME);
  xdg_exporter_v1_interface.version := 1;
  xdg_exporter_v1_interface.method_count := 2;
  xdg_exporter_v1_interface.methods := @xdg_exporter_v1_requests;
  xdg_exporter_v1_interface.event_count := 0;
  xdg_exporter_v1_interface.events := nil;
end;

class procedure TXdgImporterV1.RegisterInterface;
begin
  if vxdg_importer_v1_registered then Exit;
  vxdg_importer_v1_registered := True;
  xdg_importer_v1_interface.name := PChar(XDG_IMPORTER_V1_INTERFACE_NAME);
  xdg_importer_v1_interface.version := 1;
  xdg_importer_v1_interface.method_count := 2;
  xdg_importer_v1_interface.methods := @xdg_importer_v1_requests;
  xdg_importer_v1_interface.event_count := 0;
  xdg_importer_v1_interface.events := nil;
end;

class procedure TXdgExportedV1.RegisterInterface;
begin
  if vxdg_exported_v1_registered then Exit;
  vxdg_exported_v1_registered := True;
  Pointer(vIntf_xdg_exported_v1_Listener.handle) := @xdg_exported_v1_handle_Intf;
  xdg_exported_v1_interface.name := PChar(XDG_EXPORTED_V1_INTERFACE_NAME);
  xdg_exported_v1_interface.version := 1;
  xdg_exported_v1_interface.method_count := 1;
  xdg_exported_v1_interface.methods := @xdg_exported_v1_requests;
  xdg_exported_v1_interface.event_count := 1;
  xdg_exported_v1_interface.events := @xdg_exported_v1_events;
end;

class procedure TXdgImportedV1.RegisterInterface;
begin
  if vxdg_imported_v1_registered then Exit;
  vxdg_imported_v1_registered := True;
  Pointer(vIntf_xdg_imported_v1_Listener.destroyed) := @xdg_imported_v1_destroyed_Intf;
  xdg_imported_v1_interface.name := PChar(XDG_IMPORTED_V1_INTERFACE_NAME);
  xdg_imported_v1_interface.version := 1;
  xdg_imported_v1_interface.method_count := 2;
  xdg_imported_v1_interface.methods := @xdg_imported_v1_requests;
  xdg_imported_v1_interface.event_count := 1;
  xdg_imported_v1_interface.events := @xdg_imported_v1_events;
end;


end.
