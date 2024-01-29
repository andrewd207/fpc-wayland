unit xdg_foreign_unstable_v1_protocol;

{$mode objfpc} {$H+}
{$interfaces corba}

interface

uses
  Classes, Sysutils, ctypes, wayland_util, wayland_client_core, wayland_protocol;


type
  Pzxdg_exporter_v1 = Pointer;
  Pzxdg_importer_v1 = Pointer;
  Pzxdg_exported_v1 = Pointer;
  Pzxdg_imported_v1 = Pointer;
  Pzxdg_exporter_v1_listener = ^Tzxdg_exporter_v1_listener;
  Tzxdg_exporter_v1_listener = record
  end;

  Pzxdg_importer_v1_listener = ^Tzxdg_importer_v1_listener;
  Tzxdg_importer_v1_listener = record
  end;

  Pzxdg_exported_v1_listener = ^Tzxdg_exported_v1_listener;
  Tzxdg_exported_v1_listener = record
    handle : procedure(data: Pointer; AZxdgExportedV1: Pzxdg_exported_v1; AHandle: Pchar); cdecl;
  end;

  Pzxdg_imported_v1_listener = ^Tzxdg_imported_v1_listener;
  Tzxdg_imported_v1_listener = record
    destroyed : procedure(data: Pointer; AZxdgImportedV1: Pzxdg_imported_v1); cdecl;
  end;



  TZxdgExporterV1 = class;
  TZxdgImporterV1 = class;
  TZxdgExportedV1 = class;
  TZxdgImportedV1 = class;


  IZxdgExporterV1Listener = interface
  ['IZxdgExporterV1Listener']
  end;

  IZxdgImporterV1Listener = interface
  ['IZxdgImporterV1Listener']
  end;

  IZxdgExportedV1Listener = interface
  ['IZxdgExportedV1Listener']
    procedure zxdg_exported_v1_handle(AZxdgExportedV1: TZxdgExportedV1; AHandle: String);
  end;

  IZxdgImportedV1Listener = interface
  ['IZxdgImportedV1Listener']
    procedure zxdg_imported_v1_destroyed(AZxdgImportedV1: TZxdgImportedV1);
  end;




  TZxdgExporterV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _EXPORT = 1;
  public
    destructor Destroy; override;
    function Export(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TZxdgExportedV1}): TZxdgExportedV1;
    function AddListener(AIntf: IZxdgExporterV1Listener): LongInt;
  end;

  TZxdgImporterV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _IMPORT = 1;
  public
    destructor Destroy; override;
    function Import(AHandle: String; AProxyClass: TWLProxyObjectClass = nil {TZxdgImportedV1}): TZxdgImportedV1;
    function AddListener(AIntf: IZxdgImporterV1Listener): LongInt;
  end;

  TZxdgExportedV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
  public
    destructor Destroy; override;
    function AddListener(AIntf: IZxdgExportedV1Listener): LongInt;
  end;

  TZxdgImportedV1 = class(TWLProxyObject)
  private
    const _DESTROY = 0;
    const _SET_PARENT_OF = 1;
  public
    destructor Destroy; override;
    procedure SetParentOf(ASurface: TWlSurface);
    function AddListener(AIntf: IZxdgImportedV1Listener): LongInt;
  end;






var
  zxdg_exporter_v1_interface: Twl_interface;
  zxdg_importer_v1_interface: Twl_interface;
  zxdg_exported_v1_interface: Twl_interface;
  zxdg_imported_v1_interface: Twl_interface;



implementation

var
  vIntf_zxdg_exporter_v1_Listener: Tzxdg_exporter_v1_listener;
  vIntf_zxdg_importer_v1_Listener: Tzxdg_importer_v1_listener;
  vIntf_zxdg_exported_v1_Listener: Tzxdg_exported_v1_listener;
  vIntf_zxdg_imported_v1_Listener: Tzxdg_imported_v1_listener;



destructor TZxdgExporterV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZxdgExporterV1.Export(ASurface: TWlSurface; AProxyClass: TWLProxyObjectClass = nil {TZxdgExportedV1}): TZxdgExportedV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _EXPORT, @zxdg_exported_v1_interface, nil, ASurface.Proxy);
  if AProxyClass = nil then
    AProxyClass := TZxdgExportedV1;
  if not AProxyClass.InheritsFrom(TZxdgExportedV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZxdgExportedV1]);
  Result := TZxdgExportedV1(AProxyClass.Create(id));
end;

function TZxdgExporterV1.AddListener(AIntf: IZxdgExporterV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zxdg_exporter_v1_Listener, @FUserDataRec);
end;
destructor TZxdgImporterV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZxdgImporterV1.Import(AHandle: String; AProxyClass: TWLProxyObjectClass = nil {TZxdgImportedV1}): TZxdgImportedV1;
var
  id: Pwl_proxy;
begin
  id := wl_proxy_marshal_constructor(FProxy,
      _IMPORT, @zxdg_imported_v1_interface, nil, PChar(AHandle));
  if AProxyClass = nil then
    AProxyClass := TZxdgImportedV1;
  if not AProxyClass.InheritsFrom(TZxdgImportedV1) then
    Raise Exception.CreateFmt('%s does not inherit from %s', [AProxyClass.ClassName, TZxdgImportedV1]);
  Result := TZxdgImportedV1(AProxyClass.Create(id));
end;

function TZxdgImporterV1.AddListener(AIntf: IZxdgImporterV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zxdg_importer_v1_Listener, @FUserDataRec);
end;
destructor TZxdgExportedV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

function TZxdgExportedV1.AddListener(AIntf: IZxdgExportedV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zxdg_exported_v1_Listener, @FUserDataRec);
end;
destructor TZxdgImportedV1.Destroy;
begin
  wl_proxy_marshal(FProxy, _DESTROY);
  inherited Destroy;
end;

procedure TZxdgImportedV1.SetParentOf(ASurface: TWlSurface);
begin
  wl_proxy_marshal(FProxy, _SET_PARENT_OF, ASurface.Proxy);
end;

function TZxdgImportedV1.AddListener(AIntf: IZxdgImportedV1Listener): LongInt;
begin
  FUserDataRec.ListenerUserData := Pointer(AIntf);
  Result := wl_proxy_add_listener(FProxy, @vIntf_zxdg_imported_v1_Listener, @FUserDataRec);
end;




procedure zxdg_exported_v1_handle_Intf(AData: PWLUserData; Azxdg_exported_v1: Pzxdg_exported_v1; AHandle: Pchar); cdecl;
var
  AIntf: IZxdgExportedV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZxdgExportedV1Listener(AData^.ListenerUserData);
  AIntf.zxdg_exported_v1_handle(TZxdgExportedV1(AData^.PascalObject), AHandle);
end;

procedure zxdg_imported_v1_destroyed_Intf(AData: PWLUserData; Azxdg_imported_v1: Pzxdg_imported_v1); cdecl;
var
  AIntf: IZxdgImportedV1Listener;
begin
  if AData = nil then Exit;
  AIntf := IZxdgImportedV1Listener(AData^.ListenerUserData);
  AIntf.zxdg_imported_v1_destroyed(TZxdgImportedV1(AData^.PascalObject));
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
    (@zxdg_exported_v1_interface),
    (@wl_surface_interface),
    (@zxdg_imported_v1_interface),
    (nil),
    (@wl_surface_interface)
  );

  zxdg_exporter_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'export'; signature: 'no'; types: @pInterfaces[8])
  );
  zxdg_importer_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'import'; signature: 'ns'; types: @pInterfaces[10])
  );
  zxdg_exported_v1_requests: array[0..0] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0])
  );
  zxdg_exported_v1_events: array[0..0] of Twl_message = (
    (name: 'handle'; signature: 's'; types: @pInterfaces[0])
  );
  zxdg_imported_v1_requests: array[0..1] of Twl_message = (
    (name: 'destroy'; signature: ''; types: @pInterfaces[0]),
    (name: 'set_parent_of'; signature: 'o'; types: @pInterfaces[12])
  );
  zxdg_imported_v1_events: array[0..0] of Twl_message = (
    (name: 'destroyed'; signature: ''; types: @pInterfaces[0])
  );

initialization
  Pointer(vIntf_zxdg_exported_v1_Listener.handle) := @zxdg_exported_v1_handle_Intf;
  Pointer(vIntf_zxdg_imported_v1_Listener.destroyed) := @zxdg_imported_v1_destroyed_Intf;


  zxdg_exporter_v1_interface.name := 'zxdg_exporter_v1';
  zxdg_exporter_v1_interface.version := 1;
  zxdg_exporter_v1_interface.method_count := 2;
  zxdg_exporter_v1_interface.methods := @zxdg_exporter_v1_requests;
  zxdg_exporter_v1_interface.event_count := 0;
  zxdg_exporter_v1_interface.events := nil;

  zxdg_importer_v1_interface.name := 'zxdg_importer_v1';
  zxdg_importer_v1_interface.version := 1;
  zxdg_importer_v1_interface.method_count := 2;
  zxdg_importer_v1_interface.methods := @zxdg_importer_v1_requests;
  zxdg_importer_v1_interface.event_count := 0;
  zxdg_importer_v1_interface.events := nil;

  zxdg_exported_v1_interface.name := 'zxdg_exported_v1';
  zxdg_exported_v1_interface.version := 1;
  zxdg_exported_v1_interface.method_count := 1;
  zxdg_exported_v1_interface.methods := @zxdg_exported_v1_requests;
  zxdg_exported_v1_interface.event_count := 1;
  zxdg_exported_v1_interface.events := @zxdg_exported_v1_events;

  zxdg_imported_v1_interface.name := 'zxdg_imported_v1';
  zxdg_imported_v1_interface.version := 1;
  zxdg_imported_v1_interface.method_count := 2;
  zxdg_imported_v1_interface.methods := @zxdg_imported_v1_requests;
  zxdg_imported_v1_interface.event_count := 1;
  zxdg_imported_v1_interface.events := @zxdg_imported_v1_events;

end.
